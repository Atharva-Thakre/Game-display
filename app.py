from flask import Flask , render_template ,url_for,redirect,request,session
import os
from enum import Enum
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy import Enum as DBEnum
from sqlalchemy import create_engine
from flask_login import UserMixin,login_user,LoginManager,login_required,logout_user,current_user

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:Emperor_sci369@localhost/stp'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'Do_It_L'
db = SQLAlchemy(app)

def create_database_schema():
    #Path to the SQL file
    sql_file_path = os.path.join(app.root_path, 'Stp.sql')
    
    # Read the contents of the SQL file
    with open(sql_file_path, 'r') as file:
        sql_script = file.read()
    
    engine = create_engine(app.config['SQLALCHEMY_DATABASE_URI'])
    
    # Establish a connection to the database
    with engine.connect() as connection:
        # Execute the SQL script to create the database schema
        connection.execute(sql_script)

class User(db.Model):
    __tablename__ = 'user'

    Uid = db.Column(db.Integer, primary_key=True) 
    Uname = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    U_pawd = db.Column(db.String(128), nullable=False)

    def __repr__(self):
        return f"<User {self.Uname}>"

class pubs(db.Model):
    __tablename__ = 'pubs'

    pubId = db.Column(db.Integer, primary_key=True)
    Pubname = db.Column(db.String(120), nullable=False)
    
class devs(db.Model):
    __tablename__ = 'devs'

    DevId = db.Column(db.Integer, primary_key=True)
    Devname = db.Column(db.String(120), nullable=False)

class Platform(Enum):
  Windows = "Windows"
  Linux = "Linux"
  PS = "PS"
  Xbox = "Xbox"

class Pla(db.Model):
  __tablename__ = 'pla'
  platform = db.Column(DBEnum(Platform), primary_key=True)

class Games(db.Model):
    __tablename__ = 'games'

    Gid = db.Column(db.Integer, primary_key=True)
    Gname = db.Column(db.String(255), nullable=False)
    pubId = db.Column(db.Integer, db.ForeignKey('pubs.pubId'))
    devId = db.Column(db.Integer, db.ForeignKey('devs.DevId')) 
    platform = db.Column(DBEnum(Platform), db.ForeignKey('pla.platform'))
    publisher = db.relationship('pubs', backref='games')
    developer = db.relationship('devs', backref='games')


class G_lib(db.Model):
    __tablename__ = 'G_lib'

    Uid = db.Column(db.Integer, db.ForeignKey('user.Uid'), primary_key=True)
    Gid = db.Column(db.Integer, db.ForeignKey('games.Gid'), primary_key=True)
    user = db.relationship('User', backref='games', foreign_keys=[Uid]) 
    game = db.relationship('Games', backref='users', foreign_keys=[Gid])



@app.route('/')
def login_page():
    return render_template('Login.html')

@app.route('/login',methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']

    user = User.query.filter_by(email=email,U_pawd=password).first()

    if user:
        session['email'] = user.email
        return redirect(url_for('index'))
    else:
        return redirect(url_for('login_page'))
    
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/games')
def show_games():
    games = Games.query.distinct(Games.Gname).all()
    return render_template('games.html', games=games)

@app.route('/library')
def show_library():
    
    if 'email' in session:
        email = session['email']
        
        user = User.query.filter_by(email=email).first()
        
        library = G_lib.query.filter_by(Uid=user.Uid).all()
        
        games_in_library = [Games.query.get(game.Gid) for game in library]
        return render_template('library.html', games=games_in_library)
    else:
        
        return redirect(url_for('login_page'))

if __name__ == "__main__":
    app.run(debug=True)

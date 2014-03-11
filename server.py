from flask import Flask, render_template, request, redirect, url_for
from collections import defaultdict
import utils, MySQLdb
app = Flask(__name__)                                                                                                                                                              
                                                                                                                                                                                   
@app.route('/')                                                                                                                                                                    
def mainIndex():                                                                                                                                                                   
    return render_template('index.html', selectedMenu='Home')                                                                                                                      
                                                                                                                                                                                   
@app.route('/trivia')                                                                                                                                                              
def report():                                                                                                                                                                      
  return render_template('findtrivia.html', selectedMenu='trivia')                                                                                                                     
                                                                                                                                                                                   
@app.route('/trivia2', methods=['POST'])                                                                                                                                           
def trivia2():                                                                                                                                                                     
  trivia =  request.form.get("triviatype")
  if trivia == 'Laws':
    tCol = 'laws'
  elif trivia == 'Trivia':
    tCol = 'trivia'
  elif trivia == 'Sayings':
    tCol = 'sayings'
  elif trivia == 'Quotes':
    tCol = 'memes'
  elif trivia == 'Fortune Cookies':
    tCol = 'fortuneCookies'
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  cur.execute('select content from ' + tCol + ';')
  rows = cur.fetchall()
  print rows
  return render_template('triviadsiplay.html', trivia=trivia, rows=rows)

if __name__ == '__main__':                                                                                                                                                         
    app.debug=True                                                                                                                                                                 
    app.run(host='0.0.0.0', port=3000)                                                                                                                                

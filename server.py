from flask import Flask, render_template, request, redirect, url_for
from collections import defaultdict
import utils, MySQLdb, random
app = Flask(__name__)

@app.route('/')
def mainIndex():
    return render_template('index.html', selectedMenu='Home')

@app.route('/trivia')
def report():
  return render_template('findtrivia.html', selectedMenu='trivia')

@app.route('/submit')
def sumbmit():
  stype = request.form.get("submit")
  return render_template('submitType.html', subType = stype) 

@app.route('/trivia2', methods=['POST'])
def trivia2():     
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  trivia =  request.form.get("triviatype")
  randnum = random.randint(1,5)
  randnum2 = random.randint(1,5)
  if trivia == 'Laws':
    tCol = 'laws'
    cur.execute('select content,state from '+tCol+' order by rand() limit 3')
    #cur.execute('select content, state from ' + tCol + ';')
  elif trivia == 'Trivia':
    tCol = 'trivia'
    cur.execute('select content from '+tCol+' order by rand() limit 3')
    #cur.execute('select content from '+ tCol + ';' )
  elif trivia == 'Sayings':
    tCol = 'sayings'
    cur.execute('select content, author from '+tCol+' order by rand() limit 3')
    #cur.execute('select content, author from ' + tCol + ';')
  elif trivia == 'Meme':
    tCol = 'meme'
    cur.execute('select imageLink,whenDate,content from '+tCol+' order by rand() limit 1')
    #cur.execute('select content, imageLink from ' + tCol + ';')
  elif trivia == 'Fortune Cookies':
    tCol = 'fortuneCookies'
    cur.execute('select content from '+tCol+' order by rand() limit 3')
    #cur.execute('select content from ' + tCol + ';')
  elif trivia == 'Combo-Trivia!':
    if randnum == 1:
      tcol = 'laws'
    elif randnum == 2:
      tcol = 'trivia'
    elif randnum == 3:
      tcol = 'sayings'
    elif randnum == 4:
      tcol = 'meme'
    else:
      tcol = 'fortuneCookies'
    if randnum2 == 1:
      tcol2 = 'laws'
    elif randnum2 == 2:
      tcol2 = 'trivia'
    elif randnum2 == 3:
      tcol2 = 'sayings'
    elif randnum2 == 4:
      tcol2 = 'meme'
    else:
      tcol2 = 'fortuneCookies'
    cur.execute('select '+tcol+'.content, '+tcol2+'.content from '+tcol+' JOIN '+tcol2+' order by rand() limit 1')
  rows = cur.fetchall()
  print rows
  return render_template('triviadisplay.html', trivia=trivia, rows=rows)

@app.route('/randome', methods=['POST','GET'])                                                                                                                                           
def randome():     
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  trivia =  request.form.get("triviatype")
  ranNum = random.randint(1,5)
  
  if ranNum == 1:
    tCol = 'laws'
    cur.execute('select content,state from '+tCol+' order by rand() limit 1')
  elif ranNum == 2:
    tCol = 'trivia'
    cur.execute('select content from '+tCol+' order by rand() limit 1')
  elif ranNum == 3:
    tCol = 'sayings'
    cur.execute('select content, author from '+tCol+' order by rand() limit 1')
  elif ranNum == 4:  
    tCol = 'fortuneCookies'
    cur.execute('select content from '+tCol+' order by rand() limit 1')
  elif ranNum == 5:  
    tCol = 'meme'
    cur.execute('select imageLink,whenDate,content from '+tCol+' order by rand() limit 1')
  rows = cur.fetchall()
  print rows
  
  return render_template('randdisplay.html', trivia = trivia, rows = rows)

if __name__ == '__main__':                                                                                                                                                         
    app.debug=True                                                                                                                                                                 
    app.run(host='0.0.0.0', port=3000)                                                                                                                                

from flask import Flask, render_template, request, redirect, url_for
from collections import defaultdict
import utils, MySQLdb, random
app = Flask(__name__)

@app.route('/')
def mainIndex():
    return render_template('index.html', selectedMenu='Home')

@app.route('/submitTrivia')
def submit():  
  return render_template('submitTrivia.html', selectedMenu='submit') 

@app.route('/sub2', methods=['POST'])
def s2():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  t = request.form['triviatype']
  if(t == 'Fortune Cookies'):
    return render_template('cookiesub.html')
  elif(t == 'Laws'):
    return render_template('lawsub.html')
  elif(t=='Trivia'):
    return render_template('triviasub.html')
  elif(t=='Sayings'):
    return render_template('sayingsub.html')
  elif(t=='Meme'):
    return render_template('memesub.html')

@app.route('/fortuneSub')
def fs():
   return render_template('cookiesub.html', selectedMenu='fSub')

@app.route('/fortune', methods=['POST'])
def fortuneSub():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "Insert INTO fortuneCookies (content) VALUES(' ";
  query += request.form['cookie'] + "')"    
  print query
  cur.execute(query)
  db.commit()
  return render_template('submission.html')

@app.route('/lawSub')
def ls():
   return render_template('lawsub.html', selectedMenu='lSub')

@app.route('/law', methods=['POST'])
def lawSub():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "Insert INTO laws (content, state) VALUES(' ";
  query += request.form['law'] + "', '" + request.form['state'] + "')"  
  print query
  cur.execute(query)
  db.commit()
  return render_template('submission.html')
 
@app.route('/triviaSub')
def ts():
  return render_template('triviasub.html', selectedMenu='tSub')

@app.route('/triviaS', methods=['POST'])
def triviaSub():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "Insert INTO trivia (content) VALUES(' ";
  query += request.form['trivia'] + "')"
  print query
  cur.execute(query)
  db.commit()
  return render_template('submission.html')
 
@app.route('/saySub')
def ss():
  return render_template('sayingsub.html', selectedMenu='sSub')  
  
@app.route('/saying', methods=['POST'])
def sayingSub():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "Insert INTO sayings (content, author) VALUES(' ";
  query += request.form['saying'] + "', '" + request.form['author'] + "')"
  print query
  cur.execute(query)
  db.commit()
  return render_template('submission.html')

@app.route('/memeSub')
def ms():
  return render_template('memesub.html', selectedMenu='mSub')

@app.route('/meme', methods=['POST'])
def memeSub():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)

  date = '%s-%02i-%02i' % (request.form['year'], int(request.form['month']),int(request.form['day']))
  query = "INSERT INTO meme (imageLink, content, whenDate) VALUES (' ";
  query += request.form['url'] + "', '" + request.form['about'] +  "', '" + date + "')"
  print query
  cur.execute(query)
  db.commit()
  return render_template('submission.html') 
  
"""@app.route('/submitType2', methods=['POST'])
def submitType():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  subType = request.form['value']
  date = '%s-%02i-%02i' % (request.form['year'], int(request.form['month']),int(request.form['day']))
  if subType == 'l':
    query = "Insert INTO laws (content, state) VALUES(' ";
    query += request.form['law'] + "', '" + request.form['state'] + "')"
  elif subType == 'm':
    query = "INSERT INTO meme (imageLink, about, whenDate) VALUES (' ";
    query += request.form['url'] + "', '" + request.form['about'] +  "', '" + date + "')"
  elif subType == 's':
    query = "Insert INTO sayings (content, author) VALUES(' ";
    query += request.form['saying'] + "', '" + request.form['author'] + "')"
  elif subType == 't':
    query = "Insert INTO trivia (content) VALUES(' ";
    query += request.form['trivia'] + "')"
  elif subType == 'f':
    query = "Insert INTO fortuneCookies (content) VALUES(' ";
    query += request.form['cookie'] + "')"    
  
  print query
  
  cur.execute(query)
  db.commit()
  return render_template('submission.html')
"""

@app.route('/trivia')
def report():
  return render_template('findtrivia.html', selectedMenu='trivia')

@app.route('/trivia2', methods=['POST'])
def trivia2():     
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  trivia =  request.form.get("triviatype")

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
  elif trivia == 'Fortune Cookies':
    tCol = 'fortuneCookies'
    cur.execute('select content from '+tCol+' order by rand() limit 3')
    #cur.execute('select content from ' + tCol + ';')
  elif trivia == 'Meme':
    tCol = 'meme'
    cur.execute('select content, whenDate, imageLink from '+tCol+' order by rand() limit 3')
    #cur.execute('select content from ' + tCol + ';')
    
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

@app.route('/mash', methods=['POST','GET'])                                                                                                                                           
def mash():  
  tcol2 = 'laws'
  randnum = random.randint(1,4)
  randnum2 = random.randint(1,4)
  trivia == 'Combo-Trivia!'
  if randnum == 1:
    tcol = 'laws'
  elif randnum == 2:
    tcol = 'trivia'
  elif randnum == 3:
    tcol = 'sayings'
  else:  
    tcol = 'fortuneCookies'
  if randnum2 == 1:
    tcol2 = 'laws'
  elif randnum2 == 2:
    tcol2 = 'trivia'
  elif randnum2 == 3:
    tcol2 = 'sayings'
  else:
    tcol2 = 'fortuneCookies'
  cur.execute('select ' +tcol +'.content,'+ tcol2 +'.content from '+tcol+' JOIN '+tcol2+' order by rand() limit 1')
  rows = cur.fetchall()
  print rows
  return render_template('mashdisplay.html', trivia = trivia, rows = rows)

@app.route('/genre')
def findG():
  return render_template('findgenre.html', selectedMenu='genre')

if __name__ == '__main__':                                                                                                                                                         
    app.debug=True                                                                                                                                                                 
    app.run(host='0.0.0.0', port=3000)                                                                                                                                

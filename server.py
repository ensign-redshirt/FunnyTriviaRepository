from flask import Flask, render_template, request
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
  return render_template('triviadsiplay.html', trivia=trivia)

if __name__ == '__main__':                                                                                                                                                         
    app.debug=True                                                                                                                                                                 
    app.run(host='0.0.0.0', port=3000)                                                                                                                                

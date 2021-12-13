from flask import Flask, render_template, request, jsonify
from main import Psql
from werkzeug.security import generate_password_hash, check_password_hash


app = Flask(__name__)

psql = Psql('root',
                dbname='tv-payment-system-2.0',
                user='postgres',
                host='localhost')

@app.route("/", methods=['post', 'get'])
def table_display():

    if request.method == 'POST':
        command = request.form.get('command')
        message = psql.execute_fetch(command)
        return render_template("response.html", command = command, message = message)

    table_list = psql.execute_fetch("SELECT table_name FROM information_schema.tables WHERE (table_schema = 'public') ORDER BY table_name;")
    data = {}
    for table in table_list:

        table_data = psql.get_table_contents(table[0])
        data.update({table[0]: table_data})

    return render_template("main.html", data=data)

@app.route('/signup', methods=['POST'])
def signup(): 
    msg = ''
    fullname = request.form['fullname']
    username = request.form['username']
    email = request.form['email']
    password = request.form['password']
    _hashed_password = generate_password_hash(password)
    values = "'"+fullname+"',"+"'"+username+"',"+"'"+email+"',"+"'"+_hashed_password +"'"
    print(values)
    update = "INSERT INTO users (fullname, username, email, password) VALUES ("+values+")"
    print(update)
    if fullname and email and username and password:
        psql.cursor.execute(update)
        psql.conn.commit()
        print('success')
        msg = 'You have successfully registered!'
        return jsonify({'name' : msg})
        #return render_template("some-template.html", data=data) - if without ajax


#user form updates
@app.route('/userUpdates', methods=['POST'])
def userUpdates():
    print(request.form)
    msg = ''
    update =  request.form['update'] if request.form['update'] else None
    print(update)
    if update:
        psql.cursor.execute(update)
        psql.conn.commit()

    #Browser preview msg
    msg = 'You have successfully chaged smth!'
    return jsonify({'name' : msg})

def init():
    psql.execute_file("./sql_files/CREATE_TABLE.sql")
    psql.execute_file("./sql_files/load_sample_data.sql")
    psql.execute_file("./sql_files/trigger.sql")
    print("Successfully executed files")

init()

app.run()

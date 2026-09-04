from flask import Flask, request, render_template_string, redirect, send_from_directory
import os
import sqlite3
import subprocess

app = Flask(__name__)
UPLOAD_FOLDER = '/var/www/html/vulnerable-app/uploads'
DB_PATH = '/var/www/html/vulnerable-app/users.db'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def get_db():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    conn = get_db()
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS users (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    username TEXT,
                    password TEXT)''')
    c.execute("INSERT OR IGNORE INTO users (id, username, password) VALUES (1, 'admin', 'admin123')")
    c.execute("INSERT OR IGNORE INTO users (id, username, password) VALUES (2, 'user', 'password')")
    conn.commit()
    conn.close()

@app.route('/')
def index():
    return render_template_string('''
    <h1>Bazaarjo Vulnerable App</h1>
    <p>Technology Stack: Python 3 + Flask + SQLite + Apache2 (mod_wsgi)</p>
    <ul>
        <li><a href="/upload">Vuln 1: File Upload</a></li>
        <li><a href="/xss?name=test">Vuln 2: Cross-Site Scripting (XSS)</a></li>
        <li><a href="/cmdi?host=127.0.0.1">Vuln 3: OS Command Injection</a></li>
        <li><a href="/sqli?username=admin">Vuln 4: SQL Injection (Optional)</a></li>
    </ul>
    ''')

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            return 'No file part'
        file = request.files['file']
        if file.filename == '':
            return 'No selected file'
        filename = file.filename
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        return f'File uploaded successfully: <b>{filename}</b><br><a href="/uploads/{filename}">Access file</a>'
    return render_template_string('''
    <h2>File Upload</h2>
    <form method=post enctype=multipart/form-data>
      <input type=file name=file>
      <input type=submit value=Upload>
    </form>
    ''')

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

@app.route('/xss')
def xss():
    name = request.args.get('name', 'guest')
    return render_template_string(f'<h2>Hello, {name}!</h2><p>No input validation applied.</p>')

@app.route('/cmdi')
def cmdi():
    host = request.args.get('host', '127.0.0.1')
    try:
        result = os.popen(f'ping -c 2 {host}').read()
    except Exception as e:
        result = str(e)
    return render_template_string(f'<h2>Network Diagnostic</h2><pre>{result}</pre>')

@app.route('/sqli')
def sqli():
    username = request.args.get('username', '')
    conn = get_db()
    c = conn.cursor()
    query = f"SELECT * FROM users WHERE username = '{username}'"
    try:
        c.execute(query)
        rows = c.fetchall()
        result = f"<h2>User Lookup</h2><p>Query executed: <code>{query}</code></p><pre>{[dict(row) for row in rows]}</pre>"
    except Exception as e:
        result = f"<h2>Error</h2><pre>{str(e)}</pre>"
    conn.close()
    return render_template_string(result)

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000)

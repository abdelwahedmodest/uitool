from flask import Flask, request, render_template
import subprocess

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def generate_html():
    if request.method == 'POST':
        desktop_path = request.form['desktop_path']
        subprocess.call(['bash', 'your_script.sh', desktop_path])
        return 'HTML table generated!'
    else:
        return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)


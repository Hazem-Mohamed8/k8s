from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Jenkins Pipeline - K8S!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=6000)

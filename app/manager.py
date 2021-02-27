import os

from flask import Flask

# load environment variables
APP_SETTINGS = os.environ.get('APP_SETTINGS')
PORT = os.environ.get('PORT', 5000)
NAME = os.environ.get('APP_NAME', __name__)

app = Flask(NAME)
app.config.from_object(APP_SETTINGS)


@app.route('/')
def hello():
    return 'Hello World!'


if __name__ == '__main__':
    app.run(port=PORT)

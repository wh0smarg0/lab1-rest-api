from flask import Flask
from views import *

app = Flask(__name__)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
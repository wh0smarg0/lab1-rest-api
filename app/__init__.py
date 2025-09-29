from flask import Flask

app = Flask(__name__)

# імпортуємо роутери
import app.views

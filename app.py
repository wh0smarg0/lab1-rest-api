from flask import Flask
from views import register_routes

app = Flask(__name__)
register_routes(app)

if __name__ == "__main__":
    import os
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)

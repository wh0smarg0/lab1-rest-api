from flask import jsonify
from datetime import datetime

def register_routes(app):
    @app.route("/healthcheck", methods=["GET"])
    def healthcheck():
        return jsonify({
            "status": "ok",
            "date": datetime.utcnow().isoformat() + "Z"
        }), 200

    @app.route("/", methods=["GET"])
    def hello():
        return jsonify({"message": "Hello world!"})


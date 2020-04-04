import os
from flask import Flask
from decouple import config
from views import main
# from .extensions import db

BASE_DIR = os.path.abspath(os.path.dirname(__file__))


def create_app():
    app = Flask(__name__)
    if config('DEBUG', cast=bool):
        app.debug = True
        app.env = "development"
    app.register_blueprint(main)


    return app


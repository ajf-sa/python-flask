import os
from flask import Flask

from views import main
from extensions import db
from models import *

BASE_DIR = os.path.abspath(os.path.dirname(__file__))


def create_app():
    app = Flask(__name__)
    app.config.from_object("config.DevelopmentConfig")
    app.register_blueprint(main)
    db.init_app(app)


    return app


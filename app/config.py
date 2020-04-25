
import os
from decouple import config


# SECRET_KEY = config('SECRET_KEY')
# DEBUG = config('DEBUG', default=False, cast=bool)
# DATABASE_URI = config('DATABASE_URI')

basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True

class ProductionConfig(Config):
   SQLALCHEMY_DATABASE_URI= "postgresql://postgres:@db1:5432/pmh01"

class DevelopmentConfig(Config):
    DEVELOPMENT = True
    DEBUG = True
    SQLALCHEMY_DATABASE_URI='sqlite:///' + os.path.join(basedir, 'dev.sqlite')

class TestingConfig(Config):
    TESTING = True


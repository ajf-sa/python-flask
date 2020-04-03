import os
from flask import Flask,flash, redirect ,render_template , request, url_for

app = Flask(__name__)

@app.route("/")
def list_file():
    return ':)'
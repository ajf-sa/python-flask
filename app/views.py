from flask import Blueprint, render_template


main = Blueprint('main',__name__)

@main.route('/')
def main_index():
    return render_template('main/main_index.html')
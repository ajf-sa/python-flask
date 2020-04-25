from extensions import db


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=True)
    password = db.Column(db.String(120), unique=False, nullable=True)
    email = db.Column(db.String(80), unique=True, nullable=True)

    def __repr__(self):
        return '<User %r>' % self.username
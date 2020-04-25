from main import create_app
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from extensions import db

app = create_app()
migrate = Migrate()
with app.app_context():
    if db.engine.url.drivername == 'sqlite':
        migrate.init_app(app, db, render_as_batch=True)
    else:
        migrate.init_app(app, db)
if __name__ == "__main__":
    manager = Manager(app)
    manager.add_command('db', MigrateCommand)
    manager.run()
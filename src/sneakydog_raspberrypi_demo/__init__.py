from flask import Flask

from flask_apscheduler import APScheduler
from sneakydog_raspberrypi_demo.settings import DevelopmentConfig


scheduler = APScheduler()


def create_app() -> Flask:
    app = Flask(__name__)
    app.config.from_object(DevelopmentConfig)
    scheduler.init_app(app)
    scheduler.start()
    return app

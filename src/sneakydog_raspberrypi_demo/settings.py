"""App configuration."""


class Config:
    """Prod config."""

    DEBUG = False
    TESTING = False
    SCHEDULER_TIMEZONE = "Asia/Shanghai"


class DevelopmentConfig(Config):
    """Dev config."""

    FILE_SAVE_PATH = "/DATA/Gallery"
    DEBUG = False
    JOBS = [
        {
            "id": "job1111",
            "func": "sneakydog_raspberrypi_demo.tasks:task2",
            "trigger": "interval",
            "seconds": 2,
        }
    ]

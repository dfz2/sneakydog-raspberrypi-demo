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
    SCHEDULER_TIMEZONE = "Asia/Shanghai"

    JOBS = [
        {
            "id": "job2222",
            "func": "sneakydog_raspberrypi_demo.tasks:task1",
            "trigger": "cron",
            "minute": 35,
            "hour": 23,
        },
        {
            "id": "job1111",
            "func": "sneakydog_raspberrypi_demo.tasks:task2",
            "trigger": "interval",
            "minutes": 2,
        },
    ]

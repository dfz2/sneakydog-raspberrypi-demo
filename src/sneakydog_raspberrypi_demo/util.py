from datetime import datetime


YYYYMMDD = r"%Y%m%d"
YYYYMMDDHHMMSS = r"%Y%m%d%H%M%S"


def get_current_date() -> str:
    return datetime.now().strftime(YYYYMMDD)


def get_current_datetime():
    return datetime.now().strftime(YYYYMMDDHHMMSS)

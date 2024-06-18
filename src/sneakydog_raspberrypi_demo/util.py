from datetime import datetime


def get_current_date() -> str:
    """get_current_date

    Returns:
        str: _description_
    """
    return datetime.now().strftime(r"%Y%m%d")


def get_current_datetime() -> str:
    """get_current_datetime

    Returns:
        str: _description_
    """
    return datetime.now().strftime(r"%Y%m%d%H%M%S")

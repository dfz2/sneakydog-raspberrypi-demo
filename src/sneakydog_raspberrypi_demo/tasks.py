"""Example of adding tasks on app startup."""

from sneakydog_raspberrypi_demo import scheduler
from sneakydog_raspberrypi_demo.util import get_current_date, get_current_datetime
from datetime import datetime
import os


try:
    from picamera2 import Picamera2  # type: ignore
except:
    None



@scheduler.task(
    "interval",
    id="job_sync",
    seconds=1,
)
def task1():
    """Sample task 1.

    Added when app starts.
    """
    print("running task 1!")  # noqa: T001

    # time snap

    # oh, do you need something from config?
    with scheduler.app.app_context():
        print(scheduler.app.config)  # noqa: T001


def task2():
    """Sample task 2.

    Added when /add url is visited.
    """
    print("start task 2!")  # noqa: T001

    with scheduler.app.app_context():
        file_save_path = scheduler.app.config["FILE_SAVE_PATH"]

        current_day = get_current_date()
        file_path = os.path.join(file_save_path, current_day)
        if not os.path.exists(file_path):
            os.makedirs(file_path)

        filename = os.path.join(file_path, f"{get_current_datetime()}.jpg")

        with Picamera2() as picam2:
            config = picam2.create_still_configuration()
            picam2.configure(config)
            picam2.capture_file(filename)

"""Example of adding tasks on app startup."""

import os

from sneakydog_raspberrypi_demo import scheduler
from sneakydog_raspberrypi_demo.util import get_current_date
from sneakydog_raspberrypi_demo.util import get_current_datetime

picamera2Load = True

try:
    from picamera2 import Picamera2  # type: ignore
except:  # noqa E722
    picamera2Load = False
    print("picamera2 import fail")


def task2() -> None:
    """_summary_"""

    print("test....")
    with scheduler.app.app_context():
        file_save_path = scheduler.app.config["FILE_SAVE_PATH"]
        file_path = os.path.join(file_save_path, get_current_date())
        if not os.path.exists(file_path):
            os.makedirs(file_path)

        if picamera2Load:
            filename = os.path.join(file_path, f"{get_current_datetime()}.jpg")
            with Picamera2() as picam2:
                config = picam2.create_still_configuration()
                picam2.configure(config)
                picam2.start()
                picam2.capture_file(filename)

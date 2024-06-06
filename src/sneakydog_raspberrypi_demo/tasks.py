"""Example of adding tasks on app startup."""

from sneakydog_raspberrypi_demo import scheduler


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
    print("running task 2!")  # noqa: T001

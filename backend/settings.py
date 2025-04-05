from dotenv import load_dotenv
import os
import datetime


load_dotenv()  # loading .env file


class CredsAPP:
    """Web app setup"""
    # switch between prod and dev environment variables
    IS_PROD: bool = eval(os.getenv("APP_IS_PROD", "True"))
    # web app name (needed for logging)
    NAME: str = os.getenv("APP_NAME", "daily_planner")
    # key for session variables (cookies)
    SESSION_KEY: str = os.getenv("APP_SESSION_KEY")
    # session durations (hours)
    PERMANENT_SESSION_LIFETIME: datetime.timedelta = (
        datetime.timedelta(hours=int(os.getenv("APP_PERMANENT_SESSION_LIFETIME", "100")))
    )
    # Flask host
    HOST: str = os.getenv("APP_HOST", "0.0.0.0")
    # Flask port
    PORT: int = int(os.getenv("APP_PORT", "5000"))
    # Flask debug
    DEBUG: bool = eval(os.getenv("APP_DEBUG", str(not IS_PROD)))
import os


class BaseConfig:
    # root path
    BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    # keep secret key from env
    SECRET_KEY = os.environ.get('SECRET_KEY')


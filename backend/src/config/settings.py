from os import path
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    PROJECT_NAME: str = "CupiHorarios"
    DB_NAME: str = "cupihorarios"
    DB_USER: str = "postgres"
    DB_PASSWORD: str = "postgres"
    DB_HOST: str = "localhost"
    DB_PORT: str = "5432"
    IS_IN_PRODUCTION: bool = False
    SSL_CERT_FILE_PATH: str = "/etc/ssl/certs/server.crt"
    SSL_KEY_FILE_PATH: str = "/etc/ssl/certs/server.key"

    class Config:
        case_sensitive = True
        extra = "ignore"
        env_file = path.join(path.dirname(__file__), "..", "..", ".env")


settings = Settings()

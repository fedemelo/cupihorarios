from fastapi.middleware.cors import CORSMiddleware
from fastapi_versioning import VersionedFastAPI
from fastapi.responses import RedirectResponse
from src.config.db_config import engine, Base
from src.config.settings import Settings
from fastapi.security import HTTPBearer
from fastapi import FastAPI
from os import access, R_OK
from uvicorn import run
from src.routers import (
    assistant_availability,
    assistant,
    official_schedule,
    schedule,
    scheduled_slot,
    time_slot
)


settings = Settings()
IS_IN_PRODUCTION = settings.IS_IN_PRODUCTION
SSL_CERT_FILE_PATH = settings.SSL_CERT_FILE_PATH
SSL_KEY_FILE_PATH = settings.SSL_KEY_FILE_PATH

app = FastAPI(title=settings.PROJECT_NAME)

Base.metadata.create_all(bind=engine)

token_auth_scheme = HTTPBearer()


app.include_router(assistant_availability.router)
app.include_router(assistant.router)
app.include_router(official_schedule.router)
app.include_router(schedule.router)
app.include_router(scheduled_slot.router)
app.include_router(time_slot.router)


@app.get("/")
def root():
    return RedirectResponse(url="/v1.0/docs#/")


app = VersionedFastAPI(
    app=app,
    version_format="{major}.{minor}",
    prefix_format="/v{major}.{minor}"
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


if __name__ == "__main__":
    if IS_IN_PRODUCTION:
        print("Running in production mode")
        is_ssl_file_accessible = access(SSL_CERT_FILE_PATH, R_OK) and access(
            SSL_KEY_FILE_PATH, R_OK)
        if not is_ssl_file_accessible:
            print(
                f"Could not access one or both SSL files at {SSL_CERT_FILE_PATH} and {SSL_KEY_FILE_PATH}")
            exit(1)

        run("main:app", host="0.0.0.0", port=8000, reload=False,
            ssl_keyfile=SSL_KEY_FILE_PATH, ssl_certfile=SSL_CERT_FILE_PATH)
    else:
        run("main:app", host="0.0.0.0", port=8000, reload=True)

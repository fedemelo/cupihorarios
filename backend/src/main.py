from fastapi.middleware.cors import CORSMiddleware
from fastapi_versioning import VersionedFastAPI
from fastapi.responses import RedirectResponse
from src.config.db_config import engine, Base
from src.config.settings import Settings
from fastapi.security import HTTPBearer
from fastapi import FastAPI
from src.routers import (
    assistant
)


settings = Settings()
app = FastAPI(title=settings.PROJECT_NAME)

Base.metadata.create_all(bind=engine)

token_auth_scheme = HTTPBearer()


app.include_router(assistant.router)


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

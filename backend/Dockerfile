FROM python:3.11.8

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt
COPY ./ /app

CMD ["python", "main.py"]

EXPOSE 8001
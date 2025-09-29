FROM python:3.11.3-slim-bullseye

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

COPY . /app

ENV FLASK_APP=app:app
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=$PORT

CMD ["flask", "run", "--host=0.0.0.0", "--port=$PORT"]

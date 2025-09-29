# Базовий образ Python
FROM python:3.11.3-slim-bullseye

# Робоча папка в контейнері
WORKDIR /app

# Копіюємо залежності та встановлюємо
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

# Копіюємо весь проєкт
COPY . /app

# Встановлюємо змінну оточення для Flask
ENV FLASK_APP=app:app
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=$PORT

# Команда для запуску
CMD ["flask", "run"]

# Lab1 REST API

Простий Flask REST API з маршрутами `/` та `/healthcheck`. Підходить для запуску локально або в хмарі (Render, Docker).

## Структура проекту
lab1-rest-api/
├─ app.py               # Основний файл Flask
├─ views.py             # Маршрути
├─ requirements.txt     # Python-залежності
├─ Dockerfile           # Docker-образ
├─ docker-compose.yml
└─ README.md

## Локальний запуск (без Docker)

1. Створити та активувати віртуальне середовище:

python -m venv venv
source venv/bin/activate  # Linux / macOS
venv\Scripts\activate     # Windows

2. Встановити залежності:
pip install -r requirements.txt

3. Запустити сервер:
python app.py

4. Перевірка:
http://localhost:5000/                — головна сторінка
http://localhost:5000/healthcheck     — healthcheck

## Запуск через Docker

1. Зібрати образ:
docker build -t lab1-rest-api .

2. Запустити контейнер:
docker run -p 5000:5000 -e PORT=5000 lab1-rest-api

3. Перевірка:
http://localhost:5000/
http://localhost:5000/healthcheck

## Запуск через Docker Compose

docker-compose up --build

Веб-сервер буде доступний на http://localhost:5000

## Деплой на Render

1. Створити новий Web Service на Render.
2. Підключити репозиторій.
3. Вказати Docker як тип середовища.
4. Render автоматично задасть змінну середовища PORT.
5. У Dockerfile використовується app.py, який підхоплює цей порт.
6. Деплой має стартувати без помилок.

## Примітки
Flask слухає 0.0.0.0 для доступу ззовні контейнера.

app.py обробляє порт як integer, щоб уникнути помилки:
Error: Invalid value for '--port' / '-p': '$PORT' is not a valid integer

---


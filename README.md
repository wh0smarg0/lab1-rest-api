# Lab1 REST API

Простий Flask REST API з маршрутами `/` та `/healthcheck`. Підходить для запуску локально або в хмарі (Render, Docker).

---

## 📂 Структура проекту

```
lab1-rest-api/
├─ app.py             # Основний файл Flask
├─ views.py           # Маршрути
├─ requirements.txt   # Python-залежності
├─ Dockerfile         # Docker-образ
├─ docker-compose.yml
└─ README.md
```

---

## 🖥 Локальний запуск (без Docker)

1. Створити та активувати віртуальне середовище:

```bash
python -m venv venv
# Linux / macOS
source venv/bin/activate
# Windows
venv\Scripts\activate
```

2. Встановити залежності:

```bash
pip install -r requirements.txt
```

3. Запустити сервер:

```bash
python app.py
```

4. Перевірка роботи:

* [http://localhost:5000/](http://localhost:5000/) — головна сторінка
* [http://localhost:5000/healthcheck](http://localhost:5000/healthcheck) — healthcheck

---

## 🐳 Запуск через Docker

1. Зібрати образ:

```bash
docker build . -t lab1-rest-api:latest
```

2. Запустити контейнер:

```bash
docker run -it --rm --network=host -e PORT=5000 lab1-rest-api:latest
```

3. Перевірка роботи:

* [http://localhost:5000/](http://localhost:5000/)
* [http://localhost:5000/healthcheck](http://localhost:5000/healthcheck)

---

## 🏗 Запуск через Docker Compose

```bash
docker-compose up --build
```

Веб-сервер буде доступний на [http://localhost:5000](http://localhost:5000).

---

## ☁️ Деплой на Render

1. Створити новий **Web Service** на Render.
2. Підключити репозиторій.
3. Вказати **Docker** як тип середовища.
4. Render автоматично задасть змінну середовища `PORT`.
5. У `Dockerfile` використовується `app.py`, який підхоплює цей порт.
6. Деплой має стартувати без помилок.

---

## ℹ️ Примітки

* Flask слухає `0.0.0.0` для доступу ззовні контейнера.
* `app.py` обробляє порт як integer, щоб уникнути помилки:

```text
Error: Invalid value for '--port' / '-p': '$PORT' is not a valid integer
```


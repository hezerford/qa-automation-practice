FROM python:3.12-slim

RUN pip install poetry==1.8.3

# Отключаем создание venv внутри Docker
ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR /app
COPY pyproject.toml poetry.lock* ./

# Устанавливаем зависимости
RUN poetry install --no-interaction --no-ansi

# Копируем код
COPY . .

# Запуск тестов
CMD ["pytest", "tests/", "-v"]

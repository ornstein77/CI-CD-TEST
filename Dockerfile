FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .
COPY tests.py .

RUN useradd -m -r botuser && \
    chown -R botuser:botuser /app
USER botuser

CMD ["python", "main.py"]
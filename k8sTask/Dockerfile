FROM python:3.9-slim

WORKDIR /app

RUN pip install --no-cache-dir flask==3.0.3

COPY Python.py .

EXPOSE 6000

CMD ["python", "Python.py"]
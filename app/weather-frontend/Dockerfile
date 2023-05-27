FROM python:3.11-slim
RUN pip install flask gunicorn requests prometheus_client
WORKDIR /weather
COPY . .
EXPOSE 8080
CMD ["gunicorn", "-b", "0.0.0.0:8080", "weather"]
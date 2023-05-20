FROM python:3.11-slim
RUN pip install flask gunicorn requests prometheus_client
WORKDIR /query_service
COPY . .
EXPOSE 8081
CMD ["gunicorn", "-b", "0.0.0.0:8081", "query_service"]
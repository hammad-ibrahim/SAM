FROM python:3.9-slim-buster  # Choose a suitable Python base image

WORKDIR /app

COPY req1.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

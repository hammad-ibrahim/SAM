# Use a more recent Python image
FROM python:3.12-slim

# Install system dependencies, including ca-certificates for SSL
RUN apt-get update && \
    apt-get install -y gcc libpq-dev ca-certificates && \
    apt-get clean

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire Django project to the container
COPY . /app/

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port your Django app runs on (typically 8000)
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

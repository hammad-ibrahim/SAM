# Base image
FROM centos:9

# Update package lists
RUN dnf update -y

# Install Python dependencies
RUN yum install -y python3 python3-devel gcc openssl-devel bzip2-devel libffi-devel

# Install psycopg2 (if your project uses a PostgreSQL database)
RUN yum install -y python3-psycopg2

# Create a working directory
WORKDIR /app

# Copy your Django project code
COPY . .

# Install project dependencies
RUN pip install -r requirements.txt  # Replace with your command if different

# Expose port for Django app (modify if needed)
EXPOSE 8000

# Command to run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

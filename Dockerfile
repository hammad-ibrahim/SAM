# Use the official Django image as the base image
FROM django:latest

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the entire Django project to the container
COPY . /app/


# Expose the port your Django app runs on (typically 8000)
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

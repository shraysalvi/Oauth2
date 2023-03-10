# Base image
FROM python:3.9-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt install net-tools

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Run migrations
# RUN python manage.py migrate
# RUN python manage.py collectstatic --no-input

# Expose port 8000 for the Django app
EXPOSE 8080

# Start the Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8080", "--insecure"]

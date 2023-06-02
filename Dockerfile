# Use a Python base image
FROM python:3.10.6

# Set the working directory in the container
WORKDIR /flask_app

# Copy the dependencies file to the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app code to the container
COPY . .

RUN chmod +x /flask_app/db_migrations_script.sh

# Expose the port on which the Flask app will run
EXPOSE 5000

# Set the command to run your Flask app
CMD ["python3", "app.py"]
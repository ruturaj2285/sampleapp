# FROM registry.access.redhat.com/ubi8/ubi:latest
# RUN yum install -y python3 python3-pip && yum clean all
# WORKDIR /app
# COPY requirements.txt .
# RUN pip3 install --no-cache-dir -r requirements.txt
# COPY app.py .
# COPY tests ./tests
# EXPOSE 5000
# CMD ["python3", "app.py"]

# FROM registry.access.redhat.com/ubi8/ubi:latest

# # Update OS packages and install Python
# RUN yum update -y && \
#     yum install -y python3 python3-pip && \
#     yum clean all

# WORKDIR /app

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip3 install --no-cache-dir -r requirements.txt

# # Copy app files
# COPY app.py .
# COPY tests ./tests

# EXPOSE 5000

# CMD ["python3", "app.py"]

# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies required to build Python packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libffi-dev libxml2-dev libxslt1-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY app.py .
COPY tests ./tests

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]





# FROM registry.access.redhat.com/ubi8/ubi:latest
# RUN yum install -y python3 python3-pip && yum clean all
# WORKDIR /app
# COPY requirements.txt .
# RUN pip3 install --no-cache-dir -r requirements.txt
# COPY app.py .
# COPY tests ./tests
# EXPOSE 5000
# CMD ["python3", "app.py"]

FROM registry.access.redhat.com/ubi8/ubi:latest

# Update OS packages and install Python
RUN yum update -y && \
    yum install -y python3 python3-pip && \
    yum clean all

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy app files
COPY app.py .
COPY tests ./tests

EXPOSE 5000

CMD ["python3", "app.py"]




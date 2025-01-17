FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . ./

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip &&\
  pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt &&\
  wget -q -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.8.0/hadolint-Linux-x86_64 &&\
  chmod +x /bin/hadolint

## Step 4:
# Expose port 80
EXPOSE 80/tcp

## Step 5:
# Run app.py at container launch
ENTRYPOINT ["python", "app.py"]

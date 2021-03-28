FROM python:3.8.5-slim-buster

WORKDIR /usr/src/webscreenshot

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN apt-get update && apt-get install -y \
    phantomjs \
    xvfb \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "python", "./webscreenshot.py", "-s", "-o", "/screenshots", "-i", "/screenshots/domains.txt" ]
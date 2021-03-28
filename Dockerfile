FROM python:3.9.2-slim-buster

WORKDIR /usr/src/webscreenshot
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y \
    phantomjs \
    xvfb \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "python", "./webscreenshot.py", "-o", "/screenshots" ]
CMD [ "-i", "/screenshots/domains.txt" ]
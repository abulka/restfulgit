# FROM python:3.7-alpine
FROM python:3.6-slim

# docker build --rm -f "Dockerfile" -t restfulgit:latest "."    <--- BUILD IMAGE
# docker run --rm -ti restfulgit:latest bash    <--- BASH

# RUN apk --update add bash nano
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static
WORKDIR /code
COPY requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
COPY . /code/
# CMD ["ls", "-l"]
ENV RESTFULGIT_CONFIG /code/config.py
# CMD ["python", "-m", "restfulgit.app"]
CMD python -m restfulgit.app

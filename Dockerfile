FROM python:alpine

RUN apk update && apk upgrade

RUN apk add supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /usr/src/app

COPY /app .

WORKDIR /etc/supervisor/conf.d

ENTRYPOINT ["supervisord"]

FROM python:alpine

RUN apk update && apk upgrade

RUN apk add supervisor

WORKDIR /usr/src/app

COPY /app .

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5001
EXPOSE 5002

WORKDIR /etc/supervisor/conf.d

COPY supervisord.conf .

ENTRYPOINT ["supervisord"]

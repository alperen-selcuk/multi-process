FROM python:alpine

RUN apk update && apk upgrade

RUN apk add supervisor

COPY supervisord.conf /etc/supervisor/conf.d

COPY requirements.txt .

RUN pip install -r requirements.txt

WORKDIR /usr/src/app

COPY /app .

EXPOSE 5001
EXPOSE 5002

WORKDIR /etc/supervisor/conf.d

ENTRYPOINT ["supervisord"]

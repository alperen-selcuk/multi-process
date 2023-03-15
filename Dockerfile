FROM alpine

WORKDIR /usr/src/app

RUN apk update & apk upgrade

RUN apk add supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY /app .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5001
EXPOSE 5002

CMD ["/usr/bin/supervisord"]

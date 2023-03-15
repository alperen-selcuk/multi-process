FROM alpine

WORKDIR /usr/src/app

RUN apk update & apk upgrade

RUN apk add supervisor

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5001
EXPOSE 5002

CMD ["/usr/bin/supervisord"]

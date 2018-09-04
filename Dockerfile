FROM python:alpine

WORKDIR /app


RUN apk add --update --no-cache --virtual build_images g++ gcc libxslt-dev git && \
    git clone https://github.com/Foair/course-crawler.git /app && \
    pip install requests BeautifulSoup4 lxml -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com && \
    apk del build_images && \
    apk add --no-cache  --update aria2 && \
    rm -rf /app/README.md /app/LICENSE

RUN apk add --no-cache bash

COPY ./docker-entrypoint.sh /app

RUN chmod 777 ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

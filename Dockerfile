FROM python:3.9.18-slim

ENV TimeZone=Asia/Shanghai

USER root

WORKDIR /app

COPY *.py ./
COPY *.txt ./
COPY cron_script ./
COPY *.sh ./

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    mkdir myConfig/ && \
    ln -snf /usr/share/zoneinfo/$TimeZone /etc/localtime && echo $TimeZone > /etc/timezone && \
    apt-get update && \
    apt-get install -y cron && \
    crontab cron_script

CMD ["sh", "/app/start_cron.sh"]
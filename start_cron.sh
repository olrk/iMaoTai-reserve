#!/bin/bash
# 试了很多种方式，只有这样才能使定时任务生效
service cron start; tail -f /dev/null
FROM python:3.7-slim
COPY .  /app
WORKDIR /app
EXPOSE 5000
ENV REDIS_HOST="$redisIp"
RUN pip install --no-cache-dir -r requirements.txt
CMD ["flask", "run", "--host=0.0.0.0"]
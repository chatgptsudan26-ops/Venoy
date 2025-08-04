FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl unzip

# تحميل V2Ray الرسمي
RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip && \
    chmod +x v2ray && \
    mv v2ray /app/v2ray

COPY config.json /app/config.json
COPY Procfile /app/Procfile

CMD ["./v2ray", "run", "-config=config.json"]

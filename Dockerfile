FROM alpine:latest

LABEL description="sersync docker image, easy to use"
LABEL maintainer="taojy123@163.com"
LABEL note="Please publish the container's port 873 to host port 873, or use host network."

ENV TARGET_HOST=should.been.set
VOLUME /syncdir
EXPOSE 873

# if you want use APK mirror then uncomment, modify the mirror address to which you favor
# RUN sed -i 's|http://dl-cdn.alpinelinux.org|https://mirrors.aliyun.com|g' /etc/apk/repositories

ENV TZ=Asia/Shanghai
RUN set -ex && \
    apk add --no-cache tzdata rsync && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    rm -rf /tmp/* /var/cache/apk/*

COPY . /root

WORKDIR /root

RUN set -ex && \
    touch /tmp/rsyncd.log && \
    touch /tmp/rsync_fail_log.sh && \
    mv rsyncd.conf /etc/rsyncd.conf && \
    mv sersync2 /usr/bin/sersync2 && \
    chmod +x /usr/bin/sersync2 && \
    chmod +x startup.sh && \
    sed -i 's/\r//' startup.sh

CMD sh startup.sh

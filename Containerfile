FROM docker.io/alpine:3.22.1

RUN apk add --no-cache \
    git \
    make \
    gcc \
    musl-dev \
    linux-headers \
    gettext
RUN git clone https://github.com/z3APA3A/3proxy.git /3proxy \
    && cd /3proxy \
    && make -f Makefile.Linux

COPY ./proxy_env.cfg /app/proxy_env.cfg
COPY ./entrypoint.sh /app/entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
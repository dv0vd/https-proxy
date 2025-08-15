FROM docker.io/alpine:3.22.1

RUN apk add --no-cache \
    git \
    make \
    gcc \
    musl-dev \
    linux-headers
RUN git clone https://github.com/z3APA3A/3proxy.git /3proxy \
    && cd /3proxy \
    && make -f Makefile.Linux

COPY ./proxy.cfg /3proxy/conf/3proxy.cfg

EXPOSE 3128

ENTRYPOINT ["/3proxy/bin/3proxy", "/3proxy/conf/3proxy.cfg"]
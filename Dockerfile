FROM alpine:3.12

RUN set -ex \
    && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    apache2-utils \
    bash \
    bind-tools \
    bird \
    bridge-utils \
    busybox-extras \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file\
    fping \
    iftop \
    iperf \
    iproute2 \
    ipset \
    iptables \ 
    iptraf-ng \
    iputils \
    ipvsadm \
    jq \
    libc6-compat \
    liboping \
    mtr \
    net-snmp-tools \
    netcat-openbsd \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    openssl \
    scapy \
    socat \
    strace \
    tcpdump \
    tcptraceroute \
    tshark \
    util-linux \
    vim \
    websocat


# apparmor issue #14140
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump


# Installing termshark
ENV TERMSHARK_VERSION 2.1.1
RUN wget https://github.com/gcla/termshark/releases/download/v${TERMSHARK_VERSION}/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz -O /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz && \
    tar -zxvf /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz && \
    mv termshark_${TERMSHARK_VERSION}_linux_x64/termshark /usr/local/bin/termshark && \
    chmod +x /usr/local/bin/termshark


# Settings
ADD motd /etc/motd
ADD profile  /etc/profile

CMD ["/bin/bash","-l"]

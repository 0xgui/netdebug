FROM alpine

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
    bridge-utils \
    busybox-extras \
    conntrack-tools \
    curl \
    dhcping \
    drill \
    ethtool \
    file\
    fping \
    httpie \
    hping3 \
    iftop \
    iperf \
    iproute2 \
    ipset \
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
    socat \
    strace \
    tcpdump \
    vim \
    tcptraceroute \
    util-linux 
     

# Installing grpcurl v1.8.1
RUN wget https://github.com/fullstorydev/grpcurl/releases/download/v1.8.1/grpcurl_1.8.1_linux_x86_64.tar.gz && tar -vxzf grpcurl_1.8.1_linux_x86_64.tar.gz && chmod +x grpcurl && mv grpcurl /usr/local/bin && rm grpcurl_1.8.1_linux_x86_64.tar.gz

CMD ["/bin/bash","-l"]

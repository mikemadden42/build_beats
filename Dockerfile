FROM centos:7

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN yum update -y && \
        yum install -y libpcap-devel systemd-devel vim-enhanced python-virtualenv && \
        yum group install -y "Development Tools" && \
        yum clean all && \
        rm -rf /var/cache/yum

RUN curl -Lso - https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz | \
    tar zxf - -C /usr/local

ENV PATH /usr/local/go/bin:/root/go/bin:$PATH
ENV GOPATH /root/go

RUN go get -u -d github.com/magefile/mage && \
        cd $GOPATH/src/github.com/magefile/mage && \
        go run bootstrap.go

RUN mkdir -p ${GOPATH}/src/github.com/elastic && \
        git clone https://github.com/elastic/beats.git ${GOPATH}/src/github.com/elastic/beats

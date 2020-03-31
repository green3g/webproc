FROM golang:alpine

# install dnsmasq
RUN apk add --no-cache -uU \
	dnsmasq git curl bash \ 
	&& rm -rf /var/cache/apk/* /tmp/*

# install webproc
RUN curl https://i.jpillora.com/webproc | bash

# copy
COPY dnsmasq.conf /etc/dnsmasq.conf

# run
CMD ["/go/webproc", "--configuration-file", "/etc/dnsmasq.conf", "--", "dnsmasq", "--no-daemon"]


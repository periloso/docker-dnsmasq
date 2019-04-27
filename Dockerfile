FROM alpine:edge
RUN apk update \
	&& apk --no-cache add dnsmasq

#configure dnsmasq
RUN mkdir -p /etc/default/

RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf

VOLUME ["/etc/dnsmasq.d"]

WORKDIR /etc

CMD ["dnsmasq", "-k", "--log-facility=-"]

EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 67/udp
EXPOSE 68/udp

# EXPERIMENTAL!!
FROM	alpine:3.10

COPY	bfv_linded-v1.21-20041207.1627.run /bfv_linded-v1.21-20041207.1627.run
RUN	echo x86 > /etc/apk/arch && \
	apk --no-cache add musl && \
	apk --no-cache add ncurses5-libs && \
	ln -s /lib/ld-musl-i386.so.1 /lib/ld-linux.so.2 && \
	echo -e 'accept\n\nno\n/usr/bin'|/bfv_linded-v1.21-20041207.1627.run && \
	rm -f /bfv_linded-v1.21-20041207.1627.run

WORKDIR /usr/bin/bfv
CMD	["/usr/bin/bfv/bfv_linded.static", "+statusMonitor", "1"]

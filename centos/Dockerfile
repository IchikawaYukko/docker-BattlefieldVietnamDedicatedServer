FROM	centos:7

COPY	bfv_linded-v1.21-20041207.1627.run /bfv_linded-v1.21-20041207.1627.run
RUN	yum update -y
#RUN	yum install -y bzip2 glibc32 ncurses-compat-libs.i686 #CentOS8
RUN	yum install -y bzip2 glibc.i686 ncurses-libs.i686

RUN	cp -p /usr/bin/more{,.bak} && \
	cp -p /usr/bin/cat /usr/bin/more
RUN	echo -e 'accept\nyes\nno\n/root'|/bfv_linded-v1.21-20041207.1627.run && \
	rm -f /bfv_linded-v1.21-20041207.1627.run
RUN	rm -f /usr/bin/more && \
	mv /usr/bin/more.bak /usr/bin/more

CMD	["/root/bfv/bfv_linded.static", "+statusMonitor", "1"]

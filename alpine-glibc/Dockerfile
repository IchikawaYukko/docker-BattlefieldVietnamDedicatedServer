FROM	alpine:3.10

COPY	bfv_linded-v1.21-20041207.1627.run /bfv_linded-v1.21-20041207.1627.run
RUN	apk --no-cache add libarchive-tools zstd && \
	wget https://www.archlinux.org/packages/core/x86_64/lib32-glibc/download/ -O - | bsdtar xfJ - && \
	wget https://www.archlinux.org/packages/multilib/x86_64/lib32-ncurses/download/ -O - |bsdtar xfJ - && \
	ln -s /usr/lib32/ld-linux.so.2 /lib/ld-linux.so.2 && \
	ln -s /usr/lib32/libncursesw.so.6 /usr/lib32/libncurses.so.5 && \
	echo -e 'accept\nyes\nyes\n/usr/bin'|/bfv_linded-v1.21-20041207.1627.run && \
	rm -f /bfv_linded-v1.21-20041207.1627.run

CMD	["bfv_linded.dynamic", "+statusMonitor", "1"]

FROM	battlefield_vietnam

COPY	eod_016_server.zip /eod_016_server.zip
COPY	eod_020_server_hotfix.zip /eod_020_server_hotfix.zip

RUN	yum install -y unzip && \
	unzip /eod_016_server.zip -d /usr/bin/bfv/mods/ && \
	unzip -o /eod_020_server_hotfix.zip -d /usr/bin/bfv/mods/ && \
	yum remove -y unzip

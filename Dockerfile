FROM	centos:7

COPY	bfv_linded-v1.21-20041207.1627.run /bfv_linded-v1.21-20041207.1627.run
COPY	BVServerManager201.tgz /BVServerManager201.tgz
COPY	entrypoint.sh /usr/bin/entrypoint.sh

# 'more' command shows EURA. And it expects human intaract.
# So, to install automatically, 'more' must be replaced by cat.
#
# echo -e 'accept\n\nno\n/usr/bin'
#   ->
#     accept\n    Accept EULA
#     \n          Continue to EULA for PunkBuster
#     no\n        Not install PunkBuster
#     /usr/bin\n  Install BFV server to /usr/bin/bfv

RUN	yum update -y && yum install -y bzip2 glibc.i686 ncurses-libs.i686 && \
	cp -p /usr/bin/more{,.bak} && \
	cp -p /usr/bin/cat /usr/bin/more && \
	chmod +x /bfv_linded-v1.21-20041207.1627.run && \
	echo -e 'accept\n\nno\n/usr/bin'|/bfv_linded-v1.21-20041207.1627.run && \
	rm -f /bfv_linded-v1.21-20041207.1627.run && \
	rm -f /usr/bin/more && \
	mv /usr/bin/more.bak /usr/bin/more && \
	chmod +x /usr/bin/entrypoint.sh && \
	tar zxfv /BVServerManager201.tgz -C /usr/bin/bfv bvsmd.static && \
	tar zxfv /BVServerManager201.tgz -C /usr/bin/bfv/mods/bfvietnam/settings/ useraccess.con servermanager.con playermenu.con && \
	rm -f /BVServerManager201.tgz && \
	sed -ie 's/manager\.consolePassword ".*"/manager.consolePassword "DockerBFV"/' /usr/bin/bfv/mods/bfvietnam/settings/servermanager.con && \
	sed -ie 's/game\.serverMaxAllowedConnectionType .*/game.serverMaxAllowedConnectionType CTModem56Kbps/' /usr/bin/bfv/mods/bfvietnam/settings/servermanager.con && \
	sed -ie 's/game\.serverMaxPlayers .*/game.serverMaxPlayers 64/' /usr/bin/bfv/mods/bfvietnam/settings/servermanager.con && \
	cp -aR /usr/bin/bfv/mods/bfvietnam/settings/ /usr/bin/bfv/server_settings_skel/

# Select all conquest map as server playable map
# If non selected, fail to launch server by BVSM
COPY servermaplist_preselect_conquest_maps.con /usr/bin/bfv/server_settings_skel/servermaplist.con

WORKDIR /usr/bin/bfv
ENTRYPOINT [ "entrypoint.sh" ]

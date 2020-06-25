#!/bin/bash

# Original Gamespy server has been shutdown in May 2014.
# So, point Qtracker (www.qtracker.com) instead of Gamespy to announce server existence.
echo '65.112.87.186  bfvietnam.available.gamespy.com' >> /etc/hosts
echo '65.112.87.186  bfvietnam.master.gamespy.com' >> /etc/hosts
echo '65.112.87.186  bfvietnam.ms0.gamespy.com' >> /etc/hosts

# Set server display name
sed -ie "s/serverName \".*\"/serverName \"$SERVERNAME\"/" /usr/bin/bfv/mods/bfvietnam/settings/serversettings.con
exec /usr/bin/bfv/bfv_linded.static "$@"

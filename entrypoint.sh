#!/bin/bash

# Original Gamespy server has been shutdown in May 2014.
# So, point Qtracker (www.qtracker.com) instead of Gamespy to announce server existence.
echo '65.112.87.186  bfvietnam.available.gamespy.com' >> /etc/hosts
echo '65.112.87.186  bfvietnam.master.gamespy.com' >> /etc/hosts
echo '65.112.87.186  bfvietnam.ms0.gamespy.com' >> /etc/hosts

# If /usr/bin/bfv/mods/bfvietnam/settings/ is mounted from Docker host
#   and it is empty, copy setting files
if ! ls -1qA /usr/bin/bfv/mods/bfvietnam/settings/| grep  -q .; then
    cp -aR /usr/bin/bfv/server_settings_skel/* /usr/bin/bfv/mods/bfvietnam/settings/
    echo SERVER SETTING TEMPLATE COPIED
fi

# Start Server Manager
ln -s bfv_linded.static bfv_linded
/usr/bin/bfv/bvsmd.static -daemon "$@"
touch /usr/bin/bfv/bvsmd.log
exec tail -f /usr/bin/bfv/bvsmd.log

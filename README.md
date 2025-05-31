[日本語](READMEja.md)

# Battlefield Vietnam dedicated server Docker container!!

* `Dedicated server installer v1.21 Linux` (bfv_linded-v1.21-20041207.1627.run)
* `Battlefield Vietnam Server Manager - v2.01 Linux` (BVServerManager201.tgz)

    are required for build this container image.

Can be download from here -> http://fizweb.elte.hu/battlefield/Battlefield-Vietnam/ or http://www.bf-games.net/downloads/category/73/server.html

~~Or may be found in BFV CD-ROM ???~~ (Only BFV Server for Windows found in BFV 1.20 CD-ROM. Server for linux is not inside.)

__Don't have Battlefield Vietnam game itself ? You can buy in Amazon.com !!! You should buy it !!!__

# Setting

You can modify server settings by Battlefield Vietnam Remote Manager (BVRM).

## Initial Username & Password
Server Manager:  admin / password

Server Console:  UserName / DockerBFV

~~You must change Manager password after successful deploy.~~

Currently can not change password when you bind mount mods/bfvietnam/settings/ directory. So you should block 15667/udp port by firewall rule, or only permit access from IP address on your PC.


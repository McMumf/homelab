# Network UPS Tools (NUT)

This will explain how to configure a linux machine to connect to Synology's Network UPS Server

## 1. Install Stuff

```sh
sudo apt install nut nut-client
```

## 2. Verify Connectivity

Run the following command where `SYNOLOGY-IP` is the IP/Hostname of your Synology NAS

```sh
$ upsc ups@SYNOLOGY-IP
Init SSL without certificate database
battery.charge: 79
battery.charge.low: 10
battery.charge.warning: 20
...
```

You should see output pertaining to the UPS connected to your Synology.

Once you verified you can connect, continue to configuration

## 3. Configure nut

Edit `/etc/nut/nut.conf` and set the mode

```conf
MODE=netclient
```

Edit `/etc/nut/upsmon.conf` and configuring monitoring

```conf
RUN_AS_USER root

MONITOR ups@SYNOLOGY-IP 1 monuser secret slave

MINSUPPLIES 1
SHUTDOWNCMD "/sbin/shutdown -h"
NOTIFYCMD /usr/sbin/upssched
POLLFREQ 2
POLLFREQALERT 1
HOSTSYNC 15
DEADTIME 15
POWERDOWNFLAG /etc/killpower
```

where `SYNOLOGY-IP` is the IP/Hostname of your Synology NAS

# Cilium

## BGP

Diagram the BGP connections.

VLAN1 operates in `192.168.1.X`

VLAN3 operates in `192.168.5.X`

VLAN4 operates in `192.168.6.X`

- where lb-services will live
- what UDM Pro advertises

```mermaid
architecture-beta

group homelab[Homelab]
group vlan1(cloud)[vlan1] in homelab
group vlan3(cloud)[vlan3] in homelab

service pc(server)[PC 1] in vlan1
service cp1(server)[Control Plane 1] in vlan3
service cp2(server)[Control Plane 2] in vlan3
service cp3(server)[Control Plane 3] in vlan3
service w1(server)[Woker 1] in vlan3
service w2(server)[Woker 2] in vlan3
service w3(server)[Woker 3] in vlan3
service udm(internet)[UDM Pro] in homelab
junction udmJunction
junction junction1
junction junction2
junction junction3

udm:B -- T:udmJunction
pc:R -- L:udmJunction
udmJunction:B -- T:junction1
cp1:R -- L:junction1
w1:L -- R:junction1
cp2:R -- L:junction2
w2:L -- R:junction2
cp3:R -- L:junction3
w3:L -- R:junction3
junction1:B -- T:junction2
junction2:B -- T:junction3

```

| Machine | IP |
| ------- | -- |
| Control Plane 1 | `192.168.5.100` |
| Control Plane 2 | `192.168.5.101` |
| Control Plane 3 | `192.168.5.102` |
| Worker 1 | `192.168.5.103` |
| Worker 1 | `192.168.5.104` |
| Worker 1 | `192.168.5.105` |

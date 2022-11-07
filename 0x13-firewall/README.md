# 0x13. Firewall
## About
* Setting up firewall rules on Ubuntu servers
	* Uncomplicated firewall `ufw`
## Tasks
0. Ufw rules to block all incoming traffic execpt the following tcp ports:
	* `22` (ssh)
	* `443` (https)
	* `80` (http)
	* [0-block_all_incoming_traffic_but](0-block_all_incoming_traffic_but)
1. Configure ufw to forward incoming request on port `8080` to port `80`
	* [100-port_forwarding](100-port_forwarding)

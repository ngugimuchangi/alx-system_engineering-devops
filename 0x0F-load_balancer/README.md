# 0x0F. Load balancer

## About
Load balancing using HAProxy

## Tasks
0. Script to configure new Ubuntu machine by:
	* Installing nginx
	* Adding a custom header `X-Served-By` with the value of the `hostname`
	* [0-custom_http_response_header](0-custom_http_response_header)
1. Script to install and configure HAProxy for loadbalance between two servers
	* [1-install_load_balancer](1-install_load_balancer)
2. Puppet manifest to install nginx and add custom header on new Ubuntu machine
	* [2-puppet_custom_http_response_header.pp](2-puppet_custom_http_response_header.pp)

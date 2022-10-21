# 0x0C. Web server

# About
Working with Nginx webserver
* Installtion
* Configuration
* Creating server blocks
* Redirection
* Custom 404 pages
* Configuration management

# Tasks
0. Write a Bash script that transfers a file from our client to a server:

	Requirements:

	* Accepts 4 parameters
		* The path to the file to be transferred
		* The IP of the server we want to transfer the file to
		* The username `scp` connects with
		* The path to the SSH private key that `scp` uses
	* Display `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY` if less than 3 parameters passed
	* `scp` must transfer the file to the user home directory `~/`
	* Strict host key checking must be disabled when using `scp`
	* [0-transfer_file](0-transfer_file)
1. Write a Basch Script to install `nginx` on Ubuntu machine

	Requirements:

	* Nginx should listen on port 80
	* When querying its roo `/` with a GET request, it must return a page that contains the string `Hello World!`
	* [1-install_nginx_web_server](1-install_nginx_web_server)
2. Get a domain from [.TECH Domains](https://get.tech) and create a `A record` linking the domain name to your server
	* [2-setup_a_domain_name](2-setup_a_domain_name)
3. Write a bash script to configure `nginx` to permanently redirect `/redirect_me`
	* [3-redirection](3-redirection)
4. Configure your Nginx server to have a custom 404 page that contains the string Ceci n'est pas une page.

	Requirements:

	* The page must return an HTTP 404 error code
	* The page must contain the string Ceci n'est pas une page
	* [4-not_found_page_404](4-not_found_page_404)
5. Configuration management using Puppet

	Requirements:

	* Nginx should be listening on port 80
	* When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
	* The redirection must be a “301 Moved Permanently”
	* [7-puppet_install_nginx_web_server.pp](7-puppet_install_nginx_web_server.pp)

# 0x1A Application Server

## About
Setting up application servers
* Web Server Gateway Interface (WSGI)
* Gunicorn
* Nginx proxy configruation

## Tasks
0. Configuring flask application `web_flask/0-hello_route.py` to server its content from the route `/airbnb-onepage/` on port `5000`
1. Binding gunicorn to flask instances listening on port 5000
2. Nginx configuration to proxy request to the process listening on port `5000`
	* [2-app_server-nginx_config]
3. Nginx configuration to proxy requests to the route `/airbnb-dynamic/number_odd_or_even/(any integer)` the process listening on port `5001`
* [3-app_server-nginx_config](3-app_server-nginx_config)
4. Nginx setup so that the route /api/ points to a Gunicorn instance listening on port `5002`
* [4-app_server-nginx_config](4-app_server-nginx_config)
5. Nginx setup to:
	* Server proxy request from route `/` to Gunicorn instance that servers content from `web_dynamic/2-hbnb.py` on port `5003`
	* [5-app_server-nginx_config](5-app_server-nginx_config)
6. Systemd service file to ensure Gunicorn process from task #5 start automatically on system startup
	* [gunicorn.service](gunicorn.service)
7. Bash script to gracefully reload gunicorn process
	* [4-reload_gunicorn_no_downtime](4-reload_gunicorn_no_downtime)

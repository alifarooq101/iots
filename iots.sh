#!/bin/sh
#
#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset
#
# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
#
# Update packages and Upgrade system
echo -e "$Cyan \n Updating & Upgrading System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y;
#
# Updating & Upgrading System Done
echo -e "$Yellow \n Updating & Upgrading System Done $Color_Off"
#
echo -e "$Red \n ======================================= $Color_Off"
#
#
# Installing Communication Protocol
echo -e "$Cyan \n Installing Communication Protocol.. $Color_Off"
sudo apt install mosquitto mosquitto-clients;
#
#
# Communication Protocol Installed
echo -e "$Yellow \n Communication Protocol Installed $Color_Off"
#
# Working on Credentials
echo -e "$Cyan \n Working on Credentials.. $Color_Off"
echo "techstar:smarts" > pwfile;
#
# Working on File Encription
echo -e "$Cyan \n Working on File Encription.. $Color_Off"
mosquitto_passwd -U pwfile;
#
# File Encription Cont...
echo -e "$Cyan \n File Encription Cont.. $Color_Off"
cat pwfile;
#
# Moving Encrypted File
echo -e "$Cyan \n Moving Encrypted File.. $Color_Off"
sudo mv pwfile /etc/mosquitto/;
#
# Addressing Protocol
echo -e "$Cyan \n Addressing Protocol.. $Color_Off"
sudo nano /etc/mosquitto/mosquitto.conf;
#
# Restarting Protocol
echo -e "$Cyan \n Restarting Protocol.. $Color_Off"
sudo /etc/init.d/mosquitto restart;
#
# Protocol Restarted
echo -e "$Yellow \n Protocol Restarted.. $Color_Off"
#
# Protocol Status
echo -e "$Green \n Protocol Status $Color_Off"
sudo service mosquitto status;
#
echo -e "$Red \n ======================================= $Color_Off"
# Installing Visualization Tool.....
echo -e "$Cyan \n Installing Visualization Tool..... $Color_Off"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -;
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list;
#
# Updating......
echo -e "$Cyan \n Updating...... $Color_Off"
sudo apt update;
#
# Installing Visualization Tool.......
echo -e "$Cyan \n Installing Visualization Tool....... $Color_Off"
sudo apt install grafana;
#
# Enabling Tool........
echo -e "$Cyan \n Enabling Tool........ $Color_Off"
sudo systemctl enable grafana-server;
#
# Starting Tool.......
echo -e "$Cyan \n Starting Tool....... $Color_Off"
sudo systemctl start grafana-server;
#
# Visualization Tool Has Been Installed.......
echo -e "$Green \n Visualization Tool Has Been Installed....... $Color_Off"
echo -e "$Red \n ======================================= $Color_Off"
#
#
#
# Installing Server............
echo -e "$Cyan \n Installing Server............ $Color_Off"
sudo apt install apache2;
#
#
# Adjusting Firewall.......
echo -e "$Cyan \n Adjusting Firewall....... $Color_Off"
sudo ufw app list;
#
#
# Using Server Profile.......
echo -e "$Cyan \n Using Server Profile....... $Color_Off"
sudo ufw allow in "Apache";
#
#
# Verifying Changings.......
echo -e "$Cyan \n Verifying Changings....... $Color_Off"
sudo ufw status;
#
#
# Installing Database.........
echo -e "$Cyan \n Installing Database......... $Color_Off"
sudo apt install mysql-server;
sudo mysql_secure_installation;
#
#
#
# Login to Database.........
echo -e "$Cyan \n Login to Database......... $Color_Off"
sudo mysql;
#
#
#
# Install and Secure phpMyAdmin..........
echo -e "$Cyan \n Install and Secure phpMyAdmin.......... $Color_Off"
sudo apt update;
#
# Installing Packages............
echo -e "$Cyan \n Installing Packages............ $Color_Off"
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl;
#
#
# Enable the mbstring PHP extension............
echo -e "$Cyan \n Enable the mbstring PHP extension............ $Color_Off"
sudo phpenmod mbstring;
#
#
# Restarting Server..........
echo -e "$Cyan \n Restarting Server.......... $Color_Off"
sudo systemctl restart apache2;
#
#
# Configuring Password Access...........
echo -e "$Cyan \n Configuring Password Access........... $Color_Off"
sudo mysql;
#
#
# Checking which authentication method......................
echo -e "$Cyan \n Checking which authentication method...................... $Color_Off"
SELECT user,authentication_string,plugin,host FROM mysql.user;
#
#
# Change Auth_socket of root account to Password............
echo -e "$Cyan \n Change Auth_socket of root account to Password............ $Color_Off"
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '12121414';
#
#
# Checking Again the authentication methods...............
echo -e "$Cyan \n Checking Again the authentication methods............... $Color_Off"
SELECT user,authentication_string,plugin,host FROM mysql.user;
# Install Bridging.....
echo -e "$Cyan \n Install Bridging..... $Color_Off"
sudo apt install build-essential git curl;
#
# Installing Script......
echo -e "$Cyan \n Installing Script...... $Color_Off"
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered);
#
# Configuring automatically Starting on Boot.......
echo -e "$Cyan \n Configuring automatically Starting on Boot........ $Color_Off"
sudo systemctl enable nodered.service;
#
# Starting Manually.......
echo -e "$Cyan \n Starting Manually....... $Color_Off"
sudo node-red-start;
#
# Status......
echo -e "$Cyan \n Status...... $Color_Off"
sudo systemctl status nodered.service;
#
# Installing Admin........
# echo -e "$Cyan \n Installing Admin........ $Color_Off"
# sudo npm install -g node-red-admin;
#
# Generating Password......
# echo -e "$Cyan \n Generating Password...... $Color_Off"
# sudo node-red-admin hash-pw;
#
# Opening Settings.....
# echo -e "$Cyan \n Opening Settings..... $Color_Off"
# sudo nano /root/.node-red/settings.js;
#
# Bridging is Stopping.....
# echo -e "$Cyan \n Bridging is Stopping..... $Color_Off"
# sudo node-red-stop;
#
# Checking Bridging Status.....
# echo -e "$Cyan \n Checking Bridging Status..... $Color_Off"
# sudo systemctl status nodered.service;
#
# Bridging Starting......
# echo -e "$Cyan \n Bridging Starting...... $Color_Off"
# sudo node-red-start;
#
# Bridging Status
# echo -e "$Green \n Bridging Status...... $Color_Off"
# sudo systemctl status nodered.service;
echo -e "$Green \n Bridging has been Started...... $Color_Off"
echo -e "$Red \n ======================================= $Color_Off"
# Done.......
# echo -e "$Red \n Open phpmyadmin....Good Luck..... $Color_Off"

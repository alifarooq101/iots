#!/bin/sh

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo "$Cyan \n Updating & Upgrading System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y;

# Updating & Upgrading System Done
echo "$Yellow \n Updating & Upgrading System Done $Color_Off"

echo "$Red \n ======================================= $Color_Off"


# Installing Communication Protocol
echo "$Cyan \n Installing Communication Protocol.. $Color_Off"
sudo apt install mosquitto mosquitto-clients;


# Communication Protocol Installed
echo "$Yellow \n Communication Protocol Installed $Color_Off"

# Working on Credentials
echo "$Cyan \n Working on Credentials.. $Color_Off"
echo "techstar:smarts" > pwfile;

# Working on File Encription
echo "$Cyan \n Working on File Encription.. $Color_Off"
mosquitto_passwd -U pwfile;

# File Encription Cont...
echo "$Cyan \n File Encription Cont.. $Color_Off"
cat pwfile;

# Moving Encrypted File
echo "$Cyan \n Moving Encrypted File.. $Color_Off"
sudo mv pwfile /etc/mosquitto/;

# Addressing Protocol
echo "$Cyan \n Addressing Protocol.. $Color_Off"
sudo nano /etc/mosquitto/mosquitto.conf;

# Restarting Protocol
echo "$Cyan \n Restarting Protocol.. $Color_Off"
sudo /etc/init.d/mosquitto restart;

# Protocol Restarted
echo "$Yellow \n Protocol Restarted.. $Color_Off"

# Protocol Status
echo "$Green \n Protocol Status $Color_Off"
sudo service mosquitto status;

echo "$Red \n ======================================= $Color_Off"




# Install Bridging.....
echo "$Cyan \n Install Bridging..... $Color_Off"
sudo apt install build-essential git curl;

# Installing Script......
echo "$Cyan \n Installing Script...... $Color_Off"
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered);

# Configuring automatically Starting on Boot.......
echo "$Cyan \n Configuring automatically Starting on Boot........ $Color_Off"
sudo systemctl enable nodered.service;

# Starting Manually.......
echo "$Cyan \n Starting Manually....... $Color_Off"
sudo node-red-start;

# Status......
echo "$Cyan \n Status...... $Color_Off"
sudo systemctl status nodered.service;

# Installing Admin........
echo "$Cyan \n Installing Admin........ $Color_Off"
sudo npm install -g node-red-admin;

# Generating Password......
echo "$Cyan \n Generating Password...... $Color_Off"
sudo node-red-admin hash-pw;

# Opening Settings.....
echo "$Cyan \n Opening Settings..... $Color_Off"
sudo nano /root/.node-red/settings.js;

# Bridging is Stopping.....
echo "$Cyan \n Bridging is Stopping..... $Color_Off"
sudo node-red-stop;

# Checking Bridging Status.....
echo "$Cyan \n Checking Bridging Status..... $Color_Off"
sudo systemctl status nodered.service;

# Bridging Starting......
echo "$Cyan \n Bridging Starting...... $Color_Off"
sudo node-red-start;

# Bridging Status
echo "$Green \n Bridging Status...... $Color_Off"
sudo systemctl status nodered.service;
echo "$Green \n Bridging has been Started...... $Color_Off"
echo "$Red \n ======================================= $Color_Off"

# Installing Visualization Tool.....
echo "$Cyan \n Installing Visualization Tool..... $Color_Off"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -;
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list;

# Updating......
echo "$Cyan \n Updating...... $Color_Off"
sudo apt update;

# Installing Visualization Tool.......
echo "$Cyan \n Installing Visualization Tool....... $Color_Off"
sudo apt install grafana;

# Enabling Tool........
echo "$Cyan \n Enabling Tool........ $Color_Off"
sudo systemctl enable grafana-server;

# Starting Tool.......
echo "$Cyan \n Starting Tool....... $Color_Off"
sudo systemctl start grafana-server;

# Visualization Tool Has Been Installed.......
echo "$Green \n Visualization Tool Has Been Installed....... $Color_Off"
echo "$Red \n ======================================= $Color_Off"



# Installing Server............
echo "$Cyan \n Installing Server............ $Color_Off"
sudo apt install apache2;


# Adjusting Firewall.......
echo "$Cyan \n Adjusting Firewall....... $Color_Off"
sudo ufw app list;


# Using Server Profile.......
echo "$Cyan \n Using Server Profile....... $Color_Off"
sudo ufw allow in "Apache";


# Verifying Changings.......
echo "$Cyan \n Verifying Changings....... $Color_Off"
sudo ufw status;


# Installing Database.........
echo "$Cyan \n Installing Database......... $Color_Off"
sudo apt install mysql-server;
sudo mysql_secure_installation;



# Login to Database.........
echo "$Cyan \n Login to Database......... $Color_Off"
sudo mysql;



# Install and Secure phpMyAdmin..........
echo "$Cyan \n Install and Secure phpMyAdmin.......... $Color_Off"
sudo apt update;

# Installing Packages............
echo "$Cyan \n Installing Packages............ $Color_Off"
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl;


# Enable the mbstring PHP extension............
echo "$Cyan \n Enable the mbstring PHP extension............ $Color_Off"
sudo phpenmod mbstring;


# Restarting Server..........
echo "$Cyan \n Restarting Server.......... $Color_Off"
sudo systemctl restart apache2;


# Configuring Password Access...........
echo "$Cyan \n Configuring Password Access........... $Color_Off"
sudo mysql;


# Checking which authentication method......................
echo "$Cyan \n Checking which authentication method...................... $Color_Off"
SELECT user,authentication_string,plugin,host FROM mysql.user;


# Change Auth_socket of root account to Password............
echo "$Cyan \n Change Auth_socket of root account to Password............ $Color_Off"
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '12121414';


# Checking Again the authentication methods...............
echo "$Cyan \n Checking Again the authentication methods............... $Color_Off"
SELECT user,authentication_string,plugin,host FROM mysql.user;



# Done.......
echo -e "$Red \n Open phpmyadmin....Good Luck..... $Color_Off"

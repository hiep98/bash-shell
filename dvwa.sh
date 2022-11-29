#/bin/bash
echo -e "\n" 
echo -e "# Damn Vulnerable Web App Installer Script #"
echo -e ""
echo " Written by: itboy"
echo " Website: https://infosec.blogspot.com"
echo "[*] Downloading DVWA..."
wget http://dvwa.googlecode.com/files/DVWA-1.0.7.zip
echo -e "Done!\n"
echo -n "[*] Unzipping DVWA..."
unzip DVWA-1.0.7.zip > /dev/null
echo -e "Done!\n"
echo -n "[*] Deleting the zip file..."
rm DVWA-1.0.7.zip > /dev/null
echo -e "Done!\n"
echo -n "[*] Copying dvwa to root of Web Directory..."
cp -Rv dvwa/* /var/www/html > /dev/null
echo -e "Done!\n"
echo -n "[*] Clearing Temp Directory..."
rm -R dvwa > /dev/null
echo -e "Done!\n"
echo -e "chmod "
 chmod -Rv 777 /var/www/html/dvwa 
echo -n "[*] Starting Web Service..."
service apache2 start &> /dev/null
echo -e "Done!\n"
eservice mysql start &> /dev/null
echo -e "Done!\n"
echo -n "[*] Updating Config File..."
http://127.0.0.1/setup.php &> /dev/null
mysql -h localhost -u root
create database dvwa;
grant all on dvwa.* to dvwa@localhost identified by 'xxx';
flush privileges;
exit;
mv  /var/www/DVWA-master/configconfig.inc.php.dist  /var/www/DVWA-master/configconfig.inc.php
SET PASSWORD FOR root@localhost=PASSWORD('123');
service apache2 restart
service mysql restart
echo -e -n "[*] Starting Firefox to DVWA\nUserName: admin\nPassword:  password"
firefox http://127.0.0.1/login.php &> /dev/null &
echo -e "\nDone!\n"
echo -e "[\033[1;32m*\033[1;37m] DVWA Install Finished!\n"

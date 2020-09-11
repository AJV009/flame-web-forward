# Quickly setup a LAMP environment for Ubuntu 20.04 
### SHould work for other Ubuntu versions too!
For more ref. check this [Digitalocean guide to install LAMP on Ubuntu 20](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04) and [DigitalOcean guide to configure vhost](https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-18-04-quickstart)

## Lets just Install and Configure
**NOTE:** you just dont have to care about checking while installation if you do everything correctly!

Updating and installing packages (install all updates and keep your system fresh!)
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```

Installing git
```bash
$ sudo apt-get install git-all
```

Installing apache2 server

**NOTE:** git-all installs apache2 but still we will do it again!
```bash
$ sudo apt-get install apache2
```

Install my-sql
```bash
$ sudo apt install mysql-server
```

Setup MySQL
```bash
$ sudo mysql_secure_installation
```

It may ask if you want to enable secure password validation, just give yes!

**NOTE:** NOW you will have to create super secure passwords with over 8 chars, number, a symbol and both cases.

Install php
```bash
$ sudo apt install php libapache2-mod-php php-mysql
```

Now lets create a vhost for every project!
You will have to use terminal to make changes under /var
- Create a project folder under /var/www (lets name it xyz.xyz)
- Change permissions
```bash
$ sudo chown -R $USER:$USER /var/www/xyz.xyz
```
**NOTE:** $USER is your current username and -R basically means recursively change permissions for all files and folder residing under the said directory
-  Now lets create a config file for the new directory/site
```bash
$ sudo nano /etc/apache2/sites-available/xyz.xyz.conf
```
**NOTE:** nano is a terminal based editor
- Now copy the following text in the conf file
```bash
<VirtualHost *:80>
    ServerName xyz.xyz
    ServerAlias www.xyz.xyz 
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/xyz.xyz
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
**NOTE:**  <br>
`SeverAdmin` - the email of your website's admin <br>
`Sever Name` - the address of your website <br>
`Server Alias` - a sudo or virtual name that should be displayed on search bar while accessing the site. <br>
`Document Root` - the directory which contains the website.

- Oops we forgot to create a sample index file for fun.
```
$ sudo nano /var/www/xyz.xyz/index.html
```
- Some random content:
```
<html>
<title>My Site</title>
<body>
<h1>Youe site is blank just please add something!<h1>
qwertyuiop asdfghjkl
</body>
</html>
```
**NOTE:** 
- [`Ctrl` + `x`] -> `y` -> `Enter` (Save and Close)
- Now we have a site and some data, you may want to just shutdown the default one.
```bash
$ sudo a2dissite 000-default.conf
```
and enable new one!
```bash
$ sudo a2ensite xyz.xyz.conf
```
- Dont forget to restart the server after adding a new configuration
```bash
$ sudo systemctl restart apache2
```
**IMP:** We need to point the new host address to our local system, so that the browser wont spend time in hunting the custom xyz.xyz on the internet and quickly fetch them from the localhost!
```bash
$ sudo nano /etc/hosts
```
Now add the IP address and name of the site.
```bash
127.0.0.1       xyz.xyz
```
- Now you can access the site at `https://xyz.xyz`
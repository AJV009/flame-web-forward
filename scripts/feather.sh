#!/bin/bash

helpFunction() {
   echo ""
   echo "Usage: $0 -u site_url -d site_root"
   echo -e "\t-u Site url"
   echo -e "\t-d Site root directory"
   exit 1 # Exit script after printing help
}

makeVirtualHost() {
   chown -R $USER:$USER $site_root
   apacheSitePath="/etc/apache2/sites-available/${site_url}.conf"
   touch ${apacheSitePath}
   confData="<VirtualHost *:80> \n    ServerAdmin admin@${site_url} \n    ServerName ${site_url} \n    ServerAlias www.${site_url} \n    DocumentRoot ${site_root} \n    ErrorLog ${APACHE_LOG_DIR}/error.log \n    CustomLog ${APACHE_LOG_DIR}/access.log combined \n</VirtualHost>"
   echo -e $confData > $apacheSitePath
   a2ensite "${site_url}.conf"
   systemctl restart apache2
   sed -i "1 s/^/127.0.0.1        ${site_url}\n/" /etc/hosts
}

while getopts "u:d:" opt; do
   case "$opt" in
   u)
      site_url="$OPTARG"
      ;;
   d)
      site_root="$OPTARG"
      ;;
   ?)
      helpFunction
      ;; # Print helpFunction in case parameter is non-existent
   esac
done

if [ -z "$site_url" ] || [ -z "$site_root" ]; then
   echo "Some or all of the parameters are empty"
   helpFunction
else
   makeVirtualHost
fi

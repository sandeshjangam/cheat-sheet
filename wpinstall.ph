#!/bin/bash

website=$1

mkdir /var/www/html/$website 
cd /var/www/html/$website

wp core download 

wp config create --dbname=$website --dbuser=root --dbpass=root --extra-php <<PHP
define('FS_METHOD', 'direct');
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

wp db create

wp core install --url="localhost/$website" --title='Wordpress Site' --admin_user='ganeshk@bsf.io' --admin_password='admin@123' --admin_email='ganeshk@bsf.io' --skip-email 

wp plugin delete --all 

# wp theme install astra --activate 

# wp plugin install woocommerce --activate

# wp plugin install elementor --activate

# wp plugin install woocommerce-gateway-stripe --activate


composer global require wp-cli/wp-cli

# cd wp-content/plugins/

# git clone https://github.com/metorikhq/wc-cyclone.git
# git clone https://ganeshk:aftermath7@git.brainstormforce.com/cartflows/cartflows.git
# git clone https://ganeshk:aftermath7@git.brainstormforce.com/cartflows/cartflows-pro.git
# git clone https://ganeshk:aftermath7@git.brainstormforce.com/cartflows/woo-cart-abandonment-recovery.git

# wp plugin activate wc-cyclone cartflows cartflows-pro woo-cart-abandonment-recovery

# cd wc-cyclone && composer install

# wp cyclone seed && wp cyclone products 20

# wp plugin delete wc-cyclone	

clear

echo "==========================================================";
echo "Site is ready: http://localhost/$website/wp-admin/";
echo "Username: ganeshk@bsf.io";
echo "Password: admin@123";
echo "==========================================================";

chmod o+w /var/www/html/$website
chmod -R 777 /var/www/html/$website



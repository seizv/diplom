<?php

Config::set('site_name', 'Цветочный магазин');

Config::set('languages', array('en', 'fr'));

Config::set('upload_dir', 'webroot' . DS.'uploads'.DS);

// Routes. Route name => method prefix
Config::set('routes', array(
    'default' => '',
    'admin'   => 'admin_',
));

Config::set('default_route', 'default');
Config::set('default_language', 'en');
Config::set('default_controller', 'pages');
Config::set('default_action', 'index');
/*
Config::set('db.host', 'mysql.zzz.com.ua');
Config::set('db.user', 'seiz');
Config::set('db.password', 'rhtvtyxeu');
Config::set('db.db_name', 'seiz');
*/
Config::set('db.host', 'localhost');
Config::set('db.user', 'root');
Config::set('db.password', '');
Config::set('db.db_name', 'mvc');

Config::set('salt', 'jd7sj3sdkd964he7e');

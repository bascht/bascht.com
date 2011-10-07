---
author: bascht
date: '2007-07-24 10:35:36'
layout: post
slug: xdebug-fur-ubuntu
status: publish
title: xdebug für Ubuntu
wordpress_id: '209'
? ''
: - howto
  - howto
  - php
  - php
  - programmieren
  - programmieren
  - ubuntu
  - ubuntu
  - xdebug
  - xdebug
---

Hier ein kleines Tutorial zur Installation von xdebug für PHP5
unter Ubuntu Feisty (7.04). Zuerst benötigen wir "phpize", zu
finden im php-dev Paket: `sudo apt-get install php5-dev` Dann
schauen wir mal, was es in der PECL so alles mit "xdebug" im Namen
gibt:
    sudo pecl search xdebug
    
    Matched packages, channel pecl.php.net:
    =======================================
    Package Stable/(Latest)      Local
    Xdebug  2.0.0/(2.0.0 stable)
    Provides functions for function traces and profiling

Das sieht doch ganz gut aus, also gleich installieren:
    sudo pecl install xdebug

So, letzter Schritt - wir fügen die xdebug Extension an unsere
php.ini an. In meinem Falle (lighttpd mit fastcgi) ist es
**/etc/php5/cgi/php.ini**.
    extension=xdebug.so

Nicht vergessen, den Webserver neu zu laden und schon kanns
losgehen. Happy Debugging! bascht



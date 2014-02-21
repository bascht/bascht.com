---
author: bascht
date: '2007-12-10 15:58:17'
slug: php-pdo-unter-leopard
status: publish
title: PHP + PDO unter Leopard
comments: true
wordpress_id: '299'
? ''
: - computer
  - computer
  - howto
  - howto
  - mac
  - mac
  - php
  - php
---

Die Freude über das in MacOS integrierte PHP5 hält leider nicht so
lange an. Leider sind nämlich die PDO-Bindings für MySQL kaputt.
Dank der Anleitung unter
[http://blog.phpdoc.info/archives/83-php-5.2.5-on-Leopard.html](http://blog.phpdoc.info/archives/83-php-5.2.5-on-Leopard.html)
hab ich aber die passende Konfiguration zum Handkompilieren von
PHP5. Einfach aus den MacPorts installieren und mit
    './configure'
    '--prefix=/Users/sean/php'
    '--with-apxs2=/opt/local/apache2/bin/apxs'
    '--with-xsl=/usr'
    '--with-tidy=/opt/local'
    '--enable-mbstring'
    '--with-gd'
    '--with-jpeg-dir=/opt/local'
    '--with-png-dir=/opt/local'
    '--with-zlib-dir'
    '--enable-sockets'
    '--enable-exif'
    '--with-mcrypt=/opt/local'
    '--enable-soap'
    '--with-mysql=/usr/local/mysql'
    '--with-pdo-mysql=/usr/local/mysql/bin/mysql_config'
    '--with-mysql-sock=/tmp/mysql.sock'
    '--with-freetype-dir=/opt/local'
    '--with-openssl=/opt/local'
    '--without-iconv'
    '--enable-cli'

konfigurieren. Dann der Zweizeiler "make" und "make install" - der
Rest steht dann im Blog bei phpdoc.info.



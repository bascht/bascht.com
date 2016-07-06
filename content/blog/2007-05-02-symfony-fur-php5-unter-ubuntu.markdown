---
author: bascht
date: 2007-05-02
slug: symfony-fur-php5-unter-ubuntu
status: publish
title: Symfony für PHP5 unter Ubuntu
comments: true
wordpress_id: '120'
tags:
  - linux
  - php
  - symfony
  - ubuntu
---

...ist überhaupt kein Problem, dank PEAR. Nachdem Frank heute mit
Windows schon etwas herumgeflucht hat - hier nochmal die
Ubuntu-Style-Variante:

``` bash
bascht@baschtmobil:~$ sudo pear channel-discover pear.symfony-project.com
Adding Channel "pear.symfony-project.com" succeeded
Discovery of channel "pear.symfony-project.com" succeeded

bascht@baschtmobil:~$ sudo pear install symfony/symfony
downloading symfony-1.0.2.tgz ...
Starting to download symfony-1.0.2.tgz (1,903,264 bytes)

done: 1,903,264 bytes

install ok: channel://pear.symfony-project.com/symfony-1.0.2
```

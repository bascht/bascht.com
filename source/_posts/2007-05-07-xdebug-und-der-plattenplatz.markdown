---
author: bascht
date: '2007-05-07 01:25:30'
layout: post
slug: xdebug-und-der-plattenplatz
status: publish
title: xdebug und der Plattenplatz
wordpress_id: '129'
? ''
: - computer
  - computer
  - linux
  - linux
  - php
  - php
  - programmieren
  - programmieren
  - Uncategorized
---

Wer den freien PHP-Debugger xdebug einsetzt, sollte sich die
Standard-Einstellungen mal genau ansehen: Das Teil loggt nämlich
fleißig nach "/var/cache/xdebug"! Richtig bewusst ist mir das erst
jetzt eben geworden, als ich mit filelight auf der Suche nach
Plattenplatzfressern war. Und siehe da: 2953 Dateien mit insgesamt
4630 MB. Alles sinnlose Logfiles... Und das war kein kleiner Anteil
meiner Platte:
![xdebug](http://www.bascht.com/uploads/2007/05/xdebug.png)



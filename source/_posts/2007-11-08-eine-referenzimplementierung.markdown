---
author: bascht
date: '2007-11-08 01:11:54'
layout: post
slug: eine-referenzimplementierung
status: publish
title: Eine Referenzimplementierung
wordpress_id: '280'
? ''
: - howto
  - howto
  - java
  - java
  - linux
  - linux
  - programmierung
  - programmierung
  - tomcat
  - tomcat
  - ubuntu
  - ubuntu
---

Ja. Tolles Wort. :) Mein Experimentiertrieb hat mich heute mal dazu
gebracht, den Glassfish Java EE Server zu installieren. Da es sich
ja um \_die\_ Java EE Referenzimplementierung für Webapplikationen
handelt, sollte es also für den angehenden Inschinör einen Blick
wert sein. Um ihn mit normalen Userrechten zu steuern, empfiehlt es
sich nicht die Version aus den Apt-Repos zu benutzen. Stattdessen
gibts hier:
[https://glassfish.dev.java.net/public/downloadsindex.html](https://glassfish.dev.java.net/public/downloadsindex.html)
die aktuelle Version zum Download. Einfach ausführbar machen und
starten.
[](http://www.bascht.com/uploads/2007/11/glassfish1.jpg "Glassfish - Schritt 1")
![Glassfish - Schritt 1](http://www.bascht.com/uploads/2007/11/glassfish1.jpg)

Ratzfatz läuft der Server und begrüßt mich mit einer hübschen
Adminkonsole:
Login
[![Glassfish - Schritt 2](http://www.bascht.com/uploads/2007/11/glassfish2.thumbnail.jpg)](http://www.bascht.com/uploads/2007/11/glassfish2.jpg "Glassfish - Schritt 2")

 

Applikationsverwaltung
[![Glassfish - Schritt 3](http://www.bascht.com/uploads/2007/11/glassfish3.thumbnail.jpg)](http://www.bascht.com/uploads/2007/11/glassfish3.jpg "Glassfish - Schritt 3")

 

Magische Menüpunkte (unzählig viele!), unter anderem JNDI (das
könnte nützlich für uns werden...)
[![Glassfish - Schritt 4](http://www.bascht.com/uploads/2007/11/glassfish4.thumbnail.jpg)](http://www.bascht.com/uploads/2007/11/glassfish4.jpg "Glassfish - Schritt 4")
Zusammen mit dem Glasshfish-Plugin für Eclipse (findet ihr ganz
einfach in den Server-Connectoren) ist es echt eine spaßige
Kombination und vielleicht auch für manch einsamen und geplagten
Windows-XP Tomcat-User mal einen Blick wert. ;)




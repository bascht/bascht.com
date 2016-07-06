---
author: bascht
date: 2008-10-08
slug: adobe-air-mit-einem-64-bit-ubuntu
status: publish
title: Adobe AIR mit einem 64 bit Ubuntu
comments: true
wordpress_id: '391'
autoframe: true
tags: [adobe, air, howto, linux, software, tweetdeck, twitter, ubuntu]
---

Adobe AIR machte auf meinem 64bit Ubuntu irgendwie keine richtigen
Muxer und segfaultete munter bei der Installation Da es vielleicht
vielen ähnlich geht wie mir, hier ne kurze Anleitung wie ihr es
trotzdem zum laufen bekommt: Ladet euch den
**Adobe AIR for Linux SDK** runter (SDK, nicht die
Runtime!)[http://labs.adobe.com/downloads/air\_linux.html](http://labs.adobe.com/downloads/air_linux.html)
Entpackt den SDK in eurer Home-Verzeichnis oder wo gerade Platz
ist. In meinem Fall ist das **/home/bascht/bin/air/** Ladet euch
eine AIR App herunter und entpackt sie (das sind einfache
ZIP-Files) gleich mit in das AIR Verzeichnis. Ich hab ein
Unterverzeichnis 'apps' erstellt. Ich nehm als Beispiel mal
TweetDeck: /home/bascht/bin/air/apps/TweetDeck

![Tweetdeck](https://img.bascht.com/uploads/big/9d7a158b8340052ef60e217f178f42f6.jpg)

Jetzt legt euch einfach einen Starter ins Panel, der die AIR
Applikation direkt startet:

``` bash
/home/bascht/bin/air/bin/adl -nodebug\
  /home/bascht/bin/air/apps/TweetDeck/META-INF/AIR/application.xml\
  /home/bascht/bin/air/apps/TweetDeck/
```

Wichtig: Das ist \_eine\_ Zeile. Icon festlegen und klicken. Happy Twitter-Ing.

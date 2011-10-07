---
author: bascht
date: '2007-05-22 11:34:22'
layout: post
slug: ein-tag-ohne-x
status: publish
title: Ein Tag ohne X?
wordpress_id: '154'
? ''
: - howto
  - howto
  - internet
  - internet
  - linux
  - linux
---

Inspiriert vom Blog
[diesem Blogeintrag](http://www.terminally-incoherent.com/blog/2007/05/21/a-day-without-x/):
"A Day without X", habe ich mich mal etwas umgesehen, welche
Alternativen es zu den Grafischen Kollegen gibt. Nach kurzen Tests,
war ich mir sicher, das ich für Email, ICQ und RSS doch lieber eine
Gui hätte. :) Aber das irssi hats mir angetan. irssi ist ein
Kommandozeilen-IRC-Client - soweit so gut. Was die Geschichte
spannend macht, ist die Tatsache, dass man irssi über eine
screen-Session auch auf dem Hochschulrechner laufen lassen kann.
Das hat den Vorteil, das man quasi 24/7 im Chat sitzt, aber nur von
den Boxen aus mitliest, an denen man gerade angemeldet und online
ist. (Das können auch beliebig viele sein) Hier eine kurze
Anleitung: Einen SSH-Tunnel zum lumi aufbauen (über einen belibigen
SSH-Server der Hochschule):
ssh -P -L 2002:lumi.htwm.de:22 sschulz5@ssh-www.htwm.de Am Lumi
anmelden:

ssh -P -p 2002 sschulz5@localhost Irssi in einer Screen Session
starten

screen -S irrsi irssi Und voila! Jetzt kann man sich von jeder
Kiste aus drauf anmelden und mitlesen. Einfach per: Am Lumi
anmelden:

screen -x irssi




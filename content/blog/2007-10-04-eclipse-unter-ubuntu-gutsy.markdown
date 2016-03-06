---
author: bascht
date: 2007-10-04
slug: eclipse-unter-ubuntu-gutsy
status: publish
title: Eclipse unter Ubuntu Gutsy
comments: true
wordpress_id: '255'
? ''
: - eclipse
  - eclipse
  - howto
  - howto
  - linux
  - linux
  - ubuntu
  - ubuntu
---

Wer (wie ich) nach einem Upgrade auf Ubuntu Gutsy Probleme mit
Eclipse hat (diverse Fehlermeldungen vom Interface "ui" und "view")
der schaue einfach mal nach ob Ubuntu noch das Sun-Java verwendet.
Das wird scheinbar beim Update (ohne zu fragen) zurückgesetzt. Ein
Blick in die **/etc/eclipse/java\_home** schafft Klarheit:
> \# This file determines the search order the Eclipse Platform uses
> to find a \# compatible JAVA\_HOME. This setting may be overridden
> on a per-user basis by \# altering the JAVA\_HOME setting in
> \~/.eclipse/eclipserc. /usr/lib/jvm/java-gcj
> /usr/lib/kaffe/pthreads /usr/lib/jvm/java-6-sun
> /usr/lib/jvm/java-1.5.0-sun /usr/lib/j2se/1.5 /usr/lib/j2se/1.4
> /usr/lib/j2sdk1.5-ibm /usr/lib/j2sdk1.4-ibm /usr/lib/j2sdk1.6-sun
> /usr/lib/j2sdk1.5-sun /usr/lib/j2sdk1.4-sun

Also einfach den Editor Deiner Wahl gepackt und das Sun-Java oben
ergänzt:
> \# This file determines the search order the Eclipse Platform uses
> to find a \# compatible JAVA\_HOME. This setting may be overridden
> on a per-user basis by \# altering the JAVA\_HOME setting in
> \~/.eclipse/eclipserc. /usr/lib/jvm/java-6-sun
> /usr/lib/jvm/java-gcj /usr/lib/kaffe/pthreads
> /usr/lib/jvm/java-6-sun /usr/lib/jvm/java-1.5.0-sun
> /usr/lib/j2se/1.5 /usr/lib/j2se/1.4 /usr/lib/j2sdk1.5-ibm
> /usr/lib/j2sdk1.4-ibm /usr/lib/j2sdk1.6-sun /usr/lib/j2sdk1.5-sun
> /usr/lib/j2sdk1.4-sun

Und Voilá



---
author: bascht
date: '2007-08-23 11:27:13'
layout: post
slug: curlftpfs-fuse-mit-passworteingabe
status: publish
title: CURLFTPFS (FUSE) mit Passworteingabe
wordpress_id: '224'
? ''
: - ftp
  - ftp
  - fuse
  - fuse
  - howto
  - howto
  - linux
  - linux
  - ubuntu
  - ubuntu
---

Curlftpfs ist ein angenehmes
[FUSE](http://wiki.ubuntuusers.de/FUSE)-Modul, zum mounten von
FTP-Servern in beliebe Verzeichnisse. An die Funktionalität gewöhnt
man sich schnell, nur das Handling ist etwas Mist, da man das
Passwort entweder jedes mal über die Konsole eingeben muss, oder
aber sein Passwort in einer Klartextdatei speichern muss. Hier ein
kleines Howto, wie man **curlftpfs** automatisieren kann, ohne sein
Passwort in einer Klartextdatei zu speichern: Ich nutze dazu Zenity
(das gibt mir eine hübsche kleine Gui zur Passworteingabe). Legt
euch einfach ein kleines Shell-Script an:
`` #!/bin/bash pw=`zenity --hide-text --entry --text 'Bitte FTP-Passwort eingeben!'` curlftpfs bascht.com bascht.com/ -o user=xyz:$pw ``
Garnich schwer, oder? :)



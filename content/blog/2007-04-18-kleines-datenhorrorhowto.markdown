---
author: bascht
date: 2007-04-18
slug: kleines-datenhorrorhowto
status: publish
title: Kleines Datenhorrorhowto
comments: true
wordpress_id: '97'
? ''
: - computer
  - computer
  - fehler
  - fehler
  - technik
  - technik
  - Uncategorized
---

Do not try this at home, or at all! Glaubt mir eh keiner, was mir
grad bei André passiert ist. Hier der genaue Ablauf zum
nachspielen. Vorbetrachtungen:
> USB Platte eins: 160 GB, frisch formatiert USB Platte zwei: 110 GB,
> Backup von Platte eins

Durchführung: Anstecken: Platte eins
    mkfs.vfat -n "FAT_LADY" /dev/sdb1

Abziehn: Platte eins Anstecken: Platte zwei Merken, dass man sich
beim formatieren vertippt hat Anstecken: Platte eins
    mkfs.vfat -n "FAT LADY" /dev/sdb1

Wer den Fehler bemerkt, darf mal laut lachen und mich bedauern...
Für alle anderen gibts irgendwann 'ne Auflösung.



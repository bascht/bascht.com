---
author: bascht
date: '2008-04-13 21:20:55'
slug: spurensuche-mit-foremost
status: publish
title: Spurensuche mit Foremost
comments: true
wordpress_id: '348'
tags: computer, howto, lifehacks, linux
---

Hab gestern von Matthias ne *kaputte* SD Karte in Empfang genommen.
Ließ sich unter Windows nicht mehr formatieren, die Kamera hat sie
auch nicht mehr erkannt. Zeit also, der Karte mal mit
Linux-Boardwerkzeug zu Leibe zu rücken... :)

### 1. Schritt: Karte einlegen

Den output von dmesg überprüfen, eventuell ist sie Partitionstabelle kaputt, die Daten aber noch da.

```syslog
[2879.952330] sd 6:0:0:2: [sde] 1981440 512-byte hardware sectors (1014 MB)
[2879.953584] sd 6:0:0:2: [sde] Write Protect is off
[2879.953593] sd 6:0:0:2: [sde] Mode Sense: 43 00 00 08
[2879.953597] sd 6:0:0:2: [sde] Assuming drive cache: write through
[2879.955487] sd 6:0:0:2: [sde] 1981440 512-byte hardware sectors (1014 MB)
[2879.956683] sd 6:0:0:2: [sde] Write Protect is off
[2879.956691] sd 6:0:0:2: [sde] Mode Sense: 43 00 00 08
[2879.956696] sd 6:0:0:2: [sde] Assuming drive cache: write through
[2879.956702] sde: unknown partition table
```

### 2. Schritt: Karte Blockweise kopieren

Das geht einfach mit `dd`. Device als Input merken. Output ist eine Datei, die ihr dann
untersuchen könnt.

```bash
f$ sudo dd if=/dev/sde of=./sd.image
1981440+0 Datensätze ein 1981440+0 Datensätze aus 1014497280 Bytes (1,0 GB) kopiert, 449,267s, 2,3 MB
```

### 3. Schritt: Forensik mit Foremost

Jetzt die ausgelesene Image-Datei mit Foremost untersuchen. Hab mir dazu noch ein leeres
Verzeichnis "files" angelegt, in das Foremost dann die gefundenen
Dateien kopiert.

```bash
$ foremost -i sd.image -o files/
Processing: sd.image |************|
```

Sobald foremost durchgelaufen ist, könnt ihr versuchen in den
ausgegebenen Dateien die Bilder oder Videos auszulesen, die noch zu
retten sind. Mit etwas Glück lässt sich die Karte ja wieder
formatieren und weiterbenutzen. :)

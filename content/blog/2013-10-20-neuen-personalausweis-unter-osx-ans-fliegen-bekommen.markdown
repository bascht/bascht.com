---
title: "Den neuen Personalausweis (nPA) unter OS X ans Fliegen bekommen"
date: 2013-10-20
comments: true
tags: [npa,german government,egovernment,eid,ausweis,ausweisapp]
---


Aus der berühmten Reihe »[Adventures in E-Government](https://twitter.com/bascht/status/374817007403016192) heute:
»Wie benutze ich meinen elektronischen Personalausweis (nPA) unter Mac OS X?«.
Okay, ich gebs ja zu. So ganz freiwillig bin ich nicht an das Thema geraten: In einem meiner aktuellen Projekte habe ich mit dem »neuen« Personalausweis,
respektive [seinem elektronischen Inhalt](https://de.wikipedia.org/wiki/Elektronischer_Personalausweis#Der_elektronische_Personalausweis_.28nPA.29) zu tun.

Nachdem ich mir lange genug den Ärger der Kollegen über *AusweisApp* und *AutentApp*
angehört habe, habe ich mir so ein imposantes [Lesegerät](http://www.reiner-sct.com/produkte/chipkartenleser/cyberJack_RFID_komfort.html?pEl=7) zugelegt
und versuche euch einige Leiden zu ersparen indem ich das Setup hier kurz beschreibe. Bitte lest erst einmal bis zum Ende - es gibt die eine oder andere Fußangel.

![Reiner](https://img.bascht.com/uploads/big/e5f2ce3e7b2781ac797a9ab17c8b3cbd.jpg)

Das Setup unter OS X war - wie zu erwarten - alles andere als einfach. Man benötigt zu
erst die Treiber für den eigenen Kartenleser. In meinem Fall für den [Reiner SCT cyberjack RFID Komfort](http://www.reiner-sct.com/support/download/treiber-und-software/cyberjack/rfid-komfort-macos.html?grp=kontaktlos)
(wer denkt sich solche Produktnamen eigentlich aus?).

Das Lesegerät blinkt zwar schon lustig, aber so richtig sinnvoll wird es erst
mit der AusweisApp vom BSI. Aber **Vorsicht**. Vorher
müssen wir uns um den Browser kümmern. Das BSI hat sich mit der Entwicklung der
App nämlich auf **einen einzigen** (Nicht-IE) Browser festgelegt: Den *Firefox ESR 17*.
Richtig gelesen. *ESR* steht für *Extended Support Release*. Den bekommt ihr
auf einer [speziellen Seite](http://www.mozilla.org/en-US/firefox/organizations/all.html) der Mozilla Foundation.

![Schritt 1](https://img.bascht.com/uploads/big/31bdaa45b250b6b593370f0914cffe89.png)

<span style="font-weight: bold; color: red">Achtung, weiterscrollen:</span> Die benötigte Version **17** steht **viiiiel** weiter unten:

![Schritt 2](https://img.bascht.com/uploads/big/6967a85820ef17d83c75e42f0089c477.png)

Falls ihr bereits einen Firefox installiert habt, kopiert den ESR Firefox einfach
unter einem anderen Namen daneben:

![Schritt 3](https://img.bascht.com/uploads/big/33802f6de22fa16d91ba8be486098ce9.png)

<span style="font-weight: bold; color: red">Achtung:</span> Den ESR Firefox nicht gleich starten,
sonst wird der euer bestehendes Nutzerprofil komplett durcheinander bringen. Am besten den ProfileManager
starten und ein eigenes Profil für den Firefox ESR anlegen:

![Schritt 4](https://img.bascht.com/uploads/big/15932e68f43e306492d481ab0cb1f3d1.png)

So. Die erste Hürde ist genommen: Euer Rechner ist jetzt bereit für eine Installation der AusweisApp:
Den Download gibt im [Personalausweis-Portal des BSI](https://www.ausweisapp.bund.de/pweb/filedownload/download_pre.do).
Und hier lauert auch schon der nächste Fallstrick: Die AusweisApp kopiert ihr in euren Applications-Ordner - das kleine
"Firefox Add-Ons installieren" Paket müsst ihr aber getrennt installieren.

![Schritt 5](https://img.bascht.com/uploads/big/a642c28b008a15be3c4d3996ba9f54b0.png)

Kurz darauf müsste euch Firefox mit einer gefährlich aussehenden Warnung anspringen.
Hier also bitte einmal das Häkchen setzen und *weiter* klicken.

![Schritt 6](https://img.bascht.com/uploads/big/0b8cc81e73cd17499b76ea72861d5bd7.png)

<span style="font-weight: bold; color: red">Achtung:</span> Noch eine Bärenfalle: Die Installation aktiviert scheinbar
nur eine der beiden Extensions. Also noch mal im Firefox Menü > Extras > Erweiterungen / Addons genau hinsehen:
Eine der beiden muss eventuell noch aktiviert werden:

![Schritt 7](https://img.bascht.com/uploads/big/d36d4bf96e279bb9bb71b1c25ecd1a52.png)

So. **Fast geschafft!** War doch ganz einfach bis hierher, oder?

Falls ihr noch nicht verzweifelt seid, könnt ihr die AusweisApp direkt aus eurem Anwendungs-Ordner heraus starten.
Sobald die Anwendung aktiv ist (und das kann eine ganze Weile dauern… Es ist Java!), seht ihr ein Chip-Symbol in eurer Menüleiste:

![Schritt 8](https://img.bascht.com/uploads/big/6c3721fbd246aa4f17767be842fde109.png)

Testen könnt ihr den Personalausweis zum Beispiel im Testportal des BSI [ccepa.de/testportal/](https://www.ccepa.de/testportal/):

![Schritt 9](https://img.bascht.com/uploads/big/7f2d844d1262dad402510468465a9f22.png)

Legt euren Ausweis ins Lesegerät. Jetzt sollte das Symbol in der Menüleiste grün leuchten:

![Schritt 10](https://img.bascht.com/uploads/big/b503a75ac5b1eb9c4eef85df305decf2.png)

Mit dem Klick auf eines der Download-Symbole sollte jetzt auch die AusweisApp aus dem Hintergrund
starten und euch mit einem Fenster begrüßen:

![Schritt 11](https://img.bascht.com/uploads/big/f16372123f37b4d08513c4eaa80e1d25.png)

…und wenn ihr es bis hier hin geschafft habt: **Herzlichen Glückwunsch**! Nächster Schritt ist nur noch die PIN-Eingabe -
vorher sollte euch der Kartenleser verraten, wer denn Zugriff auf die Daten haben möchte:

![Schritt 12](https://img.bascht.com/uploads/big/c658c1558052875a2b48d8eea6eec1b7.jpg)

Und? war doch gar nicht so schwer, oder?

Nun, Spaß beiseite. Selbst mit Anleitung und Vorlauf durch meine Erfahrung im
Projekt hat es mir viel zu viele Schmerzen bereitet, den neuen Ausweis mit
Lesegerät zum Laufen zu bekommen. Das E-Government Gesetz ist seit August 2013
in Kraft und ich mag auch gern glauben dass sich die beteiligten Behörden ins
Zeug gelegt haben. In der öffentlichen Verwaltung codet es sich nicht so leicht
wie in einem Startup. Dennoch: Ausgereifte und gut durchdachte Software sieht anders aus.

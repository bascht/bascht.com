---
title: "Sachen selber machen"
date: 2014-02-14
comments: true
teaser: |
  Ein kleines Manifest für alle, die schon länger darüber nachdenken,
  ihre Infrastruktur selbst in die Hand zu nehmen.
autoframe: true
tags: dyi, hacking, oss, floss, google
---

Spätestens seit der Zeitrechnung [nach Snowden](http://www.fr-online.de/digital/duckduckgo-und-ixquick-google-konkurrenz-bewirbt-datenschutz,1472406,23571772.html)
dürfte es auch Zeitgenossen ohne [Aluhut](https://de.wikipedia.org/wiki/Aluhut) bewusst geworden sein,
dass es nur noch zwei Möglichkeiten des digitalen (Über-) Lebens gibt:

1. man lebt unter Aufsicht bei Google, Facebook, Apple & co.
2. man organisiert sich selbst einen Unterschlupf.

Ich habe ja schon seit geraumer Zeit über [meinen Weggang von Google Mail](http://bascht.com/blog/2010/01/23/mochten-sie-gmail-wirklich-entfernen/)
verbloggt. Nun will ich einen kleinen Überblick zu geben,
welche Dienste ich mittlerweile selbst betreibe. Und das nicht nur nur, weil es geht - sondern
weil es weniger Aufwand ist, als ich am Anfang befürchtete.

Die Dienste, die ich selbst betreiben wollte, sind:

* **Synchronsisation von Kalendern und Addressbüchern**
  * über mehrere (iOS und Android) Geräte hinweg
  * Möglichst so unkompliziert wie in Google Apps
* **Task-Synchronisation**
  * ebenso über mehrere Geräte
  * Mit Kontexten und Tags, a lá RememberTheMilk
* **Eine Dropbox**
  * Der Name sagt es schon. Mehrere Computer synchron.
  * Ohne Nachdenken.
* **Automatisches Backup meiner Handy-Fotos**
  * Foto Knipsen, automatischer Upload
  * Wie Dropbox auf Android
* **Spotify und iTunes Match**
  * Meine eigene Musik unterwegs hören
  * Musik überall hin streamen können
* **Einen Online-RSS Reader**
  * So hübsch & kraftvoll wie Google Reader
  * Muss meine OPML importieren können
  * Mit anständigen Apps für Android & iOS

Klingt auf den ersten Blick nicht nach einer Sache die man an einem Wochenende erledigt hat.
Aber: Weit gefehlt - ein ausgieber Nachmittag Basteln & ihr habt euren eigenen digitalen Unterschlupf zusammen.
Viel Hardware brauchte es dafür auch nicht. Alles was ich hier beschreibe, läuft auf kleinen virtuellen
Maschinen auf meinen Mac Mini zu Hause. SSL Proxy + DynDNS wird von einem Raspberry PI erledigt. Es ist
also keine Raketentechnik.

{{< figure
src="https://img.bascht.com/uploads/big/1e1c065e3e28404b2b09cca5959a95ae.png"
alt="Mac Mini"
class="noborder">}}
### Bevor es losgeht

Die Dienste, die ich hier vorstelle, betreibe ich alle hinter einem Raspberry PI, der gleichzeitig SSL Gateway
ist. Das gibt mir die Sicherheit dass ich »nur« Einbrecher über das Netz zu befürchten habe - die Daten selbst
liegen hier auf verschlüsselten Festplatten. Achtet also darauf dass ihr die Kommunikationsstrecken selbst
entsprechend absichert.

## ownCloud

Das [Owncloud](https://owncloud.org/) Projekt hat es sich zum Ziel gemacht, eine einfach zu bediendende
Plattform zu Zugriff auf Deine eigenen Daten zu sein - einfach nicht nur in der Bedienung, sondern vor
allem auch im Betrieb. Owncloud selbst ist wirklich genügsam. Ihr holt euch einfach eines der bereits
für euer Betriebssystem veröffentlichten [Pakete](http://software.opensuse.org/download/package?project=isv:ownCloud:community&package=owncloud)
und installiert das *owncloud* Paket. Fertig.

Naja, fast.

Owncloud selbst läuft als PHP Webapp - ich betreibe es hinter dem Standard Ubuntu Apachen, damit läuft
es völlig schmerzfrei und ich habe ohnehin keine Hochlast-Szenarien zu befürchten.

**Mein Tip:** Installiert ownCloud direkt mit einer PostgreSQL oder MySQL Datenbank zusammen. Der Installer
schlägt euch zwar die SQLite Datenbank vor - aber die Migration von sqlite weg ist nicht schmerzfrei möglich.

Zur Synchronisation mit iOS Geräten und eurem Desktop kopiert ihr einfach direkt den Pfad aus der App in
euer mobiles Gerät. Die Synchronisation mit Android wird etwas dadurch erschwert, dass Google wohl seine
eigenen Kalender- und Kontakte Apps präferiert.

Abhilfe verschaffen die beiden Apps von Marten Gajda:

* [CalDAV-Sync](https://play.google.com/store/apps/details?id=org.dmfs.caldav.lib)
* [CardDAV-Sync](https://play.google.com/store/apps/details?id=org.dmfs.carddav.Sync)

Beide sind ihr Geld wert und ich verwende sie seit einem Jahr ohne Probleme.

Kurzer Zwischenstand:

<div data-alert class="alert-box success radius">
  ✓ Kalender<br/>
  ✓ Kontakte
</div>

### ownCloud Client App

Die [ownCloud Client App](https://owncloud.org/install/) gibt es für Windows, OSX und Linux - und sie funktioniert
genau wie beworben: Installieren, Pfad zur ownCloud Instanz angeben, einloggen, fertig. Da ich die Instanz nur
zur Synchronisation meiner eigenen Rechner (und meines Telefons) benutze, habe ich auch hier keine größeren
Lastspitzen zu befürchten. Die Synchronisation läuft flott und fehlerfrei (achtet darauf, eurem Server NTP beizubringen).

Als Bonus der mobilen App gibt es noch einen automatischen Bilder-Upload. Die App hookt sich direkt in den Kamera-Workflow
ein und läd alle Bilder automatisch in ein Verzeichnis meiner ownCloud.

<div data-alert class="alert-box success radius">
  ✓ Kalender<br/>
  ✓ Kontakte<br/>
  ✓ Dropbox<br/>
  ✓ Automatischer Foto-Upload
</div>

## todo.txt

Ich ♥ Text. Und ich liebe Konsolenprogramme, die sich auf eine Aufgabe konzentrieren. [todo.txt](http://todotxt.com/)
von Gina Trapani ist ein Kreuzprodukt dieser beiden Vorlieben. Kurz gesagt: Es ist eine Task-Liste, mit GTD Support,
die allein auf Text-Dateien basiert. Keine Angst: Ihr *müsst* es natürlich nicht über die Kommandozeile bedienen,
aber die ist dennoch einen Blick wert. Die beiden Dateien `todo.txt` und `archive.txt` liegen in meinem ownCloud-Folder und werden damit über alle Geräte synchronsiert.
Für das wöchentliche GTD-Planning öffene ich die Datei einfach in VIM mit dem entsprechenden [Addon](https://github.com/freitass/todo.txt-vim).
Nerd-Level up.

Da die offizielle todo.txt App leider nur Dropbox unterstützt, verwende ich [Simpletask Cloudless](https://play.google.com/store/apps/details?id=nl.mpcjanssen.simpletask),
und synchronisiere die Dateien via [FolderSync](https://play.google.com/store/apps/details?id=dk.tacit.android.foldersync.full)und synchronisiere die Dateien via [FolderSync](https://play.google.com/store/apps/details?id=dk.tacit.android.foldersync.full)..


Und damit haben wir das nächste Häkchen:

<div data-alert class="alert-box success radius">
  ✓ Kalender<br/>
  ✓ Kontakte<br/>
  ✓ Dropbox<br/>
  ✓ Automatischer Foto-Upload<br/>
  ✓ Taskliste
</div>

![SimpleTask](https://img.bascht.com/uploads/big/7ceac1b65dbb2c5b1e0d9d46383d1dd0.png)

## Subsonic

Das [Subsonic Project](http://www.subsonic.org/pages/index.jsp) macht seit geraumer Zeit in etwa das, was iTunes Match
für den treuen Apple User erledigt: Meine Musik überall hörbar machen. Für mich ging das Dilemma mit dem Start der SSD
im Laptop los – plötzlich überlegt man sich zwei Mal, ob man doch die ganze Musiksammlung mitschleppen möchte.

Subsonic löst dieses Problem sehr elegant. Ihr installiert es auf euer Box (Pakete gibt es z.B. bei [getdeb](http://www.getdeb.net/software/subsonic)),
richtet die App ein und fangt an zu streamen. Wie auch bei ownCloud muss ich sagen dass das Setup wirklich kein Hexenwerk
war.

Ein klein wenig Bastelei hatte ich durch mein Proxy-Setup via NGINX. Um Subsonic auf einem Pfad unterhalb von "/" zu betreiben
musste ich die entsprechenden Flags in `/etc/default/subsonic` setzen. Genau so wichtig: Der Username. Sonst läuft subsonic
vermutlich als Root. (Jaja. Java und Linux.)

```sh
SUBSONIC_ARGS="--max-memory=150 --context-path=/subsonic"
SUBSONIC_USER=subsonic
```

Unter Linux integriert sich Subsonic wunderbar mit dem Amarok-Abkömmling [Clementine](http://www.clementine-player.org/).
Für OSX würde ich euch [Submariner](http://www.read-write.fr/subapp/) empfehlen.

Für unterwegs leistet mir die offizielle [Subsonic App](https://play.google.com/store/apps/details?id=net.sourceforge.subsonic.androidapp)
gute Dienste.


<div data-alert class="alert-box success radius">
  ✓ Kalender<br/>
  ✓ Kontakte<br/>
  ✓ Dropbox<br/>
  ✓ Automatischer Foto-Upload<br/>
  ✓ Taskliste<br/>
  ✓ iTunes Match
</div>

![Subsonic](https://img.bascht.com/uploads/big/28804eb7a5656c57cb4f09d2b73f1af3.png)

Wie ihr vielleicht bemerkt habt - einen wirklichen Ersatz für Spotify bietet das natürlich nicht. (Es sei denn, ihr habt
wirklich eine Musik-Bibliothek dieser Größe…)

Ich bleibe also erstmal weiter Spotify-Kunde - nutze es aber mittlerweile Hauptsächlich um neue Musik zu entdecken, oder
um immer mal bei Radio Markshark reinzuklicken:

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/search?q=%23NowPlaying&amp;src=hash">#NowPlaying</a> Wait von Alexi Murdoch auf <a href="https://twitter.com/search?q=%23Spotify&amp;src=hash">#Spotify</a> cc <a href="https://twitter.com/bascht">@bascht</a> <a href="https://twitter.com/fraucolle">@fraucolle</a> <a href="https://twitter.com/search?q=%23radiomarkshark&amp;src=hash">#radiomarkshark</a> <a href="http://t.co/5hxtEUZI">http://t.co/5hxtEUZI</a></p>&mdash; marcshark (@marcshark) <a href="https://twitter.com/marcshark/statuses/266056677684559872">November 7, 2012</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>



## tiny tiny RSS

Nachdem Google seinen Reader [versenkt](https://de.wikipedia.org/wiki/Google_Reader) hat, war ich ohnehin auf der Suche nach
einem neuen Feedreader - einen kurzen Zwischenstop habe ich bei [Newsblur](https://www.newsblur.com/) gemacht - aber dessen
allein das Interface war zum davonlaufen (ich sage nur *Training*).

Zum Glück hat mich [Lucas](https://twitter.com/moonbeamlabs) wenig später auf [Tiny Tiny RSS](http://tt-rss.org/redmine/projects/tt-rss/wiki)
aufmerksam gemacht - ein Projekt, welches ähnlich unkompliziert wie ownCloud auf meiner Box aufsetzen kann.

Es läuft mit PHP und braucht lediglich PostgreSQL oder MySQL - ich habe es auf der gleichen Kiste installiert
wie mein ownCloud. Einziger Handgriff für euch (oder eure Automatisierung): Ihr solltet einen Cronjob anlegen,
der die Artikel im Hintergrund für euch läd.

Die Android-App ist simpel und bedienbar - das Markieren von Artikeln (mit Stern) funktioniert wie ich es mir wünsche.
Alles fein.

![Tiny Tiny RSS](https://img.bascht.com/uploads/big/90adce0a9acb945074572d2b4860b699.png)

Endstand somit:
<div data-alert class="alert-box success radius">
  ✓ Kalender<br/>
  ✓ Kontakte<br/>
  ✓ Dropbox<br/>
  ✓ Automatischer Foto-Upload<br/>
  ✓ Taskliste<br/>
  ✓ iTunes Match<br/>
  ✓ Feed-Reader
</div>

# Fazit

Okay - ich gebe zu: Das ist natürlich alles nicht so leicht wie eine Registrierung bei Google. Ihr braucht ein
wenig Unix- / Linux-Wissen oder jemanden der euch dabei über die Tastatur schauen kann. Aber - mal ehrlich: Wenn
ihr in eurem Freundeskreis schon »die Technikerin / der Techniker« seid - warum setzt ihr nicht ein paar Services
für alle anderen?

Ein weiteres Problem ist natürlich die Interoperabilität. Wenn ihr an mit euch geteilten Google-Kalendern teilnehmen
wollt, hilft es natürlich nicht, die Arme zu verschränken. Das gleiche gilt für Dropbox. Ich habe den Client schon vor
einer Weile vom Rechner geworfen - im Moment reicht mir noch das Webinterface um Dateien in geteilte
Ordner hochzuladen – komfortabel ist das allerdings nicht.

Wenn ihr Fragen oder Anregungen habt: Ich freue mich auf euer Feedback auf Twitter oder per Mail.


<small>Vielen Dank an [Flo](https://twitter.com/argorak) fürs Gegenlesen.</small>
<small>Quelle Mac Mini Bild: [Wiki637 Commons](https://commons.wikimedia.org/wiki/File:Mac_mini.png)</small>

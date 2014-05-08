---
title: "Mut zu mutt"
date: 2014-05-08 19:40
comments: true
teaser: |
  Wer hat Angst vorm bösen mutt? Der erste Teil einer kleinen Einführung 
  in den einzigen E-Mail Client, der nicht stinkt.
autoframe: false
tags: mutt, mail, mua, email, hacking, linux, unix
---
> All mail clients suck.  This one just sucks less.

Eigentlich ist dem nichts mehr hinzuzufügen. Nachdem ich nach der letzten
[Nerdkunde Folge](http://nerdkunde.de/nk027.html) mehrere bestürzte Nachfragen
zu meiner geistigen Verfassung bekommen habe, möchte ich meine Begeisterung
für *mutt* nun doch noch einmal in Worte fassen – unter anderem auf vielfachen
Wunsch eines einzelnen Herren:

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/bascht">@bascht</a> dann schreib
mal einen blog eintrag und erkläre deine. Das wäre superlicious. Bittööö!</p>&mdash; Bodo Tasche (@bitboxer) 
<a href="https://twitter.com/bitboxer/statuses/464314248798433280">May 8, 2014</a></blockquote>

Während der Ideen-Sammlung zu diesem Blogpost habe ich gemerkt, wie viel ich eigentlich
zu diesem Thema erzählen könnte – daher werde ich den Post in mehrere Scheibchen teilen.

Los geht es mit der Frage aller Fragen.

## Warum in aller Welt mutt?

Nun, aus einer einfachen Motivation heraus – und ich vermute es ist die gleiche 
Begeisterung die mich dazu bringt, [VIM](/blog/2012/02/19/vim/) als meinen primären Editor zu verwenden. 
Nicht mehr und nicht weniger. Ich mag Dinge die *einfach* funktionieren. 
Und damit meine ich nicht den künstlichen Minimalismus »ablenkungsfreier« Schreib-Umgebungen, 
die den Apple App Store bevölkern. Software darf (und soll) möglichst mächtig sein – aber ich möchte nicht zu jedem Zeitpunkt, 
alle Funktionen sehen müssen. Ganz besonders nicht, wenn ich diese Software **jeden Tag** benutze.

Und da geht der Schmerz bereits los: E-Mail benötige ich jeden Tag und ich habe 
durchaus einige Anforderungen an (m)ein E-Mail Programm:

* **Sinnvolle & Konfigurierbare Shortcuts:**
  Ich möchte schnell Antworten, Archivieren, Löschen, Flaggen und Weiterleiten können.
* **Schnelle Suche:**
  Ich organisiere zwar selbst, benötige aber trotzdem oft genug eine Suche in allen
  vorhandenen Ordnern, nach einer verloren gegangenen PDF-Datei.
* **S/MIME & GnuPG:**
  Ja. Beides. Manche Projekte setzen S/MIME-Verschlüsselung dringend voraus, für andere
  Projekte und meine private Kommunikation benötige ich GnuPG.
* **Sinnvolle Thread-Darstellung:**
  Selbst wenn ich diese Funktion am häufigsten in Mailinglisten brauche: Ohne eine
  Baumstruktur verliere ich den Überblick.
* **Addressbuch-Anbindung via CalDAV:**
  Meine Kontakte liegen in einer [ownCloud](/blog/2014/02/14/sachen-selber-machen/).
  Ich möchte keine lokalen Adressbücher und keine doppelte Buchführung.
* **Signaturen**:
  Ich möchte frei konfigurierbare E-Mail Signaturen, die zum jeweiligen Projekt und
  eventuell auch zur jeweiligen Antwort passen.

### Andere Mail-Clients

Meine Reise durch das Land der E-Mail Programme ging vor vielen vielen Jahren mit dem
Webmailer von Compuserve los – irgendwann wurde dieser abgelöst von GMX und einem Outlook
Express unter Windows NT. So weit, so gut. Oder eben auch nicht.

Wenig später stieg ich auf Linux um. Mehrere Wechsel zwischen KDE, GNOME, XFCE, i3,
Xmonad und Konsorten brachten einen Ritt durch viele Clients wie Evolution, Sylpheed,
KMail / Kontact mit sich. Ungefähr auch zu dieser Zeit wechselte ich von GMX und
Googlemail hin zu meiner eigenen Domain & gehosteter E-Mail via IMAP.

Kurz nach dem Studium wechselte ich erneut die Plattform – dieses Mal auf OS X. Als
braver Anhänger der Church of Jobs verwendete ich selbstverständlich Mail.app. Das
ging so lange gut, wie das Reality-Distortion-Field mich vor der Einsicht bewahrte,
dass dieses Stück Gammelsoftware mit jedem Release die GPG-Anbindung zerbröselte und
nicht in der Lage war, einen Ordner mit mehr als 3 E-Mails ohne Verschnaufpause zu rendern.

In einer Phase geistiger Umnachtung (als Mac-User kennt man jene unter dem Namen »Mac Heist«),
kaufte ich mir eine Lizenz für Postbox.app. Doch auch hier musste ich wenige Monate später 
zur bitteren Einsicht kommen, dass ich mir eine geschminkte Leiche (auch bekannt als »Thunderbird«) 
hatte andrehen lassen.

Während all dieser Zeit konnte ich nicht widerstehen, etwa einmal im Jahr einen Blick
auf Mutt & Alpine zu werfen. Vielleicht ist es ein Gendefekt, aber Konsolen-Programme üben
einen ungeheuren Reiz auf mich aus. Und Mal für Mal musste ich – gegenüber den schier
unlösbaren Problemen vor denen mich das User-Interface stellte – kapitulieren.

Rückblickend kann man mir in jedem Fall nicht vorwerfen dass ich keine Marktbeobachtung betrieben hätte.

### Das Problem "mutt"

Ihr kennt das. Irgendwann einmal habt ihr euch gedacht: 

> Jetzt probiere ich einmal diese{s,n} {vim, emacs, irssi, mutt, alpine} von dem alle anderen so begeistert
> erzählen!

Dann startet man voller Enthusiasmus dieses feine Stück Software und sitzt da wie ein Frosch wenn es blitzt:

![Plain Mutt](/blog/2014-05-08-mut-zu-mutt/mutt-ohne-config.png)

*Und nun?*

Falls ihr (wie ich ja auch) bisher traditionelle E-Mail Programme verwendet habt, gibt es nun auch
direkt die ersten schlechten Nachrichten: Mutt hat _keine Ahnung_ wie die E-Mails auf euren Rechner
kommen – und es ist Mutt ehrlich gesagt auch _ziemlich egal_.

Die Knackpunkte sind schnell identifiziert: *Mutt ist ein klassisches UNIX-Werkzeug.*

* Es hat genau einen Zweck: E-Mails lesen & verwalten
* Es wird euch garantiert nicht mit einem First-Run-Wizard begrüßen.

Und wie für (fast) alle UNIX-Werkzeuge gilt: Sie haben keine Lernkurven, sondern
Lern-Wände. Aber: Einmal eben jenen Berg erklommen, fragt ihr euch, wie ihr denn bisher überhaupt
ohne das Werkzeug **$X** arbeiten konnte.

Um einen kleinen Vorgeschmack auf den nächsten Teil dieser Serie zu geben und – nicht
zuletzt – zu zeigen, dass Mutt auch *tatsächlich* E-Mails darstellen kann, hier ein
kleiner Screenshot meines derzeitigen mutt:

![Mein Mutt](/blog/2014-05-08-mut-zu-mutt/full-blown-mutt.png)

Damit soll es das für diesen Blogpost aber auch schon gewesen sein – ich freue mich darauf, 
mit euch im nächsten Teil Schritt für Schritt durch die Konfiguration von mutt zu stolpern.

Über Fragen & Feedback freue ich mich (wie immer) via Mail oder Twitter.

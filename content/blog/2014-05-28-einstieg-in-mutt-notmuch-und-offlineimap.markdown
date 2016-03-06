---
title: "Einstieg in Mutt, Notmuch & Offlineimap"
date: 2014-05-28
teaser: |
  Der zweite Teil unserer Serie: »Bascht vs. Email«
tags: [mutt, mail, mua, email, hacking, linux, unix]
---

Wie [bereits angekündigt](/blog/2014/05/08/mut-zu-mutt/) hier nun der
versprochene Einblick in die Konfiguration von Mutt, Notmuch und Offlineimap.

> *Gut gemeinter Hinweis*: Bitte versucht die Dateien nicht mit Copy & Paste in
> eure Home-Verzeichnisse zu kippen, sondern zu verstehen, was drin steht. :-)
> Ich versuche die Dateien so gut wie es geht zu kommentieren.

Im Laufe dieses Blogposts werden wir die folgenden Tools miteinander verdrahten:

* Offlineimap<br/>
  Um die E-Mails auf euren Rechner zu bekommen
* Notmuch<br/>
  Um E-Mails schnell zu durchsuchen, zu filtern & zu vertaggen
* MSMTP<br/>
  Um E-Mails versenden zu können
* Mutt<br/>
  Um E-Mails lesen & beantworten zu können
* PyCardSyncer<br/>
  Für ein synchrones Addressbuch in Mutt

Und wenn ihr euch jetzt fragt: »Warum in aller Welt sollte ich mir das antun?« – keine
Sorge – das ist eine berechtigte Frage. Aber, so unter uns: Warum sollte man allen
ernstes auf einer Text-Konsole mit einem Editor arbeiten, der vor knapp 40 Jahren
erfunden wurde?

## Offlineimap

Wer sich noch an meinen letzten Blog-Post erinnert, wird wissen: Mutt selbst
ist es eigentlich egal wie die E-Mails auf euren Rechner kommen. Das ist
allerdings nicht die ganze Wahrheit: Mutt hat integrierten IMAP Support. Den
habe ich selbst ein paar Wochen lang ausprobiert und mich regelmäßig darüber
geärgert. (Kurz und gut: Das ist Lahm, Wonky und nicht wirklich durchsuchbar)

Und genau an dieser Stelle kommt Offlineimap ins Spiel. Stellt euch Offlineimap
als eine Art rsync für euren IMAP Account vor. Mit diesem Werkzeug könnt ihr
einen kompletten Ordner-Baum in einen lokalen Ordner auf eurer Festplatte
synchronisieren – und das in beide Richtungen. Toll, oder?

### Die Konfiguration

Im Beispiel hier gehe ich davon aus, dass ihr zwei Accounts synchronisieren
möchtet: Einer *Privat*, der andere für die *Arbeit*. Offlineimap kennt die
Begriffe *Account* und *Repository*. Ein Repository kann zum Beispiel ein IMAP
Server oder ein lokaler Ordner sein. Ihr könntet so zum Beispiel zwei IMAP
Konten miteinander synchronisieren (das lassen wir aber jetzt mal).

#### offlineimaprc

{{< highlight ini >}}
# Offlineimap soll die folgenden beiden Accounts synchronisieren, die wir gleich
# definieren. Lasst ihr die »2« weg, wird nur der Erste der beiden Accounts
# synchronisiert, wenn ihr es euch nicht explizit per Kommandozeile wünscht.

[general]
accounts = privat, arbeit
maxsyncaccounts = 2

# Die beiden Accounts - hierbei handelt es sich nur um eine Verknüpfung aus einer
# lokalen Quelle (privat-local) und einer Remote-Quelle (privat-remote).

[Account privat]
localrepository  = privat-local
remoterepository = privat-remote
status_backend   = sqlite
autorefresh      = 1

[Account arbeit]
localrepository  = arbeit-local
remoterepository = arbeit-remote
status_backend   = sqlite
autorefresh      = 1

# Das beiden "Repositories" - dies sind lediglich Ordner in eurem Dateisystem,
# in denen Offlineimap für euch dann eine Ordnerstruktur erstellt. Für Mutt
# möchte ich gerne das Format "Maildir" und das ganze soll in ~/Documents/Mail
# abgelegt werden.

[Repository privat-local]
type         = Maildir
localfolders = ~/Documents/Mail/privat/

[Repository arbeit-local]
type         = Maildir
localfolders = ~/Documents/Mail/arbeit/

# Jetzt die beiden IMAP Zugänge. Achtet darauf dass ihr SSL aktiviert :-)
# Damit offlineimap etwas schneller arbeitet, könnt ihr mehrere Connections
# erlauben (probiert einfach mal mit maxconnections herum). In meinem IMAP
# Workflow verwende ich Archiv-Ordner für jedes Jahr, die möchte ich natürlich
# nicht in jedem Lauf synchronsisieren, daher der folderfilter.

[Repository privat-remote]
type               = IMAP
ssl                = yes
remotehost         = privat.example.com
remoteuser         = user
remotepass         = password
maxconnections     = 5
holdconnectionopen = yes
folderfilter       = lambda foldername: not re.search('(^Archives.*)', foldername)

[Repository arbeit-remote]
type               = IMAP
ssl                = yes
remotehost         = arbeit.example.com
remoteuser         = user
remotepass         = password
maxconnections     = 5
holdconnectionopen = yes


# Und nun das Feintuning. Offlineimap schreibt in ~/.mutt/mailboxes alle Mailboxen
# auf, damit Mutt seine gewünschte Ordner-Struktur vorfindet. Das ist das
# entscheidende Stückchen Gluecode.  :-)

[mbnames]
enabled  = yes
filename = ~/.mutt/mailboxes
header   = "mailboxes "
peritem  = "+%(accountname)s/%(foldername)s"
sep      = " "
footer   = "\n"
{{< /highlight >}}

Fertig. Jetzt startet ihr einfach `offlineimap` und seht dabei zu, wie die
E-Mails in eurem Mail-Ordner eintrudeln. Nächster Halt: Notmuch.

## Notmuch

Notmuch? Ja - noch ein Tool, von dem ihr noch nicht wusstet, dass ihr es benötigt.
Bei Notmuch handelt es sich um einen sehr schnellen Indexer für eure E-Mails. Auch
wenn Notmuch viel (viel (viel (viel (viel)))) mehr kann - wir werden uns erst
einmal auf die Suche konzentrieren.

Notmuch fragt euch beim ersten Start nach dem Ort wo eure E-Mails liegen: In meinem
Fall `~/Documents/Mail`. Das Setup ist schnell erledigt, danach startet ihr einfach
`notmuch new` und lehnt euch zurück, während sich dieses gut gelaunte Stück Software
darüber amüsiert, dass ihr ja »not much mail« habt.

### Offlineimap und Notmuch verknüpfen

Damit ihr nicht nach jedem Lauf von Offlineimap auch noch Notmuch anwerfen
müsst, gibt es die Möglichkeit, Offlineimap einen Hook mitzugeben: In den
beiden Sektionen `[Account]` fügt ihr einfach noch eine Zeile ein –

```ini
[Account privat]
…
postsynchook = /usr/bin/notmuch new
…
```

(Hier könnt ihr später auch not notmuch tagging hinzufügen, das sprengt aber
den Rahmen dieser Anleitung)

# MSMTP

Die Aufmerksamen Leser werden bemerkt haben: Zur Zeit können wir nur E-Mails
abholen und durchsuchen. Aber verschicken? Nun. Da gibt es wieder einen ganzen
Strauß voller Möglichkeiten.

Ich selbst habe mich für `msmtp` entschieden. Ein kleines Werkzeug, was sich
von außen wie `sendmail` verhält und es mir ermöglicht, Mails über meinen
regulären SMTP Server zu versenden. Die Konfiguration ist selbsterklärend:

```config
account default
auth on
host smtp.example.com
from user@example.com
user user@example.com
password such5ecret.wow!
tls_trust_file /etc/ssl/certs/ichglaubdiralles.pem
tls on
port 587
```

# Mutt

Bis jetzt haben wir all unsere E-Mails

- in einem Ordner auf unserer Festplatte
- in Windeseile durchsuchbar gemacht

Ihr habt es sicherlich schon geahnt: Jetzt kommt der Moment, wo der Elefant das
Wasser lässt: *Mutt*.

Ich habe mich bewusst dagegen entschieden, hier einfach meine ganze `.muttrc`
Datei zu dumpen & euch damit alleine zu lassen. Wenn ihr nach Copy & Paste
sucht, werdet ihr sicher in einem der vielen dotfile-Repos auf GitHub fündig.

Stattdessen möchte ich mit euch meine Konfiguration Stückchen für Stückchen
durchgehen und die Teile erklären, dich ich selbst auch verstehe – daran
entlang könnt ihr euch dann später hangeln.

*Ein Hinweis noch:* ich verwende das Debian-Paket `mutt-patched`.
Dieses enthält einige sehr angenehme Addons, die ihr nicht verpassen solltet.

### Meine Mutt-Konfiguration

Wir beginnen mit der Konfiguration, die mich persönlich gegenüber Mutt vorstellt –
darunter auch das oben erwähnte `msmtp`, damit Mutt dort E-Mails abgeben kann.
Achtet auf die Konfiguration der `alternates` – dort erklärt ihr Mutt, von
welchen Adressen aus ihr E-Mails verschickt. Weiter unten in diesem Block seht
ihr auch den `subscribe` Parameter für alle Mailinglisten, die ein wenig
kaputt-konfiguriert wurden. (Zumeist Google Groups)

```config
# My Mailer
set sendmail = "/usr/bin/msmtp"
set realname = "Sebastian Schulze"
set from     = "bascht@privat.example.com"

# Mailinglists
alternates "mailings@privat.example.com|sebastian.schulze@work.example.com"
subscribe  coderdojo-cgn-planung colognerb
```

Weiter geht es mit den Mailboxen. Diese Konfiguration ist weitgehend
selbst-erklärend. Ihr gebt Mutt eigentlich nur eure eigene Ordner-Struktur vor,
die ihr auch schon mit `offlineimap` weiter oben synchronisiert habt.
Das abschließende `source` Kommando liest die von `offlineimap` generierte
Liste ein.

```config
# Maildir
set mbox_type        = Maildir
set folder           = "/home/bascht/Documents/Mail/"
set spoolfile        = "+privat/INBOX"
set record           = "+privat/Sent"
set postponed        = "+privat/Drafts"
set header_cache     = ~/.mutt/cache/headers
set message_cachedir = ~/.mutt/cache/bodies

source ~/.mutt/mailboxes
```

Jetzt machen wir uns daran das Standard-Verhalten von Mutt auf unsere
Bedürfnisse anzupassen. In meinem Fall sind das hauptsächlich das Verhalten
beim Sortieren von Threads (`sort_*`), die VIM-Movements in Listen und die
Darstellung der Mails im Anzeigemodus. Die Option `pager_stop` sorgt dafür dass Mutt nach dem Lesen der
E-Mail nicht sofort zur nächsten Mail springt. `pager_index_lines` ergibt einen
netten Split-View, den man auch von anderen E-Mail Clients kennt.

Weiterhin möchtet ihr sicher auch ein paar Standards setzen, ohne die euch Mutt
sonst jedes Mal fragen wird (z.B. `fast_reply` oder `include`).

Ganz wichtig: Der `reverse_name`. Damit sorgt ihr dafür dass ihr E-Mails immer
mit der Adresse beantwortet, auf der ihr sie empfangen habt. Das ist besonders
beim Wechsel zwischen verschiedenen Accounts sehr angenehm.

```config
# Mutt Behaviour
set move              = no
set sort              = 'threads'
set sort_aux          = 'reverse-last-date-received'
set sort_re           = yes
set pager_stop        = yes
set pager_index_lines = 6
set quit              = ask-yes
set fast_reply        = yes
set include           = yes
set reverse_name      = yes

# VIM-Like Movement in Index
bind index gg first-entry
bind index G  last-entry
bind index,pager F  flag-message
bind index,pager R  group-reply
```
Header. Ein ganz wichtiges Thema. In dieser Sektion sorgt ihr dafür dass Mutt
euch nur die E-Mail Header anzeigt, die euch auch interessieren. Die
`hdr_order` legt die Reihenfolge auf, in der sie in der Mail dargestellt
werden.

```config
# Headers
ignore "Authentication-Results:"
ignore "DomainKey-Signature:"
ignore "DKIM-Signature:"
ignore "X-Flags:"
hdr_order "Date From To Cc"
```

Rechtschreibung. Von vielen unterschätzt. Ich möchte dennoch Tippfehler in
meinen E-Mails schon von VIM dick und rot dargestellt bekommen.

Kleines Goodie: Mit dem Kommando +Goyo starte ich direkt in den
[Goyo](https://github.com/junegunn/goyo.vim) Modus von VIM.


```config
# Nice spell checker
set editor="vim -c 'set spell spelllang=de,en' +Goyo"
```

URLs öffnen. Da Mutt die meisten URLs vermutlich umbrechen wird, sorgt ihr mit
der Pipe durch `urlview` dafür dass ihr eine angenehme Select-Liste mit allen
in der E-Mail vorkommenden Adressen zur Auswahl bekommt.

```config
# URL Opener
macro pager \Cb <pipe-entry>'urlview'<enter> 'Follow links with urlview'
```

Crypto. Ganz wichtig. :-)
Mit den beiden Konfigurationen lege ich meine Schlüssel und Standards für PGP
und S/MIME fest - je nachdem wie ich mit meinem gegenüber kommunizieren möchte.

Wie ihr die Schlüssel da hin bekommt, verrät euch [die Mutt
Doku](http://dev.mutt.org/trac/wiki/MuttGuide/UseSMIME).


```config
# GPG
set pgp_use_gpg_agent = yes
set pgp_timeout       = 3600
set pgp_autosign      = yes

# SMIME
set crypt_autosign           = yes
set crypt_replyencrypt       = yes
set crypt_replysign          = yes
set crypt_replysignencrypted = no

set smime_ca_location  = "/etc/ssl/certs/ca-certificates.crt"
set smime_certificates = "~/.smime/certificates"
set smime_keys         = "~/.smime/keys"
set smime_default_key  = "07efd20c.0"
set smime_encrypt_with = "des3"
```

Folder-Hooks. Jetzt geht es ans Eingemachte. Ich möchte je nach Projekt /
Account andere E-Mail Signaturen / GPG / SMIME Schlüssel verwenden. Damit ich
das nicht jedes Mal manuell einstellen muss, lasse ich Mutt anhand des Ordners
entscheiden, ob ich gerade privat, geschäftlich oder auf einer Mailingliste
unterwegs bin.


```config
folder-hook +privat/INBOX   'source ~/.mutt/privat'
folder-hook +privat/Lists   'source ~/.mutt/mailingsm'
folder-hook +arbeit/INBOX   'source ~/.mutt/arbeit'
```

In so einer individuellen Konfigurationsdatei reagiere ich dann zum Beispiel
noch auf individuelle Absender mit dem Switch von PGP auf SMIME.

```config
send-hook "(~t .*@dieser-kunde.example.com)"  "set crypt_autoencrypt crypt_autosign"
send-hook "(~t .*@anderer-kunde.example.com)" "set pgp_autoencrypt pgp_autosign"

set from          = "bascht@privat.example.com"
set smime_sign_as = "07EFD20C.0"
set pgp_sign_as   = "BC26CFC4"
set signature     = ~/.signature_privat
```

Und das war es dann auch schon fast. Im nächsten Abschnitt formatiere ich nur
noch ein wenig an der Darstellung der E-Mail Liste, blende die Sidebar aus
(brauche ich nicht) und sage Mutt dass es den Titel meines Terminals ändern
darf.

```config

set xterm_set_titles  = yes
set sidebar_visible   = no
```

Falls euch die Standard-Farben von Mutt zu hässlich sind, könnt ihr auch noch
ein individuelles File mit eurem Farbschema inkludieren. Ich habe an der Stelle
noch einige Matcher, weil ich manche Nachrichten gern in einer speziellen Farbe
dargestellt haben möchte.

Hier ein kleiner, kommentierter Auszug.

```config
# Den Absender möchte ich *fett* dargestellt haben
color header     brightblack   default  "^(from|subject):"
# Und E-Mail Adressen im Body bitte cyanfarben
color body       cyan          default  "[-a-z_0-9.+]+@[-a-z_0-9.]+"

# Und ab hier die Farben der E-Mail Liste:
uncolor index *
color index      white         default  ~Q # Beantwortete Nachrichten
color index      green         default  ~F # Markierte Nachrichten
color index      red           default  ~N # Neue Nachrichten
color index      brightred     default  ~O # Ungelesene Nachrichten
color index      magenta       default  ~T # Getaggte Nachrichten
color index      yellow        default  ~D # Gelöschte Nachrichten
```

## Verdict

Falls ihr in der Tat bis hier her gelesen (oder zumindest gescrollt) habt:
**Respekt**.

Ich hoffe ihr könnt zumindest das eine oder andere Schnipsel aus meinen
Konfigurationsdateien gebrauchen und habt beim Einrichten genau so viel Spaß
wie ich.

Ich freue mich auf eure Rückmeldungen per Mail [sic!] oder Twitter!
Happy mutting!

---
author: bascht
date: 2007-12-10
slug: x11-leopard-focus
status: publish
title: X11 Leopard Focus
comments: true
wordpress_id: '297'
? ''
: - computer
  - computer
  - howto
  - howto
  - leopard
  - leopard
  - linux
  - linux
  - mac
  - mac
---

Drei Stichworte. :) Und wer ein bisschen mit der Raubkatze arbeiten
will, braucht natürlich auch Fink und X11 um 'richtige' Programme
laufen zu lassen. Soweit, so gut - jedoch verloren die
X11-Programme ständig ihren Mausfocus. Nach 2 Sekunden war das
Fenster inaktiv (was selbst ruhigen Menschen beim Gimp den letzten
Nerv rauben kann...). Dank
[dem Tipp](http://discussions.apple.com/message.jspa?messageID=5654597)
habe ich nun endlich den Schuldigen: Die last.fm Applikation! Hab
mich schon gewundert, warum er beim Shutdown immer crasht - nun ist
es raus. Anscheinend fragt die last.fm App ständig bei iTunes den
Status nach, daher verliert X11 den Focus (andere Anwendungen
seltsamerweise nicht).
 

[![Fink baut Amarok](http://www.bascht.com/uploads/2007/12/compilier.thumbnail.jpg)](http://www.bascht.com/uploads/2007/12/compilier.jpg "Fink baut Amarok")Das
Problem ist jedenfalls einfach behoben - einfach in der
Aktivitätsanzeige den Zombie töten, fertig. Hoffentlich kommt da
mal ein Update von last.fm nach. Bei mir kann nun endlich wieder
weiterkompiliert werden... Grade baut Fink den Amarok 1.4 zusammen.
\*hrr\*




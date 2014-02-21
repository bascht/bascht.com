---
author: bascht
date: '2009-01-10 16:43:42'
slug: vimperator-und-rememberthemilk
status: publish
title: Vimperator und Rememberthemilk
comments: true
wordpress_id: '489'
? ''
: - firefox
  - firefox
  - mozilla
  - mozilla
  - software
  - software
  - unsortiertes
  - unsortiertes
  - vim
  - vim
  - vimperator
  - vimperator
  - web
  - web
---

Bin seit einiger Zeit wieder mal mit dem
[Vimperator](http://vimperator.org/) unterwegs. Abgesehen von ein
paar Startschwierigkeiten hat sich meine gefühlte
Browse-Geschwindigkeit um Faktor 2 erhöht. Dafür schonmal Dank an
Flo - fürs draufstubsen. Eins hat mich jedoch noch gestört,
Vimperator nimmt einem die Shortcuts für coole Webapps wie z.Bsp.
Remember The Milk weg. Das lässt sich aber einfach ändern. Einfach
im Command-Mode die entsprechende URL für passAllKeys aktivieren:
`:au LocationChange .* js modes.passAllKeys = /rememberthemilk.com/.test(buffer.URL)`
Happy Browsing.



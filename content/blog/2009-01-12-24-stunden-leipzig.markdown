---
author: bascht
date: 2009-01-12
slug: 24-stunden-leipzig
status: publish
title: 24 Stunden Leipzig
comments: true
wordpress_id: '501'
tags: leipzig, linux, ubuntu, video, youtube
---

Da man ja (besonders in der Diplomzeit) immer Zeit für Sachen
findet, die einen etwas ablenken, hab ich heute mal die Webcam
angelassen und drüben auf die Kreuzung am Adler gerichtet. motion
(sudo apt-get install motion) erledigte das Knipsen der Bilder und
mencoder fügt mit Hilfe von

```bash
mencoder "mf://*.jpg" -mf fps=16 -o /tmp/test.avi -ovc lavc -lavcopts vcodec=msmpeg4v2:vbitrate=800
```

das ganze zu einem Video zusammen. Fertig. Genießt es einfach. :-)

<iframe width="560" height="315" src="//www.youtube.com/embed/uTDK0wfmwaE?list=UUrla4yBG2pr9gWG9z7Kp43Q" frameborder="0" allowfullscreen></iframe>



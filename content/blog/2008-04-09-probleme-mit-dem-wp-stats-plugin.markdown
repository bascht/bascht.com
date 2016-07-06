---
author: bascht
date: 2008-04-09
slug: probleme-mit-dem-wp-stats-plugin
status: publish
title: Probleme mit dem WP Stats Plugin
comments: true
wordpress_id: '344'
tags: [howto, lernen, neuigkeiten, studium, wordpress, php]
---

Die Screenshots sahen natürlich super aus und auch im neuen 2.5er
Backend ließ sich das WP Stats Plugins supereinfach installieren,
worauf ich bisher aber vergeblich warten musste, sind die
**Statistiken**... Ein kleiner Blick in die FAQ macht schlauer: Wer
ein anderes Thema als das WP Standard Theme verwendet, sollte
natürlich auch den Aufruf von

```php
<?php wp_footer(); ?>
```

kurz vor dem `</body>` nicht vergessen. Jetzt sammelts fleißig.
Ich werd berichten und mich erstmal wieder CoD zuwenden...

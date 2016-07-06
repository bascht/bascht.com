---
title:  "Adjusting the Crunchbang cursor size"
date:   2013-10-17
tags: [crunchbang, openbox, x11, cursor, dualhead]
---

Firing up Crunchbang in dual screen mode (via arandr) made the cursor appear *huge* on some windows.
A quick duck duck go search revealed [this forum post](http://crunchbang.org/forums/viewtopic.php?id=4374),
which had the correct solution: Just adjust your `~/.Xdefaults` file to your liking:

{% highlight bash %}
Xcursor.size: 16
{% endhighlight %}

(I guess the additional `xrdb -merge ~/.Xdefaults` is just cargo culting)

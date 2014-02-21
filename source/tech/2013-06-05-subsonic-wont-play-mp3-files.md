---
title:  "Subsonic won't play MP3 or AAC files"
date:   2013-06-05 12:34:06
categories: music audio subsonic
---

I'm currently running my private trial in hosting [Subsonic](http://www.subsonic.org/pages/index.jsp)
as my personal Spotify-Replacement. So far everything worked out well unless I noticed that it kept
skipping all the songs I've bought in iTunes.

A quick peek at the logs reveals

{% highlight text %}
Log: (/var/subsonic/transcode/ffmpeg) Encoder (codec id 86017) not found for output stream #0.0
{% endhighlight %}

so what was missing, was just the standard *evil* codec package. E.g. for ubuntu:

{% highlight sh %}
$ sudo apt-get install ubuntu-restricted-extras
{% endhighlight %}

That's it.

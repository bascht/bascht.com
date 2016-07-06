---
title:  "Importing Posterous archives into Jekyll"
date:   2013-06-04
permalink: 'tech/2013/06/04/importing-posterous-into-jekyll'
tags: [meta, posterous, jekyll, ruby]
---

As I got dropped from posterous I was searching for a simple solution to import
my old posterous content into a simple [Jekyll](http://www.jekyllrb.com) Blog structure.

All the other importers I tried had problems importing my posts directly from posterous
(as they are probably already down at the time you are reading this). Gladly [Paul McCarthy](https://github.com/pauldmccarthy)
already got this covered with [PR 12](https://github.com/jekyll/jekyll-import/blob/initial-migrator-import/lib/jekyll/importers/posterous-archive.rb).


So just checkout out his branch (or the Jekyll-Importer master if it got merged meanwhile):

{% highlight sh %}
$ git clone https://github.com/jekyll/jekyll-import.git
$ git checkout initial-migrator-import
{% endhighlight %}

Extract your posterous archive and run the importer:

{% highlight sh %}
$ unzip /tmp/space-691755-techbascht-02f0c75da3aece386d91260.zip -d /tmp/
$ ruby -r './lib/jekyll/importers/posterous-archive.rb' -e '
>> Jekyll::PosterousArchive.process("/tmp/space[…]")'
{% endhighlight %}

Check and extract the files.
Enjoy.

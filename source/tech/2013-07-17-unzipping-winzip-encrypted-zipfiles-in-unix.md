---
title:  "Unzipping encrypted (win)zip files in linux"
date:   2013-07-17 11:04:06
categories: unzip winzip 7z encryption
---

Last week I got my hands on an »encrypted« .zip file, the built-in zip command wouldn't eat:

{% highlight bash %}
 $ unzip vpn.zip
  Archive: vpn.zip
      skipping: vpn/my-config-file.ovpn  need PK compat. v5.1 (can do v4.5)
{% endhighlight %}

The solution is pretty simple: Just install *7-Zip*. It's free software and should come with every decent linux distribution.

{% highlight bash %}
 $ 7z x vpn.zip 

 Processing archive: vpn.zip

 Extracting  vpn
 Extracting  vpn/my-config-file.ovpn
 Enter password (will not be echoed) :
{% endhighlight %}


Done.

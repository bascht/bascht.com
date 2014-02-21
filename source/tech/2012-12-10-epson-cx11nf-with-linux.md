---
title:  "Getting the EPSON CX11NF to work with Linux"
date:   2012-12-10 15:18:06
categories: linux printing epson cx11nf ubuntu
---

Linux. And printing. Well that's another chapter. 
In my [current office](http://bascht.com/blog/2013/02/04/retrospektive/) there is a
EPSON AcuLaser CX11(NF) - the setup is fairly simple (if you know the hoops you'll have to jump through).

1. Get the driver from the (horrible) [EPSON Download Section](http://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=EN&CN2=&DSCMI=15870&DSCCHK=26e8223d7bdec138ce53fff9033345aae80dfdd4).
2. Install the `.rpm` / make install the `.tar.gz`.
3. Create proper symlinks to the epson binaries
     {% highlight sh %}
$ ln -s /usr/bin/pstoalcx11.sh /usr/lib/cups/filter/
$ ln -s /usr/bin/alcx11_lprwrapper.sh /usr/lib/cups/filter/ 
$ ln -s /usr/bin/alcx11 /usr/lib/cups/filter/ {% endhighlight %}

4. Talk to the printer via a direct socket
   (If prompted by your GUI use something like `socket://10.10.0.11:9100`)

Voila.

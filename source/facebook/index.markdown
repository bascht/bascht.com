---
layout: page
title: "Facebook"
date: 2012-02-02 10:16
comments: true
sharing: true
footer: true
---


Da die Frage immer wieder mal auftaucht: 

> Ja, ich habe einen Facebook-Account. <br/>
> Nein, ich benutze ihn nicht.

Die einzige Daseinsberechtigung für meine Anmeldung dort ist, dass ich gern
das URL-Kürzel *bascht* gesichert und umgeleitet haben möchte. 

Denkt einfach an DNS.

    facebook.com/bascht IN CNAME bascht.com/facebook 
    bascht.com/facebook IN CNAME facebook.com/bascht 


Vielleicht habe ich auch irgendwann einmal Zeit, die Gründe darzulegen. 
Bis sollte der Hinweis genügen: 
Seid mir nicht böse, wenn ich keinen Freunde-Anfragen zustimme, oder nicht auf Nachrichten reagiere. 
*Ich glaube einfach nicht, dass Facebook mein Freund sein möchte.*

## Tracking
Falls ihr auch keine Lust darauf habt, auf Schritt und Tritt von Facebook
durch das Internet begleitet zu werden, hier ein Ausschnitt aus meinem Host-File.
Ich nehme gern Anregungen und Ergänzungen entgegen.

``` sh /etc/hosts

127.0.0.1 www.facebook.com
127.0.0.1 facebook.com
127.0.0.1 static.ak.fbcdn.net
127.0.0.1 www.static.ak.fbcdn.net
127.0.0.1 login.facebook.com
127.0.0.1 www.login.facebook.com
127.0.0.1 fbcdn.net
127.0.0.1 www.fbcdn.net
127.0.0.1 fbcdn.com
127.0.0.1 www.fbcdn.com
127.0.0.1 static.ak.connect.facebook.com
127.0.0.1 www.static.ak.connect.facebook.com
```

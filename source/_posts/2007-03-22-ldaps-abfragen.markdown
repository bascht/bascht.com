---
author: bascht
date: '2007-03-22 15:55:30'
layout: post
slug: ldaps-abfragen
status: publish
title: LDAP's abfragen...
wordpress_id: '63'
? ''
: - C#
  - C#
  - computer
  - computer
  - LDAP
  - LDAP
  - Novell
  - Novell
  - programmierung
  - programmierung
  - studium
  - studium
  - technik
  - technik
---

...ist ja garnicht so schwer wie ich dachte. Die Novell LDAP
Bindings für C\# einbinden, ein fixes
`using Novell.Directory.Ldap;` und fertig ist die Suppe. Einzig der
[RFC 2254](http://www.faqs.org/rfcs/rfc2254.html) für die Abfrage
ist noch etwas kryptisch geschrieben. Das wird noch.
`this.ldapConn = new LdapConnection(); ldapConn.Connect(HtwmLdap.ldapServer, HtwmLdap.ldapPort);`
Und dann einfach in einer Exceptionbehandlung
`LdapSearchQueue queue = ldapConn.Search (HtwmLdap.baseDN, LdapConnection.SCOPE_ONE, "(sn=Lehma*) | (sn=Schu*)", null, false, (LdapSearchQueue) null, (LdapSearchConstraints) null );`
liefert jedenfalls schonmal ordentlich viele Ergebnisse. (Kein
Wunder, wenn man nach Lehma\* und Schu\* sucht. :)



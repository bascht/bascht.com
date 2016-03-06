---
title:  "Checking SSL certificates with SNI via OpenSSL"
date:   2014-05-17
lang: en
categories: ssl sni openssl
---

To check the ssl certificate of a site which has
[SNI](https://en.wikipedia.org/wiki/Server_Name_Indication)
enabled, just add the -servername parameter to the s\_client:

```bash
$ openssl s\_client -servername site.example.com -connect example.com:443
```

To see only the relevant parts of the certificate – well – grep for it:
```bash
$ openssl s_client -servername site.example.com -connect example.com:443 2>/dev/null|openssl x509 -text|grep -e "DNS:\|CN="
```

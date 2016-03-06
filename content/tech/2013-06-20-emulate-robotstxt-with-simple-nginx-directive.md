---
title:  "Emulate a robots.txt file with a simple nginx directive"
date:   2013-06-20
categories: nginx seo google robots robotstxt
---

If you use nginx as a reverse proxy, you might want to emulate a
simple robots.txt file just to be sure that Googlebot doesn't
traverse into each and every location.

So why bother serving those bytes from a file when you can answer
requests directly from nginx:

```nginx
location /robots.txt {
    return 200 "User-agent: *\nDisallow: /";
}
```

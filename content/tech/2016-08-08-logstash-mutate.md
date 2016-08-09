---
title:  "Access Logstash JSON objects"
date:   2016-08-08
lang: en
tags: [logging, logstash, elasticsearch]
---

If you want to access Logstash log values buried deep in objects, be
sure to use the bracket-syntax, as `[object.field.name]` won't get you
anywhere. This is the way to go, e.g. for `mutate{}`:


```ruby
mutate {
  rename => { "[object][field][name]" => "new_field" }
}
```

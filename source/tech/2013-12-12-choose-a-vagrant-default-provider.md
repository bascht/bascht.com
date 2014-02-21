---
title:  "Choosing a Vagrant default provider"
date:   2013-12-12 17:10:06
lang: en
categories: vagrant vmware virtualbox
---

If you are using the VMWare Fusion or Workstation Providers with Vagrant,
you are likely to have VirtualBox Installation left on your machine. 
At least that's the case for me.

So if you're annoyed about the Vagrant default behaviour

{% highlight bash %}
$ va status
Vagrant could not detect VirtualBox! Make sure VirtualBox is properly installed.
Vagrant uses the `VBoxManage` binary that ships with VirtualBox, and requires
this to be available on the PATH. If VirtualBox is installed, please find the
`VBoxManage` binary and add it to the PATH environmental variable.
{% endhighlight %}

I might be the last one to find out, but there is a Vagrant setting to override
the default provider: 

```bash
$ export VAGRANT_DEFAULT_PROVIDER=vmware_workstation # (or fusion)
```

Source: http://docs.vagrantup.com/v2/providers/default.html

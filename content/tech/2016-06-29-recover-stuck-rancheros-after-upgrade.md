---
title:  "Recover stuck RancherOS after upgrade to 0.4.5"
date:   2016-06-29
lang: en
categories: linux docker rancher
---

Just tripped into that one: I upgraded a Rancher host to `0.4.5`,
rebooted it & somehow only the `system-docker` daemon came up.

The user facing container was stuck in a reboot loop:

```
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS                          PORTS               NAMES
e11da889990c        rancher/os-docker:v0.4.5    "/usr/sbin/entry.sh /"   11 minutes ago      Restarting (0) 47 seconds ago                       docker
9f0f66b8eef0        rancher/os-console:v0.4.5   "/usr/sbin/entry.sh /"   11 minutes ago      Up 11 minutes                                       console
cbe4d0a044a7        rancher/os-network:v0.4.5   "/usr/sbin/entry.sh /"   13 minutes ago      Up 13 minutes                                       network
d9da62a858d4        rancher/os-ntp:v0.4.5       "/usr/sbin/entry.sh /"   13 minutes ago      Up 13 minutes                                       ntp
dc4b0f37cd86        rancher/os-udev:v0.4.5      "/usr/sbin/entry.sh /"   13 minutes ago      Up 13 minutes                                       udev
e932a592abf3        rancher/os-acpid:v0.4.5     "/usr/sbin/entry.sh /"   13 minutes ago      Up 13 minutes                                       acpid
c866fe780221        rancher/os-syslog:v0.4.5    "/usr/sbin/entry.sh /"   13 minutes ago      Up 13 minutes                                       syslog
```

Check your `/var/log/docker.log` see if you are running into
[#18283](https://github.com/docker/docker/issues/18283):

```
Error starting daemon: Error initializing network controller: could not delete the default bridge network: network bridge has active endpoints.
```

The solution was fairly easy:

``` bash
$ sudo rm -r /var/lib/docker/network; sudo reboot;
```

Reassuring.

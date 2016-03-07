---
title:  "Enabling public key authentication in CentOS"
date:   2015-02-13
lang: en
categories: centos ssh authorized_keys selinux
---

If you are wondering why CentOS is ignoring your
`~/.ssh/authorized_keys` file for a user you created with an
interactive script or e.g. using Puppet – check that you restored the
SELinux context in the users home directory:

``` bash
$ restorecon -Rv /home/user/.ssh
```

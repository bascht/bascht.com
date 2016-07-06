---
title:  "Building a Vagrant VMware base box for CentOS 6.4"
date:   2013-10-07
tags: [redhat, centos, vmware, kernel, modules]
---

If you followed the 'semi official' guides for installing the `vmware-tools` in CentOS 6, you
might end up with a box that has all necessary tools installed, but won't load them at boot time.

Vagrant doesn't like it *that much*:

{% highlight bash %}
[default] Configuring network adapters within the VM...
The HGFS kernel module was not found on the running virtual machine.
This must be installed for shared folders to work properly. Please
install the VMware tools within the guest and try again. Note that
the VMware tools installation will succeed even if HGFS fails
to properly install. Carefully read the output of the VMware tools
installation to verify the HGFS kernel modules were installed properly.
{% endhighlight %}

For me the official RPM repositories did a good job here and I would recommed giving them a try.
So this is my current [packer](http://www.packer.io) configuration for building a vmware box:

{% highlight bash %}
rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub
rpm --import http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub

echo -e "[vmware-tools]\nname=VMware Tools\nbaseurl=http://packages.vmware.com\
/tools/esx/5.1latest/rhel6/\$basearch\nenabled=1\ngpgcheck=1" > /etc/yum.repos.d\
/vmware-tools.repo

yum -y install vmware-tools-hgfs vmware-tools-esx-nox
{% endhighlight %}

And to make sure the module is loaded at boot time:

{% highlight bash %}
echo "modprobe vmhgfs" > /etc/sysconfig/modules/vmhgfs.modules
chmod +x /etc/sysconfig/modules/vmhgfs.modules
{% endhighlight %}

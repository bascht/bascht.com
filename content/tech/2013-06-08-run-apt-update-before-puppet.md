---
title:  "Bootstrap a Vagrant VM before running the provisioner."
date:   2013-06-08
tags: [puppet, vagrant, bootstrap, vm, tricks]
---

This might not be the most elegant way to deal with this problem,
but often enough I find myself in a situation in which I try to
run *bootstrapping*-stuff in my puppet-manifests or run a simple
`apt-get update` command before provisioning with Puppet.

One way to solve this dilemma is to bootstrap custom Vagrant boxes
with a tool like [Veewee](https://github.com/jedi4ever/veewee), which
has served me well for more than a few times now.

But if it is a **really simple** task I'd like to get done, then I just
fall back to the shell provisioner, and touch a file when I'm done, so
the provisioner only runs on the very first time.

## In your Vagrantfile
Add a provisioner right _before_ your puppet or chef provisioner.

``` ruby
config.vm.provision :shell, :path => "your/path/to/bootstrap-vagrant.sh"
```

## In a separate Shell-Script e.g. bootstrap-vagrant.sh
Add your bootstrapping-code and wrap it in a conditional expression.

``` bash
#!/bin/bash
STAGE="/etc/first_stage"
if [ ! -e $STAGE ]; then
  # Your bootstrapping-code
  # * Add a user
  # * give sudo rights
  # * add ssh key, etc.
  touch $STAGE
fi
```

Not *that* fancy, but it gets stuff done for your dev boxes.

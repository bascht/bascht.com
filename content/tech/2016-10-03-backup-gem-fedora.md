---
title:  "Install the Backup Gem in Fedora (Server)"
date:   2016-10-03
lang: en
tags: [fedora, ruby, backup, gem, rubygems]
---

The marvellous [backup](http://backup.github.io/backup/v4/) Gem isn't
available as a pre-packaged RPM and as Fedora is missing a simple
=build_essentials=-Style meta package, there are some dependencies
you'll have to provide, before you can install it via Rubygems:

```bash
sudo dnf group install "C Development Tools and Libraries"
sudo dnf install rubygems ruby-devel patch redhat-rpm-config libxml2-devel

# and you're good to go:
sudo gem install backup
```

Fore more details, check the [Fedora Rubygems page](https://developer.fedoraproject.org/tech/languages/ruby/gems-installation.html).

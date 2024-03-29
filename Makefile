SHELL := /usr/bin/env bash
HUGO_VERSION := "0.89.2"
HUGO_URL := "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"

default: hugo clean public

hugo:
	$(eval TMPDIR:= $(shell mktemp -d))
	echo $(TMPDIR)
	curl -L $(HUGO_URL) -o $(TMPDIR)/hugo.tar.gz
	tar -xvf $(TMPDIR)/hugo.tar.gz hugo
	rm -rf $(TMPDIR)

preview: hugo
	./hugo server
public:
	./hugo
clean:
	rm -rf public/
sync:
	rsync -avz --delete --checksum --progress public/ uberspace-bascht:/var/www/virtual/bascht/bascht.com/
push:
	git push origin bascht.com
	git push srht bascht.com
	git push space bascht.com
	git push gitlab bascht.com

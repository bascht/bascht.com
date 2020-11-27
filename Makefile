HUGO_VERSION="0.55.6"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"


default: hugo clean public

hugo_is_installed:

hugo: hugo_is_installed
	curl -L $(HUGO_URL) > ./hugo.tar.gz
	tar -xvf hugo.tar.gz
	rm -f LICENSE.md README.md
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
	git push shrt bascht.com
	git push space bascht.com
	git push gitlab bascht.com

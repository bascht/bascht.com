HUGO_VERSION="0.37"
HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"


default: hugo clean public

hugo:
	curl -L $(HUGO_URL) > ./hugo.tar.gz
	tar -xvf hugo.tar.gz
	rm -f LICENSE.md README.md

public:
	hugo
clean:
	rm -rf public/
sync:
	rsync -avz public/ uberspace-bascht:/var/www/virtual/bascht/bascht.com

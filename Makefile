HUGO_URL = "https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_amd64.tar.gz"

default: hugo public

hugo:
	curl -L $(HUGO_URL) > ./hugo.tar.gz
	tar -xvf hugo.tar.gz
	mv hugo_*/hugo*amd64 hugo
	rm -rf hugo.tar.gz hugo_*_amd64

public:
	hugo

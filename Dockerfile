FROM nfnty/arch-mini

ENV GOPATH /go
ENV GOROOT /usr/lib/go
ENV PATH $PATH:/go/bin

RUN pacman -Syu \
&& pacman --noconfirm -S git go mercurial \
&& mkdir -p /go/bin \
&& go get code.google.com/p/go.tools/cmd/present \
&& git clone https://github.com/GrayCoder/talks.git /talk

WORKDIR /talk

EXPOSE 8080
ENTRYPOINT /go/bin/present -http="$(head -1 /etc/hosts | awk '{print $1}'):8080"

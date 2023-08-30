all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/

  
	cd ./generator ; go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o ./generator -buildvcs=false
	cd ./init ; CGO_ENABLED=0 go build -trimpath -mod=readonly -modcacherw ./init -buildvcs=false
	ronn docs/manpage.md
	mkdir "$(DESTDIR)/etc/"
	touch "$(DESTDIR)/etc/booster.yaml"
	install -Dp -m755 ./generator/generator "$(DESTDIR)/usr/bin/booster"
	install -Dp -m644 ./docs/manpage.1 "$(DESTDIR)/usr/share/man/man1/booster.1"
	install -Dp -m755 ./init/init "$(DESTDIR)/usr/lib/booster/init"

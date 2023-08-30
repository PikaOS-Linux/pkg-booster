all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/

  
	cd ./generator ; go build -trimpath -buildmode=pie -buildvcs=false -mod=readonly -modcacherw -o ./generator
	cd ./init ; CGO_ENABLED=0 go build -trimpath -buildvcs=false -mod=readonly -modcacherw -o ./init
	ronn docs/manpage.md
	mkdir "$(DESTDIR)/etc/"
	touch "$(DESTDIR)/etc/booster.yaml"
	install -Dp -m755 ./generator/generator "$(DESTDIR)/usr/bin/booster"
	install -Dp -m644 ./docs/manpage.1 "$(DESTDIR)/usr/share/man/man1/booster.1"
	install -Dp -m755 ./init/init "$(DESTDIR)/usr/lib/booster/init"
        install -Dp -m755 ./update-initramfs "$(DESTDIR)/usr/lib/booster/update-initramfs"

#!/usr/bin/bash
# Create a Debian package from the peatd source code using fpm and ronn-ng.
chmod +x *.sh      # lazy but it will do the trick
ronn man/*.ronn    # create the manpages
gzip -9 -f man/*.? # gzip the manpages
fpm \
	-s dir -t deb \
	-p peatd.deb \
	--name peatd \
	--license MIT \
	--version 0.1.0 \
	--architecture all \
	--description "PPPDUD's excellent ADS-B tracker daemon." \
	--url "https://github.com/PPPDUD/peatd" \
	--maintainer "PPPDUD <mojavesoft@gmail.com>" \
	--depends "bash" \
	--depends "readsb" \
	--deb-recommends "ttyd" \
	peatd=/usr/bin/peatd \
	.env=/etc/peatd/.env \
	peatd.service=/lib/systemd/system/peatd.service \
	man/peatd.7.gz=/usr/share/man/man7/peatd.7.gz \
	man/peatd.8.gz=/usr/share/man/man8/peatd.8.gz
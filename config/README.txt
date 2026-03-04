These files are templates for configuring peatd:
    - full-stack.env provides both a readsb server and a ttyd client (recommended for most users)
    - frontend.env provides the ttyd frontend with no built-in backend (make sure to change BEAST_CONNECTIONS when using this template)
    - backend.env provides the readsb backend for use with another frontend of some sort (advanced)

By default, /etc/peatd/.env is a copy of full-stack.env, but you can run sudo cp /usr/share/peatd/TEMPLATE-GOES-HERE.env /etc/peatd/.env to apply one of the other templates instead.

Make sure not to modify files under /usr/share/peatd/, because they will be replaced next time you upgrade peatd.
talosctl apply-config -e 192.168.5.100 -n 192.168.5.100 --file _out/cp1.yaml --talosconfig=talosconfig --insecure
talosctl apply-config -e 192.168.5.100 -n 192.168.5.101 --file _out/cp2.yaml --talosconfig=talosconfig --insecure
talosctl apply-config -e 192.168.5.100 -n 192.168.5.102 --file _out/cp3.yaml --talosconfig=talosconfig --insecure
talosctl apply-config -e 192.168.5.100 -n 192.168.5.103 --file _out/w1.yaml --talosconfig=talosconfig --insecure
talosctl apply-config -e 192.168.5.100 -n 192.168.5.104 --file _out/w2.yaml --talosconfig=talosconfig --insecure
talosctl apply-config -e 192.168.5.100 -n 192.168.5.105 --file _out/w3.yaml --talosconfig=talosconfig --insecure

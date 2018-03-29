#!/bin/bash

source ./utils.sh
check_root
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

echo "Installing go 1.10 to /usr/local/go"
sleep 1
tmpfile=$(mktemp /tmp/go_install.XXXXXXXXX.tar)
wget -O "$tmpfile" "https://dl.google.com/go/go1.10.linux-amd64.tar.gz"
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
tar -C /usr/local -xzf "$tmpfile"
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

#command -v go >/dev/null 2>&1 || {
#    echo "Go not detected after install, setting up PATH (creating /etc/profile.d/golang.sh)"
#    echo "# golang bin path (added by install_go.sh)" >> /etc/profile.d/golang.sh
#    echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile.d/golang.sh
#}
echo "Please set up your PATH to export PATH=\$PATH:/usr/local/go/bin"

echo "====Done===="

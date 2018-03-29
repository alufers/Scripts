function install_deb_from_url {
    if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
    fi
    tfile=$(mktemp /tmp/install_deb_from_url.XXXXXXXXX)
    wget -O $tfile $1
    rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
    dpkg -i $tfile
    rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
    apt --fix-broken install
    rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
    echo "====Done===="
}

function check_root {
    if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit
    fi
}

function safe_mkdir {
    if [ -d "$1" ]; then
        BACKUP_DIR="$1"
        if [ "${BACKUP_DIR: -1}" != "/" ] ; then
            BACKUP_DIR+='/'
        fi
        BACKUP_DIR+='backup'
        if [ -d "$BACKUP_DIR" ]; then
            rm -R $BACKUP_DIR
        fi
        cp -r $1 "/tmp/backup_dir"
        mv "/tmp/backup_dir" $BACKUP_DIR
    else
        mkdir -p $1
    fi
}

function is_installed() {
	if pacman -Qs $1 > /dev/null ; then
  		return 1
	else
  		return 0
	fi
}

function install_dependencies {
    echo 'Checking dependencies...'
    DEPENDENCIES="$1"
    TO_INSTALL=()
    for i in "${DEPENDENCIES[@]}"
    do
	echo "Checking $i"
    	if is_installed $i == 0; then
		TO_INSTALL+=($i)
    	fi
    done
    if [ -n "$TO_INSTALL" ]; then
    	echo "Installing dependencies"
    	sudo pacman -Sy ${TO_INSTALL[@]} --noconfirm
    else
    	echo "Dependencies already installed"
    fi

    echo 'Checking AUR dependencies...'
    AUR_DEPENDENCIES="$2"
    TO_INSTALL_AUR=()
    for i in "${AUR_DEPENDENCIES[@]}"
    do
    	if is_installed $i == 0; then
    		TO_INSTALL_AUR+=($i)
    	fi
    done
    if [ -n "$TO_INSTALL_AUR" ]; then
    	echo "Installing AUR dependencies"
    	yaourt -Sy ${TO_INSTALL_AUR[@]} --noconfirm
    else
    	echo "AUR dependencies already installed"
    fi
}

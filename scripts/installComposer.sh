#!/usr/bin/env bash

    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cd ${SCRIPT_DIR}

    # composer
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer

    mkdir ~/.composer
    cp composerInstall/composer.json ~/.composer/
    composer global install

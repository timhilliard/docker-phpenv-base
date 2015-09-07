#!/bin/bash

set -e

# Update atp and dpkg
apt-get update
apt-get install apt dpkg -y
apt-get update
apt-get install -y openssh-client curl build-essential openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config git

# Install phpenv
git clone https://github.com/CHH/phpenv.git /tmp/phpenv
PHPENV_ROOT=/usr/local/phpenv /tmp/phpenv/bin/phpenv-install.sh
echo 'export PATH="/usr/local/phpenv/bin:$PATH"' >> /etc/profile.d/phpenv.sh
echo 'eval "$(phpenv init -)"' >> /etc/profile.d/phpenv.sh
git clone https://github.com/php-build/php-build.git /usr/local/phpenv/plugins/php-build

apt-get clean
apt-get purge

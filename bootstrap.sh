#!/usr/bin/env bash

function set_timezone() {
  ln -sf /usr/share/zoneinfo/Eire /etc/localtime
}

function set_hostname() {
  echo "panopticon" >/etc/locale.conf
}

function create_hosts_file() {
  ln -sf /usr/share/zoneinfo/Eire /etc/localtime
  echo "127.0.0.1	localhost" >/etc/hosts
  echo "::1		localhost" >>/etc/hosts
  echo "127.0.1.1	panopticon.localdomain	panopticon" >>/etc/hosts
}

function generate_locales() {
  mv /etc/locale.gen /etc/locale.gen.old
  echo -e "en_US.UTF-8 UTF-8" >/etc/locale.gen
  echo "LANG=en_US.UTF-8" >/etc/locale.conf
  locale-gen
}

function load_package_cache() {
  if [ -e /vagrant/pkg.tgz ]; then
    cd /var/cache/pacman/pkg
    tar -xzvf /vagrant/pkg.tgz
    cd
  fi
}

function update_packages() {
  pacman -Syu --noconfirm
}

function install_fonts() {
  pacman -S --noconfirm ttf-liberation
}

function install_guest_utils_with_x_support() {
  pacman -Rns --noconfirm virtualbox-guest-utils-nox
  pacman -S --noconfirm virtualbox-guest-utils
}

function configure_sound() {
  pacman -S --noconfirm pulseaudio pulseaudio-alsa alsa-utils
  amixer sset Master 100%+ unmute
  alsactl store
}

function save_package_cache() {
  pacman -Sc --noconfirm
  cd /var/cache/pacman/pkg
  tar -czvf /vagrant/pkg.tgz *
}

function get_larbs() {
  curl -LO larbs.xyz/larbs.sh
}

set_timezone
set_hostname
create_hosts_file
generate_locales
load_package_cache
update_packages
install_fonts
install_guest_utils_with_x_support
configure_sound
save_package_cache
get_larbs

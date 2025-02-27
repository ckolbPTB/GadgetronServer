#!/usr/bin/env bash
set -ev

# define apt-get installation command
APT_GET_INSTALL="apt-get install -yq --no-install-recommends"

# update, qq: quiet
apt-get update -qq
${APT_GET_INSTALL} apt-utils locales
locale-gen en_GB.UTF-8

export LANG=en_GB.UTF-8
export LANGUAGE=en_GB:en

# base utilities
${APT_GET_INSTALL} build-essential python3-dev wget swig libomp-dev screen locate pkg-config curl

# git
${APT_GET_INSTALL} git

# ensure certificates are up to date
${APT_GET_INSTALL} --reinstall ca-certificates

apt-get clean
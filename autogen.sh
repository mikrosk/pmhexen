#!/bin/sh
# Regenerate the build system. Stop at the first failure so errors
# don't cascade into misleading follow-up messages.
set -e

# automake copies its helper scripts here but won't create the directory.
mkdir -p autotools

aclocal -I m4
autoheader
automake --add-missing --copy
autoconf

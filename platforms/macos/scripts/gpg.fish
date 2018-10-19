#!/usr/local/bin/fish

keybase pgp export -q 41A4DB43D4DB0DD4 | gpg --import
keybase pgp export -q 41A4DB43D4DB0DD4 --secret | gpg --allow-secret-key-import --import

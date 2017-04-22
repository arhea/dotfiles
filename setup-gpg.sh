#!/bin/bash

local key_id="41A4DB43D4DB0DD4"

keybase pgp export -q $key_id | gpg --import
keybase pgp export -q $key_id --secret | gpg --allow-secret-key-import --import

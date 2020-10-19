#!/usr/bin/env bash

# resets
fmt_reset="\e[0m"

# formatting
text_bold="\e[1m"
text_underline="\e[4m"

# text colors
text_default="\e[39m"
text_black="\e[30m"
text_red="\e[31m"
text_green="\e[32m"
text_yellow="\e[33m"
text_blue="\e[34m"
text_magenta="\e[35m"
text_cyan="\e[36m"
text_white="\e[97m"
text_light_gray="\e[37m"
text_dark_gray="\e[90m"
text_light_red="\e[91m"
text_light_green="\e[92m"
text_light_yellow="\e[93m"
text_light_blue="\e[94m"
text_light_magenta="\e[95m"
text_light_cyan="\e[96m"

# text background
bg_default="\e[49m"
bg_black="\e[40m"
bg_red="\e[41m"
bg_green="\e[42m"
bg_yellow="\e[43m"
bg_blue="\e[44m"
bg_magenta="\e[45m"
bg_cyan="\e[46m"
bg_white="\e[107m"
bg_light_gray="\e[47m"
bg_dark_gray="\e[100m"
bg_light_red="\e[101m"
bg_light_green="\e[102m"
bg_light_yellow="\e[103m"
bg_light_blue="\e[104m"
bg_light_magenta="\e[105m"
bg_light_cyan="\e[106m"

# prints text with support for colors and resets
# the formatting after each print statement
#
# @param text - the text you want to print
function print_text() {
  echo -e "${1}${fmt_reset}"
}

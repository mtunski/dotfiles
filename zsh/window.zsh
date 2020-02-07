###############################################################################
#
#  Created by William G. Scott.
#  Copyright (c) 2007. All rights reserved.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
#  USA
#
#  cf. URL: http://www.fsf.org/licensing/licenses/gpl.html
#
###############################################################################

# function set_title_tab {
#   function settab {
#     # Chage the following to change the string that actually appears in the tab:
#     tab_title=$(basename $(pwd))

#     echo -ne "\e]1; $tab_title\a"
#   }

#   function settitle {
#     # Change the following string to change what appears in the Title Bar label:
#     window_title=$PWD

#     echo -ne "\e]2; $window_title\a"
#   }

#   # Set tab and title bar dynamically using above-defined functions:
#   function title_tab_chpwd { settab ; settitle }
#   title_tab_chpwd

#   function title_tab_preexec { echo -ne "\e]1; $(history $HISTCMD | cut -b7- ) \a"  }
#   function title_tab_precmd  { settab }

#   typeset -ga preexec_functions
#   preexec_functions+=title_tab_preexec

#   typeset -ga precmd_functions
#   precmd_functions+=title_tab_precmd

#   typeset -ga chpwd_functions
#   chpwd_functions+=title_tab_chpwd
# }

# set_title_tab

function set-title-precmd() {
    # tab_title=$(basename $(pwd))
    # echo -ne "\e]2; $tab_title\a"
    echo -ne "\e]1; window name precmd\a"
    echo -ne "\e]2; tab name precmd\a"
}

function set-title-preexec() {
    # tab_title=$(basename $(pwd))
    # echo -ne "\e]2; $tab_title\a"
    echo -ne "\e]1; window name preexec\a"
    echo -ne "\e]2; tab name preexec\a"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

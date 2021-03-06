#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Text editors\n\n"

brew_install "Neovim" "neovim"

# Trying out default Emacs package for macOS
# brew_install "Emacs" "emacs-plus" "d12frosted/emacs-plus"
# execute "ln -sf /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app" \
#   "Setting Emacs.app symlink"
brew_install "Emacs" "emacs" "homebrew/cask" "--cask"

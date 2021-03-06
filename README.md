#+TITLE: [[https://github.com/gr3yta5ks][Personal dotfiles]]
#+AUTHOR: gr3ytaa5ks
#+EMAIL: fcx35@pm.me

These are the base dotfiles that I start with when I set up a new
environment. They are heavily based on [[https://github.com/alrra/dotfiles][Cătălin Mariș dotfiles]]. For
more specific local needs I use the =.local= files described in the [[*Local
 Settings][Local Settings]] section.

* Setup

To set up the =dotfiles= just run the appropriate snippet in the
terminal:

(*DO NOT* run the =setup= snippet if you do not fully understand [[https://github.com/gr3yta5ks/building-dotfiles/setup/setup.sh][what
it does]])

#+begin_src bash
  # macOS
  bash -c "$(curl -LsS https://raw.github.com/gr3yta5ks/building-dotfiles/master/setup/setup.sh)"

  # Linux
  bash -c "$(wget -qO - https://raw.github.com/gr3yta5ks/building-dotfiles/master/setup/setup.sh)"
#+end_src

*NOTE*: in an arch linux system the setup script can be run in a
tty. Because of that, =setup= won't execute the =update_content=
script which you will have to run after restarting the system.

The setup process will:

1. Download the dotfiles on your computer (by default it will suggest
   =~/Projects/dotfiles=)
2. [[https://github.com/gr3yta5ks/setup/create_symbolic_links.sh][Symlink]] the [[https://github.com/gr3yta5ks/src/git][git]], [[https://github.com/gr3yta5ks/stow/shell][shell]], [[https://github.com/gr3yta5ks/src/zsh][zsh]], [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/src/emacs/emacs.d][emacs]] and [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/src/neovim/config/nvim][neovim]] files
3. Install applications/command-line tools for [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/install/macos][macOS]] / [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/install/arch][Arch]] /
   [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/install/ubuntu][Ubuntu]] / [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/install/ubuntu-wsl][Ubuntu WSL]]
4. Set custom [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/preferences/macos][macOS]] / [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/preferences/arch][Arch]] / [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/setup/preferences/ubuntu][Ubuntu]] preferences

** Running linux GUI programs with WSL2

To run programs like GUI Emacs through WSL2 first you have to install a
graphical X server. These are some commonly used ones:

- [[https://sourceforge.net/projects/vcxsrv/][VcXsrv]] (free open-source X server)
- [[https://x410.dev][X410]] (paid X server available on Microsoft Store)

After installing an X server you need to set the *DISPLAY* environment
variable on Linux to use the Windows host's IP address, as WSL2 and
the Windows host are not in the same network device. To do this, put
the following in your =bashrc= / =zshrc=:

#+begin_src bash
  export DISPLAY=$(ip route | awk '{print $3; exit}'):0
#+end_src

* Customize
** Local Settings

The =dotfiles= can be easily extended to suit additional local
requirements by using the following files:

*** =~/.zsh.local=

The =~/.zsh.local= file will be automatically sourced after all the
other [[https://github.com/gr3yta5ks/building-dotfiles/tree/master/src/zsh_shell][zsh related files]], thus, allowing its content to add to or
overwrite the existing aliases, settings, PATH, etc.

Here is a very simple example of a =~/.zsh.local= file:

#+begin_src bash
  #!/bin/zsh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Set local aliases.

  alias starwars="telnet towel.blinkenlights.nl"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Set PATH additions.

  PATH="$PATH:$HOME/Projects/dotfiles/src/bin"

  export PATH
#+end_src

*** =~/.gitconfig.local=

The =~/.gitconfig.local= file will be automatically included after the
configurations from =~/.gitconfig=, thus, allowing its content to
overwrite or add to the existing git configurations.

_Note_: Use =~/.gitconfig.local= to store sensitive information such
as the git user credentials, e.g.:

#+begin_src bash
  [commit]

      # Sign commits using GPG.
      # https://help.github.com/articles/signing-commits-using-gpg/

      gpgsign = true


  [user]

      name = gr3yta5ks
      email = fcx35@pm.me
      signingkey = XXXXXXXX
#+end_src

*** =~/.config/nvim/init.vim.local=

The =~/.config/nvim/init.vim.local= file will be automatically sourced
after =~/.config/nvim/init.vim=, thus, allowing its content to add or
overwrite the settings from =~/.config/nvim/init.vim=.

** Forks

If you decide to fork this project, do not forget to substitute my
username with your own in the [[*Setup][setup snippets]] and in the [[https://github.com/gr3yta5ks/building-dotfiles/blob/master/setup/setup.sh][setup script]].

* License

The code is available under the [[https://github.com/gr3yta5ks/building-dotfiles/blob/master/LICENSE][GNU General Public License v3.0]].

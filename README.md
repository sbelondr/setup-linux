# Vim

Configuration of my vim

## Install

Execute `install-vimrc.sh` or copy vimrc to ~/.vimrc and install all depencies.

Then set up your env to display 42 header if you want.

## Dependency

- [Pathogen](https://github.com/tpope/vim-pathogen)

- [Gruvbox](https://github.com/morhetz/gruvbox)

- [Ariline](https://github.com/vim-airline/vim-airline)

- [Syntastic](https://github.com/vim-syntastic/syntastic)

- [NerdTree](https://github.com/scrooloose/nerdtree)

- [Clang-complete](https://github.com/xavierd/clang_complete)

- [Norminette](https://github.com/Gegel85/norminette) *(untested and optional)*

- Install ctags to navigate between function (only for C and optional)

## 42 header

This header is automatically displayed for C and C++ file languages or use the keybinding.

Add `export USER_42=<user>` in your .bashrc or .zshrc file then `source ~/<your_file>`.

`mkdir -p config_perso` and copy `header.txt` in `~/.vim/config_perso/header_noremap.txt`

## Keybinding

**Remember to deactivate the shortcut F1 on the terminal if assigned**

`C: ctrl`
`S: shift`

| Key      | Action
|----------|--------------------------------------------|
| `F2`     | Increase vertical size.                    |
| `F3`     | Decrease vertical size.                    |
| `F4`     | Increase horizontal size.                  |
| `F5`     | Decrease horizontal size.                  |
| `S-F5`   | Visualize invisible characters.            |
| `F6`     | Line number: mode relative.                |
| `S-F6`   | Line number: mode no relative.             |
| `F7`     | Call norminette.                           |
| `S-F8`   | File display in hexa mode.                 |
| `F9`     | Add new tab and display file tree.         |
| `S-F9`   | Add new tab.                               |
| `F10`    | Switch to tab on the right.                |
| `S-F10`  | Switch to tab on the left.                 |
| `F12`    | Display file tree.                         |
| `cl`     | Comment line.                              |
| `ucl`    | Decomment line.                            |


# Zshrc

Copy `zshrc` file at the end `~/.zshrc`.

# Terminator

Copy `terminator_config` in `~/.config/terminator/config`.

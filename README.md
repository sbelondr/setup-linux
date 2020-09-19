# Setup a new linux installation

Packages:

- Text editor: vim and emacs
- Terminal: terminator, zsh and oh-my-zsh (with my config)
- git (config user, mail and create ssh-keygen)
- Debug: valgrind and lldb
- docker and docker-compose
- virtualbox
- pyenv with python 3.8
- nvm with node 14
- To take notes: joplin
- htop

## Terminator

- borderless
- F1 disabled
- remove titlebar
- background transparent

## Zsh

- use md and the markdown file to view it (`md <file.md>`)
- replace `vi` by `vim`
- replace `emacs` by `emacs -nw`
- replace default editor by `vim`

## Vim

Configuration of my vim

### Dependency

- [Pathogen](https://github.com/tpope/vim-pathogen)

- [Gruvbox](https://github.com/morhetz/gruvbox)

- [Ariline](https://github.com/vim-airline/vim-airline)

- [Syntastic](https://github.com/vim-syntastic/syntastic)

- [NerdTree](https://github.com/scrooloose/nerdtree)

- [Clang-complete](https://github.com/xavierd/clang_complete)

- [42 header](https://github.com/42Paris/42header.git)

- [Norminette](https://github.com/Gegel85/norminette) *(untested and optional)*

- Install ctags to navigate between function (only for C and optional)

### Keybinding

**Remember to deactivate the shortcut F1 on the terminal if assigned**

`C: ctrl`
`S: shift`

| Key      | Action
|----------|--------------------------------------------|
| `F1`     | 42 header.                                 |
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

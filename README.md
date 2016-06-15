# Dotfiles
```
curl --silent https://raw.githubusercontent.com/lingard/dot-files/master/install.sh | sh
```

## Additional steps

1. Create `~/Developer/`
2. Change default shell to ZSH: `chsh -s /bin/zsh`.
3. Install XCode.
4. Install [Fira mono](https://github.com/mozilla/Fira/tree/master/ttf) font.
5. Add honukai colors in iterm preferences

## Structure
* `bin` — files that are symlinked to any directory with binaries in `$PATH`
* `etc` — various stuff like osx text substitutions / hosts backup
* `git-extras` — useful git functions, defined in `home/gitconfig`. Don't forget to change your git author to a proper name.
* `home` — files that are symlinked to `$HOME` directory
* `sublime` — sublime text 3 theme & settings
* `terminal` — terminal theme & prompt

## Building system from scratch (reminder)

* Insert proper hosts from `etc/hosts` to system’s `/etc/hosts`.
* Clone this project (dotfiles **RECURSIVELY** `--recursive`) and run `sh bootstrap-new-system.sh`

## Todo

* [] Add installation of rbenv
* [] Add installation of nvm
* [] Fix iterm theme installation
* [] Remove unused terminal config
* [] Add better oh-my-zsh config
* [] Fix open sublime from terminal
* [] Add support for atom/nuclide
* [] Fix bootstrap installation as it doesn't really work atm

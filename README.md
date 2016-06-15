# Dotfiles
```
curl --silent https://raw.githubusercontent.com/lingard/dot-files/master/install.sh | sh
```

## Additional steps

1. Create `~/Developer/`
2. Change default shell to ZSH: `chsh -s /bin/zsh`.
3. Install XCode.
4. Install [Hermit](https://pcaro.es/p/hermit/#downloads) font.
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
* Download the Yosemite style [Sublime Text icon](https://dribbble.com/shots/1840393-Sublime-Text-Yosemite-Icon?list=searches&tag=sublime_text) (instructions on usage are included in download)
* Install Sublime packages with Package Control: "Seti UI"

## Todo

* [] Add installation of rbenv
* [] Add installation of nvm
* [] Fix iterm theme installation
* [] Remove unused terminal config
* [] Add better oh-my-zsh config
* [] Fix open sublime from terminal
* [] Add support for atom/nuclide
* [] Fix bootstrap installation as it doesn't really work atm

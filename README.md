README
======

osx-setup-generator
-------------------

This project aims to:
* speed up the backup of all of your favorite tools, installed via `Brew` and `Cask`
* automate an "OSX" fresh installation or update

Far from revolutionary, that's true. Nevertheless, this is a good deal to restore your personal machine's tools in no time - with only 2 generated files!

requirements
------------

* [Brew](https://github.com/Homebrew/homebrew)
* [Brew-Cask](https://github.com/caskroom/homebrew-cask)

Check if you meet system requirements by running these commands:

    $ git clone https://github.com/willgarcia/osx-setup-generator.git ~/.osx-setup
    $ cd ~/.osx-setup
    $ make check

build
-----

This step generates / maintains your OSX setup:

    $ cd ~/.osx-setup
    $ make build

Example of each generated files:

    ├── [Brewfile](Brewfile-generated)
    ├── [Caskfile](Caskfile-generated)
    
Note: if the Github API rate limit is reached, follow these instructions to create a Github API token and then to set `HOMEBREW_GITHUB_API_TOKEN`: 
* [Github setup](https://github.com/settings/applications)
* [HOMEBREW_GITHUB_API_TOKEN: bash EXPORT / .bash_profile](https://gist.github.com/willgarcia/7347306870779bfa664e)

install
-------

This step installs / upgrades / audits packages defined by the previously generated files `Brewfile` and `Caskfile`.

    $ cd ~/.osx-setup
    $ make install

At this point, make sure you fix potential warnings resulting of `brew doctor` and `brew cask audit`.

notes
-----

* No AppleScripts, bash aliases, dotfiles neither symlinks or git clones here. If high-customization of the system fits your need, have a look to some staggering [dotfiles](http://dotfiles.github.io/) repos!
* If you have manually installed binaries in `/usr/bin`, consider amending your `PATH` so that `/usr/local/bin` is ahead of `/usr/bin` in your `PATH`:

    $ launchctl setenv PATH "/usr/local/bin:$PATH"
    
`/usr/local` is the default Homebrew directory for UNIX System Resources. By installing your stuff elsewhere, things will just not work.

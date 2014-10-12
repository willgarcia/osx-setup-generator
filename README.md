README
======

A way to automate a clean and self-maintainable OSX setup, over time.

osx-setup-generator
-------------------

This project aims to:
* speed up the backup of your favorite tools/packages installed via `Brew` and `Cask`
* automate OSX fresh installs or updates

It is far from revolutionary, nevertheless, it seems a good deal to restore in no time my ecosystem on a personal machine - with only 2/3 generated files!

requirements
------------

* [Brew](https://github.com/Homebrew/homebrew)
* [Brew-Cask](https://github.com/caskroom/homebrew-cask)

Check if you meet the requirements by running these commands:

    $ git clone https://github.com/willgarcia/osx-setup-generator.git ~/.osx-setup
    $ cd ~/.osx-setup
    $ make check

build
-----

This step generates/maintains your OSX setup:

    $ cd ~/.osx-setup
    $ make build

Example of each generated files:

    * (Brewfile)[Brewfile-generated]
    * (Caskfile)[Caskfile-generated]

If Github API rate limit is reached, see here how to create a Github API token and then how to set `HOMEBREW_GITHUB_API_TOKEN`: 
* [Github setup](https://github.com/settings/applications)
* [EXPORT, .bash_profile](https://gist.github.com/willgarcia/7347306870779bfa664e)

        
install
-------

This step install / upgrade any package/bottle defined in the previously generated files (`Brewfile`, `Caskfile`)

    $ cd ~/.osx-setup
    $ make install
        
notes
-----

No AppleScripts, bash aliases, "overwritten" dotfiles neither symlinks or git clones here. To go further, if an high-customization of the system fits your need, have a look to some staggering (dotfiles)[http://dotfiles.github.io/] repos!

If you have manually installed binaries in `/usr/bin`, consider amending your `PATH` so that `/usr/local/bin` is ahead of `/usr/bin` in your `PATH`:

    $ launchctl setenv PATH "/usr/local/bin:$PATH"
    
`/usr/local` is the default Homebrew directory for UNIX System Resources. By installing your stuff elsewhere, things will just not work.

HOMEBREW_URL=https://raw.githubusercontent.com/Homebrew/install/master/install

install: check install-brew install-cask

check:
	@which brew > /dev/null 2>&1 || ( \
		( \
			echo "\033[31mbrew is not installed! Run this command:" && \
			echo "\033[33mruby -e '$$(curl -fsSL $(HOMEBREW_URL))'\033[0m" \
		) && \
		exit 1 \
	)
	@brew cask > /dev/null 2>&1 || ( \
		( \
			echo "\033[31mbrew-cask is not installed! Run this command:" && \
			echo "\033[33mbrew install caskroom/cask/brew-cask\033[0m" \
		) && \
		exit 1 \
	)

install-brew:
	@if [ ! -f Brewfile ]; then echo "\033[33mBrewfile not found!\033[0m"; exit 1; fi;
	brew update
	brew upgrade
	brew install $$(cat Brewfile)
	brew cleanup
	brew prune
	brew doctor

install-cask:
	@if [ ! -f Caskfile ]; then echo "\033[33mCaskfile not found!\033[0m"; exit 1; fi;
	brew cask install $$(cat Caskfile)
	brew cask cleanup
	brew cask audit

build: check build-brew build-cask

build-brew:
	@brew list| sort | awk '{ print $$1 }' > Brewfile
	@echo "\033[32mBrewfile generated!\033[0m"

build-cask:
	@brew cask list| sort | awk '{ print $$1 }' > Caskfile
	@echo "\033[92mCaskfile generated!\033[0m"

.PHONY: install update

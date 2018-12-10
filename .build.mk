packages = fpm-equivs

before_install:
	sudo echo $(ZILOGIC_APT_REPO) | sudo tee /etc/apt/sources.list.d/zilogic.list
	sudo apt-get update

install:
	sudo apt-get install --force-yes -y --no-install-recommends $(packages)
	sudo -H pip install zdrive-push

script:
	make deb

after_success:
	zdrive-push armbox $(BUILD_TYPE) $(BUILD_VERSION) debian armbox*.deb

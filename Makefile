
bootstrap-macos: install-macos symlink-macos config-macosx
bootstrap-ubuntu: install-ubuntu symlink-ubuntu

install-macos:
	cd ./platforms/macos && make install;

symlink-macos:
	cd ./platforms/macos && make symlink;

config-macos:
	cd ./platforms/macos && make config;

install-ubuntu:
	cd ./platforms/ubuntu && make install;

symlink-ubuntu:
	cd ./platforms/ubuntu && make symlink;

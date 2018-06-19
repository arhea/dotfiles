
bootstrap-macosx: install-macosx symlink-macosx config-macosx
bootstrap-ubuntu: install-ubuntu symlink-ubuntu

install-macosx:
	cd ./platforms/macosx && make install;

symlink-macosx:
	cd ./platforms/macosx && make symlink;

config-macosx:
	cd ./platforms/macosx && make symlink;

install-ubuntu:
	cd ./platforms/ubuntu && make install;

symlink-ubuntu:
	cd ./platforms/ubuntu && make symlink;

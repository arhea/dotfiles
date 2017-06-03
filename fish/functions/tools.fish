
set docker_gc_image "spotify/docker-gc:latest"
set htop_image "jess/htop:latest"

function brew_update --description "Run Homebrew Update"
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup
  brew doctor
  brew prune
end

function tools_update --description "Update local containers that are used to run tools such as Node.js, PHP, Ruby, Terraform, and Packer"

  set_color green
  echo "=> Pulling Spotify Docker Garbage Collection"
  set_color normal
  docker pull $docker_gc_image

  set_color green
  echo "=> Pulling HTOP"
  set_color normal
  docker pull $htop_image
end

function docker_gc
  docker run -it --rm --name=docker-gc \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /etc:/etc \
    $docker_gc_image

  tools_update
end

function htop
  docker run --rm -it --name htop \
		--pid host \
		--net none \
		$htop_image
end

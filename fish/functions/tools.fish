
set docker_gc_image "spotify/docker-gc:latest"
set terraform_image "hashicorp/terraform:light"
set packer_image "hashicorp/packer:light"
set node_image "node:6-alpine"
set ruby_image "ruby:2-alpine"
set php_image "php:7-alpine"
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
  echo "=> Pulling Hashicorp Terraform"
  set_color normal
  docker pull $terraform_image

  set_color green
  echo "=> Pulling Hashicorp Packer"
  set_color normal
  docker pull $packer_image

  set_color green
  echo "=> Pulling Node.js"
  set_color normal
  docker pull $node_image

  set_color green
  echo "=> Pulling Ruby"
  set_color normal
  docker pull $ruby_image

  set_color green
  echo "=> Pulling PHP"
  set_color normal
  docker pull $php_image

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

function terraform
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v $HOME/.aws:/root/.aws \
    -v $PWD:/usr/src/app \
    $terraform_image $argv
end

function packer
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$HOME"/.aws:/root/.aws \
    -v "$PWD":/usr/src/app \
    $packer_image $argv
end

function node
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$HOME"/.aws:/root/.aws \
    -v "$PWD":/usr/src/app \
    -p "3000:3000" \
    -p "5858:5858" \
    $node_image \
    /usr/local/bin/node $argv
end

function npm
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$HOME"/.aws:/root/.aws \
    -v "$PWD":/usr/src/app \
    $node_image \
    /usr/local/bin/npm $argv
end

function ruby
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$HOME"/.aws:/root/.aws \
    -v "$PWD":/usr/src/app \
    $ruby_image \
    ruby $argv
end

function php
  docker run -it --rm \
    -w /usr/src/app \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$HOME"/.aws:/root/.aws \
    -v "$PWD":/usr/src/app \
    $php_image \
    $argv
end

function htop
  docker run --rm -it --name htop \
		--pid host \
		--net none \
		$htop_image
end

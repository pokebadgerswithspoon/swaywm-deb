# swaywm-deb
.deb builder for swaywm

## Build docker

`docker image build -t swaydebs ./`

## Execute

#### Builds all
`docker run swaydebs all`

#### Drops to bash
`docker run swaydebs bash`

#### Fetch .deb

`docker cp 353e95375326:/root/sway-debs/ .`

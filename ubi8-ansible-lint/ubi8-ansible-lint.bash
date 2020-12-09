#!/bin/bash

container=$(buildah from registry.access.redhat.com/ubi8)
mnt=$(buildah mount $container)

buildah run $container -- dnf install -y python3-pip
buildah run $container -- dnf clean all
rm -rf $mnt//var/cache/dnf
buildah run $container -- pip3 install --no-cache-dir yamllint ansible-lint
mkdir $mnt/work
buildah config --workingdir /work $container
buildah config --cmd 'ansible-lint --version' $container
buildah commit $container ubi8-ansible-lint:v0.1


## Release Notes
# v0.1
# * first version


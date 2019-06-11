## ROPS
------------------------------------------------------------------------------
A guest-os agnostic tool to strike up Rancher HA cluster in a lightning way.

## Version
Currently this installs Rancher v2.2.2

## How to Run
---------------------------------------------

### Install Rancher High-Availability Cluster
Generate ssh keys for non-password login to the hosts inside hosts.yml

Prepare install.yml, hosts.yml, then run
```
docker run --rm -v `pwd`:/outputs \
                -e ACTION=install_rancher \
                -e CONFIG="$(cat config/install.yml)" \
                -e HOSTS="$(cat config/hosts.yml)" \
                -e SSH_KEY="$(cat id_rsa)" \
                garyhuang123/rops:v0.1.0
```
Note: /outputs is used internally to save the cluster's state files, including kubeconfig, rkestate.

### Upgrade Existing Cluster & Rancher
Generate ssh keys for non-password login to the hosts inside hosts.yml

Prepare upgrade.yml, hosts.yml, kube_config_rancher_cluster.yml, rancher_cluster.rkestate, then run
```
docker run --rm -e ACTION=upgrade_rancher \
                -e CONFIG="$(cat config/upgrade.yml)" \
                -e HOSTS="$(cat config/hosts.yml)" \
                -e SSH_KEY="$(cat id_rsa)" \
                -e KUBE_CONFIG="$(cat config/kube_config_rancher_cluster.yml)" \
                -e RKE_STATE="$(cat config/rancher_cluster.rkestate)" \
                garyhuang123/rops:v0.1.0
```

### Pull Images into Private Registry
Prepare pull_image.yml, then run
```
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                -e ACTION=pull_image \
                -e CONFIG="$(cat config/pull_image.yml)" \
                garyhuang123/rops:v0.1.0
```

## Build Your Own Image if Needed
```
sh build.sh
```
The default local image name is rops

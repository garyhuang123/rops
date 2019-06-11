## Rancher-Ops
------------------------------------------------------------------------------
A guest-os agnostic tool to strike up Rancher HA cluster in a lightning way.

## Version
Currently this installs Rancher v2.2.2

### How to Run
---------------------------------------------

#### Install Rancher High-Available Cluster
Generate your own ssh keys for non-password login to the hosts inside hosts.yml
```
docker run --rm -v `pwd`:/outputs \
                -e ACTION=install_rancher \
                -e CONFIG="$(cat config/install.yml)" \
                -e HOSTS="$(cat config/hosts.yml)" \
                -e SSH_KEY="$(cat id_rsa)" \
                garyhuang123/rancher-ops
```
#### Upgrade Existing Cluster & Rancher
Generate your own ssh keys for non-password login to the hosts inside hosts.yml
```
docker run --rm -e ACTION=upgrade_rancher \
                -e CONFIG="$(cat config/upgrade.yml)" \
                -e HOSTS="$(cat config/hosts.yml)" \
                -e SSH_KEY="$(cat id_rsa)" \
                -e KUBE_CONFIG="$(cat config/kube_config_rancher_cluster.yml)" \
                -e RKE_STATE="$(cat config/rancher_cluster.rkestate)" \
                garyhuang123/rancher-ops
```
#### Pull Images into Private Registry

```
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                -e ACTION=pull_image \
                -e CONFIG="$(cat config/pull_image.yml)" \
                garyhuang123/rancher-ops
```
### Build Your Own Image if Needed
```
sh build.sh
```

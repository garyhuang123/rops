FROM centos:7
ENV ANSIBLE_HOST_KEY_CHECKING=False
RUN yum clean all && \
    yum install -y epel-release && \
    yum install ansible-2.7.5 -y

COPY scripts /workspace/scripts
COPY rancher-ha /workspace/rancher-ha

WORKDIR /workspace
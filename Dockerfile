FROM centos:7

ENV ANSIBLE_HOST_KEY_CHECKING=False

COPY scripts/* entry /usr/local/bin/
COPY rancher-ha /workspace/rancher-ha

RUN yum clean all \
    && yum install -y epel-release \
    && yum install https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.7.5-1.el7.ans.noarch.rpm -y \
    && chmod 744 -R /usr/local/bin/ \
    && curl -sSL https://get.docker.com/ | sh \
    && yum clean all

WORKDIR /workspace/rancher-ha

CMD ["entry"]

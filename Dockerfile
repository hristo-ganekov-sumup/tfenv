FROM centos:centos7

ARG AWS_PROFILE=sumup-developers
ARG USERNAME=hganekov
ARG UID=1000
ARG GID=1000

ENV AWS_PROFILE=$AWS_PROFILE

RUN yum install -y epel-release zsh git vim unzip\
    && groupadd --gid $UID $USERNAME \
    && useradd --uid $UID --gid $GID --home-dir /home/$USERNAME/ --shell /bin/zsh $USERNAME \
    && yum install -y git python2-pip gcc make \
    && pip install --upgrade pip \
    && pip install lxml boto3 boto awscli netaddr \
    && yum remove -y gcc make \
    && yum -y autoremove \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && mkdir -p /home/$USERNAME/terraform

USER $USERNAME

RUN curl -L http://install.ohmyz.sh | sh \
    && sed -i 's/plugins=(git)/plugins=(git terraform aws python)/g' /home/$USERNAME/.zshrc \
    && echo "alias tshow=\"terraform show\"" >>  /home/$USERNAME/.zshrc \
    && echo "alias tapply=\"terraform  apply 'plan.out'\"" >>  /home/$USERNAME/.zshrc \
    && echo "alias tinit=\"terraform init\"" >>  /home/$USERNAME/.zshrc \
    && echo "alias tplan=\"terraform plan --out=plan.out\"" >>  /home/$USERNAME/.zshrc \
    && mkdir -p /home/$USERNAME/.aws \
    && git clone https://github.com/tfutils/tfenv.git /home/$USERNAME/.tfenv 

ENV PATH=/home/$USERNAME/.tfenv/bin:$PATH

WORKDIR /home/$USERNAME/

RUN tfenv install 0.12.18
RUN tfenv install 0.11.14

WORKDIR /home/$USERNAME/terraform
CMD ["/bin/zsh"]

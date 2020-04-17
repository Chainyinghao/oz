#/bin/bash

echo -e "\e[35m ------Install Docker------ \e[0m"

rpm -q docker-ce
TAG=`echo $?`
DIR=`pwd`
DOCKER_IMAGE=${DIR}/images/docker_images/oz_centos.tar
STATUS=$(systemctl status docker | grep Active | awk '{print $2}')
if [[ $TAG -eq 1 ]];then
    yum install -y yum-utils device-mapper-persistent-data lvm2
    yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    yum install -y docker-ce
    systemctl enable docker
    systemctl restart docker
fi
if [[ ${STATUS} != "active" ]];then
    systemctl start docker
fi

echo -e "\e[35m ------Load OZ Image------ \e[0m"
docker load --input $DOCKER_IMAGE

echo -e "\e[35m ------Run OZ Container------ \e[0m"
VERSION=`docker images | grep oz_centos|awk '{print $2}'`
docker run -d --name oz_centos -it --privileged=true \
           -v ${DIR}/logs:/var/lib/oz/screenshots/ \
           -v ${DIR}/images/libvirt_images:/var/lib/libvirt/images/ \
           -v ${DIR}/images/ISO/:/etc/oz/ISO \
           -v ${DIR}/ks:/etc/oz/ks \
           -v ${DIR}/tdl:/etc/oz/tdl \
           oz_centos:${VERSION} /usr/sbin/init



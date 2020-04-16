#/bin/bash

rpm -q docker-ce
TAG=`echo $?`

DIR=`pwd`
DOCKER_IMAGE=${DIR}/images/docker_images/oz_image.tar
STATUS=$(systemctl status docker | grep Active | awk '{print $2}')
if [[ $TAG -eq 1 ]];then
    yum install -y docker-ce
    systemctl enable docker
    systemctl restart docker
fi
if [[ ${STATUS} != "active" ]];then
    systemctl start docker
fi

docker load --input $DOCKER_IMAGE

VERSION=`docker images | grep oz_centos|awk '{print $2}'`
docker run -d --name oz_centos -it --privileged=true \
           -v ${DIR}/logs:/var/lib/oz/screenshots/ \
           -v ${DIR}/images/libvirt_images:/var/lib/libvirt/images/ \
           -v ${DIR}/images/ISO/:/etc/oz/ISO \
           -v ${DIR}/ks:/etc/oz/ks \
           -v ${DIR}/tdl:/etc/oz/tdl \
           oz_centos:${VERSION} /usr/sbin/init



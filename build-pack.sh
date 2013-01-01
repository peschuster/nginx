#!/bin/sh

cd /home/peschuster/project/nginx
sh build.sh 
sudo sh install.sh 

cd /home/peschuster/project/customfs/ 
sudo sh ~/project/customfs/pack-complete.sh 
cp /home/peschuster/project/customfs/complete_fs.cpio.gz /home/peschuster/project/linux-2.6-xlnx/complete_fs.cpio.gz

cd /home/peschuster/project/linux-2.6-xlnx/ 
make -j 2 ARCH=microblaze simpleImage.xupv5

cd /home/peschuster/project/nginx

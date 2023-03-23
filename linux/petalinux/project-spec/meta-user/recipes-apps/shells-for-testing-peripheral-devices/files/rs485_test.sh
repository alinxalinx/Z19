#!/bin/sh

#set speed
SPEED=9600
stty -F /dev/ttyS1 ispeed $SPEED ospeed $SPEED cs8
stty -F /dev/ttyS3 ispeed $SPEED ospeed $SPEED cs8

#set up 485_de gpio
#gpiochip510 is DE port for /dev/ttyS1
if [[ ! -e /sys/class/gpio/gpio510 ]];then
        echo 510 >> /sys/class/gpio/export
fi
echo out >> /sys/class/gpio/gpio510/direction
#gpiochip511 is DE port for /dev/ttyS3
if [[ ! -e /sys/class/gpio/gpio511 ]];then
        echo 511 >> /sys/class/gpio/export
fi
echo out >> /sys/class/gpio/gpio511/direction

#/dev/ttyS1 send /dev/ttyS3 receive
echo 1 >> /sys/class/gpio/gpio510/value
echo 0 >> /sys/class/gpio/gpio511/value
cat /dev/ttyS3 > /home/root/.ttyS3_tmp &
echo -e "rs485 S1 send S3 receive test" >> /dev/ttyS1
TTYS3_DATA=`cat /home/root/.ttyS3_tmp | head -n 1`
if [ "$TTYS3_DATA" == "rs485 S1 send S3 receive test" ];then
        echo -e "\e[1;32m/dev/ttyS1 send /dev/ttyS3 receive OK\e[0m"
else
        echo -e "\e[1;31m/dev/ttyS1 send /dev/ttyS3 receive NG\e[0m"
fi
killall cat
rm /home/root/.ttyS3_tmp

#/dev/ttyS3 send /dev/ttyS1 receive
echo 1 >> /sys/class/gpio/gpio511/value
echo 0 >> /sys/class/gpio/gpio510/value
cat /dev/ttyS1 > /home/root/.ttyS1_tmp &
echo -e "rs485 S3 send S1 receive test" >> /dev/ttyS3
TTYS1_DATA=`cat /home/root/.ttyS1_tmp | head -n 1`
if [ "$TTYS1_DATA" == "rs485 S3 send S1 receive test" ];then
        echo -e "\e[1;32m/dev/ttyS3 send /dev/ttyS1 receive OK\e[0m"
else
        echo -e "\e[1;31m/dev/ttyS3 send /dev/ttyS1 receive NG\e[0m"
fi
killall cat
rm /home/root/.ttyS1_tmp

echo 0 >> /sys/class/gpio/gpio510/value
echo 0 >> /sys/class/gpio/gpio511/value




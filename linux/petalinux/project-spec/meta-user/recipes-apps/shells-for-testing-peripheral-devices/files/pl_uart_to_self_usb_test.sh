#!/bin/sh

#set speed
SPEED=9600
stty -F /dev/ttyS2 ispeed $SPEED ospeed $SPEED cs8
stty -F /dev/ttyUSB0 ispeed $SPEED ospeed $SPEED cs8
sleep 1

cat /dev/ttyS2 >> /home/root/.ttyS2_tmp &
sleep 1
echo -e "pl uart to self usb test 1" >> /dev/ttyUSB0
sleep 1
TTYS2_DATA=`cat /home/root/.ttyS2_tmp`
echo $TTYS2_DATA
killall cat

cat /dev/ttyUSB0 >> /home/root/.ttyUSB0_tmp &
sleep 1
echo -e "pl uart to self usb test 2" >> /dev/ttyS2
sleep 1
TTYUSB0_DATA=`cat /home/root/.ttyUSB0_tmp`
echo $TTYUSB0_DATA
killall cat

if [ "$TTYUSB0_DATA" == "pl uart to self usb test 2" ] && [ "$TTYS2_DATA" == "pl uart to self usb test 1" ];then
        echo -e "\e[1;32mpl uart to self usb test OK\e[0m"
else
        echo -e "\e[1;31mpl uart to self usb test NG\e[0m"
fi
rm /home/root/.ttyS2_tmp
rm /home/root/.ttyUSB0_tmp



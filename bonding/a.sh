cat > /etc/sysconfig/network-scripts/ifcfg-em1 << EOF
DEVICE=em1
USERCTL=no
ONBOOT=yes
MASTER=bond0
SLAVE=yes
BOOTPROTO=none
EOF

cat > /etc/sysconfig/network-scripts/ifcfg-em2 << EOF
DEVICE=em2
USERCTL=no
ONBOOT=yes
MASTER=bond0
SLAVE=yes
BOOTPROTO=none
EOF

echo "alias bond0 bonding" > /etc/modprobe.d/bonding.conf
echo "options bond0 miimon=100 mode=1" > /etc/modprobe.d/bonding.conf

echo IPADDR=`cat /tmp/ip.txt` >> /etc/sysconfig/network-scripts/ifcfg-bond0
echo GATEWAY=`cat /tmp/ip.txt |awk -F"." '{ print $1"."$2"."$3".1" }'` >> /etc/sysconfig/network-scripts/ifcfg-bond0


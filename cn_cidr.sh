#!/bin/bash

# China IP list url
cn_cidr_url="https://ispip.clang.cn/all_cn.txt"
# ROS script name
cn_cidr_rsc="./chn_list.rsc"
# ROS firewall address list name
address_list="chn_list"

# Init script
cat > $cn_cidr_rsc << EOF
# Remove old address list
/ip firewall address-list
:foreach i in=[ find list=$address_list ] do={ remove number=\$i }

# Add new address list
# # Private addresses
# # Class A private
add list=$address_list address=10.0.0.0/8 comment=private-network
add list=$address_list address=127.0.0.0/8 comment=private-network
add list=$address_list address=0.0.0.0/8 comment=private-network
# # Class B private
add list=$address_list address=172.16.0.0/12 comment=private-network
add list=$address_list address=169.254.0.0/16 comment=private-network
# # Class C private
add list=$address_list address=192.168.0.0/16 comment=private-network
# # China addresses list
EOF
curl -fsSL $cn_cidr_url | sed "s#^#add list=$address_list address=#g" >> $cn_cidr_rsc

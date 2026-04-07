# Remove old address list
/ip firewall address-list
:foreach i in=[ find list=cnip ] do={ remove number=$i }

# Add new address list
# # Private addresses
# # Class A private
add list=cnip address=10.0.0.0/8 comment=private-network
add list=cnip address=127.0.0.0/8 comment=private-network
add list=cnip address=0.0.0.0/8 comment=private-network
# # Class B private
add list=cnip address=172.16.0.0/12 comment=private-network
add list=cnip address=169.254.0.0/16 comment=private-network
# # Class C private
add list=cnip address=192.168.0.0/16 comment=private-network
# # China addresses list

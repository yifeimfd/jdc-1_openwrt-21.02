#/bin/bash
#=================================================
#   Description: DIY script
#   Lisence: MIT
#   Author: P3TERX
#   Blog: https://p3terx.com
#=================================================

#echo '修改feeds'
#sed -i '1,2s/coolsnowwolf/sypopo/g' ./feeds.conf.default

echo '修改网关地址'
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

#echo '修改机器名称'
#sed -i 's/OpenWrt/OpenWrt-x64/g' package/base-files/files/bin/config_generate

echo '修改banner'
cp -f diy/sypopo/banner package/base-files/files/etc/
date=`date +%m.%d.%Y`
sed -i "s/SyPopo$/SyPopo $date/g" package/base-files/files/etc/banner

echo '添加软件包'
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8
git clone https://github.com/kenzok8/small.git package/small
#git clone https://github.com/Leo-Jo-My/luci-theme-opentomato.git package/lean/luci-theme-opentomato
#sed -i "s/LeoJo/SyPopo/g" package/lean/luci-theme-opentomato/luasrc/view/themes/opentomato/footer.htm
#rm -rf package/lean/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 package/lean/luci-theme-argon

echo '定义默认值'
cat > package/lean/default-settings/files/zzz-default-settings <<-EOF
#!/bin/sh
uci set luci.main.lang=zh_cn
uci set luci.themes.OpenTomato=/luci-static/opentomato
uci set luci.main.mediaurlbase=/luci-static/opentomato
uci commit luci
uci set system.@system[0].timezone=CST-8
uci set system.@system[0].zonename=Asia/Shanghai
uci commit system
uci set fstab.@global[0].anon_mount=1
uci commit fstab
rm -f /usr/lib/lua/luci/view/admin_status/index/mwan.htm
rm -f /usr/lib/lua/luci/view/admin_status/index/upnp.htm
rm -f /usr/lib/lua/luci/view/admin_status/index/ddns.htm
rm -f /usr/lib/lua/luci/view/admin_status/index/minidlna.htm
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/aria2.lua
sed -i 's/services/nas/g' /usr/lib/lua/luci/view/aria2/overview_status.htm
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/minidlna.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/transmission.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/mjpg-streamer.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/p910nd.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/usb_printer.lua
sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/xunlei.lua
sed -i 's/services/nas/g'  /usr/lib/lua/luci/view/minidlna_status.htm
sed -i 's/\"services\"/\"vpn\"/g' /usr/lib/lua/luci/controller/shadowsocksr.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/checkport.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/refresh.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/server_list.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/status.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/subscribe.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/shadowsocksr/check.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/shadowsocksr/server.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/shadowsocksr/servers.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/shadowsocksr/client-config.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/shadowsocksr/server-config.lua
sed -i 's/\"services\"/\"vpn\"/g' /usr/lib/lua/luci/controller/openclash.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/openclash/download_game_rule.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/openclash/server_list.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/openclash/update.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/openclash/status.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/view/openclash/state.htm
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/client.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/config.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/config-subscribe.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/game-rules-manage.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/game-settings.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/groups-config.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/log.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/proxy-provider-config.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/servers.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/servers-config.lua
sed -i 's/services/vpn/g' /usr/lib/lua/luci/model/cbi/openclash/settings.lua
ln -sf /sbin/ip /usr/bin/ip
sed -i 's/downloads.openwrt.org/openwrt.proxy.ustclug.org/g' /etc/opkg/distfeeds.conf
sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf
#sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow
sed -i "s/# //g" /etc/opkg/distfeeds.conf
sed -i '/REDIRECT --to-ports 53/d' /etc/firewall.user
echo 'iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
echo 'iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
echo '[ -n "$(command -v ip6tables)" ] && ip6tables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
echo '[ -n "$(command -v ip6tables)" ] && ip6tables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 53' >> /etc/firewall.user
sed -i '/option disabled/d' /etc/config/wireless
sed -i '/set wireless.radio${devidx}.disabled/d' /lib/wifi/mac80211.sh
sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release
echo "DISTRIB_REVISION='Compiled by SyPopo'" >> /etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt '" >> /etc/openwrt_release
sed -i '/log-facility/d' /etc/dnsmasq.conf
echo "log-facility=/dev/null" >> /etc/dnsmasq.conf
sed -i 's/cbi.submit\"] = true/cbi.submit\"] = \"1\"/g' /usr/lib/lua/luci/dispatcher.lua
echo 'hsts=0' > /root/.wgetrc
rm -rf /tmp/luci-modulecache/
rm -f /tmp/luci-indexcache
exit 0
EOF

echo '当前路径'
pwd

#/bin/bash

echo '修改mt7621.mk'
sed -i '/TARGET_DEVICES += jcg_y2/a\\ndefine Device\/jdcloud_re-sp-01b\n  \$(Device\/dsa-migration)\n  \$(Device\/uimage-lzma-loader)\n  IMAGE_SIZE := 27328k\n  DEVICE_VENDOR := JDCloud\n  DEVICE_MODEL := RE-SP-01B\n  DEVICE_PACKAGES := kmod-fs-ext4 kmod-mt7603 kmod-mt7615e kmod-sdhci-mt7620 kmod-usb3 wpad-openssl\nendef\nTARGET_DEVICES += jdcloud_re-sp-01b' target/linux/ramips/image/mt7621.mk

echo '修改02-network'
sed -i '/lenovo,newifi-d1|\\/i\        jdcloud,re-sp-01b|\\' target/linux/ramips/mt7621/base-files/etc/board.d/02_network

# echo '修改网关地址'
# sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# echo '修改时区'
# sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# echo '修改机器名称'
# sed -i 's/OpenWrt/OpenWrt-JDCloud RE-SP-01B/g' package/base-files/files/bin/config_generate

echo '默认开启wifi'
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo '修改版本显示'
sed -i "s/%D %V %C'/%D %V %C Compiled by YifeiMfd'/g" package/base-files/files/etc/openwrt_release

echo '删除临时文件'
rm -rf /tmp/luci-modulecache/
rm -f /tmp/luci-indexcache

echo '当前路径'
pwd

#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/s1545151561/OpenWrt-mi3pro
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# 修改openwrt登陆地址,把下面的 192.168.51.1 修改成你想要的就可以了
  sed -i 's/192.168.100.1/192.168.31.3/g' package/base-files/files/bin/config_generate
  
# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
  sed -i 's/OpenWrt/MTkej/g' package/base-files/files/bin/config_generate  
  
# 科学上网插件
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2

# 在线用户
git_sparse_clone main https://github.com/haiibo/packages luci-app-onliner
sed -i '$i uci set nlbwmon.@nlbwmon[0].refresh_interval=2s' package/lean/default-settings/files/zzz-default-settings
sed -i '$i uci commit nlbwmon' package/lean/default-settings/files/zzz-default-settings
chmod 755 package/luci-app-onliner/root/usr/share/onliner/setnlbw.sh

./scripts/feeds update -a
./scripts/feeds install -a

# 修改版本为编译日期，数字类型。
date_version=$(date +"%Y%m%d%H")
echo $date_version > version

# 为iStoreOS固件版本加上编译作者
author="你爹呀"
sed -i "s/DISTRIB_DESCRIPTION.*/DISTRIB_DESCRIPTION='%D %V ${date_version} by ${author}'/g" package/base-files/files/etc/openwrt_release
sed -i "s/OPENWRT_RELEASE.*/OPENWRT_RELEASE=\"%D %V ${date_version} by ${author}\"/g" package/base-files/files/usr/lib/os-release

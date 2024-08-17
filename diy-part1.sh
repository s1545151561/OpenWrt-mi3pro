#!/bin/bash
#
# Copyright (c) 2019-2020 MTkej <https://github.com/s1545151561/OpenWrt-mi3pro>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/s1545151561/OpenWrt-mi3pro
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo >> feeds.conf.default
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default
echo >> feeds.conf.default
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default


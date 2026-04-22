#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#echo 'src-git custom https://github.com/xiaorouji/openwrt-passwall.git;packages' >>feeds.conf.default

# 移除旧的 openclash (如果有的话)
rm -rf feeds/openclash

# 强制添加官方主分支
echo 'src-git openclash https://github.com/vernesong/OpenClash.git;main' >> feeds.conf.default

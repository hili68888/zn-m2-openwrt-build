#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#优先安装 passwall 源
#./scripts/feeds install -a -f -p passwall_packages
#./scripts/feeds install -a -f -p passwall_luci

# 添加 TProxy 支持 (OpenClash 核心依赖)
echo "CONFIG_PACKAGE_kmod-ipt-tproxy=y" >> .config
echo "CONFIG_PACKAGE_kmod-ipt-nat=y" >> .config

# 添加 IPset 和相关模块 (解决 xt_set 缺失)
echo "CONFIG_PACKAGE_kmod-ipt-ipset=y" >> .config
echo "CONFIG_PACKAGE_kmod-ipt-conntrack-extra=y" >> .config

# 如果源码较新使用的是 nftables，则需要补齐 nft 相关
echo "CONFIG_PACKAGE_kmod-nft-tproxy=y" >> .config
echo "CONFIG_PACKAGE_kmod-nft-nat=y" >> .config

# 确保 Dnsmasq-full 包含必要组件
sed -i 's/CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y/CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y\nCONFIG_PACKAGE_dnsmasq_full_ipset=y\nCONFIG_PACKAGE_dnsmasq_full_tproxy=y/' .config

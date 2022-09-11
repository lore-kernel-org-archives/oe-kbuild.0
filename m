Content-Type: multipart/mixed; boundary="===============1980092863062466239=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10 1030/9999] phylink.c:undefined reference to `linkmode_resolve_pause'
Date: Mon, 12 Sep 2022 04:18:58 +0800
Message-ID: <202209120417.vVjrhw69-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1980092863062466239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 phylink.c:(.text+0x2e4): undefined reference to `linkmode_resolve_pause'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: 36ab8cea47b0d4a3c5067577430c147a903b5261 [1030/9999] ANDROID: GKI: =
Kconfig.gki: Add GKI_HIDDEN_ETHERNET_CONFIGS
:::::: branch date: 5 months ago
:::::: commit date: 1 year, 3 months ago
config: arm64-randconfig-s032-20220911 (https://download.01.org/0day-ci/arc=
hive/20220912/202209120417.vVjrhw69-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/36ab8cea47b0d4a=
3c5067577430c147a903b5261
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/=
android13-5.10
        git checkout 36ab8cea47b0d4a3c5067577430c147a903b5261
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_fi=
xed_state':
>> phylink.c:(.text+0x2e4): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_decode=
_c37_word':
   phylink.c:(.text+0x410): undefined reference to `linkmode_resolve_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_major_=
config':
>> phylink.c:(.text+0x56c): undefined reference to `netdev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x61c): undefined reference to `netde=
v_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_link_d=
own':
>> phylink.c:(.text+0x698): undefined reference to `netif_carrier_off'
   aarch64-linux-ld: phylink.c:(.text+0x6dc): undefined reference to `netde=
v_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_em=
ul_read':
>> phylink.c:(.text+0x778): undefined reference to `swphy_read_reg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_phy_ch=
ange':
>> phylink.c:(.text+0xb2c): undefined reference to `phy_get_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_resolv=
e':
>> phylink.c:(.text+0xe54): undefined reference to `netif_carrier_on'
>> aarch64-linux-ld: phylink.c:(.text+0xe78): undefined reference to `phy_s=
peed_to_str'
>> aarch64-linux-ld: phylink.c:(.text+0xe88): undefined reference to `phy_d=
uplex_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xedc): undefined reference to `netde=
v_printk'
   aarch64-linux-ld: phylink.c:(.text+0xf00): undefined reference to `phy_s=
peed_to_str'
   aarch64-linux-ld: phylink.c:(.text+0xf10): undefined reference to `phy_d=
uplex_to_str'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_=
mode':
   phylink.c:(.text+0x1544): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x15d8): undefined reference to `netd=
ev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_parse_=
fixedlink':
   phylink.c:(.text+0x17e8): undefined reference to `netdev_printk'
   aarch64-linux-ld: phylink.c:(.text+0x18e0): undefined reference to `netd=
ev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x1950): undefined reference to `phy_=
lookup_setting'
   aarch64-linux-ld: phylink.c:(.text+0x1a08): undefined reference to `netd=
ev_printk'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_bringu=
p_phy':
>> phylink.c:(.text+0x1aec): undefined reference to `phy_support_asym_pause'
   aarch64-linux-ld: phylink.c:(.text+0x1bbc): undefined reference to `netd=
ev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x1c2c): undefined reference to `phy_=
attached_info_irq'
   aarch64-linux-ld: phylink.c:(.text+0x1c80): undefined reference to `netd=
ev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x1d5c): undefined reference to `phy_=
request_interrupt'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_connec=
t_phy':
>> phylink.c:(.text+0x2154): undefined reference to `phy_attach_direct'
>> aarch64-linux-ld: phylink.c:(.text+0x2184): undefined reference to `phy_=
detach'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_discon=
nect_phy':
>> phylink.c:(.text+0x22ac): undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: phylink.c:(.text+0x2334): undefined reference to `phy_=
disconnect'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_start':
   phylink.c:(.text+0x23bc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x246c): undefined reference to `netd=
ev_printk'
>> aarch64-linux-ld: phylink.c:(.text+0x24f4): undefined reference to `neti=
f_carrier_off'
>> aarch64-linux-ld: phylink.c:(.text+0x26e4): undefined reference to `phy_=
start'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_stop':
   phylink.c:(.text+0x271c): undefined reference to `rtnl_is_locked'
>> aarch64-linux-ld: phylink.c:(.text+0x2774): undefined reference to `phy_=
stop'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_get_wol':
   phylink.c:(.text+0x281c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x287c): undefined reference to `phy_=
ethtool_get_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_set_wol':
   phylink.c:(.text+0x28bc): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2918): undefined reference to `phy_=
ethtool_set_wol'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_ksettings_get':
   phylink.c:(.text+0x2968): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x29c4): undefined reference to `phy_=
ethtool_ksettings_get'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_ksettings_set':
   phylink.c:(.text+0x2a7c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2ad8): undefined reference to `phy_=
ethtool_ksettings_set'
   aarch64-linux-ld: phylink.c:(.text+0x2b6c): undefined reference to `phy_=
lookup_setting'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_nway_reset':
   phylink.c:(.text+0x2d5c): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2db4): undefined reference to `phy_=
restart_aneg'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_get_pauseparam':
   phylink.c:(.text+0x2e08): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_set_pauseparam':
   phylink.c:(.text+0x2eb4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x2fb8): undefined reference to `link=
mode_set_pause'
   aarch64-linux-ld: phylink.c:(.text+0x3038): undefined reference to `phy_=
set_asym_pause'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_get_ee=
e_err':
   phylink.c:(.text+0x30a4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x30fc): undefined reference to `phy_=
get_eee_err'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_init_e=
ee':
   phylink.c:(.text+0x3158): undefined reference to `phy_init_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_get_eee':
   phylink.c:(.text+0x31a4): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x3200): undefined reference to `phy_=
ethtool_get_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_ethtoo=
l_set_eee':
   phylink.c:(.text+0x3250): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x32ac): undefined reference to `phy_=
ethtool_set_eee'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_io=
ctl':
   phylink.c:(.text+0x3304): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x344c): undefined reference to `mdio=
bus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3520): undefined reference to `mdio=
bus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3538): undefined reference to `phy_=
mii_ioctl'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_=
down':
   phylink.c:(.text+0x3650): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x36c0): undefined reference to `phy_=
speed_down'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_speed_=
up':
   phylink.c:(.text+0x3700): undefined reference to `rtnl_is_locked'
   aarch64-linux-ld: phylink.c:(.text+0x376c): undefined reference to `phy_=
speed_up'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c2=
2_pcs_get_state':
   phylink.c:(.text+0x3934): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3948): undefined reference to `mdio=
bus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c2=
2_pcs_set_advertisement':
   phylink.c:(.text+0x3af8): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3b24): undefined reference to `mdio=
bus_write'
   aarch64-linux-ld: phylink.c:(.text+0x3b48): undefined reference to `mdio=
bus_read'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c2=
2_pcs_config':
   phylink.c:(.text+0x3bec): undefined reference to `mdiobus_modify'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c2=
2_pcs_an_restart':
   phylink.c:(.text+0x3c58): undefined reference to `mdiobus_read'
   aarch64-linux-ld: phylink.c:(.text+0x3c78): undefined reference to `mdio=
bus_write'
   aarch64-linux-ld: drivers/net/phy/phylink.o: in function `phylink_mii_c4=
5_pcs_get_state':
   phylink.c:(.text+0x3cc4): undefined reference to `mdiobus_read'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=3Dn]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=3Dy]

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1980092863062466239==--


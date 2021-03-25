Content-Type: multipart/mixed; boundary="===============8538403790054017114=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 10/33] dtbs_check: COPYING CREDITS Documentation Kbuild Kconfig LICENSES MAINTAINERS Makefile PRESUBMIT.cfg README arch block certs chromeos crypto drivers fs include init ipc kernel lib mm net samples scripts security sound tools usr virt [scripts/Makefile.lib:300: arch/arm/boot/dts/mt2701-evb.dt.yaml] Error 255
Date: Fri, 26 Mar 2021 07:35:20 +0800
Message-ID: <202103260710.ypooV0s4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8538403790054017114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   3f6eca1d21f8e8a861b5731eac7b7e560ec88e91
commit: 493a781a46d158153e5042cde377e4373be0d0c4 [10/33] UPSTREAM: dt-bindi=
ngs: usb: convert mediatek, mtk-xhci.txt to YAML schema
:::::: branch date: 7 hours ago
:::::: commit date: 19 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
minnie.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-minnie.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
jerry.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-jerry.dt.yam=
l'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/tegra124-venic=
e2.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/tegra124-venice2.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/tegra124-nyan-=
big.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/tegra124-nyan-big.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/tegra124-nyan-=
blaze.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/tegra124-nyan-blaze.dt.yam=
l'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt2701-evb.dt.=
yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt2701-evb.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt7623a-rfb-na=
nd.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt7623a-rfb-nand.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt7623a-rfb-em=
mc.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt7623a-rfb-emmc.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt7623n-rfb-em=
mc.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt7623n-rfb-emmc.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt7629-rfb.dt.=
yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt7629-rfb.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/mt7623n-banana=
pi-bpi-r2.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dt=
.yaml'
   make[2]: Target '__build' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8538403790054017114==--


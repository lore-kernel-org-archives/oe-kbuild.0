Content-Type: multipart/mixed; boundary="===============6736616350108677125=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [shawnguo:imx/dt 19/19] dtbs_check: arch/arm/boot/dts/imx7d-remarkable2.dt.yaml: /: compatible: 'oneOf' conditional failed, one must be fixed:
Date: Mon, 29 Mar 2021 19:40:24 +0800
Message-ID: <202103291920.SSPIyRUu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6736616350108677125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Alistair Francis <alistair@alistair23.me>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git =
imx/dt
head:   c11d56b3761c77f50368b4828cc5d9f5f343148d
commit: c11d56b3761c77f50368b4828cc5d9f5f343148d [19/19] ARM: imx7d-remarka=
ble2: Initial device tree for reMarkable2
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/imx7d-remarkable2.dt.yaml: /: compatible: 'oneOf' cond=
itional failed, one must be fixed:
   	['remarkable,imx7d-remarkable2', 'fsl,imx7d'] is too short
   	['remarkable,imx7d-remarkable2', 'fsl,imx7d'] is too long
   	Additional items are not allowed ('fsl,imx7d' was unexpected)
   	'remarkable,imx7d-remarkable2' is not one of ['armadeus,imx1-apf9328', =
'fsl,imx1ads']
   	'remarkable,imx7d-remarkable2' is not one of ['fsl,imx23-evk', 'olimex,=
imx23-olinuxino']
   	'remarkable,imx7d-remarkable2' is not one of ['fsl,imx25-pdk', 'karo,im=
x25-tx25']
   	'remarkable,imx7d-remarkable2' is not one of ['eukrea,mbimxsd25-baseboa=
rd']
   	'remarkable,imx7d-remarkable2' is not one of ['eukrea,mbimxsd25-baseboa=
rd-cmo-qvga', 'eukrea,mbimxsd25-baseboard-dvi-svga', 'eukrea,mbimxsd25-base=
board-dvi-vga']
   	'remarkable,imx7d-remarkable2' is not one of ['armadeus,imx27-apf27', '=
fsl,imx27-pdk']
   	'armadeus,imx27-apf27dev' was expected

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6736616350108677125==--


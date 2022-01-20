Content-Type: multipart/mixed; boundary="===============2693942116305590501=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:26 mlxbf_gige_set_mac_rx_filter() warn: should '((((1))) << (4)) << index' be a 64 bit type?
Date: Thu, 20 Jan 2022 11:27:47 +0800
Message-ID: <202201200947.ryWuG9gs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2693942116305590501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Thompson <davthompson@nvidia.com>
CC: Asmaa Mnebhi <asmaa@nvidia.com>
CC: Liming Sun <limings@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: f92e1869d74e1acc6551256eb084a1c14a054e19 Add Mellanox BlueField Gig=
abit Ethernet driver
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: nios2-randconfig-m031-20220116 (https://download.01.org/0day-ci/arc=
hive/20220120/202201200947.ryWuG9gs-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:26 mlxbf_gige_set_=
mac_rx_filter() warn: should '((((1))) << (4)) << index' be a 64 bit type?

vim +26 drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c

f92e1869d74e1a David Thompson 2021-06-24  13  =

f92e1869d74e1a David Thompson 2021-06-24  14  void mlxbf_gige_set_mac_rx_fi=
lter(struct mlxbf_gige *priv,
f92e1869d74e1a David Thompson 2021-06-24  15  				  unsigned int index, u64=
 dmac)
f92e1869d74e1a David Thompson 2021-06-24  16  {
f92e1869d74e1a David Thompson 2021-06-24  17  	void __iomem *base =3D priv-=
>base;
f92e1869d74e1a David Thompson 2021-06-24  18  	u64 control;
f92e1869d74e1a David Thompson 2021-06-24  19  =

f92e1869d74e1a David Thompson 2021-06-24  20  	/* Write destination MAC to =
specified MAC RX filter */
f92e1869d74e1a David Thompson 2021-06-24  21  	writeq(dmac, base + MLXBF_GI=
GE_RX_MAC_FILTER +
f92e1869d74e1a David Thompson 2021-06-24  22  	       (index * MLXBF_GIGE_R=
X_MAC_FILTER_STRIDE));
f92e1869d74e1a David Thompson 2021-06-24  23  =

f92e1869d74e1a David Thompson 2021-06-24  24  	/* Enable MAC receive filter=
 mask for specified index */
f92e1869d74e1a David Thompson 2021-06-24  25  	control =3D readq(base + MLX=
BF_GIGE_CONTROL);
f92e1869d74e1a David Thompson 2021-06-24 @26  	control |=3D (MLXBF_GIGE_CON=
TROL_EN_SPECIFIC_MAC << index);
f92e1869d74e1a David Thompson 2021-06-24  27  	writeq(control, base + MLXBF=
_GIGE_CONTROL);
f92e1869d74e1a David Thompson 2021-06-24  28  }
f92e1869d74e1a David Thompson 2021-06-24  29  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2693942116305590501==--


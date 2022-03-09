Content-Type: multipart/mixed; boundary="===============0086617474250366581=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:26 mlxbf_gige_set_mac_rx_filter() warn: should '((((1))) << (4)) << index' be a 64 bit type?
Date: Thu, 10 Mar 2022 04:25:40 +0800
Message-ID: <202203100436.9xKM7WV8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0086617474250366581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Thompson <davthompson@nvidia.com>
CC: Asmaa Mnebhi <asmaa@nvidia.com>
CC: Liming Sun <limings@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: f92e1869d74e1acc6551256eb084a1c14a054e19 Add Mellanox BlueField Gig=
abit Ethernet driver
date:   9 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 9 months ago
config: microblaze-randconfig-m031-20220308 (https://download.01.org/0day-c=
i/archive/20220310/202203100436.9xKM7WV8-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:26 mlxbf_gige_set_=
mac_rx_filter() warn: should '((((1))) << (4)) << index' be a 64 bit type?

vim +26 drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c

f92e1869d74e1ac David Thompson 2021-06-24  13  =

f92e1869d74e1ac David Thompson 2021-06-24  14  void mlxbf_gige_set_mac_rx_f=
ilter(struct mlxbf_gige *priv,
f92e1869d74e1ac David Thompson 2021-06-24  15  				  unsigned int index, u6=
4 dmac)
f92e1869d74e1ac David Thompson 2021-06-24  16  {
f92e1869d74e1ac David Thompson 2021-06-24  17  	void __iomem *base =3D priv=
->base;
f92e1869d74e1ac David Thompson 2021-06-24  18  	u64 control;
f92e1869d74e1ac David Thompson 2021-06-24  19  =

f92e1869d74e1ac David Thompson 2021-06-24  20  	/* Write destination MAC to=
 specified MAC RX filter */
f92e1869d74e1ac David Thompson 2021-06-24  21  	writeq(dmac, base + MLXBF_G=
IGE_RX_MAC_FILTER +
f92e1869d74e1ac David Thompson 2021-06-24  22  	       (index * MLXBF_GIGE_=
RX_MAC_FILTER_STRIDE));
f92e1869d74e1ac David Thompson 2021-06-24  23  =

f92e1869d74e1ac David Thompson 2021-06-24  24  	/* Enable MAC receive filte=
r mask for specified index */
f92e1869d74e1ac David Thompson 2021-06-24  25  	control =3D readq(base + ML=
XBF_GIGE_CONTROL);
f92e1869d74e1ac David Thompson 2021-06-24 @26  	control |=3D (MLXBF_GIGE_CO=
NTROL_EN_SPECIFIC_MAC << index);
f92e1869d74e1ac David Thompson 2021-06-24  27  	writeq(control, base + MLXB=
F_GIGE_CONTROL);
f92e1869d74e1ac David Thompson 2021-06-24  28  }
f92e1869d74e1ac David Thompson 2021-06-24  29  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0086617474250366581==--


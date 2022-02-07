Content-Type: multipart/mixed; boundary="===============2791818243667487672=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2 5/6] mailbox: imx: introduce rxdb callback
Date: Mon, 07 Feb 2022 21:25:35 +0800
Message-ID: <202202072115.rSLYexUu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2791818243667487672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220207015211.394297-6-peng.fan@oss.nxp.com>
References: <20220207015211.394297-6-peng.fan@oss.nxp.com>
TO: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>

Hi "Peng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next linus/master v5.17-rc3 next-20220=
207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Peng-Fan-OSS/mailbox-imx-m=
isc-fix-and-SECO-MU-support/20220207-095529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git =
for-next
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc64-randconfig-c023-20220207 (https://download.01.org/0day-ci=
/archive/20220207/202202072115.rSLYexUu-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/imx-mailbox.c:670:51-52: rxdb: first occurrence line 673=
, second occurrence line 675

vim +670 drivers/mailbox/imx-mailbox.c

63b383575c388f Peng Fan 2020-03-19  669  =

4f0b776ef58317 Peng Fan 2021-05-28 @670  static const struct imx_mu_dcfg im=
x_mu_cfg_imx8ulp =3D {
4f0b776ef58317 Peng Fan 2021-05-28  671  	.tx	=3D imx_mu_generic_tx,
4f0b776ef58317 Peng Fan 2021-05-28  672  	.rx	=3D imx_mu_generic_rx,
0c553569a985f2 Peng Fan 2022-02-07 @673  	.rxdb	=3D imx_mu_generic_rxdb,
4f0b776ef58317 Peng Fan 2021-05-28  674  	.init	=3D imx_mu_init_generic,
0c553569a985f2 Peng Fan 2022-02-07 @675  	.rxdb	=3D imx_mu_generic_rxdb,
4f0b776ef58317 Peng Fan 2021-05-28  676  	.type	=3D IMX_MU_V2,
4f0b776ef58317 Peng Fan 2021-05-28  677  	.xTR	=3D 0x200,
4f0b776ef58317 Peng Fan 2021-05-28  678  	.xRR	=3D 0x280,
4f0b776ef58317 Peng Fan 2021-05-28  679  	.xSR	=3D {0xC, 0x118, 0x124, 0x12=
C},
4f0b776ef58317 Peng Fan 2021-05-28  680  	.xCR	=3D {0x110, 0x114, 0x120, 0x=
128},
4f0b776ef58317 Peng Fan 2021-05-28  681  };
4f0b776ef58317 Peng Fan 2021-05-28  682  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2791818243667487672==--


Content-Type: multipart/mixed; boundary="===============1781838212494824931=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 70/358] drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:516:11-29: WARNING: dma_alloc_coherent used in cfg_stm already zeroes out memory, so memset is not needed
Date: Sat, 16 Jul 2022 12:13:47 +0800
Message-ID: <202207161214.ZjBnT1qX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1781838212494824931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ming Qian <ming.qian@nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Mirela Rabulea <mirela.rabulea@nxp.com>
CC: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   ca24fef0f2c857b0533f21f9a8a756f9e73d60fb
commit: 6285cdea19daf764bf00f662a59fc83ef67345cf [70/358] media: imx-jpeg: =
Leave a blank space before the configuration data
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-c023-20220715 (https://download.01.org/0day-ci/arc=
hive/20220716/202207161214.ZjBnT1qX-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:516:11-29: WARNING: dma_a=
lloc_coherent used in cfg_stm already zeroes out memory, so memset is not n=
eeded

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1781838212494824931==--


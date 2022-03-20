Content-Type: multipart/mixed; boundary="===============0351371229124435009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 259/331] drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:470:18: warning: Array index 'free_slot' is used before limits check. [arrayIndexThenCheck]
Date: Sun, 20 Mar 2022 15:35:13 +0800
Message-ID: <202203201532.krf3RJHG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0351371229124435009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   47aa866f248c89b319b99ac7b21a0a961ed2264a
commit: 46fb99951fe2c71adfd7f4ea4439af5ed5ebb7f7 [259/331] media: platform:=
 place NXP drivers on a separate dir
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:470:18: warning: Array in=
dex 'free_slot' is used before limits check. [arrayIndexThenCheck]
    while (slot_data[free_slot].used && free_slot < n)
                    ^

vim +/free_slot +470 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  465  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  466  static int mxc_get_free_slot(struct mxc_jpeg_slot_data slot_=
data[], int n)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  467  {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  468  	int free_slot =3D 0;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  469  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11 @470  	while (slot_data[free_slot].used && free_slot < n)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  471  		free_slot++;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  472  =

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  473  	return free_slot; /* >=3Dn when there are no more free slot=
s */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  474  }
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c Mirela Rabulea 20=
21-03-11  475  =


:::::: The code at line 470 was first introduced by commit
:::::: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 d=
river for i.MX8 JPEG Encoder/Decoder

:::::: TO: Mirela Rabulea <mirela.rabulea@nxp.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0351371229124435009==--


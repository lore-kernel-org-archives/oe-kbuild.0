Content-Type: multipart/mixed; boundary="===============0429364518392961829=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/imx-jpeg/mxc-jpeg.c:455:18: warning: Array index 'free_slot' is used before limits check. [arrayIndexThenCheck]
Date: Tue, 25 Jan 2022 08:26:39 +0800
Message-ID: <202201250819.NdeqEx1I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0429364518392961829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mirela Rabulea <mirela.rabulea@nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 =
driver for i.MX8 JPEG Encoder/Decoder
date:   10 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 10 months ago
compiler: sparc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/imx-jpeg/mxc-jpeg.c:455:18: warning: Array index =
'free_slot' is used before limits check. [arrayIndexThenCheck]
    while (slot_data[free_slot].used && free_slot < n)
                    ^

vim +/free_slot +455 drivers/media/platform/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  450  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  451  static int mxc_get_free_slot=
(struct mxc_jpeg_slot_data slot_data[], int n)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  452  {
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  453  	int free_slot =3D 0;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  454  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11 @455  	while (slot_data[free_slot]=
.used && free_slot < n)
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  456  		free_slot++;
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  457  =

2db16c6ed72ce6 Mirela Rabulea 2021-03-11  458  	return free_slot; /* >=3Dn =
when there are no more free slots */
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  459  }
2db16c6ed72ce6 Mirela Rabulea 2021-03-11  460  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0429364518392961829==--


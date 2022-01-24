Content-Type: multipart/mixed; boundary="===============3578731249995770172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
Date: Tue, 25 Jan 2022 00:54:43 +0800
Message-ID: <202201250018.2bcXms2I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3578731249995770172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Niklas S=C3=B6derlund" <niklas.soderlund+renesas@ragnatech.se>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 406bb586dec096274b598944033fad220dfc0d00 media: rcar-vin: Add r8a77=
9a0 support
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/rcar-vin/rcar-core.c:220:18: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    for (i =3D 0; i < RVIN_REMOTES_MAX; i++)
                    ^

vim +220 drivers/media/platform/rcar-vin/rcar-core.c

3bb4c3bc85bf77 Niklas S=C3=B6derlund 2018-04-14  210  =

688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  211  /* group lock should =
be held when calling this function. */
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  212  static int rvin_group=
_entity_to_remote_id(struct rvin_group *group,
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  213  					  struct media_e=
ntity *entity)
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  214  {
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  215  	struct v4l2_subdev *=
sd;
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  216  	unsigned int i;
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  217  =

688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  218  	sd =3D media_entity_=
to_v4l2_subdev(entity);
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  219  =

688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09 @220  	for (i =3D 0; i < RV=
IN_REMOTES_MAX; i++)
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  221  		if (group->remotes[=
i].subdev =3D=3D sd)
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  222  			return i;
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  223  =

688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  224  	return -ENODEV;
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  225  }
688565db3f9d84 Niklas S=C3=B6derlund 2021-07-09  226  =


:::::: The code at line 220 was first introduced by commit
:::::: 688565db3f9d84026969afd3f081f26afd12a9cc media: rcar-vin: Move and r=
ename CSI-2 link notifications

:::::: TO: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3578731249995770172==--


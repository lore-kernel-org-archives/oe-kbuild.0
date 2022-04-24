Content-Type: multipart/mixed; boundary="===============5836379846288885498=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchehab-media-next:master 41/123] drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied after initialization to constant on line 281
Date: Sun, 24 Apr 2022 19:27:29 +0800
Message-ID: <202204241937.iZNM8j7V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5836379846288885498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Scally <djrscally@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: "Jean-Michel Hautbois" <jeanmichel.hautbois@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/mchehab/media-next.git master
head:   d0c19bed8cd3d005739c0a6374118c553564ef10
commit: aa4faf6eb27132532d5a133d9241254c16d4bafa [41/123] media: v4l2-async=
: Create links during v4l2_async_match_notify()
:::::: branch date: 3 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
424/202204241937.iZNM8j7V-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied a=
fter initialization to constant on line 281

vim +293 drivers/media/v4l2-core/v4l2-async.c

2cab00bb076b9f Sakari Ailus  2017-09-24  277  =

aa4faf6eb27132 Daniel Scally 2022-03-02  278  static int v4l2_async_create_=
ancillary_links(struct v4l2_async_notifier *n,
aa4faf6eb27132 Daniel Scally 2022-03-02  279  					     struct v4l2_subdev =
*sd)
aa4faf6eb27132 Daniel Scally 2022-03-02  280  {
aa4faf6eb27132 Daniel Scally 2022-03-02 @281  	struct media_link *link =3D =
NULL;
aa4faf6eb27132 Daniel Scally 2022-03-02  282  =

aa4faf6eb27132 Daniel Scally 2022-03-02  283  #if IS_ENABLED(CONFIG_MEDIA_C=
ONTROLLER)
aa4faf6eb27132 Daniel Scally 2022-03-02  284  =

aa4faf6eb27132 Daniel Scally 2022-03-02  285  	if (sd->entity.function !=3D=
 MEDIA_ENT_F_LENS &&
aa4faf6eb27132 Daniel Scally 2022-03-02  286  	    sd->entity.function !=3D=
 MEDIA_ENT_F_FLASH)
aa4faf6eb27132 Daniel Scally 2022-03-02  287  		return 0;
aa4faf6eb27132 Daniel Scally 2022-03-02  288  =

aa4faf6eb27132 Daniel Scally 2022-03-02  289  	link =3D media_create_ancill=
ary_link(&n->sd->entity, &sd->entity);
aa4faf6eb27132 Daniel Scally 2022-03-02  290  =

aa4faf6eb27132 Daniel Scally 2022-03-02  291  #endif
aa4faf6eb27132 Daniel Scally 2022-03-02  292  =

aa4faf6eb27132 Daniel Scally 2022-03-02 @293  	return IS_ERR(link) ? PTR_ER=
R(link) : 0;
aa4faf6eb27132 Daniel Scally 2022-03-02  294  }
aa4faf6eb27132 Daniel Scally 2022-03-02  295  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5836379846288885498==--


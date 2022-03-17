Content-Type: multipart/mixed; boundary="===============3383140716365802599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sailus-media-tree:master 39/48] drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied after initialization to constant on line 281
Date: Fri, 18 Mar 2022 06:51:18 +0800
Message-ID: <202203180642.bT1dS9n8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3383140716365802599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Scally <djrscally@gmail.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "Jean-Michel Hautbois" <jeanmichel.hautbois@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   22e6284ec554f51f9275937ef4c6ab063579c51c
commit: 2edab9518d47ec4d563312e3fda87d8fed2e454b [39/48] media: v4l2-async:=
 Create links during v4l2_async_match_notify()
:::::: branch date: 14 hours ago
:::::: commit date: 35 hours ago
config: h8300-randconfig-c024-20220317 (https://download.01.org/0day-ci/arc=
hive/20220318/202203180642.bT1dS9n8-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied a=
fter initialization to constant on line 281

vim +293 drivers/media/v4l2-core/v4l2-async.c

2cab00bb076b9f Sakari Ailus  2017-09-24  277  =

2edab9518d47ec Daniel Scally 2022-03-02  278  static int v4l2_async_create_=
ancillary_links(struct v4l2_async_notifier *n,
2edab9518d47ec Daniel Scally 2022-03-02  279  					     struct v4l2_subdev =
*sd)
2edab9518d47ec Daniel Scally 2022-03-02  280  {
2edab9518d47ec Daniel Scally 2022-03-02 @281  	struct media_link *link =3D =
NULL;
2edab9518d47ec Daniel Scally 2022-03-02  282  =

2edab9518d47ec Daniel Scally 2022-03-02  283  #if IS_ENABLED(CONFIG_MEDIA_C=
ONTROLLER)
2edab9518d47ec Daniel Scally 2022-03-02  284  =

2edab9518d47ec Daniel Scally 2022-03-02  285  	if (sd->entity.function !=3D=
 MEDIA_ENT_F_LENS &&
2edab9518d47ec Daniel Scally 2022-03-02  286  	    sd->entity.function !=3D=
 MEDIA_ENT_F_FLASH)
2edab9518d47ec Daniel Scally 2022-03-02  287  		return 0;
2edab9518d47ec Daniel Scally 2022-03-02  288  =

2edab9518d47ec Daniel Scally 2022-03-02  289  	link =3D media_create_ancill=
ary_link(&n->sd->entity, &sd->entity);
2edab9518d47ec Daniel Scally 2022-03-02  290  =

2edab9518d47ec Daniel Scally 2022-03-02  291  #endif
2edab9518d47ec Daniel Scally 2022-03-02  292  =

2edab9518d47ec Daniel Scally 2022-03-02 @293  	return IS_ERR(link) ? PTR_ER=
R(link) : 0;
2edab9518d47ec Daniel Scally 2022-03-02  294  }
2edab9518d47ec Daniel Scally 2022-03-02  295  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3383140716365802599==--


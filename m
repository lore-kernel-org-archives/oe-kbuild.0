Content-Type: multipart/mixed; boundary="===============0507878065404287951=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 6/6] media: v4l2-async: Create links during v4l2_async_match_notify()
Date: Mon, 31 Jan 2022 13:37:54 +0800
Message-ID: <202201311324.q8ec5kGJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0507878065404287951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220130235821.48076-7-djrscally@gmail.com>
References: <20220130235821.48076-7-djrscally@gmail.com>
TO: Daniel Scally <djrscally@gmail.com>
TO: linux-media(a)vger.kernel.org
TO: libcamera-devel(a)lists.libcamera.org
CC: sakari.ailus(a)linux.intel.com
CC: laurent.pinchart(a)ideasonboard.com
CC: hanlinchen(a)chromium.org
CC: tfiga(a)chromium.org
CC: hdegoede(a)redhat.com
CC: kieran.bingham(a)ideasonboard.com
CC: hpa(a)redhat.com

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.17-rc2 next-20220128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-an=
cillary-links/20220131-080041
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: powerpc-randconfig-c003-20220131 (https://download.01.org/0day-ci/a=
rchive/20220131/202201311324.q8ec5kGJ-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-async.c:294:23-30: ERROR: PTR_ERR applied a=
fter initialization to constant on line 282

vim +294 drivers/media/v4l2-core/v4l2-async.c

2cab00bb076b9f Sakari Ailus  2017-09-24  277  =

8dc719a0ecab0c Daniel Scally 2022-01-30  278  static int
8dc719a0ecab0c Daniel Scally 2022-01-30  279  __v4l2_async_create_ancillary=
_link(struct v4l2_async_notifier *notifier,
8dc719a0ecab0c Daniel Scally 2022-01-30  280  				   struct v4l2_subdev *sd)
8dc719a0ecab0c Daniel Scally 2022-01-30  281  {
8dc719a0ecab0c Daniel Scally 2022-01-30 @282  	struct media_link *link =3D =
NULL;
8dc719a0ecab0c Daniel Scally 2022-01-30  283  =

8dc719a0ecab0c Daniel Scally 2022-01-30  284  #if IS_ENABLED(CONFIG_MEDIA_C=
ONTROLLER)
8dc719a0ecab0c Daniel Scally 2022-01-30  285  =

8dc719a0ecab0c Daniel Scally 2022-01-30  286  	if (sd->entity.function !=3D=
 MEDIA_ENT_F_LENS &&
8dc719a0ecab0c Daniel Scally 2022-01-30  287  	    sd->entity.function !=3D=
 MEDIA_ENT_F_FLASH)
8dc719a0ecab0c Daniel Scally 2022-01-30  288  		return -EINVAL;
8dc719a0ecab0c Daniel Scally 2022-01-30  289  =

8dc719a0ecab0c Daniel Scally 2022-01-30  290  	link =3D media_create_ancill=
ary_link(&notifier->sd->entity, &sd->entity);
8dc719a0ecab0c Daniel Scally 2022-01-30  291  =

8dc719a0ecab0c Daniel Scally 2022-01-30  292  #endif
8dc719a0ecab0c Daniel Scally 2022-01-30  293  =

8dc719a0ecab0c Daniel Scally 2022-01-30 @294  	return IS_ERR(link) ? PTR_ER=
R(link) : 0;
8dc719a0ecab0c Daniel Scally 2022-01-30  295  }
8dc719a0ecab0c Daniel Scally 2022-01-30  296  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0507878065404287951==--


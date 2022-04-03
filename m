Content-Type: multipart/mixed; boundary="===============8092086433403943619=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sailus-media-tree:master 39/56] drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied after initialization to constant on line 281
Date: Sun, 03 Apr 2022 17:32:11 +0800
Message-ID: <202204031757.LLPa3mNo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8092086433403943619==
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
head:   2052fcce377325e5662418ec65a1fabe59e4cfbf
commit: d3ced079f8da4b6d9e6b72d8ba00f9d14701ffc6 [39/56] media: v4l2-async:=
 Create links during v4l2_async_match_notify()
:::::: branch date: 4 days ago
:::::: commit date: 11 days ago
config: microblaze-randconfig-c024-20220403 (https://download.01.org/0day-c=
i/archive/20220403/202204031757.LLPa3mNo-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tre=
e.git
        git fetch --no-tags sailus-media-tree master
        git checkout d3ced079f8da4b6d9e6b72d8ba00f9d14701ffc6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

All errors (new ones prefixed by >>):

   microblaze-linux-ld: net/core/sock.o: in function `sk_destruct':
>> (.text+0x3c7c): undefined reference to `__sk_defer_free_flush'


cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-async.c:293:23-30: ERROR: PTR_ERR applied a=
fter initialization to constant on line 281

vim +293 drivers/media/v4l2-core/v4l2-async.c

2cab00bb076b9f Sakari Ailus  2017-09-24  277  =

d3ced079f8da4b Daniel Scally 2022-03-02  278  static int v4l2_async_create_=
ancillary_links(struct v4l2_async_notifier *n,
d3ced079f8da4b Daniel Scally 2022-03-02  279  					     struct v4l2_subdev =
*sd)
d3ced079f8da4b Daniel Scally 2022-03-02  280  {
d3ced079f8da4b Daniel Scally 2022-03-02 @281  	struct media_link *link =3D =
NULL;
d3ced079f8da4b Daniel Scally 2022-03-02  282  =

d3ced079f8da4b Daniel Scally 2022-03-02  283  #if IS_ENABLED(CONFIG_MEDIA_C=
ONTROLLER)
d3ced079f8da4b Daniel Scally 2022-03-02  284  =

d3ced079f8da4b Daniel Scally 2022-03-02  285  	if (sd->entity.function !=3D=
 MEDIA_ENT_F_LENS &&
d3ced079f8da4b Daniel Scally 2022-03-02  286  	    sd->entity.function !=3D=
 MEDIA_ENT_F_FLASH)
d3ced079f8da4b Daniel Scally 2022-03-02  287  		return 0;
d3ced079f8da4b Daniel Scally 2022-03-02  288  =

d3ced079f8da4b Daniel Scally 2022-03-02  289  	link =3D media_create_ancill=
ary_link(&n->sd->entity, &sd->entity);
d3ced079f8da4b Daniel Scally 2022-03-02  290  =

d3ced079f8da4b Daniel Scally 2022-03-02  291  #endif
d3ced079f8da4b Daniel Scally 2022-03-02  292  =

d3ced079f8da4b Daniel Scally 2022-03-02 @293  	return IS_ERR(link) ? PTR_ER=
R(link) : 0;
d3ced079f8da4b Daniel Scally 2022-03-02  294  }
d3ced079f8da4b Daniel Scally 2022-03-02  295  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8092086433403943619==--


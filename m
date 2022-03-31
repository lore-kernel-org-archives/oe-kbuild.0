Content-Type: multipart/mixed; boundary="===============7834721184379471534=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sailus-media-tree:master 28/56] drivers/media/v4l2-core/v4l2-subdev.c:875 __v4l2_subdev_state_alloc() warn: Please consider using kvcalloc instead
Date: Thu, 31 Mar 2022 22:02:03 +0800
Message-ID: <202203312125.S4P9LSqS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7834721184379471534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: Jacopo Mondi <jacopo@jmondi.org>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   2052fcce377325e5662418ec65a1fabe59e4cfbf
commit: 38a25fa468f080196b04a18edf9fd173ceaf6466 [28/56] media: subdev: ren=
ame subdev-state alloc & free
:::::: branch date: 27 hours ago
:::::: commit date: 8 days ago
config: powerpc64-randconfig-m031-20220330 (https://download.01.org/0day-ci=
/archive/20220331/202203312125.S4P9LSqS-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-subdev.c:875 __v4l2_subdev_state_alloc() warn:=
 Please consider using kvcalloc instead

vim +875 drivers/media/v4l2-core/v4l2-subdev.c

9b02cbb3ede89b Laurent Pinchart 2015-04-24  864  =

38a25fa468f080 Tomi Valkeinen   2022-03-01  865  struct v4l2_subdev_state *=
__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
9b02cbb3ede89b Laurent Pinchart 2015-04-24  866  {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  867  	struct v4l2_subdev_state =
*state;
9b02cbb3ede89b Laurent Pinchart 2015-04-24  868  	int ret;
9b02cbb3ede89b Laurent Pinchart 2015-04-24  869  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  870  	state =3D kzalloc(sizeof(=
*state), GFP_KERNEL);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  871  	if (!state)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  872  		return ERR_PTR(-ENOMEM);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  873  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  874  	if (sd->entity.num_pads) {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10 @875  		state->pads =3D kvmalloc=
_array(sd->entity.num_pads,
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  876  					     sizeof(*state->p=
ads),
758d90e161382c Tomasz Figa      2017-06-19  877  					     GFP_KERNEL | __G=
FP_ZERO);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  878  		if (!state->pads) {
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  879  			ret =3D -ENOMEM;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  880  			goto err;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  881  		}
9b02cbb3ede89b Laurent Pinchart 2015-04-24  882  	}
9b02cbb3ede89b Laurent Pinchart 2015-04-24  883  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  884  	ret =3D v4l2_subdev_call(=
sd, pad, init_cfg, state);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  885  	if (ret < 0 && ret !=3D -=
ENOIOCTLCMD)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  886  		goto err;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  887  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  888  	return state;
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  889  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  890  err:
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  891  	if (state && state->pads)
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  892  		kvfree(state->pads);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  893  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  894  	kfree(state);
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  895  =

0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  896  	return ERR_PTR(ret);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  897  }
38a25fa468f080 Tomi Valkeinen   2022-03-01  898  EXPORT_SYMBOL_GPL(__v4l2_s=
ubdev_state_alloc);
9b02cbb3ede89b Laurent Pinchart 2015-04-24  899  =


:::::: The code at line 875 was first introduced by commit
:::::: 0d346d2a6f54f06f36b224fd27cd6eafe8c83be9 media: v4l2-subdev: add sub=
dev-wide state struct

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7834721184379471534==--


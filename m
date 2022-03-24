Content-Type: multipart/mixed; boundary="===============0336137934756957670=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/v4l2-core/v4l2-subdev.c:907 v4l2_subdev_alloc_state() warn: Please consider using kvcalloc instead
Date: Thu, 24 Mar 2022 15:03:37 +0800
Message-ID: <202203241452.RNGpJrUb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0336137934756957670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ed4643521e6af8ab8ed1e467630a85884d2696cf
commit: 0d346d2a6f54f06f36b224fd27cd6eafe8c83be9 media: v4l2-subdev: add su=
bdev-wide state struct
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-m031-20220323 (https://download.01.org/0day-ci/archi=
ve/20220324/202203241452.RNGpJrUb-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-subdev.c:907 v4l2_subdev_alloc_state() warn: P=
lease consider using kvcalloc instead

vim +907 drivers/media/v4l2-core/v4l2-subdev.c

9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  896  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  897  struct v4l2_subdev_state =
*v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  898  {
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  899  	struct v4l2_subdev_state=
 *state;
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  900  	int ret;
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  901  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  902  	state =3D kzalloc(sizeof=
(*state), GFP_KERNEL);
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  903  	if (!state)
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  904  		return ERR_PTR(-ENOMEM);
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  905  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  906  	if (sd->entity.num_pads)=
 {
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10 @907  		state->pads =3D kvmallo=
c_array(sd->entity.num_pads,
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  908  					     sizeof(*state->=
pads),
758d90e161382c1 Tomasz Figa      2017-06-19  909  					     GFP_KERNEL | __=
GFP_ZERO);
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  910  		if (!state->pads) {
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  911  			ret =3D -ENOMEM;
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  912  			goto err;
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  913  		}
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  914  	}
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  915  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  916  	ret =3D v4l2_subdev_call=
(sd, pad, init_cfg, state);
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  917  	if (ret < 0 && ret !=3D =
-ENOIOCTLCMD)
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  918  		goto err;
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  919  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  920  	return state;
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  921  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  922  err:
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  923  	if (state && state->pads)
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  924  		kvfree(state->pads);
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  925  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  926  	kfree(state);
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  927  =

0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  928  	return ERR_PTR(ret);
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  929  }
0d346d2a6f54f06 Tomi Valkeinen   2021-06-10  930  EXPORT_SYMBOL_GPL(v4l2_su=
bdev_alloc_state);
9b02cbb3ede89b5 Laurent Pinchart 2015-04-24  931  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0336137934756957670==--


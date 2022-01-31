Content-Type: multipart/mixed; boundary="===============4156360631082928106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:192 gf100_fifo_recover() warn: should '(((1))) << engi' be a 64 bit type?
Date: Mon, 31 Jan 2022 09:21:58 +0800
Message-ID: <202201310953.QyTrhHrp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4156360631082928106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: c6198d3465a9ff5a67023cc1c497a273a913d46a drm/nouveau/fifo/gf100: us=
e fifo engine id for engine recovery mask
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/a=
rchive/20220131/202201310953.QyTrhHrp-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:192 gf100_fifo_recover() w=
arn: should '(((1))) << engi' be a 64 bit type?

vim +192 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c

24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  173  =

24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  174  static void
6189f1b0938dc0 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  175  gf100_fifo_recover(struct gf100_fifo *fifo, struct nvkm_en=
gine *engine,
05c7145dae17a5 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-01-14  176  		   struct gf100_fifo_chan *chan)
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  177  {
e5c5e4f5d31979 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  178  	struct nvkm_subdev *subdev =3D &fifo->base.engine.subdev;
e5c5e4f5d31979 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  179  	struct nvkm_device *device =3D subdev->device;
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  180  	u32 chid =3D chan->base.chid;
c6198d3465a9ff drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2021-02-06  181  	int engi =3D gf100_fifo_engine_id(&fifo->base, engine);
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  182  =

e5c5e4f5d31979 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  183  	nvkm_error(subdev, "%s engine fault on channel %d, recove=
ring...\n",
9c28abb7db540a drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2020-07-25  184  		   engine->subdev.name, chid);
6ca307b0c9c787 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  185  	assert_spin_locked(&fifo->base.lock);
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  186  =

8774440390cdfe drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  187  	nvkm_mask(device, 0x003004 + (chid * 0x08), 0x00000001, 0=
x00000000);
8f0649b5c6e70e drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  188  	list_del_init(&chan->head);
8f0649b5c6e70e drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2015-08-20  189  	chan->killed =3D true;
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  190  =

c6198d3465a9ff drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2021-02-06  191  	if (engi >=3D 0 && engi !=3D GF100_FIFO_ENGN_SW)
c6198d3465a9ff drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2021-02-06 @192  		fifo->recover.mask |=3D BIT(engi);
792662439cf241 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2016-03-11  193  	schedule_work(&fifo->recover.work);
ff9f29abf0ef4c drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c Ben Skeggs =
2016-11-05  194  	nvkm_fifo_kevent(&fifo->base, chid);
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  195  }
24e8341e4cd4c7 drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c  Ben Skeggs =
2014-02-05  196  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4156360631082928106==--


Content-Type: multipart/mixed; boundary="===============3443984363406228273=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_v3d.c:468 vc4_v3d_bind() warn: 'v3d->clk' not released on lines: 451.
Date: Sat, 11 Dec 2021 09:32:30 +0800
Message-ID: <202112110956.UEWEmaO6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3443984363406228273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b8a98b6bf66ae35361e987333233d07241642909
commit: 5226711e6c413ed069788f1e3f71def9d8d839d6 drm/vc4: Convert to Linux =
IRQ interfaces
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-m031-20211210 (https://download.01.org/0day-c=
i/archive/20211211/202112110956.UEWEmaO6-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/vc4/vc4_v3d.c:468 vc4_v3d_bind() warn: 'v3d->clk' not relea=
sed on lines: 451.

vim +468 drivers/gpu/drm/vc4/vc4_v3d.c

001bdb55d9eb72 Eric Anholt       2016-02-05  388  =

d3f5168a081000 Eric Anholt       2015-03-02  389  static int vc4_v3d_bind(s=
truct device *dev, struct device *master, void *data)
d3f5168a081000 Eric Anholt       2015-03-02  390  {
d3f5168a081000 Eric Anholt       2015-03-02  391  	struct platform_device *=
pdev =3D to_platform_device(dev);
d3f5168a081000 Eric Anholt       2015-03-02  392  	struct drm_device *drm =
=3D dev_get_drvdata(master);
d3f5168a081000 Eric Anholt       2015-03-02  393  	struct vc4_dev *vc4 =3D =
to_vc4_dev(drm);
d3f5168a081000 Eric Anholt       2015-03-02  394  	struct vc4_v3d *v3d =3D =
NULL;
d5b1a78a772f1e Eric Anholt       2015-11-30  395  	int ret;
d3f5168a081000 Eric Anholt       2015-03-02  396  =

d3f5168a081000 Eric Anholt       2015-03-02  397  	v3d =3D devm_kzalloc(&pd=
ev->dev, sizeof(*v3d), GFP_KERNEL);
d3f5168a081000 Eric Anholt       2015-03-02  398  	if (!v3d)
d3f5168a081000 Eric Anholt       2015-03-02  399  		return -ENOMEM;
d3f5168a081000 Eric Anholt       2015-03-02  400  =

001bdb55d9eb72 Eric Anholt       2016-02-05  401  	dev_set_drvdata(dev, v3d=
);
001bdb55d9eb72 Eric Anholt       2016-02-05  402  =

d3f5168a081000 Eric Anholt       2015-03-02  403  	v3d->pdev =3D pdev;
d3f5168a081000 Eric Anholt       2015-03-02  404  =

d3f5168a081000 Eric Anholt       2015-03-02  405  	v3d->regs =3D vc4_iorema=
p_regs(pdev, 0);
d3f5168a081000 Eric Anholt       2015-03-02  406  	if (IS_ERR(v3d->regs))
d3f5168a081000 Eric Anholt       2015-03-02  407  		return PTR_ERR(v3d->reg=
s);
3051719af11eb4 Eric Anholt       2019-02-20  408  	v3d->regset.base =3D v3d=
->regs;
3051719af11eb4 Eric Anholt       2019-02-20  409  	v3d->regset.regs =3D v3d=
_regs;
3051719af11eb4 Eric Anholt       2019-02-20  410  	v3d->regset.nregs =3D AR=
RAY_SIZE(v3d_regs);
d3f5168a081000 Eric Anholt       2015-03-02  411  =

d3f5168a081000 Eric Anholt       2015-03-02  412  	vc4->v3d =3D v3d;
001bdb55d9eb72 Eric Anholt       2016-02-05  413  	v3d->vc4 =3D vc4;
d3f5168a081000 Eric Anholt       2015-03-02  414  =

b72a2816e37114 Eric Anholt       2017-04-28  415  	v3d->clk =3D devm_clk_ge=
t(dev, NULL);
b72a2816e37114 Eric Anholt       2017-04-28  416  	if (IS_ERR(v3d->clk)) {
b72a2816e37114 Eric Anholt       2017-04-28  417  		int ret =3D PTR_ERR(v3d=
->clk);
b72a2816e37114 Eric Anholt       2017-04-28  418  =

b72a2816e37114 Eric Anholt       2017-04-28  419  		if (ret =3D=3D -ENOENT)=
 {
b72a2816e37114 Eric Anholt       2017-04-28  420  			/* bcm2835 didn't have=
 a clock reference in the DT. */
b72a2816e37114 Eric Anholt       2017-04-28  421  			ret =3D 0;
b72a2816e37114 Eric Anholt       2017-04-28  422  			v3d->clk =3D NULL;
b72a2816e37114 Eric Anholt       2017-04-28  423  		} else {
b72a2816e37114 Eric Anholt       2017-04-28  424  			if (ret !=3D -EPROBE_D=
EFER)
b72a2816e37114 Eric Anholt       2017-04-28  425  				dev_err(dev, "Failed =
to get V3D clock: %d\n",
b72a2816e37114 Eric Anholt       2017-04-28  426  					ret);
b72a2816e37114 Eric Anholt       2017-04-28  427  			return ret;
b72a2816e37114 Eric Anholt       2017-04-28  428  		}
b72a2816e37114 Eric Anholt       2017-04-28  429  	}
b72a2816e37114 Eric Anholt       2017-04-28  430  =

d3f5168a081000 Eric Anholt       2015-03-02  431  	if (V3D_READ(V3D_IDENT0)=
 !=3D V3D_EXPECTED_IDENT0) {
d3f5168a081000 Eric Anholt       2015-03-02  432  		DRM_ERROR("V3D_IDENT0 r=
ead 0x%08x instead of 0x%08x\n",
d3f5168a081000 Eric Anholt       2015-03-02  433  			  V3D_READ(V3D_IDENT0)=
, V3D_EXPECTED_IDENT0);
d3f5168a081000 Eric Anholt       2015-03-02  434  		return -EINVAL;
d3f5168a081000 Eric Anholt       2015-03-02  435  	}
d3f5168a081000 Eric Anholt       2015-03-02  436  =

b72a2816e37114 Eric Anholt       2017-04-28  437  	ret =3D clk_prepare_enab=
le(v3d->clk);
b72a2816e37114 Eric Anholt       2017-04-28  438  	if (ret !=3D 0)
b72a2816e37114 Eric Anholt       2017-04-28  439  		return ret;
b72a2816e37114 Eric Anholt       2017-04-28  440  =

d5b1a78a772f1e Eric Anholt       2015-11-30  441  	/* Reset the binner over=
flow address/size at setup, to be sure
d5b1a78a772f1e Eric Anholt       2015-11-30  442  	 * we don't reuse an old=
 one.
d5b1a78a772f1e Eric Anholt       2015-11-30  443  	 */
d5b1a78a772f1e Eric Anholt       2015-11-30  444  	V3D_WRITE(V3D_BPOA, 0);
d5b1a78a772f1e Eric Anholt       2015-11-30  445  	V3D_WRITE(V3D_BPOS, 0);
d5b1a78a772f1e Eric Anholt       2015-11-30  446  =

d3f5168a081000 Eric Anholt       2015-03-02  447  	vc4_v3d_init_hw(drm);
d3f5168a081000 Eric Anholt       2015-03-02  448  =

5226711e6c413e Thomas Zimmermann 2021-08-03  449  	ret =3D platform_get_irq=
(pdev, 0);
5226711e6c413e Thomas Zimmermann 2021-08-03  450  	if (ret < 0)
5226711e6c413e Thomas Zimmermann 2021-08-03  451  		return ret;
5226711e6c413e Thomas Zimmermann 2021-08-03  452  	vc4->irq =3D ret;
5226711e6c413e Thomas Zimmermann 2021-08-03  453  =

5226711e6c413e Thomas Zimmermann 2021-08-03  454  	ret =3D vc4_irq_install(=
drm, vc4->irq);
d5b1a78a772f1e Eric Anholt       2015-11-30  455  	if (ret) {
d5b1a78a772f1e Eric Anholt       2015-11-30  456  		DRM_ERROR("Failed to in=
stall IRQ handler\n");
d5b1a78a772f1e Eric Anholt       2015-11-30  457  		return ret;
d5b1a78a772f1e Eric Anholt       2015-11-30  458  	}
d5b1a78a772f1e Eric Anholt       2015-11-30  459  =

7f696942a7e52d Eric Anholt       2017-05-15  460  	pm_runtime_set_active(de=
v);
3a62234680d86e Eric Anholt       2016-11-04  461  	pm_runtime_use_autosuspe=
nd(dev);
3a62234680d86e Eric Anholt       2016-11-04  462  	pm_runtime_set_autosuspe=
nd_delay(dev, 40); /* a little over 2 frames. */
001bdb55d9eb72 Eric Anholt       2016-02-05  463  	pm_runtime_enable(dev);
001bdb55d9eb72 Eric Anholt       2016-02-05  464  =

c9be804c8c7a2d Eric Anholt       2019-04-01  465  	vc4_debugfs_add_file(drm=
, "v3d_ident", vc4_v3d_debugfs_ident, NULL);
c9be804c8c7a2d Eric Anholt       2019-04-01  466  	vc4_debugfs_add_regset32=
(drm, "v3d_regs", &v3d->regset);
c9be804c8c7a2d Eric Anholt       2019-04-01  467  =

d3f5168a081000 Eric Anholt       2015-03-02 @468  	return 0;
d3f5168a081000 Eric Anholt       2015-03-02  469  }
d3f5168a081000 Eric Anholt       2015-03-02  470  =


:::::: The code at line 468 was first introduced by commit
:::::: d3f5168a0810005920e7a3d5ba83e249bd9a750c drm/vc4: Bind and initializ=
e the V3D engine.

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3443984363406228273==--


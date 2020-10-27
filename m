Content-Type: multipart/mixed; boundary="===============9082258600645876144=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:80:9: warning: Identical condition 'ret', second condition is always false
Date: Tue, 27 Oct 2020 20:52:52 +0300
Message-ID: <20201027175252.GN18329@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9082258600645876144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: c2c25c1cf96927a0b6ddb6aaa063f1fdcc90d749 drm/aspeed: Use managed dr=
mm_mode_config_cleanup
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:80:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:71:6: note: first condition
    if (ret)
        ^
   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c:80:9: note: second condition
    return ret;
           ^

vim +/ret +80 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c

c2c25c1cf96927a Daniel Vetter 2020-09-04  66  static int aspeed_gfx_setup_m=
ode_config(struct drm_device *drm)
4f2a8f5898ecd80 Joel Stanley  2019-04-03  67  {
c2c25c1cf96927a Daniel Vetter 2020-09-04  68  	int ret;
c2c25c1cf96927a Daniel Vetter 2020-09-04  69  =

c2c25c1cf96927a Daniel Vetter 2020-09-04  70  	ret =3D drmm_mode_config_ini=
t(drm);
c2c25c1cf96927a Daniel Vetter 2020-09-04  71  	if (ret)
c2c25c1cf96927a Daniel Vetter 2020-09-04  72  		return ret;
4f2a8f5898ecd80 Joel Stanley  2019-04-03  73  =

4f2a8f5898ecd80 Joel Stanley  2019-04-03  74  	drm->mode_config.min_width =
=3D 0;
4f2a8f5898ecd80 Joel Stanley  2019-04-03  75  	drm->mode_config.min_height =
=3D 0;
4f2a8f5898ecd80 Joel Stanley  2019-04-03  76  	drm->mode_config.max_width =
=3D 800;
4f2a8f5898ecd80 Joel Stanley  2019-04-03  77  	drm->mode_config.max_height =
=3D 600;
4f2a8f5898ecd80 Joel Stanley  2019-04-03  78  	drm->mode_config.funcs =3D &=
aspeed_gfx_mode_config_funcs;
c2c25c1cf96927a Daniel Vetter 2020-09-04  79  =

c2c25c1cf96927a Daniel Vetter 2020-09-04 @80  	return ret;

This should just be "return 0;"

4f2a8f5898ecd80 Joel Stanley  2019-04-03  81  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============9082258600645876144==--


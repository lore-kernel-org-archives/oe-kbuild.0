Content-Type: multipart/mixed; boundary="===============4217584767699728437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/irq: Add irq as false detection
Date: Tue, 03 Nov 2020 04:06:43 +0800
Message-ID: <202011030418.00XeoA4E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4217584767699728437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
References: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
TO: Tian Tao <tiantao6@hisilicon.com>
TO: maarten.lankhorst(a)linux.intel.com
TO: mripard(a)kernel.org
TO: tzimmermann(a)suse.de
TO: airlied(a)linux.ie
TO: daniel(a)ffwll.ch
TO: dri-devel(a)lists.freedesktop.org
TO: linux-kernel(a)vger.kernel.org

Hi Tian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.10-rc2 next-20201102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tian-Tao/drm-irq-Add-irq-a=
s-false-detection/20201102-192137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
3cea11cd5e3b00d91caf0b4730194039b45c5891
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_irq.c:175:7: warning: Either the condition '!dev' is=
 redundant or there is possible null pointer dereference: dev. [nullPointer=
RedundantCheck]
    if (!dev->irq_enabled || !dev)
         ^
   drivers/gpu/drm/drm_irq.c:175:27: note: Assuming that condition '!dev' i=
s not redundant
    if (!dev->irq_enabled || !dev)
                             ^
   drivers/gpu/drm/drm_irq.c:175:7: note: Null pointer dereference
    if (!dev->irq_enabled || !dev)
         ^

vim +175 drivers/gpu/drm/drm_irq.c

^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  152  =

^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  153  =
/**
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  154  =
 * drm_irq_uninstall - uninstall the IRQ handler
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  155  =
 * @dev: DRM device
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  156  =
 *
16584b204573ece drivers/gpu/drm/drm_irq.c  Daniel Vetter  2017-05-31  157  =
 * Calls the driver's &drm_driver.irq_uninstall function and unregisters th=
e IRQ
16584b204573ece drivers/gpu/drm/drm_irq.c  Daniel Vetter  2017-05-31  158  =
 * handler.  This should only be called by drivers which used drm_irq_insta=
ll()
16584b204573ece drivers/gpu/drm/drm_irq.c  Daniel Vetter  2017-05-31  159  =
 * to set up their interrupt handler. Other drivers must only reset
ef40cbf9998528e drivers/gpu/drm/drm_irq.c  Daniel Vetter  2017-01-25  160  =
 * &drm_device.irq_enabled to false.
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  161  =
 *
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  162  =
 * Note that for kernel modesetting drivers it is a bug if this function fa=
ils.
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  163  =
 * The sanity checks are only to catch buggy user modesetting drivers which=
 call
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  164  =
 * the same function through an ioctl.
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  165  =
 *
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  166  =
 * Returns:
f5752b38970990f drivers/gpu/drm/drm_irq.c  Daniel Vetter  2014-05-08  167  =
 * Zero on success or a negative error code on failure.
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  168  =
 */
84b1fd103dbbe01 drivers/char/drm/drm_irq.c Dave Airlie    2007-07-11  169  =
int drm_irq_uninstall(struct drm_device *dev)
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  170  {
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  171  =
	unsigned long irqflags;
4423843cde65232 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2013-10=
-04  172  	bool irq_enabled;
4423843cde65232 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2013-10=
-04  173  	int i;
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  174  =

fa889e8baa5377b drivers/gpu/drm/drm_irq.c  Tian Tao       2020-11-02 @175  =
	if (!dev->irq_enabled || !dev)
fa889e8baa5377b drivers/gpu/drm/drm_irq.c  Tian Tao       2020-11-02  176  =
		return 0;
fa889e8baa5377b drivers/gpu/drm/drm_irq.c  Tian Tao       2020-11-02  177  =

^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  178  =
	irq_enabled =3D dev->irq_enabled;
4423843cde65232 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2013-10=
-04  179  	dev->irq_enabled =3D false;
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  180  =

dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  181  =
	/*
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  182  =
	 * Wake up any waiters so they don't hang. This is just to paper over
c78d1ca2d2e3e72 drivers/gpu/drm/drm_irq.c  Frank Binns    2016-06-24  183  =
	 * issues for UMS drivers which aren't in full control of their
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  184  =
	 * vblank/irq handling. KMS drivers must ensure that vblanks are all
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  185  =
	 * disabled when uninstalling the irq handler.
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  186  =
	 */
6015002ece38dac drivers/gpu/drm/drm_irq.c  Daniel Vetter  2020-05-27  187  =
	if (drm_dev_has_vblank(dev)) {
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  188  =
		spin_lock_irqsave(&dev->vbl_lock, irqflags);
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  189  =
		for (i =3D 0; i < dev->num_crtcs; i++) {
8a51d5bef07f1c8 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2014-08=
-06  190  			struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
8a51d5bef07f1c8 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2014-08=
-06  191  =

3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  192  =
			if (!vblank->enabled)
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  193  =
				continue;
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  194  =

3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  195  =
			WARN_ON(drm_core_check_feature(dev, DRIVER_MODESET));
3bff93d64cf59f0 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2015-02-22  196  =

3ed4351a83ca05d drivers/gpu/drm/drm_irq.c  Daniel Vetter  2017-05-31  197  =
			drm_vblank_disable_and_save(dev, i);
8a51d5bef07f1c8 drivers/gpu/drm/drm_irq.c  Ville Syrj=C3=A4l=C3=A4  2014-08=
-06  198  			wake_up(&vblank->queue);
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  199  =
		}
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  200  =
		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
bde4889aaa2d59c drivers/gpu/drm/drm_irq.c  Ben Skeggs     2011-07-04  201  =
	}
dc1336ff4fe08ae drivers/gpu/drm/drm_irq.c  Jesse Barnes   2009-01-06  202  =

^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  203  =
	if (!irq_enabled)
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  204  =
		return -EINVAL;
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  205  =

7c1a38e391745cc drivers/gpu/drm/drm_irq.c  Daniel Vetter  2013-12-16  206  =
	DRM_DEBUG("irq=3D%d\n", dev->irq);
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  207  =

fa5386459f06dc3 drivers/gpu/drm/drm_irq.c  Daniel Vetter  2016-08-03  208  =
	if (drm_core_check_feature(dev, DRIVER_LEGACY))
28d520433b63757 drivers/gpu/drm/drm_irq.c  Dave Airlie    2009-09-21  209  =
		vga_client_register(dev->pdev, NULL, NULL, NULL);
28d520433b63757 drivers/gpu/drm/drm_irq.c  Dave Airlie    2009-09-21  210  =

5037f8acf448dd0 drivers/gpu/drm/drm_irq.c  Joonyoung Shim 2011-08-04  211  =
	if (dev->driver->irq_uninstall)
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  212  =
		dev->driver->irq_uninstall(dev);
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  213  =

7c1a38e391745cc drivers/gpu/drm/drm_irq.c  Daniel Vetter  2013-12-16  214  =
	free_irq(dev->irq, dev);
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  215  =

^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  216  =
	return 0;
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  217  }
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  218  =
EXPORT_SYMBOL(drm_irq_uninstall);
^1da177e4c3f415 drivers/char/drm/drm_irq.c Linus Torvalds 2005-04-16  219  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4217584767699728437==--


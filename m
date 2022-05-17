Content-Type: multipart/mixed; boundary="===============1658734340810198073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 1/2] drivers/video/fbdev/core/fbmem.c:1610:0-1: preceding lock on line 1598
Date: Tue, 17 May 2022 08:29:48 +0800
Message-ID: <202205170855.Q26EPT2e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1658734340810198073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   a9ad5822366c5065e6a65fe5ff5090295ba98986
commit: 3367aa7d74d240261de2543ddb35531ccad9d884 [1/2] fbdev: Restart confl=
icting fb removal loop when unregistering devices
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-c004-20220516 (https://download.01.org/0day-ci/=
archive/20220517/202205170855.Q26EPT2e-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fbmem.c:1610:0-1: preceding lock on line 1598

vim +1610 drivers/video/fbdev/core/fbmem.c

712f3147aee0fb drivers/video/fbmem.c            Linus Torvalds           20=
11-05-13  1551  =

3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1552  #define VGA_FB_PHYS 0xA0000
deb00d2785bedd drivers/video/fbdev/core/fbmem.c Daniel Vetter            20=
19-05-28  1553  static void do_remove_conflicting_framebuffers(struct apert=
ures_struct *a,
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1554  					       const char *name, bool primary)
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1555  {
deb00d2785bedd drivers/video/fbdev/core/fbmem.c Daniel Vetter            20=
19-05-28  1556  	int i;
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1557  =

3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1558  restart_removal:
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1559  	/* check all firmware fbs and kick off if the base addr ov=
erlaps */
10ac86884b4d76 drivers/video/fbdev/core/fbmem.c Yisheng Xie              20=
18-07-24  1560  	for_each_registered_fb(i) {
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1561  		struct apertures_struct *gen_aper;
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1562  		struct device *device;
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1563  =

06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1564  		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1565  			continue;
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1566  =

3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1567  		gen_aper =3D registered_fb[i]->apertures;
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1568  		device =3D registered_fb[i]->device;
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1569  		if (fb_do_apertures_overlap(gen_aper, a) ||
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1570  			(primary && gen_aper && gen_aper->count &&
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1571  			 gen_aper->ranges[0].base =3D=3D VGA_FB_PHYS)) {
3b9676e7ac6eff drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1572  =

fbc42d455a2982 drivers/video/fbdev/core/fbmem.c Micha=C5=82 Miros=C5=82aw  =
        2018-09-01  1573  			printk(KERN_INFO "fb%d: switching to %s from %=
s\n",
fbc42d455a2982 drivers/video/fbdev/core/fbmem.c Micha=C5=82 Miros=C5=82aw  =
        2018-09-01  1574  			       i, name, registered_fb[i]->fix.id);
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1575  =

27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1576  			/*
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1577  			 * If we kick-out a firmware driver, we also want to rem=
ove
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1578  			 * the underlying platform device, such as simple-frameb=
uffer,
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1579  			 * VESA, EFI, etc. A native driver will then be able to
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1580  			 * allocate the memory range.
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1581  			 *
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1582  			 * If it's not a platform device, at least print a warni=
ng. A
b76ecff8317eed drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-19  1583  			 * fix would add code to remove the device from the syst=
em. For
b76ecff8317eed drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-19  1584  			 * framebuffers without any Linux device, print a warnin=
g as
b76ecff8317eed drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-19  1585  			 * well.
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1586  			 */
0f525289ff0dde drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-04  1587  			if (!device) {
b76ecff8317eed drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-19  1588  				pr_warn("fb%d: no device set\n", i);
0f525289ff0dde drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-04  1589  				do_unregister_framebuffer(registered_fb[i]);
0f525289ff0dde drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-04-04  1590  			} else if (dev_is_platform(device)) {
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1591  				/*
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1592  				 * Drop the lock because if the device is unregistered,=
 its
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1593  				 * driver will call to unregister_framebuffer(), that t=
akes
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1594  				 * this lock.
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1595  				 */
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1596  				mutex_unlock(&registration_lock);
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1597  				platform_device_unregister(to_platform_device(device));
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11 @1598  				mutex_lock(&registration_lock);
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1599  			} else {
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25  1600  				pr_warn("fb%d: cannot remove device\n", i);
deb00d2785bedd drivers/video/fbdev/core/fbmem.c Daniel Vetter            20=
19-05-28  1601  				do_unregister_framebuffer(registered_fb[i]);
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1602  			}
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1603  			/*
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1604  			 * Restart the removal loop now that the device has been
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1605  			 * unregistered and its associated framebuffer gone.
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1606  			 */
3367aa7d74d240 drivers/video/fbdev/core/fbmem.c Javier Martinez Canillas 20=
22-05-11  1607  			goto restart_removal;
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1608  		}
06415c564fb985 drivers/video/fbmem.c            Marcin Slusarz           20=
10-05-16  1609  	}
27599aacbaefcb drivers/video/fbdev/core/fbmem.c Thomas Zimmermann        20=
22-01-25 @1610  }
^1da177e4c3f41 drivers/video/fbmem.c            Linus Torvalds           20=
05-04-16  1611  =


:::::: The code at line 1610 was first introduced by commit
:::::: 27599aacbaefcbf2af7b06b0029459bbf682000d fbdev: Hot-unplug firmware =
fb devices on forced removal

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1658734340810198073==--


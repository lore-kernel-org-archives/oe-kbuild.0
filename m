Content-Type: multipart/mixed; boundary="===============1030835001423566938=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/kyro/fbdev.c:725:9: sparse: expected void
Date: Tue, 22 Sep 2020 21:06:38 +0800
Message-ID: <202009222127.3LqpAyTB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1030835001423566938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Masahiro Yamada <yamada.masahiro@socionext.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   98477740630f270aecf648f1d6a9dbc6027d4ff1
commit: 80591e61a0f7e88deaada69844e4a31280c4a38f kbuild: tell sparse about =
the $ARCH
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: xtensa-randconfig-s032-20200922 (attached as .config)
compiler: xtensa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        git checkout 80591e61a0f7e88deaada69844e4a31280c4a38f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dxtensa =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/video/fbdev/kyro/fbdev.c:725:9: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@     expected void *__s @@     go=
t char [noderef] <asn:2> *screen_base @@
>> drivers/video/fbdev/kyro/fbdev.c:725:9: sparse:     expected void *__s
   drivers/video/fbdev/kyro/fbdev.c:725:9: sparse:     got char [noderef] <=
asn:2> *screen_base
   drivers/video/fbdev/kyro/fbdev.c: note: in included file (through includ=
e/linux/fb.h):
   arch/xtensa/include/asm/io.h:40:25: sparse: sparse: incorrect type in re=
turn expression (different address spaces) @@     expected void [noderef] <=
asn:2> * @@     got void * @@
   arch/xtensa/include/asm/io.h:40:25: sparse:     expected void [noderef] =
<asn:2> *
   arch/xtensa/include/asm/io.h:40:25: sparse:     got void *

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D80591e61a0f7e88deaada69844e4a31280c4a38f
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 80591e61a0f7e88deaada69844e4a31280c4a38f
vim +725 drivers/video/fbdev/kyro/fbdev.c

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  661  =

48c68c4f1b5424 drivers/video/kyro/fbdev.c       Greg Kroah-Hartman 2012-12-=
21  662  static int kyrofb_probe(struct pci_dev *pdev, const struct pci_dev=
ice_id *ent)
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  663  {
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  664  	struct fb_info *info;
a26968df0110bc drivers/video/kyro/fbdev.c       Antonino A. Daplas 2006-01-=
09  665  	struct kyrofb_info *currentpar;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  666  	unsigned long size;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  667  	int err;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  668  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  669  	if ((err =3D pci_enable_device(pdev))) {
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  670  		printk(KERN_WARNING "kyrofb: Can't enable pdev: %d\n", err);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  671  		return err;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  672  	}
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  673  =

a26968df0110bc drivers/video/kyro/fbdev.c       Antonino A. Daplas 2006-01-=
09  674  	info =3D framebuffer_alloc(sizeof(struct kyrofb_info), &pdev->dev=
);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  675  	if (!info)
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  676  		return -ENOMEM;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  677  =

a26968df0110bc drivers/video/kyro/fbdev.c       Antonino A. Daplas 2006-01-=
09  678  	currentpar =3D info->par;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  679  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  680  	kyro_fix.smem_start =3D pci_resource_start(pdev, 0);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  681  	kyro_fix.smem_len   =3D pci_resource_len(pdev, 0);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  682  	kyro_fix.mmio_start =3D pci_resource_start(pdev, 1);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  683  	kyro_fix.mmio_len   =3D pci_resource_len(pdev, 1);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  684  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  685  	currentpar->regbase =3D deviceInfo.pSTGReg =3D
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  686  		ioremap_nocache(kyro_fix.mmio_start, kyro_fix.mmio_len);
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  687  	if (!currentpar->regbase)
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  688  		goto out_free_fb;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  689  =

9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  690  	info->screen_base =3D pci_ioremap_wc_bar(pdev, 0);
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  691  	if (!info->screen_base)
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  692  		goto out_unmap_regs;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  693  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  694  	if (!nomtrr)
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  695  		currentpar->wc_cookie =3D arch_phys_wc_add(kyro_fix.smem_start,
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  696  							 kyro_fix.smem_len);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  697  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  698  	kyro_fix.ypanstep	=3D nopan ? 0 : 1;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  699  	kyro_fix.ywrapstep	=3D nowrap ? 0 : 1;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  700  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  701  	info->fbops		=3D &kyrofb_ops;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  702  	info->fix		=3D kyro_fix;
a26968df0110bc drivers/video/kyro/fbdev.c       Antonino A. Daplas 2006-01-=
09  703  	info->pseudo_palette	=3D currentpar->palette;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  704  	info->flags		=3D FBINFO_DEFAULT;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  705  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  706  	SetCoreClockPLL(deviceInfo.pSTGReg, pdev);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  707  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  708  	deviceInfo.ulNextFreeVidMem =3D 0;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  709  	deviceInfo.ulOverlayOffset =3D 0;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  710  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  711  	/* This should give a reasonable default video mode */
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  712  	if (!fb_find_mode(&info->var, info, mode_option, kyro_modedb,
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  713  			  NUM_TOTAL_MODES, &kyro_modedb[VMODE_1024_768_75], 32))
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  714  		info->var =3D kyro_var;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  715  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  716  	fb_alloc_cmap(&info->cmap, 256, 0);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  717  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  718  	kyrofb_set_par(info);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  719  	kyrofb_check_var(&info->var, info);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  720  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  721  	size =3D get_line_length(info->var.xres_virtual,
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  722  			       info->var.bits_per_pixel);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  723  	size *=3D info->var.yres_virtual;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  724  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16 @725  	fb_memset(info->screen_base, 0, size);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  726  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  727  	if (register_framebuffer(info) < 0)
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  728  		goto out_unmap;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  729  =

31b6780c15a4e3 drivers/video/kyro/fbdev.c       Joe Perches        2013-09-=
19  730  	fb_info(info, "%s frame buffer device,@%dx%d@%d using %ldk/%ld=
k of VRAM\n",
31b6780c15a4e3 drivers/video/kyro/fbdev.c       Joe Perches        2013-09-=
19  731  		info->fix.id,
31b6780c15a4e3 drivers/video/kyro/fbdev.c       Joe Perches        2013-09-=
19  732  		info->var.xres, info->var.yres, info->var.bits_per_pixel,
31b6780c15a4e3 drivers/video/kyro/fbdev.c       Joe Perches        2013-09-=
19  733  		size >> 10, (unsigned long)info->fix.smem_len >> 10);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  734  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  735  	pci_set_drvdata(pdev, info);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  736  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  737  	return 0;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  738  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  739  out_unmap:
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  740  	iounmap(info->screen_base);
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  741  out_unmap_regs:
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  742  	iounmap(currentpar->regbase);
9e517ac88b2443 drivers/video/fbdev/kyro/fbdev.c Luis R. Rodriguez  2015-08-=
24  743  out_free_fb:
a26968df0110bc drivers/video/kyro/fbdev.c       Antonino A. Daplas 2006-01-=
09  744  	framebuffer_release(info);
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  745  =

^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  746  	return -EINVAL;
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  747  }
^1da177e4c3f41 drivers/video/kyro/fbdev.c       Linus Torvalds     2005-04-=
16  748  =


:::::: The code at line 725 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1030835001423566938==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1030835001423566938==--


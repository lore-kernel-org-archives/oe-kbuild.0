Content-Type: multipart/mixed; boundary="===============7818263516963525489=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/w100fb.c:772:25: sparse: expected void
Date: Fri, 13 Nov 2020 23:30:44 +0800
Message-ID: <202011132328.XGuAmAXQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7818263516963525489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Bartlomiej,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
commit: ee5aca2e7167ee3feccc989ad609b64e698d5eb3 video: fbdev: w100fb: add =
COMPILE_TEST support
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-s031-20201113 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-107-gaf3512a6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee5aca2e7167ee3feccc989ad609b64e698d5eb3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee5aca2e7167ee3feccc989ad609b64e698d5eb3
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/video/fbdev/w100fb.c:772:25: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_fbuf @@
>> drivers/video/fbdev/w100fb.c:772:25: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:772:25: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_fbuf
   drivers/video/fbdev/w100fb.c:774:25: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_regs @@
   drivers/video/fbdev/w100fb.c:774:25: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:774:25: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_regs
   drivers/video/fbdev/w100fb.c:776:25: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_base @@
   drivers/video/fbdev/w100fb.c:776:25: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:776:25: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_base
   drivers/video/fbdev/w100fb.c:795:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_base @@
   drivers/video/fbdev/w100fb.c:795:17: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:795:17: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_base
   drivers/video/fbdev/w100fb.c:796:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_regs @@
   drivers/video/fbdev/w100fb.c:796:17: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:796:17: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_regs
   drivers/video/fbdev/w100fb.c:797:17: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void *addr @@     got =
void [noderef] <asn:2> *static [assigned] [toplevel] remapped_fbuf @@
   drivers/video/fbdev/w100fb.c:797:17: sparse:     expected void *addr
   drivers/video/fbdev/w100fb.c:797:17: sparse:     got void [noderef] <asn=
:2> *static [assigned] [toplevel] remapped_fbuf
   drivers/video/fbdev/w100fb.c: note: in included file (through arch/openr=
isc/include/asm/io.h, include/linux/fb.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value

vim +772 drivers/video/fbdev/w100fb.c

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  636  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  637  =

df3381071ca0ee5 drivers/video/fbdev/w100fb.c Bartlomiej Zolnierkiewicz 2020=
-01-16  638  static int w100fb_probe(struct platform_device *pdev)
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  639  {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  640  	int err =3D -EIO;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  641  	struct w100fb_mach_info *inf;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  642  	struct fb_info *info =3D NULL;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  643  	struct w100fb_par *par;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  644  	struct resource *mem =3D platform_get_resource(pdev, IORESOUR=
CE_MEM, 0);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  645  	unsigned int chip_id;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  646  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  647  	if (!mem)
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  648  		return -EINVAL;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  649  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  650  	/* Remap the chip base address */
4bdc0d676a64314 drivers/video/fbdev/w100fb.c Christoph Hellwig         2020=
-01-06  651  	remapped_base =3D ioremap(mem->start+W100_CFG_BASE, W100_CFG_=
LEN);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  652  	if (remapped_base =3D=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  653  		goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  654  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  655  	/* Map the register space */
4bdc0d676a64314 drivers/video/fbdev/w100fb.c Christoph Hellwig         2020=
-01-06  656  	remapped_regs =3D ioremap(mem->start+W100_REG_BASE, W100_REG_=
LEN);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  657  	if (remapped_regs =3D=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  658  		goto out;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  659  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  660  	/* Identify the chip */
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  661  	printk("Found ");
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  662  	chip_id =3D readl(remapped_regs + mmCHIP_ID);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  663  	switch(chip_id) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  664  		case CHIP_ID_W100:  printk("w100");  break;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  665  		case CHIP_ID_W3200: printk("w3200"); break;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  666  		case CHIP_ID_W3220: printk("w3220"); break;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  667  		default:
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  668  			printk("Unknown imageon chip ID\n");
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  669  			err =3D -ENODEV;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  670  			goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  671  	}
a01fbbd52e4faf5 drivers/video/w100fb.c       Richard Purdie            2007=
-05-23  672  	printk(" at 0x%08lx.\n", (unsigned long) mem->start+W100_CFG_=
BASE);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  673  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  674  	/* Remap the framebuffer */
4bdc0d676a64314 drivers/video/fbdev/w100fb.c Christoph Hellwig         2020=
-01-06  675  	remapped_fbuf =3D ioremap(mem->start+MEM_WINDOW_BASE, MEM_WIN=
DOW_SIZE);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  676  	if (remapped_fbuf =3D=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  677  		goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  678  =

afdd3b3c8ee63c6 drivers/video/w100fb.c       Richard Purdie            2005=
-11-13  679  	info=3Dframebuffer_alloc(sizeof(struct w100fb_par), &pdev->de=
v);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  680  	if (!info) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  681  		err =3D -ENOMEM;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  682  		goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  683  	}
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  684  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  685  	par =3D info->par;
3ae5eaec1d2d9c0 drivers/video/w100fb.c       Russell King              2005=
-11-09  686  	platform_set_drvdata(pdev, info);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  687  =

91f8628b7f7fe82 drivers/video/w100fb.c       Jingoo Han                2013=
-09-17  688  	inf =3D dev_get_platdata(&pdev->dev);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  689  	par->chip_id =3D chip_id;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  690  	par->mach =3D inf;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  691  	par->fastpll_mode =3D 0;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  692  	par->blanked =3D 0;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  693  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  694  	par->pll_table=3Dw100_get_xtal_table(inf->xtal_freq);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  695  	if (!par->pll_table) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  696  		printk(KERN_ERR "No matching Xtal definition found\n");
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  697  		err =3D -EINVAL;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  698  		goto out;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  699  	}
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  700  =

6da2ec56059c3c7 drivers/video/fbdev/w100fb.c Kees Cook                 2018=
-06-12  701  	info->pseudo_palette =3D kmalloc_array(MAX_PALETTES, sizeof(u=
32),
6da2ec56059c3c7 drivers/video/fbdev/w100fb.c Kees Cook                 2018=
-06-12  702  					     GFP_KERNEL);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  703  	if (!info->pseudo_palette) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  704  		err =3D -ENOMEM;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  705  		goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  706  	}
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  707  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  708  	info->fbops =3D &w100fb_ops;
9b0e1c5dd2941ae drivers/video/w100fb.c       Alberto Mardegan          2006=
-03-31  709  	info->flags =3D FBINFO_DEFAULT | FBINFO_HWACCEL_COPYAREA |
9b0e1c5dd2941ae drivers/video/w100fb.c       Alberto Mardegan          2006=
-03-31  710  		FBINFO_HWACCEL_FILLRECT;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  711  	info->node =3D -1;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  712  	info->screen_base =3D remapped_fbuf + (W100_FB_BASE-MEM_WINDO=
W_BASE);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  713  	info->screen_size =3D REMAPPED_FB_LEN;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  714  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  715  	strcpy(info->fix.id, "w100fb");
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  716  	info->fix.type =3D FB_TYPE_PACKED_PIXELS;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  717  	info->fix.type_aux =3D 0;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  718  	info->fix.accel =3D FB_ACCEL_NONE;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  719  	info->fix.smem_start =3D mem->start+W100_FB_BASE;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  720  	info->fix.mmio_start =3D mem->start+W100_REG_BASE;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  721  	info->fix.mmio_len =3D W100_REG_LEN;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  722  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  723  	if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  724  		err =3D -ENOMEM;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  725  		goto out;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  726  	}
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  727  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  728  	par->mode =3D &inf->modelist[0];
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  729  	if(inf->init_mode & INIT_MODE_ROTATED) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  730  		info->var.xres =3D par->mode->yres;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  731  		info->var.yres =3D par->mode->xres;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  732  	}
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  733  	else {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  734  		info->var.xres =3D par->mode->xres;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  735  		info->var.yres =3D par->mode->yres;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  736  	}
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  737  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  738  	if(inf->init_mode &=3D INIT_MODE_FLIPPED)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  739  		par->flip =3D 1;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  740  	else
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  741  		par->flip =3D 0;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  742  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  743  	info->var.xres_virtual =3D info->var.xres;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  744  	info->var.yres_virtual =3D info->var.yres;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  745  	info->var.pixclock =3D 0x04;  /* 171521; */
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  746  	info->var.sync =3D 0;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  747  	info->var.grayscale =3D 0;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  748  	info->var.xoffset =3D info->var.yoffset =3D 0;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  749  	info->var.accel_flags =3D 0;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  750  	info->var.activate =3D FB_ACTIVATE_NOW;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  751  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  752  	w100_hw_init(par);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  753  =

aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  754  	if (w100fb_check_var(&info->var, info) < 0) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  755  		err =3D -EINVAL;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  756  		goto out;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  757  	}
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  758  =

^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  759  	if (register_framebuffer(info) < 0) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  760  		err =3D -EINVAL;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  761  		goto out;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  762  	}
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  763  =

31b6780c15a4e3a drivers/video/w100fb.c       Joe Perches               2013=
-09-19  764  	fb_info(info, "%s frame buffer device\n", info->fix.id);
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  765  	return 0;
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  766  out:
8224c3b166db81a drivers/video/w100fb.c       Andrew Morton             2008=
-04-28  767  	if (info) {
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  768  		fb_dealloc_cmap(&info->cmap);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  769  		kfree(info->pseudo_palette);
8224c3b166db81a drivers/video/w100fb.c       Andrew Morton             2008=
-04-28  770  	}
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  771  	if (remapped_fbuf !=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06 @772  		iounmap(remapped_fbuf);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  773  	if (remapped_regs !=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  774  		iounmap(remapped_regs);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  775  	if (remapped_base !=3D NULL)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  776  		iounmap(remapped_base);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  777  	if (info)
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  778  		framebuffer_release(info);
aac51f09d96a0ac drivers/video/w100fb.c       Richard Purdie            2005=
-09-06  779  	return err;
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  780  }
^1da177e4c3f415 drivers/video/w100fb.c       Linus Torvalds            2005=
-04-16  781  =


:::::: The code at line 772 was first introduced by commit
:::::: aac51f09d96a0acfb73c1d1c0796358bb47ea07b [PATCH] w100fb: Rewrite for=
 platform independence

:::::: TO: Richard Purdie <rpurdie@rpsys.net>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7818263516963525489==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICNiJrl8AAy5jb25maWcAnFxrb9s4s/6+v0LoAge7eJGtb7mdg3ygJMpmTYmqKPmSL4KbuK2x
iZ1jO+/b/vszQ91IiXIXB2iReIYcksPhzDNDOr//9rtD3s+H181597R5efnpfNvut8fNefvsfN29
bP/H8YUTidShPkv/gsZ8t3//8fHwtt0fd6cn5/qvm78GV8enkTPfHvfbF8c77L/uvr2DhN1h/9vv
v8G/34H4+gbCjv/tHI7Dv69eUMbVt6cn54+p5/3p3P81/msADT0RBWyae17OZA6ch58VCT7kC5pI
JqKH+8F4MKjbchJNa9ZAEzEjMicyzKciFY0gjcEiziLaYS1JEuUhWbs0zyIWsZQRzh6pbzT0mSQu
p/+gMUs+50uRzIGiVDFV6n1xTtvz+1uzZuyb02iRk2Sacxay9GE8qgcUYcxgtJTKtJHMhUd4tfIP
HyqymzHu55LwVCP6NCAZT/OZkGlEQvrw4Y/9Yb/98wNuTtFEruWCxZ6zOzn7wxnnVw+fCCnzkIYi
WeckTYk3a2aRScqZW60OVuuc3r+cfp7O29dmdVMa0YR5ShlxIlxN6zpLzsTSzvFmLDZ16ouQsMik
SRbaGuUzRhOSeLN1w52RyAeNlg2gbcOSMUkkLWm1evTZ+NTNpoHUVfW7s90/O4evLQ3Y1hLCRrBy
Akl3uR7s65wuaJTKi8zcTQTxPaJMQik/3b1ujyeb/lPmzXMRUVCwZkCRyGePaFyhiPSlAjGG0YTP
bNZQ9GIw+ZYkQwSbzvKEShg5BAu1aqoz3UpanFAaxilIVcezFlrRF4JnUUqStSnWbGWZedXfE9C9
UpoXZx/Tzelv5wzTcTYwtdN5cz45m6enw/v+vNt/a6kROuTEUzJYNG10EEtmTFay+tSV3sK3quEf
TKA+iDA0k4KTlKkdUwtIvMyRli2HxebAayYIH3K6gp3VTEAaLVSfFonIuezKkSnhvDEdjRNRCt6H
Tj2XM91bIS8gkch0x9YQc05J8DBq9FewZFrYlnWn1XDCc1EvVtWaqqkdw7z45eG1TUHfpAUdNp9R
4oP56j4XHWwAnooF6cPwVqfj7oRkpfNHjemxKJ2DVw5oW8a42Eb59H37/A4x0vm63Zzfj9uTIpcr
sXBro5gmIoulbnvgqr2pzZGrprn0ZnqECghLcpNTS/IC8DPgqZbMT2cWiUmaW2WWI8XMlx1i4ofE
GKMgB2B8jzSxTTuGIJNK0xUID6WXPKt5lHJ9umAevdQCZMCBvijEjYN+fapwoC1zRr15LGDD0QOm
ItEcpVJTTrJUqK76kiD+grJ9Cl7KI2nbWVT6ppysLTNx+RwXqmBEoqMP/ExCECxFlnhUgwSJn08f
mTEFILlAGtmH9nP+GBKbEfj56rElhz+KfikT2wqEQM+sDqaOtEQMIQQgVR6IBMMS/AhJ5BmBod1M
wi+WIWZkATCN+cObZgTY2OZD7R2bk4SxGizMZpZyStMQ3CPuHCAxru2y2sqGXIsLiqhvi01CslUZ
LbWYotyGLgEszdKb8gB0lxhKcQmAmCDj3NI+yFK60jwAfoTjpHensTC7NobKphHhgd1A1Qp6eAq3
mLxK5AxcVjMfwoQ+FSbyDBRhWzjxFwyWWapa0xzIc0mSMB1hzbHJOpRdSm5sX01VKsQjl7IFNWym
u+doJCraB9rxg0lQ3zddauwNB8YBUH6+zJ7i7fHr4fi62T9tHfrv7R5wAIEI4CESALCkh4R/2KOa
yiIs9F+gH8PKML0gKeDJuWbCnLiGd+KZa7cGLvoYxIVtSKa0wkH9zdD3I1zIEzgfIrQ3nGVBAJA9
JiARVA/ZD/hWmzGtZUrD3CcpwcSQBcyrAJMePwLG7TYFDtOjyn8XIafUt5m4VY1FTKOESQ01IAxw
ce8jnxENHIWhhqEqPD9bUkDKJiZnIhYQV0OiZTxqTpg9BJxMwbVkMbax5Acy084RoDRvXnTt9MBE
AoKNxlDGFR8PT9vT6XB0zj/fCjiq4ZFq0clwng9Hg4GuUkhFILjly4SlNJ1BdJvaAEOlL5WmAoDO
/dTFoFRg8ZfN6eQw5rD96Xx8f8ISgj5s1Vc5chaBvQTBUJ+DrQUfXppG0xBc/S9E+WxhR/DWadc7
miiQ8lBjQRlqGwup1NDUI1BG1wPrEQDWeNDLAjkDW9R7fBg29ZJ6WWBoMoZQmeS+1EKBuWw5I75Y
5tPYcBehrwon1a752y/v375BnuIc3qodq+f1KQvjPItFlGdREfx8CLNwvvBEWldSz4DC3OqmGPgK
ZGXdAsscKtYlizYqMpvj0/fdefuErKvn7Rv0B3eqLUqHEVhOKE7lTIh59yDCJqscOYejAEmEFtuw
43jksjQXQZCnhoPIpySd0QQ3BzzhtFucUicanFdKPXB+VYZcCRB+xiHnhlCkEAFGLg1LTFNVsuIQ
BrhmjqX3L6aE4Vs3RvQSetyQncA19cTi6svmtH12/i4i0tvx8HX3UiTOTfkEmuVzmkSUWzfwkph6
BTybYjVHyNTzHj58+9e/PnTd8y92UUtcQkQ9VDNsFe5liGF9aOoUMU+ukGfaUXebgO08zPL0XS9Z
WWQlFz1qZoM+hV/W96T1qFSTS7yyGcZFiwtoFtEZulyYiac1XktgceAP6jPAjm/bs3M+OKfdt71z
3P7v++4I+/d6wEz15Pxnd/7unJ6Ou7fz6SM2ucKCsm4U2jjgaWx+2mwxGk16ponM65uLSipaje8m
/6DV9XB0eTJwFmcPH07fNzClDx0peKQg9bu4aYhglnnIpAQUkmNNVsYqxocYjqVl+CyCg+0DvAld
wTtmJ4vqDQdvZOaVLp5hW8ZBECFpjklGQw3ORkV5HIIEi5RpevOWE0M38zmjGc4JGmELbVb9nHbn
ZGnv2tCVzdAf26f38+bLy1ZdTDgK9Z41v+yyKAhT9HwaAOdBOy/Cz7mPYakqz6GvLCs9tsS0ECu9
hMXa6S/JIWK/19802Shax41981aLCrevh+NPJ9zsN9+2r9ZwA4gvNbIjJIDn9ykmOSZMLGv0eo2w
Ah0xB/cep8qhKzwy0VUCIcBrR+RKJpsmLWHwIy18g14um0ttkpVuQ5gfiADP5PvJw2Rwf1ML4RTy
eMSMOrQgxodOaaUiBdIkEgiy8uG2WdJjLITNFT66md/s16Py9moRTWpQxkmYeGxPEKpeGI2NaoEK
+Co/QWQwt/eOaYIpAvY1SlpTLDPRyJuFJLGDnH5jaaREZjGsBGj/3kF26B93/y5yyDoT9UjSyk1D
j5GOgNi7etocn50vx93zN5UINMBp91QKdkQX/WUFdJhRHpsllCZroIs0jNt3KU3+EvmEA8jpq/Qr
8QFLwiVYQHH11Zl9sDu+/mdz3Dovh83z9qidrKWK0jRpDKImqW30sU6rl4dgW+vRtFJa0wurAOVy
tQNrY+cB2JBLdK/atKsCiO5H2suoei0JqABrf5rzqTytijF2Xh8VcbafsIVagLZNik4XMKuefcQG
eEFZ9gb0GYqFfeNUMyLXkVc1VpeClsNS57VwYopCrnbwpcA0UiMkdGq4w+JzzkZehyZVtcukLYeN
IZSkMGSiK0+/LfTB+wBiSApjCVpqA2YAZ7pwCNSOfO2nSJmu+35yntXpPZm4aZX2FL1nTDLO4EPO
zbvcusVnMK6cumxknY0+Yr0JEVjiq/4pBztmhLeIId5wVIzGr6n2LAlKnnVSqlHmrixtqjWnvi4V
Pioz6iYk8eZ43qEOnbfN8WQ4POxEkls424Cwmskj2fXCm/FqZWOV+W7NMuYggoJun3GurpITAHXg
TVIyNQWXzDRZmXQ0p1hy21zAzFSh/ALLZ4lKDtcF8nu4GvYKAFxXFtL0u5tuM8xgRcTXujvqqllp
P4NfnbDMALAQmR43+9OLeg3i8M3Pzn4IEcuOWlKGgAOOVEhkqo5UcdVJwo+JCD8GL5vTdwfyvDfn
uR3U1I4FzBT5ifrUKx4eGHRwL3lFNrYVJGBtWV0rtLIvrRU6A5dE81xdj+VDU4ct7ugid2JycXw2
tNBGFlqUUg6xqWW1uILQl6nfpUNcJV1qljLeMikSthWTmNVZ/WC5EoKxal9dv/ZvVwF+N29vWLIp
iYiMi1abJ6zYtPYUQiKssoJl5n0nWs1sDbAstqdceKi869HA8+Oe2QNuUi1MBaTy+nrQosUArSvF
VMDsFwspLni3L1+vng7782a3hywZRJWO1m7DmJwB0oc089VKLgqtRYF7bRpF00akcVtPoTeLR+N5
K1vWFSXT0XXLECQvVmzou0OC/20afM5TkRKu7uQM/F9yaaKqLsgdju5KwLo7/X0l9lce6rCDXo3l
+MKbjq2R7Nf6NvYfkGZxhWYsCZwQcjpevyCX2i+2otfyqsYllulRe9VKklBm0bRvRNjRXwgYrdCl
TXEnWlufkKVaZ9/GxywvF6u0zGNI2Zz/Kn6OIAkIndciA3m270XRwbYXvxbVmYhI2iooyap0MEGk
gVHO5pqxIZGxeogSeroY5HiAsBGRfc6ID5/tiQe0QySVy8AOorABwh2LEK1FtFJAsx2NMrdLyJdc
lYrlTHC/fU5UA5e65cPA0cBUDHLxqUzL/bVaTHlG2wPP1pCJIISuqTM39CBu3FxPGpqfavhZBPrv
WCdKy2eJTQU/wMwDb3ZsuwNcrGBgtcqQREnC13bWXLifDIK/jkjIjFmpAkORMjU0A6kLrIgD4Fog
rtALKgVD8IU5KmQvCSeabwVgoq7KNIMqSTlZ3d3d3ttcatUCnNukwjHRIqSOfH97OxzP+pWuQS9C
JL6xtWQAxL8eXa9yPxb2NACyunCNy7dymSfvxyM5GQytbKw3gcOWNlcFR4cLmUGyjZpU+ZimDpVb
eILB+bIWohUfTTWJjZoLiX15fzcYEW6zGCb56H4wGGsPthRFj9aAPSR4A4jYfAQxu8twZ8Pb24Hh
DEqOGvx+sLLdnYXezfhaw1y+HN7cjRrpaK2ghBzQ5bh6vaIPAV7YInaFV8+Q6/gB1Ww4XsQkYoa/
8kZoO50Uh9IYcdiptqBqcxQd9m+knd6GeG287yjInE6JZ39IWbYIyerm7vbaZgtFg/uxt9Je1NTU
1WrSJQPYze/uZzFVl47tsSgdDgYTawhprbl48Lr9sTmVt66v6unD6fsGryDOmHRgO+cFgr/zDKdo
94a/6qft/9Fbs1gOeQlBJB13L0jY/rx9ccBBQcg7bl/UY/qTdtxLGQsRY/3C/oz4gohapd5M6CmZ
4SwKzOlJVqGejrUgEy8PdBG2DsWSKKXOcHw/cf4IdsftEv7/2RUZQO65ZGW9vVrJpZ6lut7ez91p
Nu4qirPuIZhtjs+qHsY+Cge7aAAaqwhC9wHwET3x3PVND4B0ztxY2u57Cjagpm6fcvsv9QMevh6z
9E28ix1JjPPp9hM8htAcS1uQL1oAcJywvOhsMKZxMSFdaKZYtpobCWn5JKSpz5S0PIKM6M5ewqma
cPsBtu1XY+0WCyhMAI7k5um8PdqiYJraPZdPIZDaHC8w5kboL8pNqhhaVBK14jLm1bb3RXEMzXVN
sjis3/Pbwhey5x6EIBOMlhAVOaoJsG3P7QEs365WRjOLFDe9JARYblk/VeWCJCCeUfOYLS89vaq5
+ZyuZdqqx1eb4cH/WEv/FIHJVlZVUvXBq4Z2IF1x2cgrkEl3BGQxoERURHZulC1E2mYuYLqYK63W
3U4yHY8fYz2OtjmqrNzPxQJzzYWAz9ctA6toADXtr4o6lt/0LXcjTTKZqpezxb1BNxCNvK6TNsrh
qBxXkMQH/ZmPLoFRPA2x2RMyZ9BLHQSNGGarCuSG7y9nCJvbH7ACnIdK5m2TAYfoFh4KRHJO8d1L
W6jim7MuqDjgqzlrZPDUm4wH9gcBVZvYI/fXE9urA7PFj+5sYkC4acK7jIRO29Pxqdbj4oRCvvJi
bv+WyEVtmqLK+yV8ZN6zNhkWtljbCHn5djjuzt9fT62d4VPhstRUPBJjL2gbS0EmdjRjjlGPW8cE
vHaw2saMra5n/qiqSSiDVl/ncL7gTUVZcPvj9XA6v/x0tq9fts/PAJU+lq2uDvsrrMT9aeAJNVsM
4D36KXxqa9Xp/dDcb6Tg89UFLR6Os5BGqXn3oZqtVqxvINcDRFx+6cTohIy5iHr7JV4oU9ecj4fO
pHtOfLIA22MtIsVX3OrS1HTPLSYWO/HdU9eo6yZKA7127bMp8wS3PtRFPg3C8cgcnq7WkZDX5oTL
dRmylc8onhmw6JMqB/XOA7+QxsFr9lxDqwgS2q7rCw54lNjw94osYkhyzHl+epzc3g3MdnMawrE2
aYDlRvOWQ0tvrtviwvT2ZjTseLjFzWS1siWsiruSphCBWyzN8YVxUaooS95WMBzn2gJ61RaHYIs2
TKqY0cocN16R9mqA9AsjUmWDKY1s8AD5CTPTZuXjxt5oMrQ/llX8GeQ+LuP9o0oWptRe/ivYie07
QYoVJy3vIdP2ZzD7YGLqpiDetltmY/VAWKdl0Q3g/NGydarlOvqcAbJLTLkpnUKu4sZha8eziMUz
Zt5Y6/S8b3342pCkjNN2z2XYhxaKkoc5/op3hl7x+L7XsBOP1FeB9Acgo/3mBSPCR4hnEAw2z5s3
BZfa1ynKyOraneouzt+LQFr21YKJ2a+MyUZC2xe4WtvWcs/KxFv7VQQPVdnoelj14hlObr9vVU0w
7vYorGhQ4U5t+p0Zj40I5PmRRFp5/WrPsZY9LarMSn9ggcXw1lMuVUGvbnd1mkrPiuoF5APh5oR7
6h325+PhBb8A2XnGpMr9KpxraS/S0tntvSmcJCHxST6+1U9U0dZILAoShPdMkiRt0VdM/QScavz5
AKRB2B7dja/bVw4lmWQ2yy4b4OsDc6DqScJMFrlEW2T+uf/mAUCbS6KWut0sxdSPr81xyguRzj0J
j+XtcNg35QYB6JajOEv1bKanH43vjaCJtEByCIiWVSLj8hVLdUuTLwqpRne8fwk4XV265kEQ0SMb
AAH8DFp2DGDAJHzyzK94AomHt4Oc89hUNI/v7ibDPNGvU+rlq7+h0CJK8yt5FfnitVVIpYjwN+/C
zVXVJrAVC4q7rRKLtG68EI30isVSRR6wrEemYseWNQEuS9nnngsHbCAghrFobSoIEcxo0j40KVPH
wiRiU/x6zLxtXyKxv3lFHmhQR6Y1KZefWxYB+H2u/kCF0Tix2PMlIIN8AC03xZKMbtIb3jF5M7DW
DJE/M4cGbDPrKEGyAL/F2BYNUKVPKrBy4rfFIEhp76AiXvJHMsXtnZh6U+XKzoQQ2/SaWI1w+ux2
xVqHS4Gf4XDSHkfRRwPwHfhSokdc3QjAy7xlaKvVvUmxwSmkr/DPJPQMUMMiswf/P86urclt3Uj/
lXlMqpINAZAE+JAHiqQkxqLEEamL/aKa2JPNVOwZly9nz9lfv7iRxKUBufbBnpn+GkATaAANoNEA
93gFMjb7oeQ/1v3Gme4+8KoBdF+Qu/62eVQdb55Y+29vP94+vn3WM6wzn/J/1t6O7KaHQy8cVlUY
Grsydk2Or4mnFkGrfug7uJG3A0zve8DTb+wfPn5++/gfY+tAGYev0t2+377nw6q88bVvRhGER3gJ
yTtOw1h20rtb3F55fn7g5iC3Hz9JhzZuVMpcv/+XeVrkFzZVwLQZ5N0B08BtDtCwJFD7ZD6/2AZa
n/bSF99OIX6Di7AAZfItIi0VqIUpB0IxNJDMDF1tFyyIqw4xlvj0umRZcutPfQ2VxRe5iIHm/MTR
VT0mQ8IWdZqQ44cS+eVxKoaoewSVL67WBBZ4M8sVZeDR78wwdmtrQJ5FL6+UT4fQlcuJpS933MSF
EnPB+CwAzXcTx6Fqdmawnpl+AZt1oIGLoTNDAd4OXdRCb3kBCiMPGDbwvSmXCzondnlyQL+EhYxM
u9BCSAZJJnfOPAPOY6veb/anQeywRtkCd+wWuA/ZigsLvlkd20wLAqvmuDODWJmdFOhtiv222qTV
CFWIPiuKaeS19LPlRJxd/S4o6BSgd+ZFn1nk/pEleRoAGAC0/WOaoAIEZFZQvxEQheKHGMKxPE/A
HsuhIo/1gq7uihyByiYSX++WXCBAuSVA86BIxd1ci0hiFkn8WA1pkvotKO3QYVhxk7ZrKx8fKooY
WIdD3eX5nZGm7liaxVk6hrJYQ0xekEBDqO3hePZi7y/aDyZD22srbjr36ypEd7bXDVBM2gFUpGu6
5gxMXAI6spKSMoU+dYJpGq/xhY/8Il98MF/4YsP5wkWTuPTg1V6fbQVM+AtaxQuhsFeCz1f8iixF
vLDilz6oiLQ4LUgMjKtDEe07BlusQvlIGEVBi8rAf0k1CmgaW1DIpFzQe41QxAcZwThsKU7IHUkF
Ux6scYneUxrORMqguBylcUNxYgpojMQCCiOxmPSUxOaXiSmjsSzYL1U1ZfCJu812jbWHfXRiUvmk
VDBIZ70dCQtYp7iITxaKK9rE+mQmBSZ3DeWAHSOhLR+Ug8J1PcpopNyxvbWHWsR8g+biacPBWxh3
z59ensbn/zx8fXn9+OPbZ/9ooxHR6brxnS90iHjrDtY2pwn15bEdIAjTBBiC5DYiWCkSiTVENzIE
LwYEgmm0pYU8YGCHhSGneSD3nI9l0aRccqD3CrFo4FsZYvH5mrNkKN6luGCkcD57vi4e0AJPRuE7
BKwLuPFIdyzzgebx1O7a1bE9Ge5ewvixdrE1Qfp79+W41bcXsiUq5mHtmExTkvb4qCP+Gj59YmMj
uNiTvgAy7h7k0ShAvWViFyZX8SRZnJbUrZQvT1+/Pn96kKV5fUemo9x6dG4HS7o+iHKI3uLaIN+G
wLJS8diHWJJ25An5UvD4XhynXHu7CWbXESeRIF83g3Y3+eKIoh1KQlJMR0R2ltMJkUOuL2W/8j62
aavQZrPCHVW6rUfxI0GJl9W8+QW4Jlh8R6lddrbb3aV2BG4Pbh3uDpu2OlcuVW1n+VSCr24ldCuW
D9Sj9hXPwKMqJw/3M8XS7G616TNxi1S7bc9XU2VWY95/D6uT1/bqYCBUwLDvh1sl/Npc+WJi8R5/
u17MyzNTB63sQHySLLfZw91abeEz6HaNwoeUmQe6kmjsxptkf8NdkcEddwl9cJur7OrbutpaF0DD
w8bstiapz79/fXr95NydU7nWfZaxgGu1YtjDt1uVrl9unuugP85BNugCY1e1pf8jcb9fU70A6Qpb
s4zCG22qrfq2wgwFBeFtWeh4eIa/glN3aqhe136dWhV2bD+IcdAb62qaZBjaNplgxDBzqqIuC57I
Ic6OXXYBu54UKWTkapRR4g8ijGZ55mWlpuZYq4ktaGBO43ZM4ram2o12m+xYZWMWMERUk1QkYwW0
m6JbdOBlsdwpTZJZ7iqPJBfIrcnxsbuy3Pv88bJLExJWlssuT9LE6om+VsxHXlFt4RM6Mrcvp5ok
qPBmONWZkEutCLEOSVStt8NhOPoDDh/R0iRwc9mX1S7oUIkYX3MNyrgl8ivRX//nRTslLcd6c8EX
pD1ubvWAUwaHeV6Yuit0PmFmgi6dKcUE2LPuQh82rdlUgLDmRwyfn34zg45eJmdbESHRLlfRh66B
yOJbkywEsCAgo17YAXosDkRCSS09tiAMjQomBwtKSpIQgEIACcpBCJ/SA61rcAUqJ0uuoZwpgzqr
zRGQlzXmTrWNIAoojlYQY010uAi/9zO0BFCYuP9rnqktRH0uCmPCOtYmtVPYgsPWs8m1abp23yrS
Yb2Gi3K2kB1EBpQv7atZJo86NFR/3JFmN1a4yAIffKeYyC0gk2229oLYnco4Kg/dkBgfoDnp2MjA
Nd2hNn2yVGkgZklVYWq7PYkr2Z2ZMPjNIpCyDpED0NX69U7i2/ZivafR16XCjdlSr33KurqtSuHP
Z3jz8XmJFTjTaeZsZLitKZ9ZOp36xljfsTyBbTZxyWcjOhW3TpMcdv2aMiqrkRVpBlkrE4vo//bZ
nImAY4fFYAwdFt1Q44m+azZ8UXkmfgp99g5JMazgg6WpGgYwokFX7kuN+nKsHoVKXX0xNKCvkXmi
TPC2fozUysRVj7cT1xbe0kJjfSm0+foHUPFlAR/FTQxcqRCdrCwYg/bULBaMjAqYKpOvFbhO2bPU
hElNBjfuJw5tGvrZClMaU5/u3iBZipKtF2333UjyDDrzmRjqRkdkFp+b5lkOl6Ts8kg+isU8G7Jq
pAC+S53ldquVD3HtSFF29TOTQJHAAM4oDFB759WA+PoAPqGcO063Iim8Ozs3qFgZYARtsk66tClP
m0bNXCkwFGwOu3rdDltf+uPIByZQeDHiE6hl16dmpwvUswKgpqdqQEkCG9Jz9QSXm85oL/+8ndva
JemrAGpDVAUQefrx8tszFIdnDmpR88+Czn0MhhQZBpdFZ2ZVLUiHEgzVlc1hbBjbQA6VJoAikIKg
kByIQnpicBTcDodyHekVBQBibzWaUApuWNgcCPo6DuQ4ANCAHCnNgBS2R9BCrtwLYgskdpdjYo/X
HvlZ1kOOwTgpIvZJtPnVJCNME1/+tXAoydZ+cQJgeL2BkIzQbPCBrkKEMgIXtNlliA0dCOBk6KAv
23CjBDJbDBxDqqEvIMLvGExM23abIwIPjxNPKzamRV+PCNGOjELC/6MC598J5nbfEWEMqrYIa8nn
vqhoarSFDvttDuq3kwbsC+cu6HrJm3AR63XiijfKAAUWAEbAKCQBDHRHCaShFDkQTUgBQOFi/kcI
7JACyhPQb8JiQYVfngRyBpdXAHUvd67UghYShGPgtprBkqszCQggsIR5nuLAh+ew2WNxFDQsbFQT
uqonCSTsWIk4ZsAgW1k3kKY27XICUSnU/h2FeSEl6ijYcTkdsgoWmIEFM7BgBhbMoF7ZFWC+preS
QSUgb4YJULESSKEuKYEMat++YpSATpkmR4qBL9mPldoMbMUre1Dm+2rkvQbe2zZ5KBjfyuDga1NQ
tQVUJDE7S/vkAtIPJcHAlH6oqlvP4EHzUFVwHa5ZBvukdVZ0vzkBTBaWFYasj1UjnHcaH2hX3a1a
r3sgs3Y/9Kfjre2HfoCqrj2SDEftCc6h/YA9oB+yNAEsrnbY5YxbB3B/w3y9CZ0iWpMOZeBwLwAR
3uO0K5Wy+SyEIaDu9LCfBkZGnNA7xoFiApef9iDJ4NJJmqZAjxcLypwBH9tfGz4JgSYgX6OlfLkf
szc4S0ZyCswQp6oukgTMV0A4cIFh4rnWfYMwvNaaeD7suODxbPpLd9dkMx0s7pllw3aEbA1OxoB+
cjL5HSRXkCneNXyepj5/w03gNAEmAg5gFADyC4a6zNANVUq7CFKAVoRCVwR0i5qZxnHgqgvl3eX2
eacxOyPMaobgs/CFbaAM/wIPja5YebUwyHRo9yVOgHWpoDsXYxeExMezsaLAYDZuuwoKWDl2PV8a
A0aNoAMtLOmAhcjpaQIZR5wOqSinZ4hAX3geEUaxD7wwQikBlnICYKj2CxNAgWo4RYFDAIEURyKx
eZwz7PggOYLTkQJz8MkWgyfHdLsGv4MjjQlJy6S0Lmtpknz7hdssbQXtJk9MjXw7c1+9nw9JbtIT
9NYNf09cZmcraSKbwXonmghWLR+4GY+teStxwqeXezaHMxe06W+XdmigrzAZ5RvS8hkMsENCSeRb
KPLNq2iScO4AY1RewSCCIsj/7pYJi6cZxXMkQPvWzXl9bB4nKNq4p533KOkEutETZgYZ7CCcuQhT
BEg1eYlEUj4eju2jkXbS7r4pjzN5UfrTnrU+eboGD8kg3NQi5UuYKzuB0r5rj+8uh0MNpV+q/jB5
BoAF6MAfnsxiyyrHYK2N76D8jPiuIoTMlyfTuVqCZdW3D+1+JGlyBXjmU+w4nx0H1oXV4zDf3p4+
fXz7Ahaiv0LcnqQIRWpG36+EqkAfa8cT83WMrziCPhytPKf3ZUJCBwL6+t82dZZWvv+ztOjSjWJ9
RISCALVMAGlUxQRHFsm6PpY0w9BH3/8s5aP09OX7z9f/Dn+zuvpmffPkMhRIatQKH/QOEenNg+Wl
ACnX48+nz7zJYEXTAgR5pvw/XHGRU78HzsGmgDa5lGO1rQ/glDysxJvpQ7vamef8g3EKJliGuj2I
90JN3mXqNxhgO5Iz6AeqAj7aK/H4HJS3ALxxQwZx/NfPV/lCcPj1j3V9s0PKCMp0um5quqCrmL+b
nrcb+A0y7UAoaLhNoL1PKB2PpT8qhtdSMlk5YkYTL0KVybJEUPrDSSwjzIvQPFUg5OzCtd1VNfho
xlq+2pQViX02J+l1kVHUXc7hvK89TuTheyBr91LEQrO3Zgy6E9pGtqO4QoHgy1MzTiCjdUZZBmYa
OHBdcHilLNtWzHoEvB47obavgMhUH+7AIV4MBlU5ftLQN6oZ2K5PSSMeDWWJm7UeEXd9OYCeGaJx
KkQsBwyDaEfpNQEr2KMErryYo3XkpMiYzwmDoDuibducr69klQYk4xxZdp2uYC9W3ijC1Q1tBbk/
CJDLpkLSGXm5MSYFTXr22BsuCznUHpM7kPs50rEhA49dNey4Ii9Uc3W7UE2P4YVaEKBgShnoT61h
ViTUK1c4QgFE+5BhIcMbCRIHbliZcLNfY+SE3Z45mg8yinDgWSrRV13UwI7NeLI/wXCZmXqspujD
0KWfT/TgjSmZX8ecOKIWfByzhIQqXvuNu9V5fMcS6FhDYvtszBGz231oqikGrT2xtSnNr7H5Zegy
c0NrJjlOlJL+7j3j6uuNamITK5S79PpQvXPOq1xdsyRxpudyRdBCnPPXZOfFJrv4seuDX6eCfHIb
3PkUx6tS0Ebx1hshfDAZh0qNRQaq7iO4ny78pFiopUYRw+5k1+18f2CyKPshR0lmjRTqMgDoLaEg
6gzExu0BSzpFB4/9Zhgj6mTWercrDLJzv8LIJlgLyx0GP1kBfqUBY7A0To9YHTOLcyyuMT6ag85K
2hnOU0GZTGPlqQZNWH2JAkx72SFMSTgKqdSjjmTBQULfHfFkktc9wlkequ2+3JRQlDdpvOmbPX8A
RMgAmaBQ3MTZaMKBx+FFVXQZAgPwTSBy5r5Lp2cbl8a8Wu5YGji10DBBnqkKscS+T7Bkyb1c4Fg0
aqi6pAx5lvbxsO3UlSkw3orJIrzg7OpYEmN3UpABBXe9iNV2dMY/CUlg8IbzUQzXoZWOF8pLfnRV
FyQFPcnlpZJ+6RhmKP7QKm5ObJwULrtgEzHoDb5wrNtrU9/Oh91Ybho4k3N7HE/lTrw7NZw6MCbi
wiz2M+V25sxu7NzNXNz621iXtixIW5MwlCcUFlOsXBno9mLzuKtbA60zAsY5Mlj2/EcfSC4nYlDt
DSYvLh7ANK03o6J4qm5BWtchnZALqGjWerEENIFeMoUyxuBk5bAguP3W5T4jGbiAW5hsk2uhqzUO
JHE77AqSZLDI4hwfUwQ55S1MfObJyRXOQNg84Mmfw4Lhb5ZO5PFmni2NQPI7FbZYJD6kZk2oOgWU
0xxKJRZo3FiBUs2LM1DYiFu6xcTyFJRJQnk4c7E8u5u3tVpzIPOWkgNREqgK7Ssf/FzwNrnLZPrh
O5jyB/IxvX1gP6ph45TBQnOIV0NA6KpHvInio0PXM5bBTdQ/0sJcnBsQX96Ger6y+KNl9qvWXBMY
gLdUNbD16YN46Q9Md2YsycMQA2cgCRUwdOngOpUXJ459BwX/dbhEuFpIomkNDBTrrXUNiJs9EH3A
XV8mCJZWgAO4iWvwZB2jeUDvgzcdDJZplQwJt9twAxhuM2WSrQ4HGc4fSiwZzsdmvTqtwwz9JWAu
aePzdu7A580MRv4BSV6CRbxnDKegaSN8llBOwGHGWOWCGCY5qHZqAYsDU/K0GI5+jH+z3sEQCUxf
0F2aIFsKbwA5bNwq/BW2AgywZDC517YMC9WL2GGYuiLu0AJU056RRdkfxnZtZdA1dVvKy5XG2x/S
fv8igiM9fHz7BjyMqVJVZSc39XViJ09ub+4OfPF8DjGIh4/Eu+dhjmNZyzcbQXCojyFIfGoIOuzH
42G3s4OQu9itPkN3lc9t3RxuztuGinhOd5iXuRLvJJbgCcDCtzStkdZZlCukrM/+QsjhUcugrhUP
fx/L/aaBpiPJykcWcYjpFC+odae+Xr7Nq0FeBd6uo6B18CPaEiqvXOSyH8XCE+V2Ov0itZIUklEy
yafgxMPl7WF/2x2GQUQaWhpR8Jx2zfxUyhLMzT8l5NU6B0DSh5TGPKwqbwnb5NSqfhPsdu5bXj3t
wDOCX9IE2CteA6fAfpBm7/I0zW9VFTiSnLj4ouIXmPKMrwba9S+Jt2p+4WvkwxF8ZX2CD321bnq3
pxyGYSuyCPeE9uR3IxlQ+fdYpnIarKtAcHzFdGz2zVAOfBw4xT5AHp62gXD6Qnu6psPicrtWniCf
vD4OMBlKCyii1TsqJpS+X8NaIwY0NwfoyJ8PibGCdO0IVyKOWgqj3CvUOP/86YFbEX8TB//Tk1Hm
4wfdIH0CeBbG8wdqqJ47vznnqkG8TWngBv3CgOB7CIphbMqM5vD2o86iLClN8m00kzVf2AQ2MSSH
2tD1qsZ3UBGM7PeHdadHnoc/DePDP5++P3/6c/wN7VhCW6+URO1QQm3utNj0cvTDn+bnpP/8UC6t
Z2mbeIW6Hs+ACk0zYSeu1R766ZUFmYHwXhH7eUrqt69id89VjLbcH24dz3u2JeTg/PT68eXz56dv
fywPUv74+cp//oUX/vr9Tfzygj/yv76+/OXhX9/eXn/w+vtuPUo5mSorrnjy7c6h2fE+E/yIchzL
avt34xHP5vXj2ydZ6Kfn6TddvHwD402+efbv589f+Q/xKObisvbz08ubkerrt7ePz9/nhF9efndq
WXW18eydKbgcdUlTAivkzFGwQHhrzdGUeYqy2CwhWQK+KoqjG3oS2mPXc+VASAKfAk8MGQmENV8Y
dgTDgey0oLszwUnZVpisImynukQkjVXbhS/0aEwYwUDgwLd6guoxHboeHrT0bHTYv7+txvXNYZOa
cKyHWWN81eCDVe5Es5NM55dPz2+RdNwkpKGoqIpjNTIU+y6OZ/DJ0oznMfzdkITiyGpV2rH8TPM8
xiPGahR4fNLkiNX+eO4zFFibGRxZtO+cexqKT6A5Lpgl8LQzMRSFG6fMZ4jVqGCI1sW5vxJsd19D
WcQI9GQNUKC6URQIO6g75xVnzjhjlPH8Gs05qg+SIxAf21BqGqsBxXEvDxII729wFFGOd4zFVW47
MOcalqqRpy/P3570ZDI/R+7V1eGM8+hQLhiyWOcVDOxeDtG6Ppzdq8YeQ5YHAsdPDNTZ+vcZ7n0m
zaPNLYq4k0MRL+I85HngsFqPUmPRIQQHbJo5RoRiYwPnOCf38jjHSxmOCUn6KnDFUZvs/8jSPfK0
bsfVDfJpn9Q9Y8CYsf789P3fYRUta7GPHuskwp0h8MDJzJCneWAgefnCbaffnoUpPJtY7uTe17xt
CYrZCYqH+Ya6tNT+psriBuvXb9xME6fQgbLENEwzvAVM6/r4IG1UP6lYZ4k7p86ApOzdl+8fn7mp
+/r89vO7a0v6owkl0amjyzAN+LEqBs9bwYgJ+/8wd+dIoJ7gRuRNP4Uy8gUGrTiqa40ZS9TTp8cz
KC+Qg23Nj6e93DlXGf/8/uPty8v/Pv8fZc+23Diu46+4zsOpntqdGl1t+WEeZEm2NdYtouw486Ly
pN3p1KSTlJM+s71fvwB14wV0eh/6YgAiQRIEQRIEZrCJ6TYS6uEkp8cM1VUm3DOJODCs7cCRXC9l
bOAsryElRy2t3IVtxC6DYGFA8j2udL+ho0kHU4EqZ6llGWrPG0d1BlewZKABjcg1Fu/M50ac7Rqb
dtPYlsEEEsmOkWORkaJkIl95RS1jYZvzcU35MYNSfNJnWiNbNIY2R57HAsvUW6hCxAtuXYrswNSM
dWRZ9IsFlcihK+A41yhqXfWkO5dAlniWZZgj6wjsSQMuD4KazeFTQ781+3BplGGWOra/MDGeNkub
9NwXiWpYGE1Ddsxcy67XRkHN7diGrjNsPjXSFbTSI1UepcRE7fZ2nuE1xHo4DBnOIvjtzNs7aPDT
5fPs09vpHdabx/fzL9O5iXrew5qVFSyptCE9FoMCqAf9rDlYS4s+jB3xpNdMj53DBk94yj9BbRmI
c0h8fsBhQRAz1+ZTh2r1Pc9f+l8zWClghX+/PJ6errQ/ro87A5+Dto6cOFZ4TfvZKV9/FEHgLah5
MWFHpgH0KzMOkfAdbL4827ZkBjjQcZWOaVxxRiPozwxGz51TwKXSJH9re46ljQno1EAFruYWLRPO
FUHiY04LkklQcC21AqWVOCqW4vQ8EDuGKKuIPyTMPi4pX1v+da8hYlvSWhOqGwadF6jzqLGyD42h
NKYhpZxoJuxCLbQbcuOcAok86owwWBPNfMA0soydj0k4QntOdf7CFqW4mX0yTjWRwwpsG1W+EHbU
RNtZqGPQAR1CZF1HbTTMaPruCZHZ3FsE1No4tc5TGCqODSXvMNt8WtEPc8z1TdIWpyvs+Xwl1zSA
Iw28QDAJrTToUpfgrl2B2oRwvbRsE49JZKvl4Gx15wt1aMCEd6yagHp2ooDrJnMC16KA6uCiilU0
z5+xDQsw3gSXsT49+E5C23ShhEb9omCUTdQNgaMNcddvjlmn9ASmLuxU4mKYLGHDgJPi5fL+dRZ+
O18e70/Pv+1eLufT86yZZtBvEV/A4uZg5BdE0rEsRU7L2scQI2ojEGy7plVpFcGWXdfL2SZuXJfM
7SygfZmBHip6EHVgGEld8+PktUzLRbgPfEeb2R20pa+nBIKDl5HV2fo5Scrin9dgS8fWZlugzTau
OB2LDcPOq5CX+n//v+ptIvRtVuYHNyc87kPbyfnjw+P76Um0emYvz08/evPxtyrLVNMHQFdXQ2gd
6HpyNeQovgXujgWSaHYPvF9enobjo9mXl0tn5BAWl7s83v1hkq1itXVUyULYUoNVjibtHGoSdnSM
9lSp5UC9oA5smtl4AODqk4YFm4w+Hh3xpP87L7JZgWWr6kbQMPO5/z8ad0fHt3zTNOB7KIdYs1Dh
k8+NELkt6z1zlckbsqhsHM3TZ5tkiZzCoBvl7hoY425cvpzuz7NPSeFbjmP/MojH0/miu+MM+tta
qkZp5Qwi1ry8PL3N3vEi4z/np5fX2fP5H9OEifd5fteuO67lLZW2c+KFby6n16+P92+CO9vYXAwM
k1b7g/6Sa6ixFh4Zwo82T/E0a5VSUKZA4wqU1pHHu0bnMdH1A7E8eHVOJWlDdHJEP7Z2ja6BCWuY
UjT/mCXZGpFCxwJulzMcw0r09xvg69WEIrgBjnPWtE1ZlVm5uWvrhEwbiB+suc+bGK5HQ5aHpA6z
rIx+h4VUR2dJuGur7R3rEtRIBWRlGLewp47RZyG/DUWPxr5roySSYZskbzHqhKntJtxBqZtF2yQe
FbwTDZdgsxfNSUD4CghhpMFqm8ujgXCWZrYYrnGAF8eKHwwug6PMgoT0pTxO1xjqLJE6l475h6g6
AngIxzP71Dk4RC/V4NjwC/x4/vL48P1yQj8PJS7PT3wg9ewmkVzMOQyGwijyGLNg8NyI6iaSd/Qj
CQhFbtgGjDQ+5vKJk6ikIxpOhIufooIpfiQfkgkkhzROB+6HQ3h+4r66PH5+OI8nOez7X78S1zdC
SRuHik8uEKRVJUvM1DGROrV7VF026DH8UTtZFGaGpA8ig4x2O0GSztHstt3GOeUQO5Jkh5ipvOLL
PUzaV1EOhEhQhUWSDZ0cP769Pp1+zKrT8/lJ60tOigGuWvShAi2V0V52E+2qTNptio9knMXSNAIT
aXOwLft2n7dFNpdHo6PpG6jB1duJCbNO0mNatDsoF9YmZxVajtpDI+EdRmxb34ER53hx6sxD17rO
cpqlTbKDf5auYyh2JEmXQWCbh7inLooygwWushbLPyPqSdpE+0ectlkDzOaJ5ctm9UizS4tN76Xa
7mJruYgtj6KDhSNGNrNmB0VtY9jeLSk6FuZsD52UxUtLTHoglATIFezlb6TjBwm98XwxovWELNCx
Pgtg673NpKPNiaI8hMhn0bi+ug+jiGDDTruLTNRllubJsc2iGP9b7EFaqKfrwgd1yjAFy7YtG3yl
ugyptpQsxj8gdo3jB4vWd1WDo6ODv0NWFmnUHg5H21pbrldYZM+KkWKbch9tWVQnSUGT3sUpzKI6
ny/spU1LpkCkemJQ1GW0443+Y2v5i8JSzyHJT4pV2dYrENGYjACvyxWbx/Y8Jps/kSTuNnQ+IJm7
f1hHy6UFRKLLP2qGQB0EodXCT893krVlOOggPwzDD6tJ0l3Zeu7tYW1Tz7UFSrB+qza7AdmqbXYU
A65qRMxyF4dFfPsBkec2dpZY5JxjaQMjmR5b1iy6HOsU9yJRsCS3WhMxOvuF0dFzvHBXkXX2FP7c
D3c5xXpToUOn5QQNSKWBqZ7Gc/MmCT8aLU5cbWz6HmYiq/fZXad/lov29ua4CenKQY9UCYz+saos
34+chXL62ZuAyoIrVriq03iTUI0fMdKaPe0jJ+tIYiyKC0ytQrvp8z1Av1QAqOA5pgxdgcswEMWJ
ZhnlySbEwJwYjjmujvg+dZO0q8C3YEe4vjXWjKZ51RSuZ/CH6dpeh3HSViyY02cWMo26PsGWAf6k
gRQ5qkOkS8s56sAu8YDEQ2do9ANg4KHZpgUGCI3mLnSUDcaEqoaakm3TVdiFLDG54hOElMMCQRbI
UwqDVK4rT0451CNYMfdBIgwBUoavq9h2mGVTr8yRpHugBpM/LI5z1/Pl6kXsIjgq/TxiY8X8xg0b
+hn6qiUgIPodqzaZ9JkgFdAn5ZOt/aYID+lBrqoH6kFHOed1VG2EoFlNWtwhfHsMXH8R6wi0AR3x
7bmIcD1JiYkoj3xAPlDkKShB96bRi62TKqzEK4UBATral28EBczC9U3TvjkkjqVJUfd8qd2syaM6
5DCKE1UiY8ZkUIaK4460pOo0KRp+JNLe7NN6p9hRWbrC53pxmQ8KcX05fTvP/vr+5Qvs4+Nx495/
s161UR5jPqKpHIDxF513Ikj4f39iws9PpK+iNb4BybIa1KWGiMrqDr4KNQRsiDbJCnYGEobdMbos
RJBlIUIsaxwX5Kqsk3RTtEkRpyGVVWCosRQjc6/x5eAarEwYUTHKBsAxI2l/2sOUunAjiCyAGEmm
iz4aX0+Xz/+cLkQoUuyarGLoqS5KJoDDmt42AWqzojeggKoONbVIAKaEdRkPJwUJxL6wYyV4IwBv
bVnesa05GdoKS5BjxOE4r/J2c2w8XytlyB9Il9RH21G+yRO0scqcWncAvarLMGbbJGmU/uvWLFM/
MYbXhNTKgl2F7xcVNro3jf1xafc2+MrHbbHH00n2u6thQAeALlYmwYiia4VPTPGMdKI1o4uGyZTh
g6c2rW94gHwTXVylBswBRIjg0ONI9ZhGpfJJKqoaFpsYkI7GJUyeFu062rUVz3u6mwL4yyVnSVK1
4RqTpWNjxnzVfM4i3XrVGaX8vK0/fJvF+iHbWCzOqhiKK6vQnZvmnkSpmyU6CWV76OSjxdrGh6u9
OhFi/5NVTyTjy/trJXarVCxGd1VxLG3F0IoKOttUW1jnwWbWT04UUnlHI5o+H47YUGKeV9zOl9zy
ADZWsD1saH9xpForb8n62skVt4scf7r/++nx4ev77N+zLIqHGGZaIAQ8f4mykE/dQxoJazNiMm9t
gR3tNKIHKEfkDKyfzdrylQ+ag+tbN9IVEcI7G4yyVAasK+cvRHATl45H3Soh8rDZOJ7rhJ7M2PB6
WGYrzJk7X643lmR99Q2B1WO3JhMRI0FnVsrFlfiG2/EFo2AVRrss3WwbQ2dO+D4IO4XCMDZS+uYB
oYcNI4j6EEsfUPFYN7eZ4d37RBfGVRCQrtQKzULJGj0gr+YcF9rcxxC6WhGPAmaFdEUcSXloCCRV
4IvhXYTq0YCtQ7rbh1g5HzThalbjcdgxeNo3grWD71iLrKLbtornNmkjCINQR8eoKOgW9PENSd3x
gYYYauKvNBQbtEepmhx0dklWpV1cT9+wcl9Qh/17Bhp4G6Utmrew8+/M6aluxE8RUsbiEAzCjYlv
6JAjSLDPqrRd7elwCEiAK5EpHQDioc+37TYEWyKKldo1Mxxh2GY1hwjCq68/3h7vT0+z7PRD8jgY
SyzKitd4jJKUjnSPWJ6k9mBqURNuD6XKm/R9k2zqEC+wr3YZObRXmqHwGMabhA7H0dxVCb3VwA/r
Eoaf3aZNRFnteS6o0uq2ZslNm1DA/qrqh/Bh23scdO7ZPGBEFzNi+/L2jpfBgytIrOVvgI+HCC4C
iMUgsfIC3wNhXWrWhjQIQINWRLsln2oAVk96zssVjWTeGtghqVkluvpTHcL3oHEeirHuB1RagHVa
YC4nDS8EcJIaEN8aeGdb/Cddqx/ssaY5jC35WgcIohvsS4nvPo+NWlTe7Mwde0snesmTHJNzUT71
RXKLKkTQc/irW9cFW2OEtWv4e6tgVjXq3yLB/cYt+s0UmyQerHxcfYm5zj+klk0RH4aNLb3q6qCF
azn+MlTBYPV0EVcl3qJ87orReCeor0Kj2rLQI9FT4Elmw7rlKs5bHMWDRVOjOmEd6qM5meN6xC6d
o8IDQi351ILDjeHwu68wUjoVAXnE+gR7mCiFvsmY8PQzyBFvCNrS4wPfovy9B2wwV4e8isKlFHZV
hCqxWkfU3FU/6DOBqMDIdjxmidlGuzLkQIscNkZwM7G/ih0ltW7Xqsb1DW/ZOb6Po2kqtYlCDK+n
Fdtkkb+0DRkPuoLNwVAFvJgVeQD3EUdVeZYdHzm4bBzyyQJH7prYmS/VTk+Za68z117qEt2jHNIr
k1P0mQxWWRMNC9qkZbiT619Pj89/f7J/4St2vVnN+j3A92fcrbLX8z364m7TeApwAz/4pcom/0XY
MPIhzdJip4tCnh1BGsw9jwGqjS1Am+yuSZRe6bIU9PF8CAWw1CUAwc6CvtzpyuzjPWq2GnZJc3l8
eJAW++4bUOgb5QRWRHTRyo3C2hOVsCJsy0ZtY4/Nm1iZswNmm4R1s0pC05ejxW/4Pqr2BkwYNekh
be4MaHnbIqGGRI98WHj3Pb6+45uAt9l714eTeBXn9y+PT+/o3sdd7GafsKvfT5eH87sqW2OH1mHB
8ArC2OVd+MYr49zTwSYvpWKKKkQNWj2mbsIoSCIjYRQlmBIM/Yxos7luos5AoK/4MKEUnhHo7/YB
tdqvifBUd0WEFxVygrNbDqc2Kl050rURh7Q5JlLs7l2oq6OOaPDIFW99OgwIY8WIYjkc7comUSzd
4ZpQbthQbLg/9hfg4tbS8xaBZFyk+Qb9vNMUj2AIvquw5n7G/EBtktmqd/fhyOlQtgfXJe9QXwZ3
9hoYiYyFoidA7wVQls2I+9e/Jg7RPRqPh1aYlZWOZiiSUJdDAr4zK8WcbVi7+Ruxr/bk1hWvN1oi
jiQ6KooV9a6LeVLsNeHMH+8vL28vX95n2x+v58uvh9nD9zPslkSX9CEiwgekAwObOrmTc9U34QZW
nYlF0P6JeCLf/VZ3YCO000tciNM/k3a3+t2xvOAKGSztIqUljFdHnKcsas1hC3sqIc6dxlUVZQvb
JsGO5O0gImjvAIHCEHNloggM0V9ECuqWW8QLe4IRnLsLx9PgIWyxoZ/SEowf7A0DQRU57pzj1e4Y
8XOXxINcBvKdnoi42lSwacnY6iOa2fPcJooGjBUgN9dLZ9f6EdA03/hdQFqKE8HcE3OED/AGjGqS
XUAYwvWIFLR5JFJQXicifqGNLoKdI8VTnrtOSF1X9gTrzBffhA/SgAE509J2WulNqIBN07psDa6m
w6REcU0da0etkT1NND9iLOeSYD2vIiUKk8JFfGM7K4K9AnBNGzo2udGQiUqt6RyRp2aEPY8pXBau
qoicejBnw5jgE+Bx+JGWUNNVa/g9Z1XrPFCw6Q21hesJmO/MNU4Dx/c0eQegTwJbFhLDtuv+zVIq
Cjahra5pKq3aoZ+pAWjoMavLPTppjG9xoDvf3k8Pj88PWm7p+/vz0/ny8u2sRiEKwUqy544h3FKP
VUOKDS9e5FK7mp5PTy8P/LFa/yoTjHNgRY6WG8YLWCIk0zde2IbUo4By1OBuAwfXahP5GdB/Pf76
+fFy7lIw0Zw1C9cWhqcHqInVBrAp0tRP1tuHyXs93QPZ8/3Z2HFSR5GzHxALby69+/uw3N7lFBkb
X9GyH8/vX89vj1KnLAMxywH/7cnOeoYyeA2wU/vn5fI375Qf/3u+/Pcs/fZ6/swZiwyt9JeuS/bs
TxbWy/07zAP48nx5+DHjcoqzI43EtiWLwPdkWeQgY86zAa+lTRvnhanWLgLq+e3lCU9QfmKsHWY7
agCovpaPihlfxBFqoXtn9Xo+/f39FT+Cks6zt9fz+f6rFNaMphA2ip1R3cX30cz68Pnz5eXxs/RI
rgeNZjpr19UmxN2PtNUoUtjysSqkX1qh59aaDHFcMqkc/N1GsCemz+sRy68iDUWBHs8drTyTWPRb
Dr6Vq0vKxWCgGB9tflMx3XmLDi43FLCs8IxGZHDAVeUteXA04OvwVi/wkK5qnnpOw3Qu0jHe5lG1
GQ/HBwI6ceXI7G2uV4l3ZlRddCLpAYuXqEK3rqK8G2A1SWV/69Meom16Q7LeR/3t6KiTgdRzx4hG
m9Pb3+d36l2pghm+PqZZGx5TFIW16JmZJlmM7egeRA/nFjlexmD7WCvtafGavseIKTy+iR/y04hC
9iPc39LXtpQj4yT7mOyyLllruFaNtiD0yegrQ59Q5UmWhUV5HMlIqjIDe/NYmiLbbm9BCIqslG/a
OsX59HL/94y9fL/cE26p/Di1LdeiezVCoI9WYk6YbMfqqEX7VHDv6CVGySyJErbDHKEKfMgtMYCn
cy3YE0RlVpoPd+PbNqxW+pfrpslry7b0D6fjrGPlHY9XCPKElcXcWHV5m6kNqeNQZ4XtCy+9Uk13
92+q5dAEmAxZqagAi38xMC8txyxfOvNrze4HLO6SLGPqYzrDxeCTbOQsbLKQLXQWMIm76ZuqTvPQ
0VoDIlonKhQvwTd1lzey0qvp21GlDGP0G3RqT1RU9AwL6/ywyPmJqXIVPZHwFB9VSq2gHY412mwY
HsAp/mRrloFg5lcGpzwWISw4lbkH82ZHiFhVx8Yvep7+QLWODZm4Zdt+Tkc5Bc2bvZL6qsuJAus6
rYrGLxuDTCV926HPqIVpGNKjcO60DVwU/7yWMvqOUPLMp8dWe1V3YYwO/qagoUSJoZ+awYptIug5
2yIm1jAuKeh7fACGXTz3VqLBTypaYcKEabYqqZvFtMzzveBl1a2faCs/3s84cladHs780mdI5DFp
8O7rtGyrTROuRNcbFdNNBPYhwRQlRGjdR/wIGpeX2nuoa8tRff728n7GtBiUb0ad5GWTwOJDbyGJ
j7tCX7+9PeiLW139H2lPstw6kuN9vsJRp56Iqm6RFCXqUIcUSUkskxLNpGTZF4bbVtVT9LPl8RJd
7q+fRC5UIhPU65452QLA3BcAiaXiluJa/rT18KZU9HW/QcBi7raQLKkSDk6fL08yc8rZ50YhRGv/
wr/ePw7PV5uXq/Tb8fW/QTB4PP4uBixz9A7PQggWYH5KqQGQt1GXsvWODbELkqC8Fv8xviVj0Cia
pdgFm7RYL5C+TeGqHkeLa0QjVetB3nlyGt8PWKqdpfBVJd2ngH2BxHP0vjvT8LVg4alDWJHUIZPF
2DI90SZ7S88C2bKCesvqsXzRmI03fzs9PD2enulOGp5HShPWaSrKmItLlrfoSCDLUvL/vv7b4u1w
eH98EJvo5vQmeO6BJXGzLdK0y9dCrCRdMmvGpFE/35QoxtGPqlBvyX+t9kMVy3M03ULnyFXifat0
boLh+vPPwTIVO3ZTLS+ya+s6J6skCj/HFW8P/xjcVuI+TavsZuCqFRuhYeliiTaKgEMK9O62YTW9
FQUFT2tx1ZBtJdskG3Xz+fAdciQNzjgYj4MpBltngoUjGi0pwM1TnNVn4UZB+bxwQGWZWoaafbJW
u7cqN2uVAWKovtt0zfl5+9koVjfkGJA9tViJTWr4DaJSiMkg79plg57X5YZVvBfxFWAlSxmOTM53
MZbb2snk2JNFHtlQodbL6Fay1epcMQfH/vj9+OIu/LNwW6z3Qrbe2scD8QVu4H1Lb4N/78bp2XEI
1rVbNPmNaar+ebU8CcKXE4q+plBC8N0Zb/DNOsthKVqinEVU5w1IrQyyIz6TBHBUcrbL6e/BWInX
bPBrxnmxy92We6bC7BxqSGsLdIe9QejynWPtghCmlPUmJdNXUrR1XW393imSfhVnC2tf5vs2lTHQ
VOynPz8eTy+ar/D7pog7lgn+Xmm3MAJbD2lgxfZRFMcUHNvXabjKUG3vbINo14O5kTRJn9lZvuBf
omxayDRORf7RBLyKY9tDTION+b1lqSxYxcb2qM6s+/i3ezBr6da5baFu5DUbZkJ/QSBRGWnXarCK
bkXrLQu7KeIH2DcskFzbw7rUCuxrgcFgWdza28rWTwH+GjRgnbIpssDaRkpwQVRd6t8Fx0XpbzxS
WSuXPpSGJLRJ+K1xrXp2wIacqkY0zeytf/ONjbLFNTgr/TrL9iUEXkAvEhI0oEc1WGS8L4HT0AOQ
VDrPrmH7KhbYOQrE79COsyF+j0feb7eMVGwjadFW2iWdoZKexnDb/zJjod2YjEW2yUtWsSYbTVzA
zDEla7KBNBpyoltdbwQqWWKAr/c8QyVKgP/+g7D0XF3v098gfpmd/CKNQjv2qeCEpuMYhdjXoIEy
DdZ5ogTwhE5cUrEE0rUjnwew8aZNPBSOenGvZNoQ6w1dACahfQ7zlEUonhlvrxOI1f9lA+YsHtm8
wv/nZVlc5MuKiR0t2BznhXk0CxpapQyvqgN5seD5eUKpZAAxQ8FzJYSyB5KIxCEdTwdKndhBMtXv
rlgIpkFGxCnLvHRKOhPQryPwNDxBb9rid9IFGJKM8O9ZgFoxnUXOcCYJ5UUoELPQJZ2N6fRtgJpR
aiIlrLKKxVkIvADWuBegNJFgOxgPm8ERsqzZQGrofL3Ly00NebLboYhI+iJENYL2t2yAIVE1ajCo
Pqt9GGPiVZGMsTvRaj8lU9Lo0DX4cyGGTjO3Z2WdBskesoiTFsd1Clb83kdtGo6npP8HYJLYI57R
Nk8KR+ZXYvtgFFp+zAAIAvtuUBCk6ARQNKENTgRuNqET+KR1FI4sf1sAjO3Q4ACYBX4uJQgfWLWT
eDoFq2B6DNdsO01sTgxeI/B0K5ZRLS+kQoZgncu7ZjMwPdqLApXF61x8hCaey1mHwCzK8cU+MSG5
NyB14nkX7oKyBc+qzn3ytHF0S1uwPEtHSYDWkYGScfQNcsxHoXWcKHAQBpFl56mBo4QH9kgb2oSP
8JWkEZOATwaMViWFKG0goIRCT2ekuYxCJtF47NXJk0lCZ/TVFUo3poEyKyGH7PHUQtStMh3HY7Q2
29tyPBLyeDUwGbflBNBmvWnwbjEJRnjStbi9N+vyP7WNkgHBr3IUShzYoiaXwW6JMq0vtJr39bsQ
xp2LOIkmyBzJolLc8bfDs/Tw5Sr7HmKZ4SGuq1cdz9d8ICrvvMqdpJ8akaY8wedAwW7cCOY9rq74
dERGaoC6iwZCVfFlHSFLW15z0h1xd5/M9uidxO2k7OXq+KQB0jxHxY63zQZoAnt2IK24HBuuGW+l
nee1+c4q1OZ1ea2/W23p8B9+EUgoap1qaRwSMhycPphw6gbI1yvXFs3UxaPJ2OZO4mgywr9tGUH8
dtIaAGRMs1sCgYSvOJ6F4PzEcw+KaohnUYMp7HC84vckHDdYlBE3aTBBTpctWKWH+LMEcWrw25XZ
4slsooff7uE0pgxVJCJxSSe0MCoQeJynHoc7lJpTbPiEFHGzegPRRjCvxsfjAX7bMDviC4oNmISR
PWCCYYiDqcNexEk4wEKMpyEWrARoRgag1Ncls69oA3Ic4lvlCJCE0rkV3yYCEcdTWq5S6GlE8jsa
OQnQnaiOf2doLCvMC7uptxF++nx+/tI6WHziq+QR+U7wpY4qROlGJX4Yo/QhyIvLI1HaHPq5w22b
jjh3+J/Pw8vjV29U+i/wI80yrvO6WHY/8tn24eP09rfsCHlg/v7ZB+nvF+nM86lGL9oDRcgy6m8P
74dfSkF2eLoqT6fXq7+IJkDuGtPEd6uJ9vG1ECIBOp8EYBrYl+N/WvY5WNPF4UGH7B9fb6f3x9Pr
4eq9v3H7FoEaaoSd4xQwIC86g0OSqlRlTZwy9g0fDyhU59UyGIgRu9gzHkKCKVqUq+ptNIpHAwoR
feFIplzqdJw1q1EQfPQCGpyHDfq8oNtl5AXYdrafP87q0j88fP/4ZnE7Bvr2cdU8fByuqtPL8QNP
yyIfj3HkawWinEdABz5Cics0JLQXGlmfhbSbqBr4+Xx8On58EYumCqMAp4JctQNuQivg/MkIFKuW
h3ZyKfUbawc1zFFwrdotec7zYoqUUvA7RPolr0/qcBRb/wMc1p8PD++fbyob96cYI0KbOyb9qzTO
3QISSLKq86oIJkiVCr9dVaqEIU5isd/wZOpEotSwgU3RoxUzcdZWVnuSGSjWO9hmE7nNsC0uQtE7
0KJwZk1vsZJXk4zv6ZtgeCLsjQoDCxFjMadpoOeHA+WGL6NSEQffb1nHo8Dhcrag2KBPJlYKBmRE
O+6xOuOziF4agJqhuV4F09j5bevgUsFtBIm1MwBg8z7id2QnQk0hdgliQAAyianZXdYhq0UX2Wi0
sPQHhrXnZTgbSbUNibEDvUhIgNmq3zgL6DTJTd0IMd/qVNk2sR3QvtyJE2ucokNXnGPj4fTUCkkF
a1tvWKBS9Z2tEetWzA81IrVosow+YzWOF0EQIV0mQMa0uoG311E08MwgFvx2V/CQYtDblEdjOxiO
BNhPN2bwWzHU8cRKtyEBCbofADQlM/EKzDiOrN5teRwkofXSvUvXpUxd7UAi6zDd5ZVUTJyLURA7
Wd6unAQJOpvuxbiHoZtlQW93vDWVicvDHy+HD6X/JzbtdTKb2sIW/EbTzK5HsxnJV+uHpoot1/YR
2wPJZymJwLGx2DIKcLjTqkqj2PGVw2eeLEaxFK5wbKq+hD4zJN7KWFVpnIwjfydrhO7VeT066KGn
LEPXVFHg3yxDZEOOUeSs/lefx/r1++FP14IKNB1b+pZA3+gL/PH78cVbNda9QuAlgQnQcvXLlcqm
/f30csDC0arRhsDUm7CMbtZs69Z6hHZuPJAdyxqVMbhSgBbXhh/HwUsI3H+sxuDa7viCU7X0Q0F3
GIkLr6cPce8eyQftOKSTfYPjuf20KWTxse05KAH2naYA9hOCkMjRzQOAIAowIHYBwSiwjq22LiXf
izwUyV6RPRYjgnm+sqpngXcBDZSsvlYS49vhHRgY4gib16PJqEJGePOqDkkuMStX4oS1E7HXkAXe
4o9rNOp1GQSx+9s9AjSUfjEUyCjAvH3F44GXGYGIpv6C7+omHwhU08ZjUuO6qsPRxGJ972smOB5L
xtQAfEgboGE0jUjtDv6ZD3wBZ8h3Qu3Mo1kUD19S6Ds9w6c/j88gSkCc5qfju3K39eZbckkqpPx5
VRUZ5Hkr2rzbUbupmgehvXlq5extOKkFOPziDGi8WZCiId/PYvtaBzpri+3KOCpH+16l2A/gxb79
H5xZZ7TQBF6uIySg/aBYdWYfnl9BV0PuL9CszhJ8FBWVSv6xUaaP6O4u97PRJCDFaomy56GtapTH
Uv6eYibsjg+klJIoMn8hSOtBEqM3E6qP/XK4tQJSix/q1McgKwuDBdVOO3aLAbwq5jvKJwhwMsJh
hAsHk2AZffwLl2NeXQeKknFJs0p5/KB2yWiCSYxrgfdVtwbjttOSiRDlWNRN5owO3KpuQeZapl+G
BEF7S0VH0hgI5/Wrib7Q3Mg0o340dIEBk0hLrS5G3w7WDVG7GgZ0Z9imqm2STRNcdwjym/R9YjbI
jIpgRlIoTZwX6KHaoEV7yP4aguaeBR5Vv3zHCTCCoq1nBkgbMrTpVnfCK3KVqGZRFhf365p3S7sj
kMrBBIUVXcxyZMAqsxI3N7zNBzzOTBJQUUq6qebFekjh7E5ZX3/N0mvsaiszKthOtqiTgGPtakob
uWj8ngekAkyh53lTuvMl4crR4kLBmkK/1w5WsOLZtV882JsMfgJcbdktb/3PSrZuBxynNYF6xblA
IX1zfoRXMfI61lwaALDVuIAm3SkRhbLq33BvviWiduw9JIanZMIPjXTCQmsonDVVHcRTorhNCnEQ
hkvcrveFW2ArAy6ndghLhegDKg/Au2W5zf1G3N+t6SlVgTLNOiqiyYDS3qGbhFiFphim1R1k+H2X
9vznQ1JnMJARBr4IoM4hjtAANq+FMrR7u8TIPRSAbjkBVL7LTuRyjJ8UVnX+5zPvc5ciHkkS+qFU
9gYWdzIHIjroTU/ULfflf0D2gyq7ZRAyr7hBqgjCXKGVAjTp3XINYRsEarA2sNLjzcAw907z0JDO
m1NAr7lEulWveSinOmvoXBPy8wbqZi2tou0phleAbjvZdXFVr9NcrIzBws8kKyoSpk3CxV7EeSIA
C9yZOJaT6ubiMoOM2+V5nQ7SqX14obtqQwMBnoZVAbcK3KBqG2BUIfMbq0lCOHU1dLtmDwH7qEHU
FI1gFwZWImsET8SiaQwEabnlkNlIrRM8kfLS9Cbbp/A6V+3y+bYTVYg2btuqoLHJHvrvdb/esy5M
1oJj5kXqtqlHXthlQANNcs6WqqqjCxMl/eS9xgB0a7tCGOCeEyOWCh67vryuWF2vNuu8q7JKrAtK
YgOyTZqXGzDqabKcu7VIXuhiLfJmvbl4rjUMAkJfLEXZXubryDv6bCLjkyQXbMYL/xbpSajl2iO9
lBIWkeY5s1oFjsGzoZFyryr0F4Gm6jZePBfWUn+p662IvreRw1dDT3XxSAcTLrBbDaJgBH0ZPN7O
hGNN6F2ibbEaj6aXbmEpmAm8+OFtMenKGMzGXR2S8p8gyZjmCtxvsyoJJvuBmqVoqpl8fC8JXqsu
6jzCMyegy6oAv9TS7aLinSFrCCl7YDbI+hT8B9MhH9yUanTDuHnktCNumaN0nTWbIiMb4Ubjyphl
X73eVXnl/HRVDAooBbLCiuF0Bm/STYvSECmU4dpyiH5AeZxhMijjyy0DrPJl8ZQqRRx/+WLLEfOn
jpyFW+OZCTb7XH5JDbQhINsDXMNQe/TgyTUNUZKsser3nmkv+kTZe6lRtJwBdVQD9Yk7ResdZHdY
1jb7r1I26fG29IDKNt0pR4ZeMTBlA3J79fH28Ci1n1ZMZkPfkk6DcgO0VoIZA+mWLXLH7uHirCNn
pieoW/qZqifw8kmeTT78Lph2geR1biX86qplY2Qyewm5uI4NvPeysgWVTt10Rd25psduYYaYu6YZ
PQVIZt2AgNgTaTtw9EzZI4s0H48GcJWQjveb0LEwAaybtVy3dNHk+b1JnO0ZotcQxv/shG6X1+TL
YmO9u24WNFwCs0XpDYaAdYtqIP+pIWAL6lZAgwnZD2uc7X0xkEu9zcmoIxCFVvRwL6Vs9w3T94mv
tuAUsJzOQiuKrgbyYDxKMBQ7OQOkqrQNjv/66UVzqcVJVKMjihdkMB5eFhWOki4AOiKDinxgbbAm
Vbk0LQuVzRbg6GHZertM15Q2Gb+EChrH2SS/yakjFIJM3WxZBnnqrWFwvMiVyegRYlXKm9WagR2D
95Y2FxMNfnQcLU6ImMghrXlqJQbP9xCjaAGZScTJ321wggKI8d8BwsmTbC0oSHza3NWQ7XqIYpc3
Tq6HHucmsc5cQKEAMqgAahkbzMNws9201llXN2JiFbC7Zc0aBchXYCce/s2iarsdesZSIIo9lSWk
rTWkbNtuFnzc2UyEgiEQ3D2dLdOkzl2uswks6OfFjRjVkt11RESm9OHx2wGnvOWpOP/o0BOaWimu
3g+fT6er38Xi8taWdEdcYDEIQNfDXieABu1dS74vALaGKB3VZl2AN9gXQgkupMya3Doxr/NmbY+g
w6i1Ve39pJa8QuxZ21pVCq5Cxn7Mxe6xNz/8URNnv7r6w2QxsJDyADaOSuhB+VqvS2vaxQ+TU+HX
n47vpySJZ78EP9loyCwsR2ocTfGHPWY6jMFWQwiXDBgtO0TUundILtVBKd8xCTYmdXDUe7xDEg70
PZlEg5jxIOZCX0gnaYdkNvj5LPrh57N4eChmpHsiJhkP154MpHYCooJvYN11lMcfKiQIbSN/FxW4
lcu8Mz+sdWiGDd6ZXgOOaPCYBsc0eOI22SCmP2w2aY5pdysaKpt8hEcETmuvN0XSNW5xEkrxgYAU
HC/IYWyNSwJwmgvGLnVLUxjB7Gwb6hmpJ2k2rC1ksf7nd01RlgXpfaxJliwv6bqXguOmg3kaCsHg
l4zMettTrLdFSxUuR0K0+sK37ba5LmRCSvT1tl1Qu0LItLDy7etQg7o1RE8qi3vWSr9KHXuRvHwR
G6e8Gw+Pn29gj+KlsbrO79DtC7+FVHGzzSEAuHu/m6s0b3gh7iHBAgl6wQotURlzXQ71Ct6ASjpT
1Z6j9yhuz8Bxc7psJThIIT1Bx2m2hefpFrjBLhMSvnyUa5siJXloTWnf6SuQ8VesyfK1aAHwhOmm
vhMim+BRmWIh+po8Mro9rWhsKmkgV7NK1Uy0xmQ9Orff9porefXrT+Bb9XT658vPXw/PDz9/Pz08
vR5ffn5/+P0gyjk+/Xx8+Tj8AVP7899ff/9Jzfb14e3l8P3q28Pb00EaXp1nXYfBez69fV0dX47g
K3D814N29uq54wLeXOElf71Z25FCAQFPyzAydsY5jwLkXExgxbsjKzfo4bb3brbuWu75KlhDG6N5
Sd++Xj9OV4+nt8PV6e3q2+H7q/TaO7+5SnLBVNVkEimFZeWS2aI/Aoc+PGcZCfRJ+XVa1CtblnIQ
/icrZmcdtoA+aYMSdvUwkrBnFJ/dhg+2hA01/rqufWoB9MuG5yGfVJynbEmUq+HoWROjwKBKRqeV
afKGZ9SQ5/sWIm3jnHqaZrkIwqTall6r19uy9KgB6Pekln+9EuQfYo1s25U4BYnuuae8Eqk+//79
+PjLPw5fV49ynf8BOd2/znvYzK6TjkdBMyp1t8blaeq1OU+zFQFsMo50fKaH22aXh3EczLxms8+P
b2Dp+/jwcXi6yl9k2yGxyz+PH9+u2Pv76fEoUdnDx4PXmTStiOqWAyYs5qOVuMNYOKo35R24tFzY
6vmy4IHtoGM2ZH5T7Ij+r5g47nZGiTWXXrDPp6fDu9/yeerNeLqY+4ujbQiYvz7zdE5Ma9lQab81
ckNUV1Pt2hP1iVsYwpv622FlhtVf0Jngi9pt5bcdAjX26vGH929DY4aynZvDrmLUHtmLjlxaBLsK
+30b2/XD+4dfb5NGITFdAPYHa0+eyfOSXefhfADOiR6I4ttglBWL4RlcrhjmI80s/nBlV9nYG8kq
i31YIda0NI3w+99UGewNv+WAIGOlnfFhPKHKi8KRv9dWLPBoBVAV4dYtEDHpLHfGR34VFQFrBcMy
3/h3Zrtsghl169zWTs2KtTi+fkPa6/5s8TeVgKlgsW7RbL2dFzSjayialEyCZ1bZ5haSkRDLTyFM
/mZvjTPIMlIw/wxiIAw4SZ8tXExdAwJO5mDUd1DOvaIW5sp0y7pesXtGSWhm+ljJGbGazOFPLZ08
v1Rg3tQqQqW7dsZE89qcel4yyNvNQgmAJPw8rGoBnZ5fwfvCib7QD9qiZG6wX+cSuCdTA/5vZcey
3LYNvPcrPD21M20ap26THnyASEhCRBIMSFqWLhzHUVJPasdj2TP9/O4uQHLxoCY92cIu8Vws9gWs
Bb67eBP1o9hfRMOEsnWWGOi+afOI5s3Nw6dv92fVy/3Hw9PwDISnUIx03ag+q1OiaW4WK8pwG3WP
II7tpyBBVl4Og9P0BP0BRtTYe4VZpyVGMdS7+PCBtnr3UD5XMf65+/h0AyrN07eX57uHxFGGd6pT
HIDuWtsjYYjYPIWThFkSP/m5RUkJDAhMSmsxXmq/Yvlw+oCoqfby8vwUyqlOjoJEqpFQiEsizZ4S
65RYJJpdWUo0E5CNASOUmGNlAtbdonA4TbeYRWvr0sOZXLt/vP6rz6Rp1VJl6EQbPWiTR2OTNe/Q
o3SFcKzF4qTMJ64ZV8kUKwVVvB2yYEdOOgtFRQI/9r2bKzRm1NI65dCnRt0M/G6W2vFpgc8kux/P
PoNKfbz78mAv2Nz+fbj9Cso689ria3wYp0kmnMsfb+Hj42/4BaD1oLe8ejzcj+4I69TgxiHjOdRi
eOOl+nZwq9KxyZ4zFukqF2YXtpcyF9mKYQNmm0I17WzXJgziEvif7eHgD/uOyRuqXKgKe0cuxuXl
+ApDxGQmAhKRL3WsCgQbzIDNqHaIDQeZp8rqXb80uhw8oQmUQlYBNNMmV/x9R6NKCVpwucBU2yx0
BslIFHG1daYw/YuoY1BQ3LRlPTwxzbhGBrogsGqv6DzY+rAn5wVqaKjter+C3wMxDwqSZlYfAZiD
XOzeJT61kJnMzhZFmO38cY4Yi2SqKYD9GcghM/Jg5t2YAC5ptZs0LrvXGOo1RlS5LtmETCCQKSjU
F6+sTouPpRjLEpbvkVPDGVp4HlGQN6Y6eOk6S9SN2KzuqdN7LOYDtiX99buUIOqAFDdYZ2E1vRL8
QTdXKEyZKmvXQPwRALNwxvUusvdRGc3odEd5HFu/2vPrbwxwvWeLgylvGl3o0r/QMpWigZ2n5vVg
UCuHUcDKlSh6VIn4WYeZgGBLX2H+JyNYNMUar8ZpL+YRi/KSxUvk9LB0VgiD+TPWJGSxyk22pm+a
XZUR7lKbad+P64kQgWH7YbDawC5WhTVOe9ux7krRbHq9XJJRO/HdqtCeQQV/n9r7A7cSrQZdmdNJ
Vuz7VniV4W06EFxS0QplrbxXeODHMmfzolVOEV7Ah9l8NxhoWCjval+Ngf8pP5RevBerlR9ohCfY
aQ9SdNr4foXhsKfSx6e7h+ev9qbz/eHIvQ0saAPIyuaqSwZtEDQTReGfM5SsCHO4FnCIFaOd+u0s
xodOyfbyYpxfJxBFNVwwmtpVAvP3zNLUrlxoFAGlMYDpveo6O/RRl7v75/Dr8929O+WPhHpry59S
EyUrsmGXHSrca5mk1qWBblDU0eX56zcX/srWmPURO502IBgpcpvDrUmFnq4l3qjFG6ewVbipW2PU
GQj4ACmUH+1EE4dSFTkmS9WUos3Y2RFCqOe9ropdwAC2omrd4GpNbIgHNvFyjydQ88AvMpgTKTaU
rSKruyRdf/eS/MCT6zm6zw8fX75QNmj1cHx+esHHtfz0UWKlKDbJpDJIuY561r9u0SR3LZUDKwPx
vByy0AQZ9k52ym8TQ5xkEU9amIWFOwfHelmsFm4lkLHxcV9uPbKVIXTgvWnAQNzDJvTYF1Stt1U6
TyjpNFo12ic8v7yv0A5UqXY3i7GXRsezQEhGLpP7xaIAEwUiTu8oR/6FSN0wcEDypXbIijzlCzZ4
7oCyyuP9HrRxldqxbiUpyw25X6Ppt9sBbyeFPm/WOwz8WxZ6G23rNDDL6LjeCCTTSK23xfTp5Xnk
+Z0oK2hqba/AW+M8Ip3pb4/HX87wbc+XR7tR1zcPXwLdBy/QA3vROunH9eAYytrJy9c+EE8l3bVT
McamdvWY7ICxMr1sZ4GYvRzTTJQcjVr4HhzXtXO+6NhCv8ZbTC0IMInBbT8A0wSWmusVZxGnJ88G
hADz+/SCHC+x0S1hDvGrPr1iaEM6kV2qypCEcao3UtaBtmo1XPSfTezsp+Pj3QP61GAQ9y/Ph38P
8M/h+fbVq1c/s9dKML6Y6l6RUDNmR+XxolfJcGNeA44qJH3TwjHcymtuuHOU6pJoh+UTejDs7dbC
gE3obS3alP/VNbptZBk1SH0MmCuW5bJOoSaKraQK7cv0Jzh5KFkPUmHjN9QDpbedkYGmMo0rkQr2
/6znpO8Dz2iN4Oo+iQsw+L6r0GgPlGm10XAYG8ulfQ7y1Z6Sn26eb87weLxFk4uXx45mQDUx33SF
IaNP0ZAFUey4slLLFAuFxwcoWaIVaDjBl86ioHZv2870OOxHZmAqqlaJIpE8N+tS29pbQy8PR0fp
+aJQAwYPvmUQPFtIWBz56Jtzv25az5l65YeGMZrhDSOv/9Fm+uCkPZOQ8waaFSClZLs2mSS2ouff
oE+Medvf+JJQH5Af/QS9ztvvpEGF+dVsIj/E98QU+ANbpO2brULpN2yZVUVbfAuI3AQW1Tcon6kh
+DxwEJ2HEU1ECccQrtbwzUygvZQlUKtxKQrT4g++JwOatetNSn+iwyTs7HoLSzS3Ck0Fsspat7OA
UaiJpwovV4kK5hn4/hKvVfkPxXGYpPC2uUsGhCAq2NQCbcT2S5kUMQZk2AMDWrwsMcR1ZpyE6S4P
jcOSk6qQqSUjKQGJ9KF+AbS+LoVJEygD38dtiAIlQzL/p2/aWETY4cAA6ohFTBudNTiHHBNWLvG2
iTtUJkFD4CswMV/79nh4eLo73nrMjVsm2sPxGc8aFHYyTFp684W9RbnpKsUOL/oZHGi2TF5TBwLY
wN7REKCNW5jwUp6Rp7DZJUGKjOR1sEtIqgjVCQ9oNRYSB+Zxlnguz4C9pke9NGUUtmI+SPOZvnIk
w02lpqssG4GJwvUnD+4kOGzytvToGj1Q5CRpgEGlaFo6mLdnB5GApIzZQ2qB9spgyTw7pw/yzJzB
sQbcBZmL/8Fg6/NlHd7xtbzOuzJ14thxWbubDQZm5uwB2GTc52y9dVDc6uug1DmG/MKFakvhXRgf
ioEKi1SoA8G7TrFgRCq6Dsy7VDiqgH6rBt0ELWr1AcDFKvEilYug0mJTRh2+KucJ2/a4Qd4fRF4P
pK1AjYYheyyPf7xUpgR5kucCo5tkPjNgDhNchBE0O4nExqIVpRhwP9CdIKCsZ3D41REBWVvtPP2Q
m49r+EN1rnQyRMly1rR7klVGUdi+Z5JE8VI1DRJyrrOudGlL/gM1hhBI1ZABAA==
--===============7818263516963525489==--


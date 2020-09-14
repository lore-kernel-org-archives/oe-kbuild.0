Content-Type: multipart/mixed; boundary="===============5652909092751051990=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/aty/mach64_cursor.c:156:23: sparse: expected void
Date: Mon, 14 Sep 2020 19:47:19 +0800
Message-ID: <202009141909.4MpXGbEo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5652909092751051990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Masahiro Yamada <yamada.masahiro@socionext.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   856deb866d16e29bd65952e0289066f6078af773
commit: 80591e61a0f7e88deaada69844e4a31280c4a38f kbuild: tell sparse about =
the $ARCH
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-s032-20200914 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-191-g10164920-dirty
        git checkout 80591e61a0f7e88deaada69844e4a31280c4a38f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/video/fbdev/aty/mach64_cursor.c:156:23: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void *p @@ =
    got unsigned char [noderef] [usertype] <asn:2> *dst @@
>> drivers/video/fbdev/aty/mach64_cursor.c:156:23: sparse:     expected voi=
d *p
   drivers/video/fbdev/aty/mach64_cursor.c:156:23: sparse:     got unsigned=
 char [noderef] [usertype] <asn:2> *dst
   drivers/video/fbdev/aty/mach64_cursor.c:187:25: sparse: sparse: cast rem=
oves address space '<asn:2>' of expression
   drivers/video/fbdev/aty/mach64_cursor.c:188:25: sparse: sparse: cast rem=
oves address space '<asn:2>' of expression
   drivers/video/fbdev/aty/mach64_cursor.c:209:30: sparse: sparse: cast rem=
oves address space '<asn:2>' of expression
   drivers/video/fbdev/aty/mach64_cursor.c: note: in included file (through=
 arch/s390/include/asm/io.h, include/linux/fb.h):
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
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
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
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
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
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
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
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] val @@=
     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] val
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D80591e61a0f7e88deaada69844e4a31280c4a38f
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 80591e61a0f7e88deaada69844e4a31280c4a38f
vim +156 drivers/video/fbdev/aty/mach64_cursor.c

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   67  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   68  static int atyfb_cursor(struct fb_info *info, struct fb_cursor *c=
ursor)
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   69  {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   70  	struct atyfb_par *par =3D (struct atyfb_par *) info->par;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   71  	u16 xoff, yoff;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   72  	int x, y, h;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   73  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   74  #ifdef __sparc__
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   75  	if (par->mmaped)
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   76  		return -EPERM;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   77  #endif
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   78  	if (par->asleep)
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   79  		return -EPERM;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   80  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   81  	wait_for_fifo(1, par);
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   82  	if (cursor->enable)
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   83  		aty_st_le32(GEN_TEST_CNTL, aty_ld_le32(GEN_TEST_CNTL, par)
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   84  			    | HWCURSOR_ENABLE, par);
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   85  	else
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   86  		aty_st_le32(GEN_TEST_CNTL, aty_ld_le32(GEN_TEST_CNTL, par)
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31   87  				& ~HWCURSOR_ENABLE, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   88  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   89  	/* set position */
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   90  	if (cursor->set & FB_CUR_SETPOS) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   91  		x =3D cursor->image.dx - cursor->hot.x - info->var.xoffset;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   92  		if (x < 0) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   93  			xoff =3D -x;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   94  			x =3D 0;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   95  		} else {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   96  			xoff =3D 0;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   97  		}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   98  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16   99  		y =3D cursor->image.dy - cursor->hot.y - info->var.yoffset;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  100  		if (y < 0) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  101  			yoff =3D -y;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  102  			y =3D 0;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  103  		} else {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  104  			yoff =3D 0;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  105  		}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  106  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  107  		h =3D cursor->image.height;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  108  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  109  		/*
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  110  		 * In doublescan mode, the cursor location
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  111  		 * and heigh also needs to be doubled.
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  112  		 */
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  113                  if (par->crtc.gen_cntl & CRTC_DBL_SCAN_EN) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  114  			y<<=3D1;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  115  			h<<=3D1;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  116  		}
2f682fae611df6 drivers/video/aty/mach64_cursor.c Krzysztof Helt     2009-03=
-31  117  		wait_for_fifo(3, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  118  		aty_st_le32(CUR_OFFSET, (info->fix.smem_len >> 3) + (yoff << 1)=
, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  119  		aty_st_le32(CUR_HORZ_VERT_OFF,
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  120  			    ((u32) (64 - h + yoff) << 16) | xoff, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  121  		aty_st_le32(CUR_HORZ_VERT_POSN, ((u32) y << 16) | x, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  122  	}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  123  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  124  	/* Set color map */
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  125  	if (cursor->set & FB_CUR_SETCMAP) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  126  		u32 fg_idx, bg_idx, fg, bg;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  127  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  128  		fg_idx =3D cursor->image.fg_color;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  129  		bg_idx =3D cursor->image.bg_color;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  130  =

72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  131  		fg =3D ((info->cmap.red[fg_idx] & 0xff) << 24) |
72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  132  		     ((info->cmap.green[fg_idx] & 0xff) << 16) |
72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  133  		     ((info->cmap.blue[fg_idx] & 0xff) << 8) | 0xff;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  134  =

72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  135  		bg =3D ((info->cmap.red[bg_idx] & 0xff) << 24) |
72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  136  		     ((info->cmap.green[bg_idx] & 0xff) << 16) |
72c24cc51aef31 drivers/video/aty/mach64_cursor.c Antonino A. Daplas 2006-06=
-26  137  		     ((info->cmap.blue[bg_idx] & 0xff) << 8);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  138  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  139  		wait_for_fifo(2, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  140  		aty_st_le32(CUR_CLR0, bg, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  141  		aty_st_le32(CUR_CLR1, fg, par);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  142  	}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  143  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  144  	if (cursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  145  	    u8 *src =3D (u8 *)cursor->image.data;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  146  	    u8 *msk =3D (u8 *)cursor->mask;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  147  	    u8 __iomem *dst =3D (u8 __iomem *)info->sprite.addr;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  148  	    unsigned int width =3D (cursor->image.width + 7) >> 3;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  149  	    unsigned int height =3D cursor->image.height;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  150  	    unsigned int align =3D info->sprite.scan_align;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  151  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  152  	    unsigned int i, j, offset;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  153  	    u8 m, b;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  154  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  155  	    // Clear cursor image with 1010101010...
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16 @156  	    fb_memset(dst, 0xaa, 1024);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  157  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  158  	    offset =3D align - width*2;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  159  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  160  	    for (i =3D 0; i < height; i++) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  161  		for (j =3D 0; j < width; j++) {
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  162  			u16 l =3D 0xaaaa;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  163  			b =3D *src++;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  164  			m =3D *msk++;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  165  			switch (cursor->rop) {
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  166  			case ROP_XOR:
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  167  			    // Upper 4 bits of mask data
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  168  			    l =3D cursor_bits_lookup[(b ^ m) >> 4] |
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  169  			    // Lower 4 bits of mask
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  170  				    (cursor_bits_lookup[(b ^ m) & 0x0f] << 8);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  171  			    break;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  172  			case ROP_COPY:
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  173  			    // Upper 4 bits of mask data
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  174  			    l =3D cursor_bits_lookup[(b & m) >> 4] |
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  175  			    // Lower 4 bits of mask
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  176  				    (cursor_bits_lookup[(b & m) & 0x0f] << 8);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  177  			    break;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  178  			}
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  179  			/*
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  180  			 * If cursor size is not a multiple of 8 characters
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  181  			 * we must pad it with transparent pattern (0xaaaa).
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  182  			 */
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  183  			if ((j + 1) * 8 > cursor->image.width) {
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  184  				l =3D comp(l, 0xaaaa,
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  185  				    (1 << ((cursor->image.width & 7) * 2)) - 1);
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  186  			}
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  187  			fb_writeb(l & 0xff, dst++);
43751a1b8ee2e7 drivers/video/aty/mach64_cursor.c Mikulas Patocka    2014-01=
-23  188  			fb_writeb(l >> 8, dst++);
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  189  		}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  190  		dst +=3D offset;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  191  	    }
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  192  	}
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  193  =

^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  194  	return 0;
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  195  }
^1da177e4c3f41 drivers/video/aty/mach64_cursor.c Linus Torvalds     2005-04=
-16  196  =


:::::: The code at line 156 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5652909092751051990==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
B8x2COGfgwEA
--===============5652909092751051990==--


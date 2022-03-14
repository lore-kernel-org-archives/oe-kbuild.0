Content-Type: multipart/mixed; boundary="===============2671375051028670148=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
Date: Mon, 14 Mar 2022 11:10:37 +0800
Message-ID: <202203141119.bZSAwA1k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2671375051028670148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220313192952.12058-3-tzimmermann@suse.de>
References: <20220313192952.12058-3-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: daniel(a)ffwll.ch
TO: deller(a)gmx.de
TO: m.szyprowski(a)samsung.com
TO: geert(a)linux-m68k.org
TO: javierm(a)redhat.com
TO: sam(a)ravnborg.org
CC: linux-fbdev(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220310]
[cannot apply to linus/master v5.17-rc7 v5.17-rc6 v5.17-rc5 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/fbdev-Fi=
x-image-blitting-for-arbitrary-image-widths/20220314-033209
base:    71941773e143369a73c9c4a3b62fbb60736a1182
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
314/202203141119.bZSAwA1k-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/video/fbdev/core/cfbimgblt.c:304 fast_imageblit() error: uninitiali=
zed symbol 'j'.

vim +/j +304 drivers/video/fbdev/core/cfbimgblt.c

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  206  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  207  /*
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  208   * fast_imageblit - optimized monochrome color expansion
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  209   *
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  210   * Only if:  bits_per_pixel =3D=3D 8, 16, or 32
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  211   *           image->width is divisible by pixel/dword (ppw);
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  212   *           fix->line_legth is divisible by 4;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  213   *           beginning and end of a scanline is dword aligned
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  214   */
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  215  static inline void fast_imageblit(const struct fb_image *image,=
 struct fb_info *p,
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  216  				  u8 __iomem *dst1, u32 fgcolor,
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  217  				  u32 bgcolor)
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  218  {
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  219  	u32 fgx =3D fgcolor, bgx =3D bgcolor, bpp =3D p->var.bits_per_=
pixel;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  220  	u32 ppw =3D 32/bpp, spitch =3D (image->width + 7)/8;
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  221  	u32 bit_mask, eorx, shift;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  222  	const char *s =3D image->data, *src;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  223  	u32 __iomem *dst;
d95159cf1b12e8 drivers/video/cfbimgblt.c            Helge Deller      2006-=
12-08  224  	const u32 *tab =3D NULL;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  225  	size_t tablen;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  226  	u32 colortab[16];
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  227  	int i, j, k;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  228  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  229  	switch (bpp) {
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  230  	case 8:
e4c690e061b909 drivers/video/cfbimgblt.c            Anton Vorontsov   2008-=
04-28  231  		tab =3D fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  232  		tablen =3D 16;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  233  		break;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  234  	case 16:
e4c690e061b909 drivers/video/cfbimgblt.c            Anton Vorontsov   2008-=
04-28  235  		tab =3D fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  236  		tablen =3D 4;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  237  		break;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  238  	case 32:
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  239  		tab =3D cfb_tab32;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  240  		tablen =3D 2;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  241  		break;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  242  	default:
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  243  		return;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  244  	}
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  245  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  246  	for (i =3D ppw-1; i--; ) {
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  247  		fgx <<=3D bpp;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  248  		bgx <<=3D bpp;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  249  		fgx |=3D fgcolor;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  250  		bgx |=3D bgcolor;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  251  	}
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  252  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  253  	bit_mask =3D (1 << ppw) - 1;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  254  	eorx =3D fgx ^ bgx;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  255  	k =3D image->width/ppw;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  256  =

0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  257  	for (i =3D 0; i < tablen; ++i)
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  258  		colortab[i] =3D (tab[i] & eorx) ^ bgx;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  259  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  260  	for (i =3D image->height; i--; ) {
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  261  		dst =3D (u32 __iomem *)dst1;
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  262  		shift =3D 8;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  263  		src =3D s;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  264  =

9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  265  		/*
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  266  		 * Manually unroll the per-line copying loop for better
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  267  		 * performance. This works until we processed the last
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  268  		 * completely filled source byte (inclusive).
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  269  		 */
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  270  		switch (ppw) {
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  271  		case 4: /* 8 bpp */
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  272  			for (j =3D k; j >=3D 2; j -=3D 2, ++src) {
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  273  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  274  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  275  			}
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  276  			break;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  277  		case 2: /* 16 bpp */
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  278  			for (j =3D k; j >=3D 4; j -=3D 4, ++src) {
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  279  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  280  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  281  				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  282  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  283  			}
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  284  			break;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  285  		case 1: /* 32 bpp */
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  286  			for (j =3D k; j >=3D 8; j -=3D 8, ++src) {
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  287  				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  288  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  289  				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  290  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  291  				FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  292  				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  293  				FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  294  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  295  			}
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  296  			break;
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  297  		}
0d03011894d232 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
02-23  298  =

9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  299  		/*
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  300  		 * For image widths that are not a multiple of 8, there
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  301  		 * are trailing pixels left on the current line. Print
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  302  		 * them as well.
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  303  		 */
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13 @304  		for (; j--; ) {
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  305  			shift -=3D ppw;
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  306  			FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  307  			if (!shift) {
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  308  				shift =3D 8;
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  309  				++src;
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  310  			}
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  311  		}
9410e2f8731c22 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022-=
03-13  312  =

^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  313  		dst1 +=3D p->fix.line_length;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  314  		s +=3D spitch;
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  315  	}
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  316  }
^1da177e4c3f41 drivers/video/cfbimgblt.c            Linus Torvalds    2005-=
04-16  317  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2671375051028670148==--


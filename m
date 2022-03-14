Content-Type: multipart/mixed; boundary="===============8205507119894766255=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] fbdev: Fix sys_imageblit() for arbitrary image widths
Date: Mon, 14 Mar 2022 10:19:09 +0800
Message-ID: <202203141008.L3JTRr7U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8205507119894766255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220313192952.12058-2-tzimmermann@suse.de>
References: <20220313192952.12058-2-tzimmermann@suse.de>
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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
314/202203141008.L3JTRr7U-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/video/fbdev/core/sysimgblt.c:274 fast_imageblit() error: uninitiali=
zed symbol 'j'.

vim +/j +274 drivers/video/fbdev/core/sysimgblt.c

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  177  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  178  /*
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  179   * fast_imageblit - optimized monochrome color expansion
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  180   *
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  181   * Only if:  bits_per_pixel =3D=3D 8, 16, or 32
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  182   *           image->width is divisible by pixel/dword (ppw);
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  183   *           fix->line_legth is divisible by 4;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  184   *           beginning and end of a scanline is dword aligned
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  185   */
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  186  static void fast_imageblit(const struct fb_image *image, struc=
t fb_info *p,
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  187  				  void *dst1, u32 fgcolor, u32 bgcolor)
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  188  {
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  189  	u32 fgx =3D fgcolor, bgx =3D bgcolor, bpp =3D p->var.bits_per=
_pixel;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  190  	u32 ppw =3D 32/bpp, spitch =3D (image->width + 7)/8;
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  191  	u32 bit_mask, eorx, shift;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  192  	const char *s =3D image->data, *src;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  193  	u32 *dst;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  194  	const u32 *tab;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  195  	size_t tablen;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  196  	u32 colortab[16];
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  197  	int i, j, k;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  198  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  199  	switch (bpp) {
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  200  	case 8:
e4c690e061b909 drivers/video/sysimgblt.c            Anton Vorontsov    2008=
-04-28  201  		tab =3D fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  202  		tablen =3D 16;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  203  		break;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  204  	case 16:
e4c690e061b909 drivers/video/sysimgblt.c            Anton Vorontsov    2008=
-04-28  205  		tab =3D fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  206  		tablen =3D 4;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  207  		break;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  208  	case 32:
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  209  		tab =3D cfb_tab32;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  210  		tablen =3D 2;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  211  		break;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  212  	default:
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  213  		return;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  214  	}
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  215  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  216  	for (i =3D ppw-1; i--; ) {
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  217  		fgx <<=3D bpp;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  218  		bgx <<=3D bpp;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  219  		fgx |=3D fgcolor;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  220  		bgx |=3D bgcolor;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  221  	}
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  222  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  223  	bit_mask =3D (1 << ppw) - 1;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  224  	eorx =3D fgx ^ bgx;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  225  	k =3D image->width/ppw;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  226  =

6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  227  	for (i =3D 0; i < tablen; ++i)
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  228  		colortab[i] =3D (tab[i] & eorx) ^ bgx;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  229  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  230  	for (i =3D image->height; i--; ) {
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  231  		dst =3D dst1;
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  232  		shift =3D 8;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  233  		src =3D s;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  234  =

34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  235  		/*
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  236  		 * Manually unroll the per-line copying loop for better
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  237  		 * performance. This works until we processed the last
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  238  		 * completely filled source byte (inclusive).
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  239  		 */
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  240  		switch (ppw) {
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  241  		case 4: /* 8 bpp */
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  242  			for (j =3D k; j >=3D 2; j -=3D 2, ++src) {
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  243  				*dst++ =3D colortab[(*src >> 4) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  244  				*dst++ =3D colortab[(*src >> 0) & bit_mask];
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  245  			}
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  246  			break;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  247  		case 2: /* 16 bpp */
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  248  			for (j =3D k; j >=3D 4; j -=3D 4, ++src) {
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  249  				*dst++ =3D colortab[(*src >> 6) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  250  				*dst++ =3D colortab[(*src >> 4) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  251  				*dst++ =3D colortab[(*src >> 2) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  252  				*dst++ =3D colortab[(*src >> 0) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  253  			}
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  254  			break;
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  255  		case 1: /* 32 bpp */
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  256  			for (j =3D k; j >=3D 8; j -=3D 8, ++src) {
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  257  				*dst++ =3D colortab[(*src >> 7) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  258  				*dst++ =3D colortab[(*src >> 6) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  259  				*dst++ =3D colortab[(*src >> 5) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  260  				*dst++ =3D colortab[(*src >> 4) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  261  				*dst++ =3D colortab[(*src >> 3) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  262  				*dst++ =3D colortab[(*src >> 2) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  263  				*dst++ =3D colortab[(*src >> 1) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  264  				*dst++ =3D colortab[(*src >> 0) & bit_mask];
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  265  			}
6f29e04938bf50 drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-02-23  266  			break;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  267  		}
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  268  =

34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  269  		/*
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  270  		 * For image widths that are not a multiple of 8, there
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  271  		 * are trailing pixels left on the current line. Print
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  272  		 * them as well.
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  273  		 */
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13 @274  		for (; j--; ) {
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  275  			shift -=3D ppw;
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  276  			*dst++ =3D colortab[(*src >> shift) & bit_mask];
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  277  			if (!shift) {
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  278  				shift =3D 8;
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  279  				++src;
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  280  			}
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  281  		}
34e093954c6d2a drivers/video/fbdev/core/sysimgblt.c Thomas Zimmermann  2022=
-03-13  282  =

68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  283  		dst1 +=3D p->fix.line_length;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  284  		s +=3D spitch;
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  285  	}
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  286  }
68648ed1f58d98 drivers/video/sysimgblt.c            Antonino A. Daplas 2007=
-05-08  287  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8205507119894766255==--


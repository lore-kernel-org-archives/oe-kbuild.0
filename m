Content-Type: multipart/mixed; boundary="===============1318787102910195851=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/solomon/ssd130x.c:348:68: warning: Parameter 'buf' can be declared with const [constParameter]
Date: Sat, 23 Apr 2022 12:26:16 +0800
Message-ID: <202204231255.VgvLXzbG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1318787102910195851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomo=
n SSD130x OLED displays
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a61732e808672cfa8c8c6028bcf9feacb953ef40
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/drm/solomon/ssd130x.c:585:7: warning: Redundant initializati=
on for 'mode'. The initialized value is overwritten before it is read. [red=
undantInitialization]
    mode =3D drm_mode_duplicate(connector->dev, &ssd130x->mode);
         ^
   drivers/gpu/drm/solomon/ssd130x.c:582:32: note: mode is initialized
    struct drm_display_mode *mode =3D &ssd130x->mode;
                                  ^
   drivers/gpu/drm/solomon/ssd130x.c:585:7: note: mode is overwritten
    mode =3D drm_mode_duplicate(connector->dev, &ssd130x->mode);
         ^
>> drivers/gpu/drm/solomon/ssd130x.c:348:68: warning: Parameter 'buf' can b=
e declared with const [constParameter]
   static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
                                                                      ^

vim +/buf +348 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672c Javier Martinez Canillas 2022-02-14  347  =

a61732e808672c Javier Martinez Canillas 2022-02-14 @348  static int ssd130x=
_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
a61732e808672c Javier Martinez Canillas 2022-02-14  349  			       struct d=
rm_rect *rect)
a61732e808672c Javier Martinez Canillas 2022-02-14  350  {
a61732e808672c Javier Martinez Canillas 2022-02-14  351  	unsigned int x =
=3D rect->x1;
a61732e808672c Javier Martinez Canillas 2022-02-14  352  	unsigned int y =
=3D rect->y1;
a61732e808672c Javier Martinez Canillas 2022-02-14  353  	unsigned int widt=
h =3D drm_rect_width(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  354  	unsigned int heig=
ht =3D drm_rect_height(rect);
a61732e808672c Javier Martinez Canillas 2022-02-14  355  	unsigned int line=
_length =3D DIV_ROUND_UP(width, 8);
a61732e808672c Javier Martinez Canillas 2022-02-14  356  	unsigned int page=
s =3D DIV_ROUND_UP(y % 8 + height, 8);
a61732e808672c Javier Martinez Canillas 2022-02-14  357  	u32 array_idx =3D=
 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  358  	int ret, i, j, k;
a61732e808672c Javier Martinez Canillas 2022-02-14  359  	u8 *data_array =
=3D NULL;
a61732e808672c Javier Martinez Canillas 2022-02-14  360  =

a61732e808672c Javier Martinez Canillas 2022-02-14  361  	data_array =3D kc=
alloc(width, pages, GFP_KERNEL);
a61732e808672c Javier Martinez Canillas 2022-02-14  362  	if (!data_array)
a61732e808672c Javier Martinez Canillas 2022-02-14  363  		return -ENOMEM;
a61732e808672c Javier Martinez Canillas 2022-02-14  364  =

a61732e808672c Javier Martinez Canillas 2022-02-14  365  	/*
a61732e808672c Javier Martinez Canillas 2022-02-14  366  	 * The screen is =
divided in pages, each having a height of 8
a61732e808672c Javier Martinez Canillas 2022-02-14  367  	 * pixels, and th=
e width of the screen. When sending a byte of
a61732e808672c Javier Martinez Canillas 2022-02-14  368  	 * data to the co=
ntroller, it gives the 8 bits for the current
a61732e808672c Javier Martinez Canillas 2022-02-14  369  	 * column. I.e, t=
he first byte are the 8 bits of the first
a61732e808672c Javier Martinez Canillas 2022-02-14  370  	 * column, then t=
he 8 bits for the second column, etc.
a61732e808672c Javier Martinez Canillas 2022-02-14  371  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  372  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  373  	 * Representation=
 of the screen, assuming it is 5 bits
a61732e808672c Javier Martinez Canillas 2022-02-14  374  	 * wide. Each let=
ter-number combination is a bit that controls
a61732e808672c Javier Martinez Canillas 2022-02-14  375  	 * one pixel.
a61732e808672c Javier Martinez Canillas 2022-02-14  376  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  377  	 * A0 A1 A2 A3 A4
a61732e808672c Javier Martinez Canillas 2022-02-14  378  	 * B0 B1 B2 B3 B4
a61732e808672c Javier Martinez Canillas 2022-02-14  379  	 * C0 C1 C2 C3 C4
a61732e808672c Javier Martinez Canillas 2022-02-14  380  	 * D0 D1 D2 D3 D4
a61732e808672c Javier Martinez Canillas 2022-02-14  381  	 * E0 E1 E2 E3 E4
a61732e808672c Javier Martinez Canillas 2022-02-14  382  	 * F0 F1 F2 F3 F4
a61732e808672c Javier Martinez Canillas 2022-02-14  383  	 * G0 G1 G2 G3 G4
a61732e808672c Javier Martinez Canillas 2022-02-14  384  	 * H0 H1 H2 H3 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  385  	 *
a61732e808672c Javier Martinez Canillas 2022-02-14  386  	 * If you want to=
 update this screen, you need to send 5 bytes:
a61732e808672c Javier Martinez Canillas 2022-02-14  387  	 *  (1) A0 B0 C0 =
D0 E0 F0 G0 H0
a61732e808672c Javier Martinez Canillas 2022-02-14  388  	 *  (2) A1 B1 C1 =
D1 E1 F1 G1 H1
a61732e808672c Javier Martinez Canillas 2022-02-14  389  	 *  (3) A2 B2 C2 =
D2 E2 F2 G2 H2
a61732e808672c Javier Martinez Canillas 2022-02-14  390  	 *  (4) A3 B3 C3 =
D3 E3 F3 G3 H3
a61732e808672c Javier Martinez Canillas 2022-02-14  391  	 *  (5) A4 B4 C4 =
D4 E4 F4 G4 H4
a61732e808672c Javier Martinez Canillas 2022-02-14  392  	 */
a61732e808672c Javier Martinez Canillas 2022-02-14  393  =

a61732e808672c Javier Martinez Canillas 2022-02-14  394  	ret =3D ssd130x_s=
et_col_range(ssd130x, ssd130x->col_offset + x, width);
a61732e808672c Javier Martinez Canillas 2022-02-14  395  	if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  396  		goto out_free;
a61732e808672c Javier Martinez Canillas 2022-02-14  397  =

a61732e808672c Javier Martinez Canillas 2022-02-14  398  	ret =3D ssd130x_s=
et_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  399  	if (ret < 0)
a61732e808672c Javier Martinez Canillas 2022-02-14  400  		goto out_free;
a61732e808672c Javier Martinez Canillas 2022-02-14  401  =

a61732e808672c Javier Martinez Canillas 2022-02-14  402  	for (i =3D y / 8;=
 i < y / 8 + pages; i++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  403  		int m =3D 8;
a61732e808672c Javier Martinez Canillas 2022-02-14  404  =

a61732e808672c Javier Martinez Canillas 2022-02-14  405  		/* Last page may=
 be partial */
a61732e808672c Javier Martinez Canillas 2022-02-14  406  		if (8 * (i + 1) =
> ssd130x->height)
a61732e808672c Javier Martinez Canillas 2022-02-14  407  			m =3D ssd130x->=
height % 8;
a61732e808672c Javier Martinez Canillas 2022-02-14  408  		for (j =3D x; j =
< x + width; j++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  409  			u8 data =3D 0;
a61732e808672c Javier Martinez Canillas 2022-02-14  410  =

a61732e808672c Javier Martinez Canillas 2022-02-14  411  			for (k =3D 0; k=
 < m; k++) {
a61732e808672c Javier Martinez Canillas 2022-02-14  412  				u8 byte =3D bu=
f[(8 * i + k) * line_length + j / 8];
a61732e808672c Javier Martinez Canillas 2022-02-14  413  				u8 bit =3D (by=
te >> (j % 8)) & 1;
a61732e808672c Javier Martinez Canillas 2022-02-14  414  =

a61732e808672c Javier Martinez Canillas 2022-02-14  415  				data |=3D bit =
<< k;
a61732e808672c Javier Martinez Canillas 2022-02-14  416  			}
a61732e808672c Javier Martinez Canillas 2022-02-14  417  			data_array[arra=
y_idx++] =3D data;
a61732e808672c Javier Martinez Canillas 2022-02-14  418  		}
a61732e808672c Javier Martinez Canillas 2022-02-14  419  	}
a61732e808672c Javier Martinez Canillas 2022-02-14  420  =

a61732e808672c Javier Martinez Canillas 2022-02-14  421  	ret =3D ssd130x_w=
rite_data(ssd130x, data_array, width * pages);
a61732e808672c Javier Martinez Canillas 2022-02-14  422  =

a61732e808672c Javier Martinez Canillas 2022-02-14  423  out_free:
a61732e808672c Javier Martinez Canillas 2022-02-14  424  	kfree(data_array);
a61732e808672c Javier Martinez Canillas 2022-02-14  425  	return ret;
a61732e808672c Javier Martinez Canillas 2022-02-14  426  }
a61732e808672c Javier Martinez Canillas 2022-02-14  427  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1318787102910195851==--


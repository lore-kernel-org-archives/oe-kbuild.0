Content-Type: multipart/mixed; boundary="===============5771774414691711969=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/solomon/ssd130x.c:348:68: warning: Parameter 'buf' can be declared with const [constParameter]
Date: Sat, 16 Jul 2022 10:51:04 +0800
Message-ID: <202207161049.XpF43cOd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5771774414691711969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/solomon/ssd130x.c:348:68: warning: Parameter 'buf' can be declared w=
ith const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b59ec8d50a1f28747ceff9a4f39af5deba9540e
commit: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomo=
n SSD130x OLED displays
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a61732e808672cfa8c8c6028bcf9feacb953ef40
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:97:26: warning: Local v=
ariable 'msg' shadows outer variable [shadowVariable]
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:97:26: note: Shadowed d=
eclaration
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:97:26: note: Shadow var=
iable
     struct cros_ec_command msg;
                            ^
>> drivers/media/cec/platform/cros-ec/cros-ec-cec.c:98:28: warning: Local v=
ariable 'data' shadows outer variable [shadowVariable]
     struct ec_params_cec_set data;
                              ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:98:28: note: Shadowed d=
eclaration
     struct ec_params_cec_set data;
                              ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:98:28: note: Shadow var=
iable
     struct ec_params_cec_set data;
                              ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:123:26: warning: Local =
variable 'msg' shadows outer variable [shadowVariable]
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:123:26: note: Shadowed =
declaration
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:123:26: note: Shadow va=
riable
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:124:30: warning: Local =
variable 'data' shadows outer variable [shadowVariable]
     struct ec_params_cec_write data;
                                ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:124:30: note: Shadowed =
declaration
     struct ec_params_cec_write data;
                                ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:124:30: note: Shadow va=
riable
     struct ec_params_cec_write data;
                                ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:147:26: warning: Local =
variable 'msg' shadows outer variable [shadowVariable]
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:147:26: note: Shadowed =
declaration
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:147:26: note: Shadow va=
riable
     struct cros_ec_command msg;
                            ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:148:28: warning: Local =
variable 'data' shadows outer variable [shadowVariable]
     struct ec_params_cec_set data;
                              ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:148:28: note: Shadowed =
declaration
     struct ec_params_cec_set data;
                              ^
   drivers/media/cec/platform/cros-ec/cros-ec-cec.c:148:28: note: Shadow va=
riable
     struct ec_params_cec_set data;
                              ^
--

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
--
>> drivers/media/pci/ddbridge/ddbridge-mci.c:110:42: warning: Parameter 'ke=
y' can be declared with const [constParameter]
   static struct mci_base *match_base(void *key)
                                            ^
--
>> drivers/media/pci/ddbridge/ddbridge-core.c:2516:2: warning: Signed integ=
er overflow for expression '0x000000ff<<(24&0x1f)'. [integerOverflow]
    IRQ_HANDLE_BYTE(24);
    ^

vim +/buf +348 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672cf Javier Martinez Canillas 2022-02-14  347  =

a61732e808672cf Javier Martinez Canillas 2022-02-14 @348  static int ssd130=
x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
a61732e808672cf Javier Martinez Canillas 2022-02-14  349  			       struct =
drm_rect *rect)
a61732e808672cf Javier Martinez Canillas 2022-02-14  350  {
a61732e808672cf Javier Martinez Canillas 2022-02-14  351  	unsigned int x =
=3D rect->x1;
a61732e808672cf Javier Martinez Canillas 2022-02-14  352  	unsigned int y =
=3D rect->y1;
a61732e808672cf Javier Martinez Canillas 2022-02-14  353  	unsigned int wid=
th =3D drm_rect_width(rect);
a61732e808672cf Javier Martinez Canillas 2022-02-14  354  	unsigned int hei=
ght =3D drm_rect_height(rect);
a61732e808672cf Javier Martinez Canillas 2022-02-14  355  	unsigned int lin=
e_length =3D DIV_ROUND_UP(width, 8);
a61732e808672cf Javier Martinez Canillas 2022-02-14  356  	unsigned int pag=
es =3D DIV_ROUND_UP(y % 8 + height, 8);
a61732e808672cf Javier Martinez Canillas 2022-02-14  357  	u32 array_idx =
=3D 0;
a61732e808672cf Javier Martinez Canillas 2022-02-14  358  	int ret, i, j, k;
a61732e808672cf Javier Martinez Canillas 2022-02-14  359  	u8 *data_array =
=3D NULL;
a61732e808672cf Javier Martinez Canillas 2022-02-14  360  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  361  	data_array =3D k=
calloc(width, pages, GFP_KERNEL);
a61732e808672cf Javier Martinez Canillas 2022-02-14  362  	if (!data_array)
a61732e808672cf Javier Martinez Canillas 2022-02-14  363  		return -ENOMEM;
a61732e808672cf Javier Martinez Canillas 2022-02-14  364  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  365  	/*
a61732e808672cf Javier Martinez Canillas 2022-02-14  366  	 * The screen is=
 divided in pages, each having a height of 8
a61732e808672cf Javier Martinez Canillas 2022-02-14  367  	 * pixels, and t=
he width of the screen. When sending a byte of
a61732e808672cf Javier Martinez Canillas 2022-02-14  368  	 * data to the c=
ontroller, it gives the 8 bits for the current
a61732e808672cf Javier Martinez Canillas 2022-02-14  369  	 * column. I.e, =
the first byte are the 8 bits of the first
a61732e808672cf Javier Martinez Canillas 2022-02-14  370  	 * column, then =
the 8 bits for the second column, etc.
a61732e808672cf Javier Martinez Canillas 2022-02-14  371  	 *
a61732e808672cf Javier Martinez Canillas 2022-02-14  372  	 *
a61732e808672cf Javier Martinez Canillas 2022-02-14  373  	 * Representatio=
n of the screen, assuming it is 5 bits
a61732e808672cf Javier Martinez Canillas 2022-02-14  374  	 * wide. Each le=
tter-number combination is a bit that controls
a61732e808672cf Javier Martinez Canillas 2022-02-14  375  	 * one pixel.
a61732e808672cf Javier Martinez Canillas 2022-02-14  376  	 *
a61732e808672cf Javier Martinez Canillas 2022-02-14  377  	 * A0 A1 A2 A3 A4
a61732e808672cf Javier Martinez Canillas 2022-02-14  378  	 * B0 B1 B2 B3 B4
a61732e808672cf Javier Martinez Canillas 2022-02-14  379  	 * C0 C1 C2 C3 C4
a61732e808672cf Javier Martinez Canillas 2022-02-14  380  	 * D0 D1 D2 D3 D4
a61732e808672cf Javier Martinez Canillas 2022-02-14  381  	 * E0 E1 E2 E3 E4
a61732e808672cf Javier Martinez Canillas 2022-02-14  382  	 * F0 F1 F2 F3 F4
a61732e808672cf Javier Martinez Canillas 2022-02-14  383  	 * G0 G1 G2 G3 G4
a61732e808672cf Javier Martinez Canillas 2022-02-14  384  	 * H0 H1 H2 H3 H4
a61732e808672cf Javier Martinez Canillas 2022-02-14  385  	 *
a61732e808672cf Javier Martinez Canillas 2022-02-14  386  	 * If you want t=
o update this screen, you need to send 5 bytes:
a61732e808672cf Javier Martinez Canillas 2022-02-14  387  	 *  (1) A0 B0 C0=
 D0 E0 F0 G0 H0
a61732e808672cf Javier Martinez Canillas 2022-02-14  388  	 *  (2) A1 B1 C1=
 D1 E1 F1 G1 H1
a61732e808672cf Javier Martinez Canillas 2022-02-14  389  	 *  (3) A2 B2 C2=
 D2 E2 F2 G2 H2
a61732e808672cf Javier Martinez Canillas 2022-02-14  390  	 *  (4) A3 B3 C3=
 D3 E3 F3 G3 H3
a61732e808672cf Javier Martinez Canillas 2022-02-14  391  	 *  (5) A4 B4 C4=
 D4 E4 F4 G4 H4
a61732e808672cf Javier Martinez Canillas 2022-02-14  392  	 */
a61732e808672cf Javier Martinez Canillas 2022-02-14  393  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  394  	ret =3D ssd130x_=
set_col_range(ssd130x, ssd130x->col_offset + x, width);
a61732e808672cf Javier Martinez Canillas 2022-02-14  395  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  396  		goto out_free;
a61732e808672cf Javier Martinez Canillas 2022-02-14  397  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  398  	ret =3D ssd130x_=
set_page_range(ssd130x, ssd130x->page_offset + y / 8, pages);
a61732e808672cf Javier Martinez Canillas 2022-02-14  399  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  400  		goto out_free;
a61732e808672cf Javier Martinez Canillas 2022-02-14  401  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  402  	for (i =3D y / 8=
; i < y / 8 + pages; i++) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  403  		int m =3D 8;
a61732e808672cf Javier Martinez Canillas 2022-02-14  404  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  405  		/* Last page ma=
y be partial */
a61732e808672cf Javier Martinez Canillas 2022-02-14  406  		if (8 * (i + 1)=
 > ssd130x->height)
a61732e808672cf Javier Martinez Canillas 2022-02-14  407  			m =3D ssd130x-=
>height % 8;
a61732e808672cf Javier Martinez Canillas 2022-02-14  408  		for (j =3D x; j=
 < x + width; j++) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  409  			u8 data =3D 0;
a61732e808672cf Javier Martinez Canillas 2022-02-14  410  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  411  			for (k =3D 0; =
k < m; k++) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  412  				u8 byte =3D b=
uf[(8 * i + k) * line_length + j / 8];
a61732e808672cf Javier Martinez Canillas 2022-02-14  413  				u8 bit =3D (b=
yte >> (j % 8)) & 1;
a61732e808672cf Javier Martinez Canillas 2022-02-14  414  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  415  				data |=3D bit=
 << k;
a61732e808672cf Javier Martinez Canillas 2022-02-14  416  			}
a61732e808672cf Javier Martinez Canillas 2022-02-14  417  			data_array[arr=
ay_idx++] =3D data;
a61732e808672cf Javier Martinez Canillas 2022-02-14  418  		}
a61732e808672cf Javier Martinez Canillas 2022-02-14  419  	}
a61732e808672cf Javier Martinez Canillas 2022-02-14  420  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  421  	ret =3D ssd130x_=
write_data(ssd130x, data_array, width * pages);
a61732e808672cf Javier Martinez Canillas 2022-02-14  422  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  423  out_free:
a61732e808672cf Javier Martinez Canillas 2022-02-14  424  	kfree(data_array=
);
a61732e808672cf Javier Martinez Canillas 2022-02-14  425  	return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  426  }
a61732e808672cf Javier Martinez Canillas 2022-02-14  427  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5771774414691711969==--


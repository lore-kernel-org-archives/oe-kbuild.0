Content-Type: multipart/mixed; boundary="===============3750346975001819666=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/solomon/ssd130x.c:301:21: sparse: sparse: dubious: x & !y
Date: Mon, 28 Mar 2022 21:27:36 +0800
Message-ID: <202203282108.TOszHcdP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3750346975001819666==
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
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: a61732e808672cfa8c8c6028bcf9feacb953ef40 drm: Add driver for Solomo=
n SSD130x OLED displays
date:   6 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-s001-20220328 (https://download.01.org/0day-ci/arch=
ive/20220328/202203282108.TOszHcdP-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da61732e808672cfa8c8c6028bcf9feacb953ef40
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a61732e808672cfa8c8c6028bcf9feacb953ef40
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/acpi/apei/ drivers/gpu/drm/=
solomon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/solomon/ssd130x.c:301:21: sparse: sparse: dubious: x & !y

vim +301 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672cf Javier Martinez Canillas 2022-02-14  235  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  236  static int ssd130=
x_init(struct ssd130x_device *ssd130x)
a61732e808672cf Javier Martinez Canillas 2022-02-14  237  {
a61732e808672cf Javier Martinez Canillas 2022-02-14  238  	u32 precharge, d=
clk, com_invdir, compins, chargepump;
a61732e808672cf Javier Martinez Canillas 2022-02-14  239  	int ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  240  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  241  	/* Set initial c=
ontrast */
a61732e808672cf Javier Martinez Canillas 2022-02-14  242  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_CONTRAST, ssd130x->contrast);
a61732e808672cf Javier Martinez Canillas 2022-02-14  243  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  244  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  245  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  246  	/* Set segment r=
e-map */
a61732e808672cf Javier Martinez Canillas 2022-02-14  247  	if (ssd130x->seg=
_remap) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  248  		ret =3D ssd130x=
_write_cmd(ssd130x, 1, SSD130X_SEG_REMAP_ON);
a61732e808672cf Javier Martinez Canillas 2022-02-14  249  		if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  250  			return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  251  	}
a61732e808672cf Javier Martinez Canillas 2022-02-14  252  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  253  	/* Set COM direc=
tion */
a61732e808672cf Javier Martinez Canillas 2022-02-14  254  	com_invdir =3D (=
SSD130X_SET_COM_SCAN_DIR |
a61732e808672cf Javier Martinez Canillas 2022-02-14  255  		      SSD130X_S=
ET_COM_SCAN_DIR_SET(ssd130x->com_invdir));
a61732e808672cf Javier Martinez Canillas 2022-02-14  256  	ret =3D ssd130x_=
write_cmd(ssd130x,  1, com_invdir);
a61732e808672cf Javier Martinez Canillas 2022-02-14  257  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  258  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  259  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  260  	/* Set multiplex=
 ratio value */
a61732e808672cf Javier Martinez Canillas 2022-02-14  261  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_MULTIPLEX_RATIO, ssd130x->height - 1);
a61732e808672cf Javier Martinez Canillas 2022-02-14  262  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  263  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  264  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  265  	/* set display o=
ffset value */
a61732e808672cf Javier Martinez Canillas 2022-02-14  266  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_DISPLAY_OFFSET, ssd130x->com_offset);
a61732e808672cf Javier Martinez Canillas 2022-02-14  267  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  268  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  269  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  270  	/* Set clock fre=
quency */
a61732e808672cf Javier Martinez Canillas 2022-02-14  271  	dclk =3D (SSD130=
X_SET_CLOCK_DIV_SET(ssd130x->dclk_div - 1) |
a61732e808672cf Javier Martinez Canillas 2022-02-14  272  		SSD130X_SET_CLO=
CK_FREQ_SET(ssd130x->dclk_frq));
a61732e808672cf Javier Martinez Canillas 2022-02-14  273  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_CLOCK_FREQ, dclk);
a61732e808672cf Javier Martinez Canillas 2022-02-14  274  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  275  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  276  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  277  	/* Set Area Colo=
r Mode ON/OFF & Low Power Display Mode */
a61732e808672cf Javier Martinez Canillas 2022-02-14  278  	if (ssd130x->are=
a_color_enable || ssd130x->low_power) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  279  		u32 mode =3D 0;
a61732e808672cf Javier Martinez Canillas 2022-02-14  280  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  281  		if (ssd130x->ar=
ea_color_enable)
a61732e808672cf Javier Martinez Canillas 2022-02-14  282  			mode |=3D SSD1=
30X_SET_AREA_COLOR_MODE_ENABLE;
a61732e808672cf Javier Martinez Canillas 2022-02-14  283  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  284  		if (ssd130x->lo=
w_power)
a61732e808672cf Javier Martinez Canillas 2022-02-14  285  			mode |=3D SSD1=
30X_SET_AREA_COLOR_MODE_LOW_POWER;
a61732e808672cf Javier Martinez Canillas 2022-02-14  286  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  287  		ret =3D ssd130x=
_write_cmd(ssd130x, 2, SSD130X_SET_AREA_COLOR_MODE, mode);
a61732e808672cf Javier Martinez Canillas 2022-02-14  288  		if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  289  			return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  290  	}
a61732e808672cf Javier Martinez Canillas 2022-02-14  291  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  292  	/* Set precharge=
 period in number of ticks from the internal clock */
a61732e808672cf Javier Martinez Canillas 2022-02-14  293  	precharge =3D (S=
SD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
a61732e808672cf Javier Martinez Canillas 2022-02-14  294  		     SSD130X_SE=
T_PRECHARGE_PERIOD1_SET(ssd130x->prechargep2));
a61732e808672cf Javier Martinez Canillas 2022-02-14  295  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_PRECHARGE_PERIOD, precharge);
a61732e808672cf Javier Martinez Canillas 2022-02-14  296  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  297  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  298  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  299  	/* Set COM pins =
configuration */
a61732e808672cf Javier Martinez Canillas 2022-02-14  300  	compins =3D BIT(=
1);
a61732e808672cf Javier Martinez Canillas 2022-02-14 @301  	compins |=3D (SS=
D130X_SET_COM_PINS_CONFIG1_SET(ssd130x->com_seq) |
a61732e808672cf Javier Martinez Canillas 2022-02-14  302  		    SSD130X_SET=
_COM_PINS_CONFIG2_SET(ssd130x->com_lrremap));
a61732e808672cf Javier Martinez Canillas 2022-02-14  303  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_COM_PINS_CONFIG, compins);
a61732e808672cf Javier Martinez Canillas 2022-02-14  304  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  305  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  306  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  307  	/* Set VCOMH */
a61732e808672cf Javier Martinez Canillas 2022-02-14  308  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_SET_VCOMH, ssd130x->vcomh);
a61732e808672cf Javier Martinez Canillas 2022-02-14  309  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  310  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  311  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  312  	/* Turn on the D=
C-DC Charge Pump */
a61732e808672cf Javier Martinez Canillas 2022-02-14  313  	chargepump =3D B=
IT(4);
a61732e808672cf Javier Martinez Canillas 2022-02-14  314  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  315  	if (ssd130x->dev=
ice_info->need_chargepump)
a61732e808672cf Javier Martinez Canillas 2022-02-14  316  		chargepump |=3D=
 BIT(2);
a61732e808672cf Javier Martinez Canillas 2022-02-14  317  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  318  	ret =3D ssd130x_=
write_cmd(ssd130x, 2, SSD130X_CHARGE_PUMP, chargepump);
a61732e808672cf Javier Martinez Canillas 2022-02-14  319  	if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  320  		return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  321  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  322  	/* Set lookup ta=
ble */
a61732e808672cf Javier Martinez Canillas 2022-02-14  323  	if (ssd130x->loo=
kup_table_set) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  324  		int i;
a61732e808672cf Javier Martinez Canillas 2022-02-14  325  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  326  		ret =3D ssd130x=
_write_cmd(ssd130x, 1, SSD130X_SET_LOOKUP_TABLE);
a61732e808672cf Javier Martinez Canillas 2022-02-14  327  		if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  328  			return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  329  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  330  		for (i =3D 0; i=
 < ARRAY_SIZE(ssd130x->lookup_table); i++) {
a61732e808672cf Javier Martinez Canillas 2022-02-14  331  			u8 val =3D ssd=
130x->lookup_table[i];
a61732e808672cf Javier Martinez Canillas 2022-02-14  332  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  333  			if (val < 31 |=
| val > 63)
a61732e808672cf Javier Martinez Canillas 2022-02-14  334  				dev_warn(ssd1=
30x->dev,
a61732e808672cf Javier Martinez Canillas 2022-02-14  335  					 "lookup tab=
le index %d value out of range 31 <=3D %d <=3D 63\n",
a61732e808672cf Javier Martinez Canillas 2022-02-14  336  					 i, val);
a61732e808672cf Javier Martinez Canillas 2022-02-14  337  			ret =3D ssd130=
x_write_cmd(ssd130x, 1, val);
a61732e808672cf Javier Martinez Canillas 2022-02-14  338  			if (ret < 0)
a61732e808672cf Javier Martinez Canillas 2022-02-14  339  				return ret;
a61732e808672cf Javier Martinez Canillas 2022-02-14  340  		}
a61732e808672cf Javier Martinez Canillas 2022-02-14  341  	}
a61732e808672cf Javier Martinez Canillas 2022-02-14  342  =

a61732e808672cf Javier Martinez Canillas 2022-02-14  343  	/* Switch to hor=
izontal addressing mode */
a61732e808672cf Javier Martinez Canillas 2022-02-14  344  	return ssd130x_w=
rite_cmd(ssd130x, 2, SSD130X_SET_ADDRESS_MODE,
a61732e808672cf Javier Martinez Canillas 2022-02-14  345  				 SSD130X_SET_=
ADDRESS_MODE_HORIZONTAL);
a61732e808672cf Javier Martinez Canillas 2022-02-14  346  }
a61732e808672cf Javier Martinez Canillas 2022-02-14  347  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3750346975001819666==--


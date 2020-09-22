Content-Type: multipart/mixed; boundary="===============1821823637565154303=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 02/32] auxdisplay: Introduce hd44780_common.[ch]
Date: Tue, 22 Sep 2020 10:33:42 +0800
Message-ID: <202009221036.rnzPtpyC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1821823637565154303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200921144645.2061313-3-poeschel@lemonage.de>
References: <20200921144645.2061313-3-poeschel@lemonage.de>
TO: poeschel(a)lemonage.de
TO: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
TO: Willy Tarreau <willy@haproxy.com>
TO: Ksenija Stanojevic <ksenija.stanojevic@gmail.com>
TO: open list <linux-kernel@vger.kernel.org>
CC: Lars Poeschel <poeschel@lemonage.de>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master linus/master v5.9-rc6 next-2020092=
1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/poeschel-lemonage-de/auxdi=
splay-Use-an-enum-for-charlcd-backlight-on-off-ops/20200921-234637
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: arc-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/auxdisplay/hd44780.c:254:6: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. 'break;' missing? [redundantAss=
ignInSwitch]
    ret =3D device_property_read_u32(dev, "display-height-chars",
        ^
   drivers/auxdisplay/hd44780.c:185:0: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    int ifwidth, ret =3D -ENOMEM;
   ^
   drivers/auxdisplay/hd44780.c:254:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    ret =3D device_property_read_u32(dev, "display-height-chars",
        ^

# https://github.com/0day-ci/linux/commit/48ef34da2bee5cd52d20f34ae7a52cc50=
e6a8951
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review poeschel-lemonage-de/auxdisplay-Use-an-enu=
m-for-charlcd-backlight-on-off-ops/20200921-234637
git checkout 48ef34da2bee5cd52d20f34ae7a52cc50e6a8951
vim +254 drivers/auxdisplay/hd44780.c

d47d88361feea2c Geert Uytterhoeven 2017-03-10  177  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  178  static int hd44780_prob=
e(struct platform_device *pdev)
d47d88361feea2c Geert Uytterhoeven 2017-03-10  179  {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  180  	struct device *dev =3D=
 &pdev->dev;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  181  	unsigned int i, base;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  182  	struct charlcd *lcd;
48ef34da2bee5cd Lars Poeschel      2020-09-21  183  	struct hd44780_common =
*hdc;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  184  	struct hd44780 *hd;
48ef34da2bee5cd Lars Poeschel      2020-09-21  185  	int ifwidth, ret =3D -=
ENOMEM;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  186  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  187  	/* Required pins */
d47d88361feea2c Geert Uytterhoeven 2017-03-10  188  	ifwidth =3D gpiod_coun=
t(dev, "data");
d47d88361feea2c Geert Uytterhoeven 2017-03-10  189  	if (ifwidth < 0)
d47d88361feea2c Geert Uytterhoeven 2017-03-10  190  		return ifwidth;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  191  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  192  	switch (ifwidth) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  193  	case 4:
d47d88361feea2c Geert Uytterhoeven 2017-03-10  194  		base =3D PIN_DATA4;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  195  		break;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  196  	case 8:
d47d88361feea2c Geert Uytterhoeven 2017-03-10  197  		base =3D PIN_DATA0;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  198  		break;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  199  	default:
d47d88361feea2c Geert Uytterhoeven 2017-03-10  200  		return -EINVAL;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  201  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  202  =

48ef34da2bee5cd Lars Poeschel      2020-09-21  203  	hdc =3D hd44780_common=
_alloc();
48ef34da2bee5cd Lars Poeschel      2020-09-21  204  	if (!hdc)
48ef34da2bee5cd Lars Poeschel      2020-09-21  205  		return -ENOMEM;
48ef34da2bee5cd Lars Poeschel      2020-09-21  206  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  207  	lcd =3D charlcd_alloc(=
sizeof(struct hd44780));
d47d88361feea2c Geert Uytterhoeven 2017-03-10  208  	if (!lcd)
48ef34da2bee5cd Lars Poeschel      2020-09-21  209  		goto fail1;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  210  =

48ef34da2bee5cd Lars Poeschel      2020-09-21  211  	hd =3D kzalloc(sizeof(=
struct hd44780), GFP_KERNEL);
48ef34da2bee5cd Lars Poeschel      2020-09-21  212  	if (!hd)
48ef34da2bee5cd Lars Poeschel      2020-09-21  213  		goto fail2;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  214  =

48ef34da2bee5cd Lars Poeschel      2020-09-21  215  	hdc->hd44780 =3D hd;
48ef34da2bee5cd Lars Poeschel      2020-09-21  216  	lcd->drvdata =3D hdc;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  217  	for (i =3D 0; i < ifwi=
dth; i++) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  218  		hd->pins[base + i] =
=3D devm_gpiod_get_index(dev, "data", i,
d47d88361feea2c Geert Uytterhoeven 2017-03-10  219  							  GPIOD_OUT_LOW);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  220  		if (IS_ERR(hd->pins[b=
ase + i])) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  221  			ret =3D PTR_ERR(hd->=
pins[base + i]);
48ef34da2bee5cd Lars Poeschel      2020-09-21  222  			goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  223  		}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  224  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  225  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  226  	hd->pins[PIN_CTRL_E] =
=3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  227  	if (IS_ERR(hd->pins[PI=
N_CTRL_E])) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  228  		ret =3D PTR_ERR(hd->p=
ins[PIN_CTRL_E]);
48ef34da2bee5cd Lars Poeschel      2020-09-21  229  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  230  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  231  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  232  	hd->pins[PIN_CTRL_RS] =
=3D devm_gpiod_get(dev, "rs", GPIOD_OUT_HIGH);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  233  	if (IS_ERR(hd->pins[PI=
N_CTRL_RS])) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  234  		ret =3D PTR_ERR(hd->p=
ins[PIN_CTRL_RS]);
48ef34da2bee5cd Lars Poeschel      2020-09-21  235  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  236  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  237  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  238  	/* Optional pins */
d47d88361feea2c Geert Uytterhoeven 2017-03-10  239  	hd->pins[PIN_CTRL_RW] =
=3D devm_gpiod_get_optional(dev, "rw",
d47d88361feea2c Geert Uytterhoeven 2017-03-10  240  							GPIOD_OUT_LOW);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  241  	if (IS_ERR(hd->pins[PI=
N_CTRL_RW])) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  242  		ret =3D PTR_ERR(hd->p=
ins[PIN_CTRL_RW]);
48ef34da2bee5cd Lars Poeschel      2020-09-21  243  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  244  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  245  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  246  	hd->pins[PIN_CTRL_BL] =
=3D devm_gpiod_get_optional(dev, "backlight",
d47d88361feea2c Geert Uytterhoeven 2017-03-10  247  							GPIOD_OUT_LOW);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  248  	if (IS_ERR(hd->pins[PI=
N_CTRL_BL])) {
d47d88361feea2c Geert Uytterhoeven 2017-03-10  249  		ret =3D PTR_ERR(hd->p=
ins[PIN_CTRL_BL]);
48ef34da2bee5cd Lars Poeschel      2020-09-21  250  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  251  	}
d47d88361feea2c Geert Uytterhoeven 2017-03-10  252  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  253  	/* Required properties=
 */
c7c3f096eb5e721 Geert Uytterhoeven 2017-03-23 @254  	ret =3D device_propert=
y_read_u32(dev, "display-height-chars",
c7c3f096eb5e721 Geert Uytterhoeven 2017-03-23  255  				       &lcd->height=
);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  256  	if (ret)
48ef34da2bee5cd Lars Poeschel      2020-09-21  257  		goto fail3;
c7c3f096eb5e721 Geert Uytterhoeven 2017-03-23  258  	ret =3D device_propert=
y_read_u32(dev, "display-width-chars", &lcd->width);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  259  	if (ret)
48ef34da2bee5cd Lars Poeschel      2020-09-21  260  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  261  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  262  	/*
d47d88361feea2c Geert Uytterhoeven 2017-03-10  263  	 * On displays with mo=
re than two rows, the internal buffer width is
d47d88361feea2c Geert Uytterhoeven 2017-03-10  264  	 * usually equal to th=
e display width
d47d88361feea2c Geert Uytterhoeven 2017-03-10  265  	 */
d47d88361feea2c Geert Uytterhoeven 2017-03-10  266  	if (lcd->height > 2)
d47d88361feea2c Geert Uytterhoeven 2017-03-10  267  		lcd->bwidth =3D lcd->=
width;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  268  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  269  	/* Optional properties=
 */
d47d88361feea2c Geert Uytterhoeven 2017-03-10  270  	device_property_read_u=
32(dev, "internal-buffer-width", &lcd->bwidth);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  271  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  272  	lcd->ifwidth =3D ifwid=
th;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  273  	lcd->ops =3D ifwidth =
=3D=3D 8 ? &hd44780_ops_gpio8 : &hd44780_ops_gpio4;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  274  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  275  	ret =3D charlcd_regist=
er(lcd);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  276  	if (ret)
48ef34da2bee5cd Lars Poeschel      2020-09-21  277  		goto fail3;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  278  =

d47d88361feea2c Geert Uytterhoeven 2017-03-10  279  	platform_set_drvdata(p=
dev, lcd);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  280  	return 0;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  281  =

48ef34da2bee5cd Lars Poeschel      2020-09-21  282  fail3:
48ef34da2bee5cd Lars Poeschel      2020-09-21  283  	kfree(hd);
48ef34da2bee5cd Lars Poeschel      2020-09-21  284  fail2:
48ef34da2bee5cd Lars Poeschel      2020-09-21  285  	kfree(lcd);
48ef34da2bee5cd Lars Poeschel      2020-09-21  286  fail1:
48ef34da2bee5cd Lars Poeschel      2020-09-21  287  	kfree(hdc);
d47d88361feea2c Geert Uytterhoeven 2017-03-10  288  	return ret;
d47d88361feea2c Geert Uytterhoeven 2017-03-10  289  }
d47d88361feea2c Geert Uytterhoeven 2017-03-10  290  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1821823637565154303==--


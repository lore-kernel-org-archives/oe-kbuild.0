Content-Type: multipart/mixed; boundary="===============8543034636807268652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ojeda-linux:auxdisplay 2/25] drivers/auxdisplay/hd44780.c:254:6: warning: Variable 'ret' is reassigned a value before the old one has been used. 'break; '
Date: Thu, 05 Nov 2020 00:31:14 +0800
Message-ID: <202011050011.fDKyZKZk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8543034636807268652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lars Poeschel <poeschel@lemonage.de>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Willy Tarreau <w@1wt.eu>

tree:   https://github.com/ojeda/linux.git auxdisplay
head:   8c9108d014c5bd0f0da2e3544eb45dc56a6da92b
commit: 718e05ed92ecac0d9d3954bcc8064527c3ce7565 [2/25] auxdisplay: Introdu=
ce hd44780_common.[ch]
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

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

vim +254 drivers/auxdisplay/hd44780.c

d47d88361feea2 Geert Uytterhoeven 2017-03-10  177  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  178  static int hd44780_probe=
(struct platform_device *pdev)
d47d88361feea2 Geert Uytterhoeven 2017-03-10  179  {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  180  	struct device *dev =3D =
&pdev->dev;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  181  	unsigned int i, base;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  182  	struct charlcd *lcd;
718e05ed92ecac Lars Poeschel      2020-11-03  183  	struct hd44780_common *=
hdc;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  184  	struct hd44780 *hd;
718e05ed92ecac Lars Poeschel      2020-11-03  185  	int ifwidth, ret =3D -E=
NOMEM;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  186  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  187  	/* Required pins */
d47d88361feea2 Geert Uytterhoeven 2017-03-10  188  	ifwidth =3D gpiod_count=
(dev, "data");
d47d88361feea2 Geert Uytterhoeven 2017-03-10  189  	if (ifwidth < 0)
d47d88361feea2 Geert Uytterhoeven 2017-03-10  190  		return ifwidth;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  191  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  192  	switch (ifwidth) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  193  	case 4:
d47d88361feea2 Geert Uytterhoeven 2017-03-10  194  		base =3D PIN_DATA4;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  195  		break;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  196  	case 8:
d47d88361feea2 Geert Uytterhoeven 2017-03-10  197  		base =3D PIN_DATA0;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  198  		break;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  199  	default:
d47d88361feea2 Geert Uytterhoeven 2017-03-10  200  		return -EINVAL;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  201  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  202  =

718e05ed92ecac Lars Poeschel      2020-11-03  203  	hdc =3D hd44780_common_=
alloc();
718e05ed92ecac Lars Poeschel      2020-11-03  204  	if (!hdc)
718e05ed92ecac Lars Poeschel      2020-11-03  205  		return -ENOMEM;
718e05ed92ecac Lars Poeschel      2020-11-03  206  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  207  	lcd =3D charlcd_alloc(s=
izeof(struct hd44780));
d47d88361feea2 Geert Uytterhoeven 2017-03-10  208  	if (!lcd)
718e05ed92ecac Lars Poeschel      2020-11-03  209  		goto fail1;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  210  =

718e05ed92ecac Lars Poeschel      2020-11-03  211  	hd =3D kzalloc(sizeof(s=
truct hd44780), GFP_KERNEL);
718e05ed92ecac Lars Poeschel      2020-11-03  212  	if (!hd)
718e05ed92ecac Lars Poeschel      2020-11-03  213  		goto fail2;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  214  =

718e05ed92ecac Lars Poeschel      2020-11-03  215  	hdc->hd44780 =3D hd;
718e05ed92ecac Lars Poeschel      2020-11-03  216  	lcd->drvdata =3D hdc;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  217  	for (i =3D 0; i < ifwid=
th; i++) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  218  		hd->pins[base + i] =3D=
 devm_gpiod_get_index(dev, "data", i,
d47d88361feea2 Geert Uytterhoeven 2017-03-10  219  							  GPIOD_OUT_LOW);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  220  		if (IS_ERR(hd->pins[ba=
se + i])) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  221  			ret =3D PTR_ERR(hd->p=
ins[base + i]);
718e05ed92ecac Lars Poeschel      2020-11-03  222  			goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  223  		}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  224  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  225  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  226  	hd->pins[PIN_CTRL_E] =
=3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  227  	if (IS_ERR(hd->pins[PIN=
_CTRL_E])) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  228  		ret =3D PTR_ERR(hd->pi=
ns[PIN_CTRL_E]);
718e05ed92ecac Lars Poeschel      2020-11-03  229  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  230  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  231  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  232  	hd->pins[PIN_CTRL_RS] =
=3D devm_gpiod_get(dev, "rs", GPIOD_OUT_HIGH);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  233  	if (IS_ERR(hd->pins[PIN=
_CTRL_RS])) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  234  		ret =3D PTR_ERR(hd->pi=
ns[PIN_CTRL_RS]);
718e05ed92ecac Lars Poeschel      2020-11-03  235  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  236  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  237  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  238  	/* Optional pins */
d47d88361feea2 Geert Uytterhoeven 2017-03-10  239  	hd->pins[PIN_CTRL_RW] =
=3D devm_gpiod_get_optional(dev, "rw",
d47d88361feea2 Geert Uytterhoeven 2017-03-10  240  							GPIOD_OUT_LOW);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  241  	if (IS_ERR(hd->pins[PIN=
_CTRL_RW])) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  242  		ret =3D PTR_ERR(hd->pi=
ns[PIN_CTRL_RW]);
718e05ed92ecac Lars Poeschel      2020-11-03  243  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  244  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  245  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  246  	hd->pins[PIN_CTRL_BL] =
=3D devm_gpiod_get_optional(dev, "backlight",
d47d88361feea2 Geert Uytterhoeven 2017-03-10  247  							GPIOD_OUT_LOW);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  248  	if (IS_ERR(hd->pins[PIN=
_CTRL_BL])) {
d47d88361feea2 Geert Uytterhoeven 2017-03-10  249  		ret =3D PTR_ERR(hd->pi=
ns[PIN_CTRL_BL]);
718e05ed92ecac Lars Poeschel      2020-11-03  250  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  251  	}
d47d88361feea2 Geert Uytterhoeven 2017-03-10  252  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  253  	/* Required properties =
*/
c7c3f096eb5e72 Geert Uytterhoeven 2017-03-23 @254  	ret =3D device_property=
_read_u32(dev, "display-height-chars",
c7c3f096eb5e72 Geert Uytterhoeven 2017-03-23  255  				       &lcd->height);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  256  	if (ret)
718e05ed92ecac Lars Poeschel      2020-11-03  257  		goto fail3;
c7c3f096eb5e72 Geert Uytterhoeven 2017-03-23  258  	ret =3D device_property=
_read_u32(dev, "display-width-chars", &lcd->width);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  259  	if (ret)
718e05ed92ecac Lars Poeschel      2020-11-03  260  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  261  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  262  	/*
d47d88361feea2 Geert Uytterhoeven 2017-03-10  263  	 * On displays with mor=
e than two rows, the internal buffer width is
d47d88361feea2 Geert Uytterhoeven 2017-03-10  264  	 * usually equal to the=
 display width
d47d88361feea2 Geert Uytterhoeven 2017-03-10  265  	 */
d47d88361feea2 Geert Uytterhoeven 2017-03-10  266  	if (lcd->height > 2)
d47d88361feea2 Geert Uytterhoeven 2017-03-10  267  		lcd->bwidth =3D lcd->w=
idth;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  268  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  269  	/* Optional properties =
*/
d47d88361feea2 Geert Uytterhoeven 2017-03-10  270  	device_property_read_u3=
2(dev, "internal-buffer-width", &lcd->bwidth);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  271  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  272  	lcd->ifwidth =3D ifwidt=
h;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  273  	lcd->ops =3D ifwidth =
=3D=3D 8 ? &hd44780_ops_gpio8 : &hd44780_ops_gpio4;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  274  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  275  	ret =3D charlcd_registe=
r(lcd);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  276  	if (ret)
718e05ed92ecac Lars Poeschel      2020-11-03  277  		goto fail3;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  278  =

d47d88361feea2 Geert Uytterhoeven 2017-03-10  279  	platform_set_drvdata(pd=
ev, lcd);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  280  	return 0;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  281  =

718e05ed92ecac Lars Poeschel      2020-11-03  282  fail3:
718e05ed92ecac Lars Poeschel      2020-11-03  283  	kfree(hd);
718e05ed92ecac Lars Poeschel      2020-11-03  284  fail2:
718e05ed92ecac Lars Poeschel      2020-11-03  285  	kfree(lcd);
718e05ed92ecac Lars Poeschel      2020-11-03  286  fail1:
718e05ed92ecac Lars Poeschel      2020-11-03  287  	kfree(hdc);
d47d88361feea2 Geert Uytterhoeven 2017-03-10  288  	return ret;
d47d88361feea2 Geert Uytterhoeven 2017-03-10  289  }
d47d88361feea2 Geert Uytterhoeven 2017-03-10  290  =


:::::: The code at line 254 was first introduced by commit
:::::: c7c3f096eb5e721d8522ba060fa621ea906ef738 auxdisplay: hd44780: Fix DT=
 properties to include units of measurement

:::::: TO: Geert Uytterhoeven <geert@linux-m68k.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8543034636807268652==--


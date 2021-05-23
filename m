Content-Type: multipart/mixed; boundary="===============2056503522166679854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-regmap.c:132:21: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sun, 23 May 2021 11:53:08 +0800
Message-ID: <202105231101.RDA8M1Gz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2056503522166679854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "=C3=81lvaro Fern=C3=A1ndez Rojas" <noltari@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Jonas Gorski <jonas.gorski@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4ff2473bdb4cf2bb7d208ccf4418d3d7e6b1652c
commit: 705791e23ecd93d6c2697234fdf0c22b499c0a5b pinctrl: add a pincontrol =
driver for BCM6362
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpio-regmap.c:132:21: warning: Boolean result is used in bi=
twise operation. Clarify expression with parentheses. [clarifyCondition]
    if (!!(val & mask) ^ invert)
                       ^

vim +132 drivers/gpio/gpio-regmap.c

ebe363197e525f Michael Walle 2020-05-28  106  =

ebe363197e525f Michael Walle 2020-05-28  107  static int gpio_regmap_get_di=
rection(struct gpio_chip *chip,
ebe363197e525f Michael Walle 2020-05-28  108  				     unsigned int offset)
ebe363197e525f Michael Walle 2020-05-28  109  {
ebe363197e525f Michael Walle 2020-05-28  110  	struct gpio_regmap *gpio =3D=
 gpiochip_get_data(chip);
ebe363197e525f Michael Walle 2020-05-28  111  	unsigned int base, val, reg,=
 mask;
ebe363197e525f Michael Walle 2020-05-28  112  	int invert, ret;
ebe363197e525f Michael Walle 2020-05-28  113  =

ebe363197e525f Michael Walle 2020-05-28  114  	if (gpio->reg_dir_out_base) {
ebe363197e525f Michael Walle 2020-05-28  115  		base =3D gpio_regmap_addr(g=
pio->reg_dir_out_base);
ebe363197e525f Michael Walle 2020-05-28  116  		invert =3D 0;
ebe363197e525f Michael Walle 2020-05-28  117  	} else if (gpio->reg_dir_in_=
base) {
ebe363197e525f Michael Walle 2020-05-28  118  		base =3D gpio_regmap_addr(g=
pio->reg_dir_in_base);
ebe363197e525f Michael Walle 2020-05-28  119  		invert =3D 1;
ebe363197e525f Michael Walle 2020-05-28  120  	} else {
ebe363197e525f Michael Walle 2020-05-28  121  		return -EOPNOTSUPP;
ebe363197e525f Michael Walle 2020-05-28  122  	}
ebe363197e525f Michael Walle 2020-05-28  123  =

ebe363197e525f Michael Walle 2020-05-28  124  	ret =3D gpio->reg_mask_xlate=
(gpio, base, offset, &reg, &mask);
ebe363197e525f Michael Walle 2020-05-28  125  	if (ret)
ebe363197e525f Michael Walle 2020-05-28  126  		return ret;
ebe363197e525f Michael Walle 2020-05-28  127  =

ebe363197e525f Michael Walle 2020-05-28  128  	ret =3D regmap_read(gpio->re=
gmap, reg, &val);
ebe363197e525f Michael Walle 2020-05-28  129  	if (ret)
ebe363197e525f Michael Walle 2020-05-28  130  		return ret;
ebe363197e525f Michael Walle 2020-05-28  131  =

ebe363197e525f Michael Walle 2020-05-28 @132  	if (!!(val & mask) ^ invert)
ebe363197e525f Michael Walle 2020-05-28  133  		return GPIO_LINE_DIRECTION_=
OUT;
ebe363197e525f Michael Walle 2020-05-28  134  	else
ebe363197e525f Michael Walle 2020-05-28  135  		return GPIO_LINE_DIRECTION_=
IN;
ebe363197e525f Michael Walle 2020-05-28  136  }
ebe363197e525f Michael Walle 2020-05-28  137  =


:::::: The code at line 132 was first introduced by commit
:::::: ebe363197e525ffbd279c729421f6f6c24d8d681 gpio: add a reusable generi=
c gpio_chip using regmap

:::::: TO: Michael Walle <michael@walle.cc>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2056503522166679854==--


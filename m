Content-Type: multipart/mixed; boundary="===============8687203334074726586=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpio/gpio-regmap.c:132:21: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Tue, 30 Mar 2021 01:16:02 +0800
Message-ID: <202103300158.4bIeWrRs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8687203334074726586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Walle <michael@walle.cc>
CC: Lee Jones <lee.jones@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Michael,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a5e13c6df0e41702d2b2c77c8ad41677ebb065b3
commit: b7536d8749e54923c9a7e8c4175e1e4f9b8c1541 gpio: Add support for the =
sl28cpld GPIO controller
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

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
--===============8687203334074726586==--


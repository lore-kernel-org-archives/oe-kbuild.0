Content-Type: multipart/mixed; boundary="===============4836296219050738811=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/tlv320adc3xxx.c:845:55: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Tue, 01 Mar 2022 03:49:32 +0800
Message-ID: <202203010333.W6pNYpgA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4836296219050738811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ricard Wanderlof <ricardw@axis.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e57714cd0ad2d5bb90e50b5096a0e671dec1ef3
commit: e9a3b57efd28fe889a98171bdc1e9e0dd7eb9a50 ASoC: codec: tlv320adc3xxx=
: New codec driver
date:   2 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 2 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/codecs/tlv320adc3xxx.c:845:55: warning: Boolean result is used=
 in bitwise operation. Clarify expression with parentheses. [clarifyConditi=
on]
         ADC3XXX_GPIO_GPO << ADC3XXX_GPIO_CTRL_CFG_SHIFT |
                                                         ^

vim +845 sound/soc/codecs/tlv320adc3xxx.c

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  834  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  835  static int adc3xxx_gpio_di=
rection_out(struct gpio_chip *chip,
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  836  				      unsigned int off=
set, int value)
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  837  {
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  838  	struct adc3xxx *adc3xxx =
=3D gpiochip_get_data(chip);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  839  =

e9a3b57efd28fe Ricard Wanderlof 2021-12-15  840  	/* Set GPIO output functi=
on. */
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  841  	return regmap_update_bits=
(adc3xxx->regmap,
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  842  				  adc3xxx_gpio_ctrl_re=
g[offset],
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  843  				  ADC3XXX_GPIO_CTRL_CF=
G_MASK |
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  844  				  ADC3XXX_GPIO_CTRL_OU=
TPUT_CTRL_MASK,
e9a3b57efd28fe Ricard Wanderlof 2021-12-15 @845  				  ADC3XXX_GPIO_GPO << =
ADC3XXX_GPIO_CTRL_CFG_SHIFT |
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  846  				  !!value << ADC3XXX_G=
PIO_CTRL_OUTPUT_CTRL_SHIFT);
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  847  }
e9a3b57efd28fe Ricard Wanderlof 2021-12-15  848  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4836296219050738811==--


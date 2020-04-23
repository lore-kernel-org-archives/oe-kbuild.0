Content-Type: multipart/mixed; boundary="===============2784441751176192350=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 2326/4517] drivers/gpio/gpio-pca953x.c:499 pca953x_gpio_get_multiple() error: uninitialized symbol 'reg_val'.
Date: Fri, 24 Apr 2020 03:33:54 +0800
Message-ID: <202004240349.89mccCeV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2784441751176192350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Paul Thomas <pthomas8589@gmail.com>
CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   aefe184e814492e36b2ca350c1522bd71b09b520
commit: 96d7c7b3e6545612c1d37944621fdd611afd6adf [2326/4517] gpio: gpio-pca=
953x, Add get_multiple function
:::::: branch date: 12 hours ago
:::::: commit date: 7 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpio/gpio-pca953x.c:499 pca953x_gpio_get_multiple() error: uninitia=
lized symbol 'reg_val'.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D96d7c7b3e6545612c1d37944621fdd611afd6adf
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 96d7c7b3e6545612c1d37944621fdd611afd6adf
vim +/reg_val +499 drivers/gpio/gpio-pca953x.c

66e57192319bdd Andy Shevchenko 2017-03-22  469  =

96d7c7b3e65456 Paul Thomas     2020-04-14  470  static int pca953x_gpio_get=
_multiple(struct gpio_chip *gc,
96d7c7b3e65456 Paul Thomas     2020-04-14  471  				      unsigned long *ma=
sk, unsigned long *bits)
96d7c7b3e65456 Paul Thomas     2020-04-14  472  {
96d7c7b3e65456 Paul Thomas     2020-04-14  473  	struct pca953x_chip *chip =
=3D gpiochip_get_data(gc);
96d7c7b3e65456 Paul Thomas     2020-04-14  474  	unsigned int reg_val;
96d7c7b3e65456 Paul Thomas     2020-04-14  475  	int offset, value, i, ret =
=3D 0;
96d7c7b3e65456 Paul Thomas     2020-04-14  476  	u8 inreg;
96d7c7b3e65456 Paul Thomas     2020-04-14  477  =

96d7c7b3e65456 Paul Thomas     2020-04-14  478  	/* Force offset outside th=
e range of i so that
96d7c7b3e65456 Paul Thomas     2020-04-14  479  	 * at least the first rele=
vant register is read
96d7c7b3e65456 Paul Thomas     2020-04-14  480  	 */
96d7c7b3e65456 Paul Thomas     2020-04-14  481  	offset =3D gc->ngpio;
96d7c7b3e65456 Paul Thomas     2020-04-14  482  	for_each_set_bit(i, mask, =
gc->ngpio) {
96d7c7b3e65456 Paul Thomas     2020-04-14  483  		/* whenever i goes into a=
 new bank update inreg
96d7c7b3e65456 Paul Thomas     2020-04-14  484  		 * and read the register
96d7c7b3e65456 Paul Thomas     2020-04-14  485  		 */
96d7c7b3e65456 Paul Thomas     2020-04-14  486  		if ((offset >> BANK_SFT) =
!=3D (i >> BANK_SFT)) {
96d7c7b3e65456 Paul Thomas     2020-04-14  487  			offset =3D i;
96d7c7b3e65456 Paul Thomas     2020-04-14  488  			inreg =3D pca953x_recalc=
_addr(chip, chip->regs->input,
96d7c7b3e65456 Paul Thomas     2020-04-14  489  						    offset, true, fal=
se);
96d7c7b3e65456 Paul Thomas     2020-04-14  490  			mutex_lock(&chip->i2c_lo=
ck);
96d7c7b3e65456 Paul Thomas     2020-04-14  491  			ret =3D regmap_read(chip=
->regmap, inreg, &reg_val);
96d7c7b3e65456 Paul Thomas     2020-04-14  492  			mutex_unlock(&chip->i2c_=
lock);
96d7c7b3e65456 Paul Thomas     2020-04-14  493  			if (ret < 0)
96d7c7b3e65456 Paul Thomas     2020-04-14  494  				return ret;
96d7c7b3e65456 Paul Thomas     2020-04-14  495  		}
96d7c7b3e65456 Paul Thomas     2020-04-14  496  		/* reg_val is relative to=
 the last read byte,
96d7c7b3e65456 Paul Thomas     2020-04-14  497  		 * so only shift the rela=
tive bits
96d7c7b3e65456 Paul Thomas     2020-04-14  498  		 */
96d7c7b3e65456 Paul Thomas     2020-04-14 @499  		value =3D (reg_val >> (i =
% 8)) & 0x01;
96d7c7b3e65456 Paul Thomas     2020-04-14  500  		__assign_bit(i, bits, val=
ue);
96d7c7b3e65456 Paul Thomas     2020-04-14  501  	}
96d7c7b3e65456 Paul Thomas     2020-04-14  502  	return ret;
96d7c7b3e65456 Paul Thomas     2020-04-14  503  }
96d7c7b3e65456 Paul Thomas     2020-04-14  504  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2784441751176192350==--


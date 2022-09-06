Content-Type: multipart/mixed; boundary="===============2115375985290536780=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/5] gpio: pca953x: Add support for PCAL6534
Date: Wed, 07 Sep 2022 03:07:33 +0800
Message-ID: <202209070210.q7hXXYzv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2115375985290536780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906082820.4030401-5-martyn.welch@collabora.co.uk>
References: <20220906082820.4030401-5-martyn.welch@collabora.co.uk>
TO: Martyn Welch <martyn.welch@collabora.co.uk>

Hi Martyn,

I love your patch! Perhaps something to improve:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.=
0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martyn-Welch/dt-bind=
ings-vendor-prefixes-add-Diodes/20220906-163145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio=
/for-next
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20907/202209070210.q7hXXYzv-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpio/gpio-pca953x.c:475 pcal6534_recalc_addr() error: uninitialized=
 symbol 'pinctrl'.

vim +/pinctrl +475 drivers/gpio/gpio-pca953x.c

982768fce8419d Martyn Welch        2022-09-06  445  =

982768fce8419d Martyn Welch        2022-09-06  446  /* The PCAL6534 and com=
patible chips have altered bank alignment that doesn't
982768fce8419d Martyn Welch        2022-09-06  447   * fit within the bit s=
hifting scheme used for other devices.
982768fce8419d Martyn Welch        2022-09-06  448   */
982768fce8419d Martyn Welch        2022-09-06  449  static u8 pcal6534_reca=
lc_addr(struct pca953x_chip *chip, int reg, int off)
982768fce8419d Martyn Welch        2022-09-06  450  {
982768fce8419d Martyn Welch        2022-09-06  451  	int addr;
982768fce8419d Martyn Welch        2022-09-06  452  	int pinctrl;
982768fce8419d Martyn Welch        2022-09-06  453  =

982768fce8419d Martyn Welch        2022-09-06  454  	addr =3D (reg & PCAL_G=
PIO_MASK) * NBANK(chip);
982768fce8419d Martyn Welch        2022-09-06  455  =

982768fce8419d Martyn Welch        2022-09-06  456  	switch (reg) {
982768fce8419d Martyn Welch        2022-09-06  457  	case PCAL953X_OUT_STRE=
NGTH:
982768fce8419d Martyn Welch        2022-09-06  458  	case PCAL953X_IN_LATCH:
982768fce8419d Martyn Welch        2022-09-06  459  	case PCAL953X_PULL_EN:
982768fce8419d Martyn Welch        2022-09-06  460  	case PCAL953X_PULL_SEL:
982768fce8419d Martyn Welch        2022-09-06  461  	case PCAL953X_INT_MASK:
982768fce8419d Martyn Welch        2022-09-06  462  	case PCAL953X_INT_STAT:
982768fce8419d Martyn Welch        2022-09-06  463  	case PCAL953X_OUT_CONF:
982768fce8419d Martyn Welch        2022-09-06  464  		pinctrl =3D ((reg & P=
CAL_PINCTRL_MASK) >> 1) + 0x20;
982768fce8419d Martyn Welch        2022-09-06  465  		break;
982768fce8419d Martyn Welch        2022-09-06  466  	case PCAL6524_INT_EDGE:
982768fce8419d Martyn Welch        2022-09-06  467  	case PCAL6524_INT_CLR:
982768fce8419d Martyn Welch        2022-09-06  468  	case PCAL6524_IN_STATU=
S:
982768fce8419d Martyn Welch        2022-09-06  469  	case PCAL6524_OUT_INDC=
ONF:
982768fce8419d Martyn Welch        2022-09-06  470  	case PCAL6524_DEBOUNCE:
982768fce8419d Martyn Welch        2022-09-06  471  		pinctrl =3D ((reg & P=
CAL_PINCTRL_MASK) >> 1) + 0x1c;
982768fce8419d Martyn Welch        2022-09-06  472  		break;
982768fce8419d Martyn Welch        2022-09-06  473  	}
982768fce8419d Martyn Welch        2022-09-06  474  =

982768fce8419d Martyn Welch        2022-09-06 @475  	return pinctrl + addr =
+ (off / BANK_SZ);
c6e3cf01d31d88 Bartosz Golaszewski 2016-09-09  476  }
c6e3cf01d31d88 Bartosz Golaszewski 2016-09-09  477  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2115375985290536780==--


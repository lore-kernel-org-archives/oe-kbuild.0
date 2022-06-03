Content-Type: multipart/mixed; boundary="===============4770323286831263290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-ingenic.c:162 is_soc_or_above() warn: bitwise AND condition is false here
Date: Fri, 03 Jun 2022 12:13:43 +0800
Message-ID: <202206031240.nCj5vYaI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4770323286831263290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50fd82b3a9a9335df5d50c7ddcb81c81d358c4fc
commit: 8d2d607c6cd8c8bcbfdb8b399a1d28af27bb238d pinctrl: ingenic: Garbage-=
collect code paths for SoCs disabled by config
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
config: nios2-randconfig-m031-20220601 (https://download.01.org/0day-ci/arc=
hive/20220603/202206031240.nCj5vYaI-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pinctrl/pinctrl-ingenic.c:162 is_soc_or_above() warn: bitwise AND c=
ondition is false here

vim +162 drivers/pinctrl/pinctrl-ingenic.c

e72394e2ea196a0 Paul Cercueil 2018-08-21  141  =

8d2d607c6cd8c8b Paul Cercueil 2022-04-12  142  static const unsigned long e=
nabled_socs =3D
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  143  	IS_ENABLED(CONFIG_MACH_JZ47=
30) << ID_JZ4730 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  144  	IS_ENABLED(CONFIG_MACH_JZ47=
40) << ID_JZ4740 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  145  	IS_ENABLED(CONFIG_MACH_JZ47=
25B) << ID_JZ4725B |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  146  	IS_ENABLED(CONFIG_MACH_JZ47=
50) << ID_JZ4750 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  147  	IS_ENABLED(CONFIG_MACH_JZ47=
55) << ID_JZ4755 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  148  	IS_ENABLED(CONFIG_MACH_JZ47=
60) << ID_JZ4760 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  149  	IS_ENABLED(CONFIG_MACH_JZ47=
70) << ID_JZ4770 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  150  	IS_ENABLED(CONFIG_MACH_JZ47=
75) << ID_JZ4775 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  151  	IS_ENABLED(CONFIG_MACH_JZ47=
80) << ID_JZ4780 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  152  	IS_ENABLED(CONFIG_MACH_X100=
0) << ID_X1000 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  153  	IS_ENABLED(CONFIG_MACH_X150=
0) << ID_X1500 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  154  	IS_ENABLED(CONFIG_MACH_X183=
0) << ID_X1830 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  155  	IS_ENABLED(CONFIG_MACH_X200=
0) << ID_X2000 |
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  156  	IS_ENABLED(CONFIG_MACH_X210=
0) << ID_X2100;
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  157  =

8d2d607c6cd8c8b Paul Cercueil 2022-04-12  158  static bool
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  159  is_soc_or_above(const struct=
 ingenic_pinctrl *jzpc, enum jz_version version)
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  160  {
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  161  	return (enabled_socs >> ver=
sion) &&
8d2d607c6cd8c8b Paul Cercueil 2022-04-12 @162  		(!(enabled_socs & GENMASK(=
version - 1, 0))
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  163  		 || jzpc->info->version >=
=3D version);
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  164  }
8d2d607c6cd8c8b Paul Cercueil 2022-04-12  165  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4770323286831263290==--


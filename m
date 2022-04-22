Content-Type: multipart/mixed; boundary="===============0312199089068229522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5335/5845] drivers/pinctrl/pinctrl-ingenic.c:162 is_soc_or_above() warn: bitwise AND condition is false here
Date: Sat, 23 Apr 2022 05:50:05 +0800
Message-ID: <202204230531.NOfuVMxk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0312199089068229522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Cercueil <paul@crapouillou.net>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: c9c5123a32e41a1f00de39a44f51f50c91b2dc35 [5335/5845] pinctrl: ingen=
ic: Garbage-collect code paths for SoCs disabled by config
:::::: branch date: 16 hours ago
:::::: commit date: 32 hours ago
config: xtensa-randconfig-m031-20220422 (https://download.01.org/0day-ci/ar=
chive/20220423/202204230531.NOfuVMxk-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pinctrl/pinctrl-ingenic.c:162 is_soc_or_above() warn: bitwise AND c=
ondition is false here

vim +162 drivers/pinctrl/pinctrl-ingenic.c

e72394e2ea196a Paul Cercueil 2018-08-21  141  =

c9c5123a32e41a Paul Cercueil 2022-04-12  142  static const unsigned long en=
abled_socs =3D
c9c5123a32e41a Paul Cercueil 2022-04-12  143  	IS_ENABLED(CONFIG_MACH_JZ473=
0) << ID_JZ4730 |
c9c5123a32e41a Paul Cercueil 2022-04-12  144  	IS_ENABLED(CONFIG_MACH_JZ474=
0) << ID_JZ4740 |
c9c5123a32e41a Paul Cercueil 2022-04-12  145  	IS_ENABLED(CONFIG_MACH_JZ472=
5B) << ID_JZ4725B |
c9c5123a32e41a Paul Cercueil 2022-04-12  146  	IS_ENABLED(CONFIG_MACH_JZ475=
0) << ID_JZ4750 |
c9c5123a32e41a Paul Cercueil 2022-04-12  147  	IS_ENABLED(CONFIG_MACH_JZ475=
5) << ID_JZ4755 |
c9c5123a32e41a Paul Cercueil 2022-04-12  148  	IS_ENABLED(CONFIG_MACH_JZ476=
0) << ID_JZ4760 |
c9c5123a32e41a Paul Cercueil 2022-04-12  149  	IS_ENABLED(CONFIG_MACH_JZ477=
0) << ID_JZ4770 |
c9c5123a32e41a Paul Cercueil 2022-04-12  150  	IS_ENABLED(CONFIG_MACH_JZ477=
5) << ID_JZ4775 |
c9c5123a32e41a Paul Cercueil 2022-04-12  151  	IS_ENABLED(CONFIG_MACH_JZ478=
0) << ID_JZ4780 |
c9c5123a32e41a Paul Cercueil 2022-04-12  152  	IS_ENABLED(CONFIG_MACH_X1000=
) << ID_X1000 |
c9c5123a32e41a Paul Cercueil 2022-04-12  153  	IS_ENABLED(CONFIG_MACH_X1500=
) << ID_X1500 |
c9c5123a32e41a Paul Cercueil 2022-04-12  154  	IS_ENABLED(CONFIG_MACH_X1830=
) << ID_X1830 |
c9c5123a32e41a Paul Cercueil 2022-04-12  155  	IS_ENABLED(CONFIG_MACH_X2000=
) << ID_X2000 |
c9c5123a32e41a Paul Cercueil 2022-04-12  156  	IS_ENABLED(CONFIG_MACH_X2100=
) << ID_X2100;
c9c5123a32e41a Paul Cercueil 2022-04-12  157  =

c9c5123a32e41a Paul Cercueil 2022-04-12  158  static bool
c9c5123a32e41a Paul Cercueil 2022-04-12  159  is_soc_or_above(const struct =
ingenic_pinctrl *jzpc, enum jz_version version)
c9c5123a32e41a Paul Cercueil 2022-04-12  160  {
c9c5123a32e41a Paul Cercueil 2022-04-12  161  	return (enabled_socs >> vers=
ion) &&
c9c5123a32e41a Paul Cercueil 2022-04-12 @162  		(!(enabled_socs & GENMASK(v=
ersion - 1, 0))
c9c5123a32e41a Paul Cercueil 2022-04-12  163  		 || jzpc->info->version >=
=3D version);
c9c5123a32e41a Paul Cercueil 2022-04-12  164  }
c9c5123a32e41a Paul Cercueil 2022-04-12  165  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0312199089068229522==--


Content-Type: multipart/mixed; boundary="===============8055827366548802811=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [power-supply:for-next 38/46] drivers/power/supply/bq27xxx_battery.c:520:34-47: WARNING bq27000_props and bq34z100_props (line 794) are identical
Date: Sat, 16 Jan 2021 23:30:35 +0800
Message-ID: <202101162329.tPlIhGSI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8055827366548802811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hermes Zhang <chenhuiz@axis.com>
CC: Sebastian Reichel <sre@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
head:   95b78d53706d3866c232e4f4819ad38a88f148d4
commit: 3ed510f06e12f8876c20474766cc2f101a41174f [38/46] power: supply: bq2=
7xxx: Support CHARGE_NOW for bq27z561/bq28z610/bq34z100
:::::: branch date: 88 minutes ago
:::::: commit date: 5 hours ago
config: microblaze-randconfig-c004-20210116 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


"coccinelle warnings: (new ones prefixed by >>)"
   drivers/power/supply/bq27xxx_battery.c:456:1-14: WARNING bq27z561_regs a=
nd bq28z610_regs (line 477) are identical
>> drivers/power/supply/bq27xxx_battery.c:520:34-47: WARNING bq27000_props =
and bq34z100_props (line 794) are identical
   drivers/power/supply/bq27xxx_battery.c:754:34-48: WARNING bq27z561_props=
 and bq28z610_props (line 774) are identical

vim +520 drivers/power/supply/bq27xxx_battery.c

d74534c27775857c drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2015-09-22  127  =

0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  128  #define BQ27XXX_DM_REG_ROWS \
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  129  	[BQ27XXX_DM_CTRL] =3D 0x61,  \
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  130  	[BQ27XXX_DM_CLASS] =3D 0x3e, \
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  131  	[BQ27XXX_DM_BLOCK] =3D 0x3f, \
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  132  	[BQ27XXX_DM_DATA] =3D 0x40,  \
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  133  	[BQ27XXX_DM_CKSUM] =3D 0x60
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  134  =

d74534c27775857c drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2015-09-22  135  /* Register mappings */
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  136  static u8
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  137  	bq27000_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  138  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  139  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  140  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  141  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  142  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  143  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  144  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  145  		[BQ27XXX_REG_TTF] =3D 0x18,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  146  		[BQ27XXX_REG_TTES] =3D 0x1c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  147  		[BQ27XXX_REG_TTECP] =3D 0x26,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  148  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  149  		[BQ27XXX_REG_RC] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  150  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  151  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  152  		[BQ27XXX_REG_AE] =3D 0x22,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  153  		[BQ27XXX_REG_SOC] =3D 0x0b,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  154  		[BQ27XXX_REG_DCAP] =3D 0x76,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  155  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  156  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  157  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  158  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  159  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  160  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  161  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  162  	bq27010_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  163  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  164  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  165  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  166  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  167  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  168  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  169  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  170  		[BQ27XXX_REG_TTF] =3D 0x18,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  171  		[BQ27XXX_REG_TTES] =3D 0x1c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  172  		[BQ27XXX_REG_TTECP] =3D 0x26,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  173  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  174  		[BQ27XXX_REG_RC] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  175  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  176  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  177  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  178  		[BQ27XXX_REG_SOC] =3D 0x0b,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  179  		[BQ27XXX_REG_DCAP] =3D 0x76,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  180  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  181  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  182  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  183  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  184  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  185  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  186  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  187  	bq2750x_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  188  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  189  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  190  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  191  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  192  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  193  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  194  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  195  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  196  		[BQ27XXX_REG_TTES] =3D 0x1a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  197  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  198  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  199  		[BQ27XXX_REG_RC] =3D 0x10,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  200  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  201  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  202  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  203  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  204  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  205  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  206  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  207  	},
1059361fb69b6cae drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  208  #define bq2751x_regs bq27510g3_regs
1059361fb69b6cae drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  209  #define bq2752x_regs bq27510g3_regs
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  210  	bq27500_regs[BQ27XXX_REG_MAX] =3D {
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  211  		[BQ27XXX_REG_CTRL] =3D 0x00,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  212  		[BQ27XXX_REG_TEMP] =3D 0x06,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  213  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  214  		[BQ27XXX_REG_VOLT] =3D 0x08,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  215  		[BQ27XXX_REG_AI] =3D 0x14,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  216  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  217  		[BQ27XXX_REG_TTE] =3D 0x16,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  218  		[BQ27XXX_REG_TTF] =3D 0x18,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  219  		[BQ27XXX_REG_TTES] =3D 0x1c,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  220  		[BQ27XXX_REG_TTECP] =3D 0x26,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  221  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  222  		[BQ27XXX_REG_RC] =3D 0x10,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  223  		[BQ27XXX_REG_FCC] =3D 0x12,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  224  		[BQ27XXX_REG_CYCT] =3D 0x2a,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  225  		[BQ27XXX_REG_AE] =3D 0x22,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  226  		[BQ27XXX_REG_SOC] =3D 0x2c,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  227  		[BQ27XXX_REG_DCAP] =3D 0x3c,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  228  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  229  		BQ27XXX_DM_REG_ROWS,
32833635b0fe9bf7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  230  	},
1059361fb69b6cae drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  231  #define bq27510g1_regs bq27500_regs
1059361fb69b6cae drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  232  #define bq27510g2_regs bq27500_regs
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  233  	bq27510g3_regs[BQ27XXX_REG_MAX] =3D {
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  234  		[BQ27XXX_REG_CTRL] =3D 0x00,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  235  		[BQ27XXX_REG_TEMP] =3D 0x06,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  236  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  237  		[BQ27XXX_REG_VOLT] =3D 0x08,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  238  		[BQ27XXX_REG_AI] =3D 0x14,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  239  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  240  		[BQ27XXX_REG_TTE] =3D 0x16,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  241  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  242  		[BQ27XXX_REG_TTES] =3D 0x1a,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  243  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  244  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  245  		[BQ27XXX_REG_RC] =3D 0x10,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  246  		[BQ27XXX_REG_FCC] =3D 0x12,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  247  		[BQ27XXX_REG_CYCT] =3D 0x1e,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  248  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  249  		[BQ27XXX_REG_SOC] =3D 0x20,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  250  		[BQ27XXX_REG_DCAP] =3D 0x2e,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  251  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  252  		BQ27XXX_DM_REG_ROWS,
71375aa7d6a7392d drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  253  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  254  	bq27520g1_regs[BQ27XXX_REG_MAX] =3D {
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  255  		[BQ27XXX_REG_CTRL] =3D 0x00,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  256  		[BQ27XXX_REG_TEMP] =3D 0x06,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  257  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  258  		[BQ27XXX_REG_VOLT] =3D 0x08,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  259  		[BQ27XXX_REG_AI] =3D 0x14,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  260  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  261  		[BQ27XXX_REG_TTE] =3D 0x16,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  262  		[BQ27XXX_REG_TTF] =3D 0x18,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  263  		[BQ27XXX_REG_TTES] =3D 0x1c,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  264  		[BQ27XXX_REG_TTECP] =3D 0x26,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  265  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  266  		[BQ27XXX_REG_RC] =3D 0x10,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  267  		[BQ27XXX_REG_FCC] =3D 0x12,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  268  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  269  		[BQ27XXX_REG_AE] =3D 0x22,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  270  		[BQ27XXX_REG_SOC] =3D 0x2c,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  271  		[BQ27XXX_REG_DCAP] =3D 0x3c,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  272  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  273  		BQ27XXX_DM_REG_ROWS,
68f2a813eb25bd0e drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  274  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  275  	bq27520g2_regs[BQ27XXX_REG_MAX] =3D {
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  276  		[BQ27XXX_REG_CTRL] =3D 0x00,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  277  		[BQ27XXX_REG_TEMP] =3D 0x06,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  278  		[BQ27XXX_REG_INT_TEMP] =3D 0x36,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  279  		[BQ27XXX_REG_VOLT] =3D 0x08,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  280  		[BQ27XXX_REG_AI] =3D 0x14,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  281  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  282  		[BQ27XXX_REG_TTE] =3D 0x16,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  283  		[BQ27XXX_REG_TTF] =3D 0x18,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  284  		[BQ27XXX_REG_TTES] =3D 0x1c,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  285  		[BQ27XXX_REG_TTECP] =3D 0x26,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  286  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  287  		[BQ27XXX_REG_RC] =3D 0x10,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  288  		[BQ27XXX_REG_FCC] =3D 0x12,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  289  		[BQ27XXX_REG_CYCT] =3D 0x2a,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  290  		[BQ27XXX_REG_AE] =3D 0x22,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  291  		[BQ27XXX_REG_SOC] =3D 0x2c,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  292  		[BQ27XXX_REG_DCAP] =3D 0x3c,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  293  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  294  		BQ27XXX_DM_REG_ROWS,
a5deb9a93040a4a2 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  295  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  296  	bq27520g3_regs[BQ27XXX_REG_MAX] =3D {
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  297  		[BQ27XXX_REG_CTRL] =3D 0x00,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  298  		[BQ27XXX_REG_TEMP] =3D 0x06,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  299  		[BQ27XXX_REG_INT_TEMP] =3D 0x36,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  300  		[BQ27XXX_REG_VOLT] =3D 0x08,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  301  		[BQ27XXX_REG_AI] =3D 0x14,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  302  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  303  		[BQ27XXX_REG_TTE] =3D 0x16,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  304  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  305  		[BQ27XXX_REG_TTES] =3D 0x1c,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  306  		[BQ27XXX_REG_TTECP] =3D 0x26,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  307  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  308  		[BQ27XXX_REG_RC] =3D 0x10,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  309  		[BQ27XXX_REG_FCC] =3D 0x12,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  310  		[BQ27XXX_REG_CYCT] =3D 0x2a,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  311  		[BQ27XXX_REG_AE] =3D 0x22,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  312  		[BQ27XXX_REG_SOC] =3D 0x2c,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  313  		[BQ27XXX_REG_DCAP] =3D 0x3c,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  314  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  315  		BQ27XXX_DM_REG_ROWS,
825e915ba2e811b9 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  316  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  317  	bq27520g4_regs[BQ27XXX_REG_MAX] =3D {
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  318  		[BQ27XXX_REG_CTRL] =3D 0x00,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  319  		[BQ27XXX_REG_TEMP] =3D 0x06,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  320  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  321  		[BQ27XXX_REG_VOLT] =3D 0x08,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  322  		[BQ27XXX_REG_AI] =3D 0x14,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  323  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  324  		[BQ27XXX_REG_TTE] =3D 0x16,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  325  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  326  		[BQ27XXX_REG_TTES] =3D 0x1c,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  327  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  328  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  329  		[BQ27XXX_REG_RC] =3D 0x10,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  330  		[BQ27XXX_REG_FCC] =3D 0x12,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  331  		[BQ27XXX_REG_CYCT] =3D 0x1e,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  332  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  333  		[BQ27XXX_REG_SOC] =3D 0x20,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  334  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  335  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  336  		BQ27XXX_DM_REG_ROWS,
8835cae5f2abd7f7 drivers/power/supply/bq27xxx_battery.c Chris Lapa         =
 2017-01-11  337  	},
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  338  	bq27521_regs[BQ27XXX_REG_MAX] =3D {
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  339  		[BQ27XXX_REG_CTRL] =3D 0x02,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  340  		[BQ27XXX_REG_TEMP] =3D 0x0a,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  341  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  342  		[BQ27XXX_REG_VOLT] =3D 0x0c,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  343  		[BQ27XXX_REG_AI] =3D 0x0e,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  344  		[BQ27XXX_REG_FLAGS] =3D 0x08,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  345  		[BQ27XXX_REG_TTE] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  346  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  347  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  348  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  349  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  350  		[BQ27XXX_REG_RC] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  351  		[BQ27XXX_REG_FCC] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  352  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  353  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  354  		[BQ27XXX_REG_SOC] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  355  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  356  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  357  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  358  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  359  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  360  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  361  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
70a39e1075019eef drivers/power/supply/bq27xxx_battery.c Pavel Machek       =
 2017-11-10  362  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  363  	bq27530_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  364  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  365  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  366  		[BQ27XXX_REG_INT_TEMP] =3D 0x32,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  367  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  368  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  369  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  370  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  371  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  372  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  373  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  374  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  375  		[BQ27XXX_REG_RC] =3D 0x10,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  376  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  377  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  378  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  379  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  380  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  381  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  382  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  383  	},
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  384  #define bq27531_regs bq27530_regs
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  385  	bq27541_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  386  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  387  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  388  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  389  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  390  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  391  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  392  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  393  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  394  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  395  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  396  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  397  		[BQ27XXX_REG_RC] =3D 0x10,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  398  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  399  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  400  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  401  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  402  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  403  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  404  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  405  	},
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  406  #define bq27542_regs bq27541_regs
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  407  #define bq27546_regs bq27541_regs
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  408  #define bq27742_regs bq27541_regs
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  409  	bq27545_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  410  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  411  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  412  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  413  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  414  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  415  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  416  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  417  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  418  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  419  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  420  		[BQ27XXX_REG_NAC] =3D 0x0c,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  421  		[BQ27XXX_REG_RC] =3D 0x10,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  422  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  423  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  424  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  425  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  426  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  427  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  428  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714d6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-06-17  429  	},
9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  430  	bq27421_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  431  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  432  		[BQ27XXX_REG_TEMP] =3D 0x02,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  433  		[BQ27XXX_REG_INT_TEMP] =3D 0x1e,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  434  		[BQ27XXX_REG_VOLT] =3D 0x04,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  435  		[BQ27XXX_REG_AI] =3D 0x10,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  436  		[BQ27XXX_REG_FLAGS] =3D 0x06,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  437  		[BQ27XXX_REG_TTE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  438  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  439  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  440  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  441  		[BQ27XXX_REG_NAC] =3D 0x08,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  442  		[BQ27XXX_REG_RC] =3D 0x0c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  443  		[BQ27XXX_REG_FCC] =3D 0x0e,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  444  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  445  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  446  		[BQ27XXX_REG_SOC] =3D 0x1c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  447  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676ff6 drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2016-05-31  448  		[BQ27XXX_REG_AP] =3D 0x18,
0670c9b3588f163c drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-06-07  449  		BQ27XXX_DM_REG_ROWS,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  450  	},
457b42f0aa1c3977 drivers/power/supply/bq27xxx_battery.c Liu Xiang          =
 2018-07-22  451  #define bq27411_regs bq27421_regs
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  452  #define bq27425_regs bq27421_regs
5ef6a16033b47afb drivers/power/supply/bq27xxx_battery.c Andrew F. Davis    =
 2018-04-21  453  #define bq27426_regs bq27421_regs
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  454  #define bq27441_regs bq27421_regs
3a731c6414c94012 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23  455  #define bq27621_regs bq27421_regs
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  456  	bq27z561_regs[BQ27XXX_REG_MAX] =3D {
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  457  		[BQ27XXX_REG_CTRL] =3D 0x00,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  458  		[BQ27XXX_REG_TEMP] =3D 0x06,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  459  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  460  		[BQ27XXX_REG_VOLT] =3D 0x08,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  461  		[BQ27XXX_REG_AI] =3D 0x14,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  462  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  463  		[BQ27XXX_REG_TTE] =3D 0x16,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  464  		[BQ27XXX_REG_TTF] =3D 0x18,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  465  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  466  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  467  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  468  		[BQ27XXX_REG_RC] =3D 0x10,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  469  		[BQ27XXX_REG_FCC] =3D 0x12,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  470  		[BQ27XXX_REG_CYCT] =3D 0x2a,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  471  		[BQ27XXX_REG_AE] =3D 0x22,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  472  		[BQ27XXX_REG_SOC] =3D 0x2c,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  473  		[BQ27XXX_REG_DCAP] =3D 0x3c,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  474  		[BQ27XXX_REG_AP] =3D 0x22,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  475  		BQ27XXX_DM_REG_ROWS,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  476  	},
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  477  	bq28z610_regs[BQ27XXX_REG_MAX] =3D {
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  478  		[BQ27XXX_REG_CTRL] =3D 0x00,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  479  		[BQ27XXX_REG_TEMP] =3D 0x06,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  480  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  481  		[BQ27XXX_REG_VOLT] =3D 0x08,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  482  		[BQ27XXX_REG_AI] =3D 0x14,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  483  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  484  		[BQ27XXX_REG_TTE] =3D 0x16,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  485  		[BQ27XXX_REG_TTF] =3D 0x18,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  486  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  487  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  488  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  489  		[BQ27XXX_REG_RC] =3D 0x10,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  490  		[BQ27XXX_REG_FCC] =3D 0x12,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  491  		[BQ27XXX_REG_CYCT] =3D 0x2a,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  492  		[BQ27XXX_REG_AE] =3D 0x22,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  493  		[BQ27XXX_REG_SOC] =3D 0x2c,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  494  		[BQ27XXX_REG_DCAP] =3D 0x3c,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  495  		[BQ27XXX_REG_AP] =3D 0x22,
707d678a5c7c5e80 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  496  		BQ27XXX_DM_REG_ROWS,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  497  	},
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  498  	bq34z100_regs[BQ27XXX_REG_MAX] =3D {
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  499  		[BQ27XXX_REG_CTRL] =3D 0x00,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  500  		[BQ27XXX_REG_TEMP] =3D 0x0c,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  501  		[BQ27XXX_REG_INT_TEMP] =3D 0x2a,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  502  		[BQ27XXX_REG_VOLT] =3D 0x08,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  503  		[BQ27XXX_REG_AI] =3D 0x0a,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  504  		[BQ27XXX_REG_FLAGS] =3D 0x0e,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  505  		[BQ27XXX_REG_TTE] =3D 0x18,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  506  		[BQ27XXX_REG_TTF] =3D 0x1a,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  507  		[BQ27XXX_REG_TTES] =3D 0x1e,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  508  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  509  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
3ed510f06e12f887 drivers/power/supply/bq27xxx_battery.c Hermes Zhang       =
 2020-12-22  510  		[BQ27XXX_REG_RC] =3D 0x04,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  511  		[BQ27XXX_REG_FCC] =3D 0x06,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  512  		[BQ27XXX_REG_CYCT] =3D 0x2c,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  513  		[BQ27XXX_REG_AE] =3D 0x24,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  514  		[BQ27XXX_REG_SOC] =3D 0x02,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  515  		[BQ27XXX_REG_DCAP] =3D 0x3c,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  516  		[BQ27XXX_REG_AP] =3D 0x22,
41a7431dbaa37533 drivers/power/supply/bq27xxx_battery.c Krzysztof Kozlowski=
 2020-09-19  517  		BQ27XXX_DM_REG_ROWS,
6f24ff97e3231a53 drivers/power/supply/bq27xxx_battery.c Dan Murphy         =
 2020-07-29  518  	};
d74534c27775857c drivers/power/bq27xxx_battery.c        Andrew F. Davis    =
 2015-09-22  519  =

9aade6d8f9d0fd08 drivers/power/supply/bq27xxx_battery.c Liam Breck         =
 2017-08-23 @520  static enum power_supply_property bq27000_props[] =3D {
4e924a814ac78e32 drivers/power/bq27x00_battery.c        Grazvydas Ignotas  =
 2010-02-27  521  	POWER_SUPPLY_PROP_STATUS,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  522  	POWER_SUPPLY_PROP_PRESENT,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  523  	POWER_SUPPLY_PROP_VOLTAGE_NOW,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  524  	POWER_SUPPLY_PROP_CURRENT_NOW,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  525  	POWER_SUPPLY_PROP_CAPACITY,
d66bab3f3a511908 drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-11-01  526  	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  527  	POWER_SUPPLY_PROP_TEMP,
4e924a814ac78e32 drivers/power/bq27x00_battery.c        Grazvydas Ignotas  =
 2010-02-27  528  	POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW,
4e924a814ac78e32 drivers/power/bq27x00_battery.c        Grazvydas Ignotas  =
 2010-02-27  529  	POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
4e924a814ac78e32 drivers/power/bq27x00_battery.c        Grazvydas Ignotas  =
 2010-02-27  530  	POWER_SUPPLY_PROP_TIME_TO_FULL_NOW,
5661f334e8a53848 drivers/power/bq27x00_battery.c        Lars-Peter Clausen =
 2010-05-24  531  	POWER_SUPPLY_PROP_TECHNOLOGY,
631c17ee5daf0ca7 drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-02-01  532  	POWER_SUPPLY_PROP_CHARGE_FULL,
631c17ee5daf0ca7 drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-02-01  533  	POWER_SUPPLY_PROP_CHARGE_NOW,
631c17ee5daf0ca7 drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-02-01  534  	POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
73c244a8a5541e3a drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-04-30  535  	POWER_SUPPLY_PROP_CYCLE_COUNT,
631c17ee5daf0ca7 drivers/power/bq27x00_battery.c        Pali Roh=C3=A1r    =
      2011-02-01  536  	POWER_SUPPLY_PROP_ENERGY_NOW,
9903e62700a122a3 drivers/power/bq27x00_battery.c        Syed Rafiuddin     =
 2012-05-17  537  	POWER_SUPPLY_PROP_POWER_AVG,
9903e62700a122a3 drivers/power/bq27x00_battery.c        Syed Rafiuddin     =
 2012-05-17  538  	POWER_SUPPLY_PROP_HEALTH,
db04fc5caa792601 drivers/power/bq27x00_battery.c        Andrew F. Davis    =
 2015-07-22  539  	POWER_SUPPLY_PROP_MANUFACTURER,
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  540  };
b996ad0e9fb15ca4 drivers/power/bq27x00_battery.c        Rodolfo Giometti   =
 2008-08-20  541  =


:::::: The code at line 520 was first introduced by commit
:::::: 9aade6d8f9d0fd086068fc390c6f6c0ce98ea07a power: supply: bq27xxx: Cre=
ate single chip data table

:::::: TO: Liam Breck <kernel@networkimprov.net>
:::::: CC: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8055827366548802811==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8055827366548802811==--


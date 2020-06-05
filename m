Content-Type: multipart/mixed; boundary="===============7321706425552018943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] power: supply: bq27xxx_battery: Add the BQ28z610 Battery monitor
Date: Sat, 06 Jun 2020 05:08:27 +0800
Message-ID: <202006060405.wknCcjpz%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7321706425552018943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200528122147.6171-4-dmurphy@ti.com>
References: <20200528122147.6171-4-dmurphy@ti.com>
TO: Dan Murphy <dmurphy@ti.com>
TO: sre(a)kernel.org
TO: afd(a)ti.com
TO: pali(a)kernel.org
CC: linux-pm(a)vger.kernel.org
CC: robh(a)kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: Dan Murphy <dmurphy@ti.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on power-supply/for-next]
[cannot apply to linus/master v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Dan-Murphy/dt-bindings-pow=
er-Add-BQ27561-compatible/20200528-202355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c023-20200605 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/power/supply/bq27xxx_battery.c:447:1-13: WARNING bq27561_regs an=
d bq28z610_regs (line 467) are identical
>> drivers/power/supply/bq27xxx_battery.c:722:34-47: WARNING bq27561_props =
and bq28z610_props (line 741) are identical

# https://github.com/0day-ci/linux/commit/5dff4eaa8047c57c208639b38f0d15ca8=
0eeb391
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5dff4eaa8047c57c208639b38f0d15ca80eeb391
vim +447 drivers/power/supply/bq27xxx_battery.c

d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2015-=
09-22  132  =

0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  133  #define BQ27XXX_DM_REG_ROWS \
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  134  	[BQ27XXX_DM_CTRL] =3D 0x61,  \
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  135  	[BQ27XXX_DM_CLASS] =3D 0x3e, \
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  136  	[BQ27XXX_DM_BLOCK] =3D 0x3f, \
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  137  	[BQ27XXX_DM_DATA] =3D 0x40,  \
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  138  	[BQ27XXX_DM_CKSUM] =3D 0x60
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  139  =

d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2015-=
09-22  140  /* Register mappings */
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  141  static u8
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  142  	bq27000_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  143  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  144  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  145  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  146  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  147  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  148  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  149  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  150  		[BQ27XXX_REG_TTF] =3D 0x18,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  151  		[BQ27XXX_REG_TTES] =3D 0x1c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  152  		[BQ27XXX_REG_TTECP] =3D 0x26,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  153  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  154  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  155  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  156  		[BQ27XXX_REG_AE] =3D 0x22,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  157  		[BQ27XXX_REG_SOC] =3D 0x0b,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  158  		[BQ27XXX_REG_DCAP] =3D 0x76,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  159  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  160  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  161  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  162  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  163  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  164  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  165  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  166  	bq27010_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  167  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  168  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  169  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  170  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  171  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  172  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  173  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  174  		[BQ27XXX_REG_TTF] =3D 0x18,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  175  		[BQ27XXX_REG_TTES] =3D 0x1c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  176  		[BQ27XXX_REG_TTECP] =3D 0x26,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  177  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  178  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  179  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  180  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  181  		[BQ27XXX_REG_SOC] =3D 0x0b,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  182  		[BQ27XXX_REG_DCAP] =3D 0x76,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  183  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  184  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  185  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  186  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  187  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  188  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  189  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  190  	bq2750x_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  191  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  192  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  193  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  194  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  195  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  196  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  197  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  198  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  199  		[BQ27XXX_REG_TTES] =3D 0x1a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  200  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  201  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  202  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  203  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  204  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  205  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  206  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  207  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  208  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  209  	},
1059361fb69b6c drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  210  #define bq2751x_regs bq27510g3_regs
1059361fb69b6c drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  211  #define bq2752x_regs bq27510g3_regs
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  212  	bq27500_regs[BQ27XXX_REG_MAX] =3D {
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  213  		[BQ27XXX_REG_CTRL] =3D 0x00,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  214  		[BQ27XXX_REG_TEMP] =3D 0x06,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  215  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  216  		[BQ27XXX_REG_VOLT] =3D 0x08,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  217  		[BQ27XXX_REG_AI] =3D 0x14,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  218  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  219  		[BQ27XXX_REG_TTE] =3D 0x16,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  220  		[BQ27XXX_REG_TTF] =3D 0x18,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  221  		[BQ27XXX_REG_TTES] =3D 0x1c,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  222  		[BQ27XXX_REG_TTECP] =3D 0x26,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  223  		[BQ27XXX_REG_NAC] =3D 0x0c,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  224  		[BQ27XXX_REG_FCC] =3D 0x12,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  225  		[BQ27XXX_REG_CYCT] =3D 0x2a,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  226  		[BQ27XXX_REG_AE] =3D 0x22,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  227  		[BQ27XXX_REG_SOC] =3D 0x2c,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  228  		[BQ27XXX_REG_DCAP] =3D 0x3c,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  229  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  230  		BQ27XXX_DM_REG_ROWS,
32833635b0fe9b drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  231  	},
1059361fb69b6c drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  232  #define bq27510g1_regs bq27500_regs
1059361fb69b6c drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  233  #define bq27510g2_regs bq27500_regs
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  234  	bq27510g3_regs[BQ27XXX_REG_MAX] =3D {
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  235  		[BQ27XXX_REG_CTRL] =3D 0x00,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  236  		[BQ27XXX_REG_TEMP] =3D 0x06,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  237  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  238  		[BQ27XXX_REG_VOLT] =3D 0x08,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  239  		[BQ27XXX_REG_AI] =3D 0x14,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  240  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  241  		[BQ27XXX_REG_TTE] =3D 0x16,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  242  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  243  		[BQ27XXX_REG_TTES] =3D 0x1a,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  244  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  245  		[BQ27XXX_REG_NAC] =3D 0x0c,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  246  		[BQ27XXX_REG_FCC] =3D 0x12,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  247  		[BQ27XXX_REG_CYCT] =3D 0x1e,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  248  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  249  		[BQ27XXX_REG_SOC] =3D 0x20,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  250  		[BQ27XXX_REG_DCAP] =3D 0x2e,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  251  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  252  		BQ27XXX_DM_REG_ROWS,
71375aa7d6a739 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  253  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  254  	bq27520g1_regs[BQ27XXX_REG_MAX] =3D {
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  255  		[BQ27XXX_REG_CTRL] =3D 0x00,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  256  		[BQ27XXX_REG_TEMP] =3D 0x06,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  257  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  258  		[BQ27XXX_REG_VOLT] =3D 0x08,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  259  		[BQ27XXX_REG_AI] =3D 0x14,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  260  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  261  		[BQ27XXX_REG_TTE] =3D 0x16,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  262  		[BQ27XXX_REG_TTF] =3D 0x18,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  263  		[BQ27XXX_REG_TTES] =3D 0x1c,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  264  		[BQ27XXX_REG_TTECP] =3D 0x26,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  265  		[BQ27XXX_REG_NAC] =3D 0x0c,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  266  		[BQ27XXX_REG_FCC] =3D 0x12,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  267  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  268  		[BQ27XXX_REG_AE] =3D 0x22,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  269  		[BQ27XXX_REG_SOC] =3D 0x2c,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  270  		[BQ27XXX_REG_DCAP] =3D 0x3c,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  271  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  272  		BQ27XXX_DM_REG_ROWS,
68f2a813eb25bd drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  273  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  274  	bq27520g2_regs[BQ27XXX_REG_MAX] =3D {
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  275  		[BQ27XXX_REG_CTRL] =3D 0x00,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  276  		[BQ27XXX_REG_TEMP] =3D 0x06,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  277  		[BQ27XXX_REG_INT_TEMP] =3D 0x36,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  278  		[BQ27XXX_REG_VOLT] =3D 0x08,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  279  		[BQ27XXX_REG_AI] =3D 0x14,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  280  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  281  		[BQ27XXX_REG_TTE] =3D 0x16,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  282  		[BQ27XXX_REG_TTF] =3D 0x18,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  283  		[BQ27XXX_REG_TTES] =3D 0x1c,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  284  		[BQ27XXX_REG_TTECP] =3D 0x26,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  285  		[BQ27XXX_REG_NAC] =3D 0x0c,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  286  		[BQ27XXX_REG_FCC] =3D 0x12,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  287  		[BQ27XXX_REG_CYCT] =3D 0x2a,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  288  		[BQ27XXX_REG_AE] =3D 0x22,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  289  		[BQ27XXX_REG_SOC] =3D 0x2c,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  290  		[BQ27XXX_REG_DCAP] =3D 0x3c,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  291  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  292  		BQ27XXX_DM_REG_ROWS,
a5deb9a93040a4 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  293  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  294  	bq27520g3_regs[BQ27XXX_REG_MAX] =3D {
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  295  		[BQ27XXX_REG_CTRL] =3D 0x00,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  296  		[BQ27XXX_REG_TEMP] =3D 0x06,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  297  		[BQ27XXX_REG_INT_TEMP] =3D 0x36,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  298  		[BQ27XXX_REG_VOLT] =3D 0x08,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  299  		[BQ27XXX_REG_AI] =3D 0x14,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  300  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  301  		[BQ27XXX_REG_TTE] =3D 0x16,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  302  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  303  		[BQ27XXX_REG_TTES] =3D 0x1c,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  304  		[BQ27XXX_REG_TTECP] =3D 0x26,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  305  		[BQ27XXX_REG_NAC] =3D 0x0c,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  306  		[BQ27XXX_REG_FCC] =3D 0x12,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  307  		[BQ27XXX_REG_CYCT] =3D 0x2a,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  308  		[BQ27XXX_REG_AE] =3D 0x22,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  309  		[BQ27XXX_REG_SOC] =3D 0x2c,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  310  		[BQ27XXX_REG_DCAP] =3D 0x3c,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  311  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  312  		BQ27XXX_DM_REG_ROWS,
825e915ba2e811 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  313  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  314  	bq27520g4_regs[BQ27XXX_REG_MAX] =3D {
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  315  		[BQ27XXX_REG_CTRL] =3D 0x00,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  316  		[BQ27XXX_REG_TEMP] =3D 0x06,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  317  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  318  		[BQ27XXX_REG_VOLT] =3D 0x08,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  319  		[BQ27XXX_REG_AI] =3D 0x14,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  320  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  321  		[BQ27XXX_REG_TTE] =3D 0x16,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  322  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  323  		[BQ27XXX_REG_TTES] =3D 0x1c,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  324  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  325  		[BQ27XXX_REG_NAC] =3D 0x0c,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  326  		[BQ27XXX_REG_FCC] =3D 0x12,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  327  		[BQ27XXX_REG_CYCT] =3D 0x1e,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  328  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  329  		[BQ27XXX_REG_SOC] =3D 0x20,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  330  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  331  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  332  		BQ27XXX_DM_REG_ROWS,
8835cae5f2abd7 drivers/power/supply/bq27xxx_battery.c Chris Lapa      2017-=
01-11  333  	},
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  334  	bq27521_regs[BQ27XXX_REG_MAX] =3D {
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  335  		[BQ27XXX_REG_CTRL] =3D 0x02,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  336  		[BQ27XXX_REG_TEMP] =3D 0x0a,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  337  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  338  		[BQ27XXX_REG_VOLT] =3D 0x0c,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  339  		[BQ27XXX_REG_AI] =3D 0x0e,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  340  		[BQ27XXX_REG_FLAGS] =3D 0x08,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  341  		[BQ27XXX_REG_TTE] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  342  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  343  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  344  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  345  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  346  		[BQ27XXX_REG_FCC] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  347  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  348  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  349  		[BQ27XXX_REG_SOC] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  350  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  351  		[BQ27XXX_REG_AP] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  352  		[BQ27XXX_DM_CTRL] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  353  		[BQ27XXX_DM_CLASS] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  354  		[BQ27XXX_DM_BLOCK] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  355  		[BQ27XXX_DM_DATA] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  356  		[BQ27XXX_DM_CKSUM] =3D INVALID_REG_ADDR,
70a39e1075019e drivers/power/supply/bq27xxx_battery.c Pavel Machek    2017-=
11-10  357  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  358  	bq27530_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  359  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  360  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  361  		[BQ27XXX_REG_INT_TEMP] =3D 0x32,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  362  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  363  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  364  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  365  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  366  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  367  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  368  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  369  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  370  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  371  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  372  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  373  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  374  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  375  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  376  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  377  	},
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  378  #define bq27531_regs bq27530_regs
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  379  	bq27541_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  380  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  381  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  382  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  383  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  384  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  385  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  386  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  387  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  388  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  389  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  390  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  391  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  392  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  393  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  394  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  395  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  396  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  397  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  398  	},
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  399  #define bq27542_regs bq27541_regs
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  400  #define bq27546_regs bq27541_regs
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  401  #define bq27742_regs bq27541_regs
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  402  	bq27545_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  403  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  404  		[BQ27XXX_REG_TEMP] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  405  		[BQ27XXX_REG_INT_TEMP] =3D 0x28,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  406  		[BQ27XXX_REG_VOLT] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  407  		[BQ27XXX_REG_AI] =3D 0x14,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  408  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  409  		[BQ27XXX_REG_TTE] =3D 0x16,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  410  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  411  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  412  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  413  		[BQ27XXX_REG_NAC] =3D 0x0c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  414  		[BQ27XXX_REG_FCC] =3D 0x12,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  415  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  416  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  417  		[BQ27XXX_REG_SOC] =3D 0x2c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  418  		[BQ27XXX_REG_DCAP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  419  		[BQ27XXX_REG_AP] =3D 0x24,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  420  		BQ27XXX_DM_REG_ROWS,
2e05b518c89714 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
06-17  421  	},
9aade6d8f9d0fd drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  422  	bq27421_regs[BQ27XXX_REG_MAX] =3D {
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  423  		[BQ27XXX_REG_CTRL] =3D 0x00,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  424  		[BQ27XXX_REG_TEMP] =3D 0x02,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  425  		[BQ27XXX_REG_INT_TEMP] =3D 0x1e,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  426  		[BQ27XXX_REG_VOLT] =3D 0x04,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  427  		[BQ27XXX_REG_AI] =3D 0x10,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  428  		[BQ27XXX_REG_FLAGS] =3D 0x06,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  429  		[BQ27XXX_REG_TTE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  430  		[BQ27XXX_REG_TTF] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  431  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  432  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  433  		[BQ27XXX_REG_NAC] =3D 0x08,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  434  		[BQ27XXX_REG_FCC] =3D 0x0e,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  435  		[BQ27XXX_REG_CYCT] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  436  		[BQ27XXX_REG_AE] =3D INVALID_REG_ADDR,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  437  		[BQ27XXX_REG_SOC] =3D 0x1c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  438  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5630b4334c676f drivers/power/bq27xxx_battery.c        Andrew F. Davis 2016-=
05-31  439  		[BQ27XXX_REG_AP] =3D 0x18,
0670c9b3588f16 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
06-07  440  		BQ27XXX_DM_REG_ROWS,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  441  	},
457b42f0aa1c39 drivers/power/supply/bq27xxx_battery.c Liu Xiang       2018-=
07-22  442  #define bq27411_regs bq27421_regs
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  443  #define bq27425_regs bq27421_regs
5ef6a16033b47a drivers/power/supply/bq27xxx_battery.c Andrew F. Davis 2018-=
04-21  444  #define bq27426_regs bq27421_regs
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  445  #define bq27441_regs bq27421_regs
3a731c6414c940 drivers/power/supply/bq27xxx_battery.c Liam Breck      2017-=
08-23  446  #define bq27621_regs bq27421_regs
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28 @447  	bq27561_regs[BQ27XXX_REG_MAX] =3D {
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  448  		[BQ27XXX_REG_CTRL] =3D 0x00,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  449  		[BQ27XXX_REG_TEMP] =3D 0x06,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  450  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  451  		[BQ27XXX_REG_VOLT] =3D 0x08,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  452  		[BQ27XXX_REG_AI] =3D 0x14,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  453  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  454  		[BQ27XXX_REG_TTE] =3D 0x16,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  455  		[BQ27XXX_REG_TTF] =3D 0x18,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  456  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  457  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  458  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  459  		[BQ27XXX_REG_FCC] =3D 0x12,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  460  		[BQ27XXX_REG_CYCT] =3D 0x2a,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  461  		[BQ27XXX_REG_AE] =3D 0x22,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  462  		[BQ27XXX_REG_SOC] =3D 0x2c,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  463  		[BQ27XXX_REG_DCAP] =3D 0x3c,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  464  		[BQ27XXX_REG_AP] =3D 0x22,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  465  		BQ27XXX_DM_REG_ROWS,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  466  	},
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28 @467  	bq28z610_regs[BQ27XXX_REG_MAX] =3D {
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  468  		[BQ27XXX_REG_CTRL] =3D 0x00,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  469  		[BQ27XXX_REG_TEMP] =3D 0x06,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  470  		[BQ27XXX_REG_INT_TEMP] =3D INVALID_REG_ADDR,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  471  		[BQ27XXX_REG_VOLT] =3D 0x08,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  472  		[BQ27XXX_REG_AI] =3D 0x14,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  473  		[BQ27XXX_REG_FLAGS] =3D 0x0a,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  474  		[BQ27XXX_REG_TTE] =3D 0x16,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  475  		[BQ27XXX_REG_TTF] =3D 0x18,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  476  		[BQ27XXX_REG_TTES] =3D INVALID_REG_ADDR,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  477  		[BQ27XXX_REG_TTECP] =3D INVALID_REG_ADDR,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  478  		[BQ27XXX_REG_NAC] =3D INVALID_REG_ADDR,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  479  		[BQ27XXX_REG_FCC] =3D 0x12,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  480  		[BQ27XXX_REG_CYCT] =3D 0x2a,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  481  		[BQ27XXX_REG_AE] =3D 0x22,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  482  		[BQ27XXX_REG_SOC] =3D 0x2c,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  483  		[BQ27XXX_REG_DCAP] =3D 0x3c,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  484  		[BQ27XXX_REG_AP] =3D 0x22,
5dff4eaa8047c5 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  485  		BQ27XXX_DM_REG_ROWS,
21d12204359351 drivers/power/supply/bq27xxx_battery.c Dan Murphy      2020-=
05-28  486  	};
d74534c2777585 drivers/power/bq27xxx_battery.c        Andrew F. Davis 2015-=
09-22  487  =


:::::: The code at line 447 was first introduced by commit
:::::: 21d1220435935180251125b9514089d2de94e5e8 power: supply: bq27xxx_batt=
ery: Add the BQ27561 Battery monitor

:::::: TO: Dan Murphy <dmurphy@ti.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7321706425552018943==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7321706425552018943==--


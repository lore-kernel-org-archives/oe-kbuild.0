Content-Type: multipart/mixed; boundary="===============6438378001599535673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/emif.c:628:30: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Mon, 25 Jan 2021 08:24:07 +0800
Message-ID: <202101250800.3eKvraJJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6438378001599535673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   228a65d4544af5086bd167dcc5a0cb4fae2c42b4
commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile tes=
ting for most of the drivers
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/memory/emif.c:628:30: warning: Shifting signed 32-bit value by 3=
1 bits is undefined behaviour [shiftTooManyBitsSigned]
    alert |=3D (cs1_used ? 1 : 0) << TA_CS1EN_SHIFT;
                                ^
   drivers/memory/emif.c:849:20: warning: Shifting signed 32-bit value by 3=
1 bits is undefined behaviour [shiftTooManyBitsSigned]
     writel(DDR_MR4 | CS_MASK, base + EMIF_LPDDR2_MODE_REG_CONFIG);
                      ^

vim +628 drivers/memory/emif.c

98231c4fc3b95a0e Aneesh V 2012-04-27  597  =

98231c4fc3b95a0e Aneesh V 2012-04-27  598  static u32 get_temp_alert_config=
(const struct lpddr2_addressing *addressing,
98231c4fc3b95a0e Aneesh V 2012-04-27  599  		const struct emif_custom_confi=
gs *custom_configs, bool cs1_used,
98231c4fc3b95a0e Aneesh V 2012-04-27  600  		u32 sdram_io_width, u32 emif_b=
us_width)
98231c4fc3b95a0e Aneesh V 2012-04-27  601  {
98231c4fc3b95a0e Aneesh V 2012-04-27  602  	u32 alert =3D 0, interval, devc=
nt;
98231c4fc3b95a0e Aneesh V 2012-04-27  603  =

98231c4fc3b95a0e Aneesh V 2012-04-27  604  	if (custom_configs && (custom_c=
onfigs->mask &
98231c4fc3b95a0e Aneesh V 2012-04-27  605  				EMIF_CUSTOM_CONFIG_TEMP_ALER=
T_POLL_INTERVAL))
98231c4fc3b95a0e Aneesh V 2012-04-27  606  		interval =3D custom_configs->t=
emp_alert_poll_interval_ms;
98231c4fc3b95a0e Aneesh V 2012-04-27  607  	else
98231c4fc3b95a0e Aneesh V 2012-04-27  608  		interval =3D TEMP_ALERT_POLL_I=
NTERVAL_DEFAULT_MS;
98231c4fc3b95a0e Aneesh V 2012-04-27  609  =

98231c4fc3b95a0e Aneesh V 2012-04-27  610  	interval *=3D 1000000;			/* Con=
vert to ns */
98231c4fc3b95a0e Aneesh V 2012-04-27  611  	interval /=3D addressing->tREFI=
_ns;	/* Convert to refresh cycles */
98231c4fc3b95a0e Aneesh V 2012-04-27  612  	alert |=3D (interval << TA_REFI=
NTERVAL_SHIFT);
98231c4fc3b95a0e Aneesh V 2012-04-27  613  =

98231c4fc3b95a0e Aneesh V 2012-04-27  614  	/*
98231c4fc3b95a0e Aneesh V 2012-04-27  615  	 * sdram_io_width is in 'log2(x=
) - 1' form. Convert emif_bus_width
98231c4fc3b95a0e Aneesh V 2012-04-27  616  	 * also to this form and subtra=
ct to get TA_DEVCNT, which is
98231c4fc3b95a0e Aneesh V 2012-04-27  617  	 * in log2(x) form.
98231c4fc3b95a0e Aneesh V 2012-04-27  618  	 */
98231c4fc3b95a0e Aneesh V 2012-04-27  619  	emif_bus_width =3D __fls(emif_b=
us_width) - 1;
98231c4fc3b95a0e Aneesh V 2012-04-27  620  	devcnt =3D emif_bus_width - sdr=
am_io_width;
98231c4fc3b95a0e Aneesh V 2012-04-27  621  	alert |=3D devcnt << TA_DEVCNT_=
SHIFT;
98231c4fc3b95a0e Aneesh V 2012-04-27  622  =

98231c4fc3b95a0e Aneesh V 2012-04-27  623  	/* DEVWDT is in 'log2(x) - 3' f=
orm */
98231c4fc3b95a0e Aneesh V 2012-04-27  624  	alert |=3D (sdram_io_width - 2)=
 << TA_DEVWDT_SHIFT;
98231c4fc3b95a0e Aneesh V 2012-04-27  625  =

98231c4fc3b95a0e Aneesh V 2012-04-27  626  	alert |=3D 1 << TA_SFEXITEN_SHI=
FT;
98231c4fc3b95a0e Aneesh V 2012-04-27  627  	alert |=3D 1 << TA_CS0EN_SHIFT;
98231c4fc3b95a0e Aneesh V 2012-04-27 @628  	alert |=3D (cs1_used ? 1 : 0) <=
< TA_CS1EN_SHIFT;
98231c4fc3b95a0e Aneesh V 2012-04-27  629  =

98231c4fc3b95a0e Aneesh V 2012-04-27  630  	return alert;
98231c4fc3b95a0e Aneesh V 2012-04-27  631  }
98231c4fc3b95a0e Aneesh V 2012-04-27  632  =


:::::: The code@line 628 was first introduced by commit
:::::: 98231c4fc3b95a0e9d37ba3711ad993bb27605c8 memory: emif: add one-time =
settings

:::::: TO: Aneesh V <aneesh@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6438378001599535673==--


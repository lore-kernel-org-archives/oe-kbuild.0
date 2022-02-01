Content-Type: multipart/mixed; boundary="===============2712664839134843766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/rtc-gamecube.c:247 gamecube_rtc_read_offset_from_sram() warn: 'hw_srnprot' not released on lines: 239.
Date: Tue, 01 Feb 2022 13:49:55 +0800
Message-ID: <202202011339.oPwRPmNf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2712664839134843766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 86559400b3ef9de93ba50523cffe767c35cd531a rtc: gamecube: Add a RTC d=
river for the GameCube, Wii and Wii U
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: nios2-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011339.oPwRPmNf-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-gamecube.c:247 gamecube_rtc_read_offset_from_sram() warn: '=
hw_srnprot' not released on lines: 239.

vim +/hw_srnprot +247 drivers/rtc/rtc-gamecube.c

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  189  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  190  static int gamecube_rtc=
_read_offset_from_sram(struct priv *d)
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  191  {
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  192  	struct device_node *np;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  193  	int ret;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  194  	struct resource res;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  195  	void __iomem *hw_srnpr=
ot;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  196  	u32 old;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  197  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  198  	np =3D of_find_compati=
ble_node(NULL, NULL, "nintendo,latte-srnprot");
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  199  	if (!np)
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  200  		np =3D of_find_compat=
ible_node(NULL, NULL,
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  201  					     "nintendo,hol=
lywood-srnprot");
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  202  	if (!np) {
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  203  		pr_info("HW_SRNPROT n=
ot found, assuming a GameCube\n");
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  204  		return regmap_read(d-=
>regmap, RTC_SRAM_BIAS, &d->rtc_bias);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  205  	}
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  206  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  207  	ret =3D of_address_to_=
resource(np, 0, &res);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  208  	if (ret) {
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  209  		pr_err("no io memory =
range found\n");
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  210  		return -1;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  211  	}
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  212  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  213  	hw_srnprot =3D ioremap=
(res.start, resource_size(&res));
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  214  	old =3D ioread32be(hw_=
srnprot);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  215  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  216  	/* TODO: figure out wh=
y we use this magic constant.  I obtained it by
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  217  	 * reading the leftove=
r value after boot, after IOSU already ran.
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  218  	 *
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  219  	 * On my Wii U, settin=
g this register to 1 prevents the console from
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  220  	 * rebooting properly,=
 so wiiubrew.org must be missing something.
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  221  	 *
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  222  	 * See https://wiiubre=
w.org/wiki/Hardware/Latte_registers
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  223  	 */
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  224  	if (old !=3D 0x7bf)
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  225  		iowrite32be(0x7bf, hw=
_srnprot);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  226  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  227  	/* Get the offset from=
 RTC SRAM.
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  228  	 *
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  229  	 * Its default locatio=
n on the GameCube and on the Wii is in the SRAM,
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  230  	 * while on the Wii U =
the bootloader needs to fill it with the contents
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  231  	 * of /config/rtc.xml =
on the SLC (the eMMC).  We don=E2=80=99t do that from
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  232  	 * Linux since it requ=
ires implementing a proprietary filesystem and do
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  233  	 * file decryption, in=
stead we require the bootloader to fill the same
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  234  	 * SRAM address as on =
previous consoles.
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  235  	 */
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  236  	ret =3D regmap_read(d-=
>regmap, RTC_SRAM_BIAS, &d->rtc_bias);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  237  	if (ret) {
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  238  		pr_err("failed to get=
 the RTC bias\n");
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  239  		return -1;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  240  	}
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  241  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  242  	/* Reset SRAM access t=
o how it was before, our job here is done. */
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  243  	if (old !=3D 0x7bf)
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  244  		iowrite32be(old, hw_s=
rnprot);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  245  	iounmap(hw_srnprot);
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  246  =

86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15 @247  	return 0;
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  248  }
86559400b3ef9d Emmanuel Gil Peyrot 2021-12-15  249  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2712664839134843766==--


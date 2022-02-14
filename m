Content-Type: multipart/mixed; boundary="===============3458568891025548696=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:ux500-href-charging-v5.17-rc1 21/30] drivers/power/supply/samsung-sdi-battery.c:668:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Mon, 14 Feb 2022 16:01:38 +0800
Message-ID: <202202141608.hdJ1JgJF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3458568891025548696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-href-charging-v5.17-rc1
head:   093b70a91c09965c2a4b6065a26fdaa65b3e6e5e
commit: 794acf43f9663fd18b4cee063c1757d21c4cb68c [21/30] power: supply: Sta=
tic data for Samsung batteries
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/power/supply/samsung-sdi-battery.c:668:2: warning: Address of lo=
cal auto-variable assigned to a function parameter. [autoVariables]
    *info =3D &batt->info;
    ^

vim +668 drivers/power/supply/samsung-sdi-battery.c

794acf43f9663f Linus Walleij 2021-12-03  651  =

794acf43f9663f Linus Walleij 2021-12-03  652  int samsung_sdi_battery_get_i=
nfo(struct device *dev,
794acf43f9663f Linus Walleij 2021-12-03  653  				 struct device_node *np,
794acf43f9663f Linus Walleij 2021-12-03  654  				 struct power_supply_batt=
ery_info **info)
794acf43f9663f Linus Walleij 2021-12-03  655  {
794acf43f9663f Linus Walleij 2021-12-03  656  	struct samsung_sdi_battery *=
batt;
794acf43f9663f Linus Walleij 2021-12-03  657  	int i;
794acf43f9663f Linus Walleij 2021-12-03  658  =

794acf43f9663f Linus Walleij 2021-12-03  659  	for (i =3D 0; i < ARRAY_SIZE=
(samsung_sdi_batteries); i++) {
794acf43f9663f Linus Walleij 2021-12-03  660  		batt =3D &samsung_sdi_batte=
ries[i];
794acf43f9663f Linus Walleij 2021-12-03  661  		if (of_device_is_compatible=
(np, batt->compatible))
794acf43f9663f Linus Walleij 2021-12-03  662  			break;
794acf43f9663f Linus Walleij 2021-12-03  663  	}
794acf43f9663f Linus Walleij 2021-12-03  664  =

794acf43f9663f Linus Walleij 2021-12-03  665  	if (i =3D=3D ARRAY_SIZE(sams=
ung_sdi_batteries))
794acf43f9663f Linus Walleij 2021-12-03  666  		return -ENODEV;
794acf43f9663f Linus Walleij 2021-12-03  667  =

794acf43f9663f Linus Walleij 2021-12-03 @668  	*info =3D &batt->info;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3458568891025548696==--


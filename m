Content-Type: multipart/mixed; boundary="===============7649170576614324061=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/power/supply/bq256xx_charger.c:346:12: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
Date: Wed, 21 Apr 2021 02:57:07 +0800
Message-ID: <202104210257.D8mNZ4zN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7649170576614324061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Ricardo Rivera-Matos" <r-rivera-matos@ti.com>
CC: Sebastian Reichel <sre@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7af08140979a6e7e12b78c93b8625c8d25b084e2
commit: 32e4978bb920d047fe5de3ea42d176f267c01f63 power: supply: bq256xx: In=
troduce the BQ256XX charger driver
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
compiler: mips64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/power/supply/bq256xx_charger.c:346:12: warning: Identical inner =
'if' condition is always true. [identicalInnerCondition]
      if (val < array[i])
              ^
   drivers/power/supply/bq256xx_charger.c:345:33: note: outer condition: va=
l<array[i]
     if (val > array[i - 1] && val < array[i]) {
                                   ^
   drivers/power/supply/bq256xx_charger.c:346:12: note: identical inner con=
dition: val<array[i]
      if (val < array[i])
              ^

vim +/if +346 drivers/power/supply/bq256xx_charger.c

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  330  =

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  331  static int bq256xx_arr=
ay_parse(int array_size, int val, const int array[])
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  332  {
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  333  	int i =3D 0;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  334  =

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  335  	if (val < array[i])
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  336  		return i - 1;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  337  =

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  338  	if (val >=3D array[ar=
ray_size - 1])
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  339  		return array_size - =
1;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  340  =

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  341  	for (i =3D 1; i < arr=
ay_size; i++) {
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  342  		if (val =3D=3D array=
[i])
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  343  			return i;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  344  =

32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  345  		if (val > array[i - =
1] && val < array[i]) {
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06 @346  			if (val < array[i])
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  347  				return i - 1;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  348  			else
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  349  				return i;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  350  		}
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  351  	}
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  352  	return -EINVAL;
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  353  }
32e4978bb920d0 Ricardo Rivera-Matos 2021-01-06  354  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7649170576614324061==--


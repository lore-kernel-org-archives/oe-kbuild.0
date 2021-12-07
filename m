Content-Type: multipart/mixed; boundary="===============6944555776969556377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thermal/tegra/soctherm.c:736 get_hot_temp() error: uninitialized symbol 'type'.
Date: Wed, 08 Dec 2021 07:50:05 +0800
Message-ID: <202112080723.6tgJu6W4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6944555776969556377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

Hi Dmitry,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-m031-20211207 (https://download.01.org/0day-c=
i/archive/20211208/202112080723.6tgJu6W4-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/thermal/tegra/soctherm.c:736 get_hot_temp() error: uninitialized sy=
mbol 'type'.

Old smatch warnings:
drivers/thermal/tegra/soctherm.c:602 tegra_thermctl_set_trip_temp() error: =
uninitialized symbol 'type'.
drivers/thermal/tegra/soctherm.c:653 tegra_thermctl_get_trend() error: unin=
itialized symbol 'trip_temp'.

vim +/type +736 drivers/thermal/tegra/soctherm.c

d790405d1b23cf Nicolin Chen 2017-10-25  722  =

ce0dbf04f685d4 Wei Ni       2016-05-11  723  static int get_hot_temp(struct=
 thermal_zone_device *tz, int *trip, int *temp)
ce0dbf04f685d4 Wei Ni       2016-05-11  724  {
ce0dbf04f685d4 Wei Ni       2016-05-11  725  	int ntrips, i, ret;
ce0dbf04f685d4 Wei Ni       2016-05-11  726  	enum thermal_trip_type type;
ce0dbf04f685d4 Wei Ni       2016-05-11  727  =

ce0dbf04f685d4 Wei Ni       2016-05-11  728  	ntrips =3D of_thermal_get_ntr=
ips(tz);
ce0dbf04f685d4 Wei Ni       2016-05-11  729  	if (ntrips <=3D 0)
ce0dbf04f685d4 Wei Ni       2016-05-11  730  		return -EINVAL;
ce0dbf04f685d4 Wei Ni       2016-05-11  731  =

ce0dbf04f685d4 Wei Ni       2016-05-11  732  	for (i =3D 0; i < ntrips; i++=
) {
ce0dbf04f685d4 Wei Ni       2016-05-11  733  		ret =3D tz->ops->get_trip_ty=
pe(tz, i, &type);
ce0dbf04f685d4 Wei Ni       2016-05-11  734  		if (ret)
ce0dbf04f685d4 Wei Ni       2016-05-11  735  			return -EINVAL;
ce0dbf04f685d4 Wei Ni       2016-05-11 @736  		if (type =3D=3D THERMAL_TRIP=
_HOT) {
ce0dbf04f685d4 Wei Ni       2016-05-11  737  			ret =3D tz->ops->get_trip_t=
emp(tz, i, temp);
ce0dbf04f685d4 Wei Ni       2016-05-11  738  			if (!ret)
ce0dbf04f685d4 Wei Ni       2016-05-11  739  				*trip =3D i;
ce0dbf04f685d4 Wei Ni       2016-05-11  740  =

ce0dbf04f685d4 Wei Ni       2016-05-11  741  			return ret;
ce0dbf04f685d4 Wei Ni       2016-05-11  742  		}
ce0dbf04f685d4 Wei Ni       2016-05-11  743  	}
ce0dbf04f685d4 Wei Ni       2016-05-11  744  =

ce0dbf04f685d4 Wei Ni       2016-05-11  745  	return -EINVAL;
ce0dbf04f685d4 Wei Ni       2016-05-11  746  }
ce0dbf04f685d4 Wei Ni       2016-05-11  747  =


:::::: The code at line 736 was first introduced by commit
:::::: ce0dbf04f685d48ffdec64a17ebb4965f828c3ff thermal: tegra: add hw-thro=
ttle function

:::::: TO: Wei Ni <wni@nvidia.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6944555776969556377==--


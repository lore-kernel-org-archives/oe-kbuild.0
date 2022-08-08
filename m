Content-Type: multipart/mixed; boundary="===============8872261259024651624=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thermal/tegra/soctherm.c:592:32: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 15:42:51 +0800
Message-ID: <202208081535.8OJkpcSO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8872261259024651624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only Kconfig file updated"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/thermal/tegra/soctherm.c:592:32: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

Hi Dmitry,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220808/202208081535.8OJkpcSO-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f8d8b0334cc4e7908b78e73936a7673bbef0411
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f8d8b0334cc4e7908b78e73936a7673bbef0411
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from drivers/thermal/tegra/soctherm.c:27:
   include/linux/irqdomain.h: In function 'irq_find_mapping':
   include/linux/irqdomain.h:423:22: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     423 |         unsigned int irq;
         |                      ^~~
     'irq_find_mapping': event 1
       |
       |  423 |         unsigned int irq;
       |      |                      ^~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'tegra_thermctl_set_trip_t=
emp':
>> drivers/thermal/tegra/soctherm.c:592:32: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     592 |         enum thermal_trip_type type;
         |                                ^~~~
     'tegra_thermctl_set_trip_temp': event 1
       |
       |  592 |         enum thermal_trip_type type;
       |      |                                ^~~~
       |      |                                |
       |      |                                (1) use of uninitialized val=
ue '<unknown>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'tegra_thermctl_get_trend':
   drivers/thermal/tegra/soctherm.c:641:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     641 |         int trip_temp, temp, last_temp, ret;
         |             ^~~~~~~~~
     'tegra_thermctl_get_trend': event 1
       |
       |  641 |         int trip_temp, temp, last_temp, ret;
       |      |             ^~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'get_hot_temp':
   drivers/thermal/tegra/soctherm.c:726:32: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     726 |         enum thermal_trip_type type;
         |                                ^~~~
     'get_hot_temp': event 1
       |
       |  726 |         enum thermal_trip_type type;
       |      |                                ^~~~
       |      |                                |
       |      |                                (1) use of uninitialized val=
ue '<unknown>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'tegra_soctherm_set_hwtrip=
s':
   drivers/thermal/tegra/soctherm.c:778:16: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     778 |         int i, trip, temperature, ret;
         |                ^~~~
     'tegra_soctherm_set_hwtrips': event 1
       |
       |  778 |         int i, trip, temperature, ret;
       |      |                ^~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/thermal/tegra/soctherm.c:778:22: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     778 |         int i, trip, temperature, ret;
         |                      ^~~~~~~~~~~
     'tegra_soctherm_set_hwtrips': event 1
       |
       |  778 |         int i, trip, temperature, ret;
       |      |                      ^~~~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'soctherm_oc_cfg_parse':
   drivers/thermal/tegra/soctherm.c:1620:13: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1620 |         u32 val;
         |             ^~~
     'soctherm_oc_cfg_parse': event 1
       |
       | 1620 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/thermal/tegra/soctherm.c: In function 'soctherm_throt_cfg_parse':
   drivers/thermal/tegra/soctherm.c:1648:13: warning: use of uninitialized =
value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1648 |         u32 val;
         |             ^~~
     'soctherm_throt_cfg_parse': event 1
       |
       | 1648 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +592 drivers/thermal/tegra/soctherm.c

2510aa56ab8795 Wei Ni       2019-02-21  584  =

d790405d1b23cf Nicolin Chen 2017-10-25  585  static int tegra_thermctl_set_=
trip_temp(void *data, int trip, int temp)
d790405d1b23cf Nicolin Chen 2017-10-25  586  {
d790405d1b23cf Nicolin Chen 2017-10-25  587  	struct tegra_thermctl_zone *z=
one =3D data;
d790405d1b23cf Nicolin Chen 2017-10-25  588  	struct thermal_zone_device *t=
z =3D zone->tz;
d790405d1b23cf Nicolin Chen 2017-10-25  589  	struct tegra_soctherm *ts =3D=
 zone->ts;
d790405d1b23cf Nicolin Chen 2017-10-25  590  	const struct tegra_tsensor_gr=
oup *sg =3D zone->sg;
d790405d1b23cf Nicolin Chen 2017-10-25  591  	struct device *dev =3D zone->=
dev;
d790405d1b23cf Nicolin Chen 2017-10-25 @592  	enum thermal_trip_type type;
d790405d1b23cf Nicolin Chen 2017-10-25  593  	int ret;
d790405d1b23cf Nicolin Chen 2017-10-25  594  =

d790405d1b23cf Nicolin Chen 2017-10-25  595  	if (!tz)
d790405d1b23cf Nicolin Chen 2017-10-25  596  		return -EINVAL;
d790405d1b23cf Nicolin Chen 2017-10-25  597  =

d790405d1b23cf Nicolin Chen 2017-10-25  598  	ret =3D tz->ops->get_trip_typ=
e(tz, trip, &type);
d790405d1b23cf Nicolin Chen 2017-10-25  599  	if (ret)
d790405d1b23cf Nicolin Chen 2017-10-25  600  		return ret;
d790405d1b23cf Nicolin Chen 2017-10-25  601  =

d790405d1b23cf Nicolin Chen 2017-10-25  602  	if (type =3D=3D THERMAL_TRIP_=
CRITICAL) {
2510aa56ab8795 Wei Ni       2019-02-21  603  		/*
2510aa56ab8795 Wei Ni       2019-02-21  604  		 * If thermtrips property is=
 set in DT,
2510aa56ab8795 Wei Ni       2019-02-21  605  		 * doesn't need to program c=
ritical type trip to HW,
2510aa56ab8795 Wei Ni       2019-02-21  606  		 * if not, program critical =
trip to HW.
2510aa56ab8795 Wei Ni       2019-02-21  607  		 */
2510aa56ab8795 Wei Ni       2019-02-21  608  		if (min_low_temp =3D=3D tsen=
sor_group_thermtrip_get(ts, sg->id))
d790405d1b23cf Nicolin Chen 2017-10-25  609  			return thermtrip_program(de=
v, sg, temp);
2510aa56ab8795 Wei Ni       2019-02-21  610  		else
2510aa56ab8795 Wei Ni       2019-02-21  611  			return 0;
2510aa56ab8795 Wei Ni       2019-02-21  612  =

d790405d1b23cf Nicolin Chen 2017-10-25  613  	} else if (type =3D=3D THERMA=
L_TRIP_HOT) {
d790405d1b23cf Nicolin Chen 2017-10-25  614  		int i;
d790405d1b23cf Nicolin Chen 2017-10-25  615  =

d790405d1b23cf Nicolin Chen 2017-10-25  616  		for (i =3D 0; i < THROTTLE_S=
IZE; i++) {
d790405d1b23cf Nicolin Chen 2017-10-25  617  			struct thermal_cooling_devi=
ce *cdev;
d790405d1b23cf Nicolin Chen 2017-10-25  618  			struct soctherm_throt_cfg *=
stc;
d790405d1b23cf Nicolin Chen 2017-10-25  619  =

d790405d1b23cf Nicolin Chen 2017-10-25  620  			if (!ts->throt_cfgs[i].init)
d790405d1b23cf Nicolin Chen 2017-10-25  621  				continue;
d790405d1b23cf Nicolin Chen 2017-10-25  622  =

d790405d1b23cf Nicolin Chen 2017-10-25  623  			cdev =3D ts->throt_cfgs[i].=
cdev;
d790405d1b23cf Nicolin Chen 2017-10-25  624  			if (get_thermal_instance(tz=
, cdev, trip))
d790405d1b23cf Nicolin Chen 2017-10-25  625  				stc =3D find_throttle_cfg_=
by_name(ts, cdev->type);
d790405d1b23cf Nicolin Chen 2017-10-25  626  			else
d790405d1b23cf Nicolin Chen 2017-10-25  627  				continue;
d790405d1b23cf Nicolin Chen 2017-10-25  628  =

d790405d1b23cf Nicolin Chen 2017-10-25  629  			return throttrip_program(de=
v, sg, stc, temp);
d790405d1b23cf Nicolin Chen 2017-10-25  630  		}
d790405d1b23cf Nicolin Chen 2017-10-25  631  	}
d790405d1b23cf Nicolin Chen 2017-10-25  632  =

d790405d1b23cf Nicolin Chen 2017-10-25  633  	return 0;
d790405d1b23cf Nicolin Chen 2017-10-25  634  }
d790405d1b23cf Nicolin Chen 2017-10-25  635  =


:::::: The code at line 592 was first introduced by commit
:::::: d790405d1b23cf1495d22ed043a422dc44bb6848 thermal: tegra: remove forw=
ard declarations

:::::: TO: Nicolin Chen <nicoleotsuka@gmail.com>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8872261259024651624==--


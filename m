Content-Type: multipart/mixed; boundary="===============8125650335706298549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1111/7639] drivers/thermal/thermal_helpers.c:79:6: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Fri, 16 Sep 2022 18:54:52 +0800
Message-ID: <202209161817.xgJdTJfC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8125650335706298549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
hermal/thermal_helpers.c:79:6: warning: Redundant initialization for 'ret'.=
 The initialized value is overwritten before it is read. [redundantInitiali=
zation]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d5538ab91d3a9a237805be6f8c6c272af2987995
commit: a930da9bf583b2add01fb0e086913664dadaffd0 [1111/7639] thermal/core: =
Move the mutex inside the thermal_zone_device_update() function
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a930da9bf583b2add01fb0e086913664dadaffd0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/thermal_helpers.c:79:6: warning: Redundant initializatio=
n for 'ret'. The initialized value is overwritten before it is read. [redun=
dantInitialization]
    ret =3D tz->ops->get_temp(tz, temp);
        ^
   drivers/thermal/thermal_helpers.c:69:10: note: ret is initialized
    int ret =3D -EINVAL;
            ^
   drivers/thermal/thermal_helpers.c:79:6: note: ret is overwritten
    ret =3D tz->ops->get_temp(tz, temp);
        ^

vim +/ret +79 drivers/thermal/thermal_helpers.c

cd221c7b638f83 Eduardo Valentin 2016-11-07   66  =

a930da9bf583b2 Daniel Lezcano   2022-08-05   67  int __thermal_zone_get_tem=
p(struct thermal_zone_device *tz, int *temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   68  {
cd221c7b638f83 Eduardo Valentin 2016-11-07   69  	int ret =3D -EINVAL;
cd221c7b638f83 Eduardo Valentin 2016-11-07   70  	int count;
cd221c7b638f83 Eduardo Valentin 2016-11-07   71  	int crit_temp =3D INT_MAX;
cd221c7b638f83 Eduardo Valentin 2016-11-07   72  	enum thermal_trip_type ty=
pe;
cd221c7b638f83 Eduardo Valentin 2016-11-07   73  =

a930da9bf583b2 Daniel Lezcano   2022-08-05   74  	lockdep_assert_held(&tz->=
lock);
cd221c7b638f83 Eduardo Valentin 2016-11-07   75  =

a930da9bf583b2 Daniel Lezcano   2022-08-05   76  	if (!tz || IS_ERR(tz) || =
!tz->ops->get_temp)
a930da9bf583b2 Daniel Lezcano   2022-08-05   77  		return -EINVAL;
cd221c7b638f83 Eduardo Valentin 2016-11-07   78  =

cd221c7b638f83 Eduardo Valentin 2016-11-07  @79  	ret =3D tz->ops->get_temp=
(tz, temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07   80  =

cd221c7b638f83 Eduardo Valentin 2016-11-07   81  	if (IS_ENABLED(CONFIG_THE=
RMAL_EMULATION) && tz->emul_temperature) {
e5bfcd30f88fdb Daniel Lezcano   2022-07-22   82  		for (count =3D 0; count =
< tz->num_trips; count++) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   83  			ret =3D tz->ops->get_tr=
ip_type(tz, count, &type);
cd221c7b638f83 Eduardo Valentin 2016-11-07   84  			if (!ret && type =3D=3D=
 THERMAL_TRIP_CRITICAL) {
cd221c7b638f83 Eduardo Valentin 2016-11-07   85  				ret =3D tz->ops->get_t=
rip_temp(tz, count,
cd221c7b638f83 Eduardo Valentin 2016-11-07   86  						&crit_temp);
cd221c7b638f83 Eduardo Valentin 2016-11-07   87  				break;
cd221c7b638f83 Eduardo Valentin 2016-11-07   88  			}
cd221c7b638f83 Eduardo Valentin 2016-11-07   89  		}
cd221c7b638f83 Eduardo Valentin 2016-11-07   90  =

cd221c7b638f83 Eduardo Valentin 2016-11-07   91  		/*
cd221c7b638f83 Eduardo Valentin 2016-11-07   92  		 * Only allow emulating =
a temperature when the real temperature
cd221c7b638f83 Eduardo Valentin 2016-11-07   93  		 * is below the critical=
 temperature so that the emulation code
cd221c7b638f83 Eduardo Valentin 2016-11-07   94  		 * cannot hide critical =
conditions.
cd221c7b638f83 Eduardo Valentin 2016-11-07   95  		 */
cd221c7b638f83 Eduardo Valentin 2016-11-07   96  		if (!ret && *temp < crit=
_temp)
cd221c7b638f83 Eduardo Valentin 2016-11-07   97  			*temp =3D tz->emul_temp=
erature;
cd221c7b638f83 Eduardo Valentin 2016-11-07   98  	}
cd221c7b638f83 Eduardo Valentin 2016-11-07   99  =

cd221c7b638f83 Eduardo Valentin 2016-11-07  100  	return ret;
cd221c7b638f83 Eduardo Valentin 2016-11-07  101  }
cd221c7b638f83 Eduardo Valentin 2016-11-07  102  =


:::::: The code at line 79 was first introduced by commit
:::::: cd221c7b638f83193ffcacf9c2e3f087033fd4cf thermal: core: introduce th=
ermal_helpers.c

:::::: TO: Eduardo Valentin <edubezval@gmail.com>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8125650335706298549==--


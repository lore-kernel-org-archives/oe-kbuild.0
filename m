Content-Type: multipart/mixed; boundary="===============5986493752004827578=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] clocksource/drivers/timer-ti-dm: Move inline functions to driver for am6
Date: Thu, 21 Apr 2022 17:01:32 +0800
Message-ID: <202204211615.ksMqmJrW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5986493752004827578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408101715.43697-2-tony@atomide.com>
References: <20220408101715.43697-2-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kernel(a)vger.kernel.org
CC: linux-omap(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: Keerthy <j-keerthy@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on tmlind-omap/for-next linus/master v5.18-rc3 nex=
t-20220420]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Lindgren/TI-tim=
er-changes-for-am6/20220408-181823
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 3123109=
284176b1532874591f7c81f3837bbdc17
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220420 (https://download.01.org/0day-ci/archi=
ve/20220421/202204211615.ksMqmJrW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd=
5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a90353915d5d39c3181=
f8002304e951ffa3d2f6b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tony-Lindgren/TI-timer-changes-for=
-am6/20220408-181823
        git checkout a90353915d5d39c3181f8002304e951ffa3d2f6b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/hwmon/max1619.c:145:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/max1619.c:145:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", temp_from_reg(data->temp[attr->index=
]));
                  ^~~~~~~
   drivers/hwmon/max1619.c:172:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/max1619.c:172:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->alarms);
                  ^~~~~~~
   drivers/hwmon/max1619.c:180:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   drivers/hwmon/max1619.c:180:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", (data->alarms >> bitnr) & 1);
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/hwmon/max1668.c:139:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:139:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:151:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_max[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:151:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_max[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:163:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", data->temp_min[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:163:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", data->temp_min[index] * 1000);
                  ^~~~~~~
   drivers/hwmon/max1668.c:175:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
                  ^~~~~~~
   drivers/hwmon/max1668.c:175:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", (data->alarms >> index) & 0x1);
                  ^~~~~~~
   drivers/hwmon/max1668.c:187:9: warning: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   drivers/hwmon/max1668.c:187:9: note: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n",
                  ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/i2c/busses/i2c-nomadik.c:1034:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(adap->name, sizeof(adap->name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-nomadik.c:1034:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(adap->name, sizeof(adap->name),
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/i2c/busses/i2c-owl.c:489:2: warning: Call to function 'snprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(i2c_dev->adap.name, sizeof(i2c_dev->adap.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-owl.c:489:2: note: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11
           snprintf(i2c_dev->adap.name, sizeof(i2c_dev->adap.name),
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/i2c/busses/i2c-pca-platform.c:161:2: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(i2c->adap.name, sizeof(i2c->adap.name),
           ^~~~~~~~
   drivers/i2c/busses/i2c-pca-platform.c:161:2: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(i2c->adap.name, sizeof(i2c->adap.name),
           ^~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
>> drivers/clocksource/timer-ti-dm.c:135:18: warning: Division by zero [cla=
ng-analyzer-core.DivideZero]
                   udelay(3500000 / rate + 1);
                                  ^
   drivers/clocksource/timer-ti-dm.c:640:2: note: 'rate' initialized to 0
           unsigned long rate =3D 0;
           ^~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:642:15: note: Assuming 'timer' is non-=
null
           if (unlikely(!timer))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/clocksource/timer-ti-dm.c:642:2: note: Taking false branch
           if (unlikely(!timer))
           ^
   drivers/clocksource/timer-ti-dm.c:645:6: note: Assuming the condition is=
 false
           if (!(timer->capability & OMAP_TIMER_NEEDS_RESET))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:645:2: note: Taking false branch
           if (!(timer->capability & OMAP_TIMER_NEEDS_RESET))
           ^
   drivers/clocksource/timer-ti-dm.c:648:45: note: Passing the value 0 via =
3rd parameter 'rate'
           __omap_dm_timer_stop(timer, timer->posted, rate);
                                                      ^~~~
   drivers/clocksource/timer-ti-dm.c:648:2: note: Calling '__omap_dm_timer_=
stop'
           __omap_dm_timer_stop(timer, timer->posted, rate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:125:6: note: Assuming the condition is=
 true
           if (l & OMAP_TIMER_CTRL_ST) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-ti-dm.c:125:2: note: Taking true branch
           if (l & OMAP_TIMER_CTRL_ST) {
           ^
   drivers/clocksource/timer-ti-dm.c:135:18: note: Division by zero
                   udelay(3500000 / rate + 1);
                                  ^
   arch/arm/include/asm/delay.h:83:24: note: expanded from macro 'udelay'
           (__builtin_constant_p(n) ?                                      \
                                 ^
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/clocksource/timer-ti-dm-systimer.c:475:3: warning: Value stored =
to 'l' is never read [clang-analyzer-deadcode.DeadStores]
                   l =3D readl_relaxed(ctrl);
                   ^
   drivers/clocksource/timer-ti-dm-systimer.c:475:3: note: Value stored to =
'l' is never read
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/media/i2c/ov772x.c:583:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov772x.c:583:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/media/i2c/ov8856.c:1827:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1827:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1839:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1849:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov8856.c:1849:2: note: Value stored to 'ret' is never =
read
           ret =3D ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (46 in non-user code, 1 with check filters).

vim +135 drivers/clocksource/timer-ti-dm.c

a90353915d5d39c Tony Lindgren 2022-04-08  118  =

a90353915d5d39c Tony Lindgren 2022-04-08  119  static inline void __omap_dm=
_timer_stop(struct omap_dm_timer *timer,
a90353915d5d39c Tony Lindgren 2022-04-08  120  					int posted, unsigned lo=
ng rate)
a90353915d5d39c Tony Lindgren 2022-04-08  121  {
a90353915d5d39c Tony Lindgren 2022-04-08  122  	u32 l;
a90353915d5d39c Tony Lindgren 2022-04-08  123  =

a90353915d5d39c Tony Lindgren 2022-04-08  124  	l =3D __omap_dm_timer_read(=
timer, OMAP_TIMER_CTRL_REG, posted);
a90353915d5d39c Tony Lindgren 2022-04-08  125  	if (l & OMAP_TIMER_CTRL_ST)=
 {
a90353915d5d39c Tony Lindgren 2022-04-08  126  		l &=3D ~0x1;
a90353915d5d39c Tony Lindgren 2022-04-08  127  		__omap_dm_timer_write(time=
r, OMAP_TIMER_CTRL_REG, l, posted);
a90353915d5d39c Tony Lindgren 2022-04-08  128  #ifdef CONFIG_ARCH_OMAP2PLUS
a90353915d5d39c Tony Lindgren 2022-04-08  129  		/* Readback to make sure w=
rite has completed */
a90353915d5d39c Tony Lindgren 2022-04-08  130  		__omap_dm_timer_read(timer=
, OMAP_TIMER_CTRL_REG, posted);
a90353915d5d39c Tony Lindgren 2022-04-08  131  		/*
a90353915d5d39c Tony Lindgren 2022-04-08  132  		 * Wait for functional clo=
ck period x 3.5 to make sure that
a90353915d5d39c Tony Lindgren 2022-04-08  133  		 * timer is stopped
a90353915d5d39c Tony Lindgren 2022-04-08  134  		 */
a90353915d5d39c Tony Lindgren 2022-04-08 @135  		udelay(3500000 / rate + 1);
a90353915d5d39c Tony Lindgren 2022-04-08  136  #endif
a90353915d5d39c Tony Lindgren 2022-04-08  137  	}
a90353915d5d39c Tony Lindgren 2022-04-08  138  =

a90353915d5d39c Tony Lindgren 2022-04-08  139  	/* Ack possibly pending int=
errupt */
a90353915d5d39c Tony Lindgren 2022-04-08  140  	writel_relaxed(OMAP_TIMER_I=
NT_OVERFLOW, timer->irq_stat);
a90353915d5d39c Tony Lindgren 2022-04-08  141  }
a90353915d5d39c Tony Lindgren 2022-04-08  142  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5986493752004827578==--


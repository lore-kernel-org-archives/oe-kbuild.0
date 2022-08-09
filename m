Content-Type: multipart/mixed; boundary="===============7417463445975949559=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/asb100.c:579:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 09 Aug 2022 17:56:53 +0800
Message-ID: <202208091714.RmAaAJTY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7417463445975949559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/hwmon/asb100.c:579:23: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: b97adb596399581df42a5f94e14235359f150373 hwmon: Allow to compile AS=
B100 and FSCHMD on !X86
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220809/202208091714.RmAaAJTY-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db97adb596399581df42a5f94e14235359f150373
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b97adb596399581df42a5f94e14235359f150373
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/asb100.c: In function 'pwm1_enable_store':
>> drivers/hwmon/asb100.c:579:23: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     579 |         unsigned long val;
         |                       ^~~
     'pwm1_enable_store': event 1
       |
       |  579 |         unsigned long val;
       |      |                       ^~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hwmon/asb100.c:28:
   drivers/hwmon/asb100.c: In function 'asb100_update_device':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:105:10: note: in expansion of macro 'typecheck'
     105 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   drivers/hwmon/asb100.c:945:13: note: in expansion of macro 'time_after'
     945 |         if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
         |             ^~~~~~~~~~
     'asb100_update_device': event 1
       |
       |include/linux/typecheck.h:11:19:
       |   11 |         typeof(x) __dummy2; \
       |      |                   ^~~~~~~~
       |      |                   |
       |      |                   (1) use of uninitialized value '<unknown>=
' here
   include/linux/jiffies.h:105:10: note: in expansion of macro 'typecheck'
       |  105 |         (typecheck(unsigned long, a) && \
       |      |          ^~~~~~~~~
   drivers/hwmon/asb100.c:945:13: note: in expansion of macro 'time_after'
       |  945 |         if (time_after(jiffies, data->last_updated + HZ + H=
Z / 2)
       |      |             ^~~~~~~~~~
       |
--
   drivers/hwmon/fschmd.c: In function 'temp_max_store':
>> drivers/hwmon/fschmd.c:362:14: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     362 |         long v;
         |              ^
     'temp_max_store': event 1
       |
       |  362 |         long v;
       |      |              ^
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |
   drivers/hwmon/fschmd.c: In function 'fan_div_store':
   drivers/hwmon/fschmd.c:436:23: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     436 |         unsigned long v;
         |                       ^
     'fan_div_store': event 1
       |
       |  436 |         unsigned long v;
       |      |                       ^
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   drivers/hwmon/fschmd.c: In function 'pwm_auto_point1_pwm_store':
   drivers/hwmon/fschmd.c:525:23: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     525 |         unsigned long v;
         |                       ^
     'pwm_auto_point1_pwm_store': event 1
       |
       |  525 |         unsigned long v;
       |      |                       ^
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   drivers/hwmon/fschmd.c: In function 'alert_led_store':
   drivers/hwmon/fschmd.c:570:23: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     570 |         unsigned long v;
         |                       ^
     'alert_led_store': event 1
       |
       |  570 |         unsigned long v;
       |      |                       ^
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/hwmon/fschmd.c:22:
   drivers/hwmon/fschmd.c: In function 'fschmd_update_device':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:105:10: note: in expansion of macro 'typecheck'
     105 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   drivers/hwmon/fschmd.c:1306:13: note: in expansion of macro 'time_after'
    1306 |         if (time_after(jiffies, data->last_updated + 2 * HZ) || =
!data->valid) {
         |             ^~~~~~~~~~
     'fschmd_update_device': event 1
       |
       |include/linux/typecheck.h:11:19:
       |   11 |         typeof(x) __dummy2; \
       |      |                   ^~~~~~~~
       |      |                   |
       |      |                   (1) use of uninitialized value '<unknown>=
' here
   include/linux/jiffies.h:105:10: note: in expansion of macro 'typecheck'
       |  105 |         (typecheck(unsigned long, a) && \
       |      |          ^~~~~~~~~
   drivers/hwmon/fschmd.c:1306:13: note: in expansion of macro 'time_after'
       | 1306 |         if (time_after(jiffies, data->last_updated + 2 * HZ=
) || !data->valid) {
       |      |             ^~~~~~~~~~
       |

vim +579 drivers/hwmon/asb100.c

^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  572  =

82e73f7f95387737 drivers/hwmon/asb100.c     Julia Lawall   2016-12-22  573 =
 static ssize_t pwm1_enable_store(struct device *dev,
82e73f7f95387737 drivers/hwmon/asb100.c     Julia Lawall   2016-12-22  574 =
 				 struct device_attribute *attr,
82e73f7f95387737 drivers/hwmon/asb100.c     Julia Lawall   2016-12-22  575 =
 				 const char *buf, size_t count)
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  576 =
 {
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  577 =
 	struct i2c_client *client =3D to_i2c_client(dev);
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  578 =
 	struct asb100_data *data =3D i2c_get_clientdata(client);
8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14 @579 =
 	unsigned long val;
8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14  580 =
 	int err;
8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14  581  =

8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14  582 =
 	err =3D kstrtoul(buf, 10, &val);
8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14  583 =
 	if (err)
8c103696fa59e1b8 drivers/hwmon/asb100.c     Guenter Roeck  2012-01-14  584 =
 		return err;
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  585  =

9a61bf6300533d3b drivers/hwmon/asb100.c     Ingo Molnar    2006-01-18  586 =
 	mutex_lock(&data->update_lock);
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  587 =
 	data->pwm &=3D 0x0f; /* keep the duty cycle bits */
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  588 =
 	data->pwm |=3D (val ? 0x80 : 0x00);
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  589 =
 	asb100_write_value(client, ASB100_REG_PWM1, data->pwm);
9a61bf6300533d3b drivers/hwmon/asb100.c     Ingo Molnar    2006-01-18  590 =
 	mutex_unlock(&data->update_lock);
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  591 =
 	return count;
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  592 =
 }
^1da177e4c3f4152 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  593  =


:::::: The code at line 579 was first introduced by commit
:::::: 8c103696fa59e1b810bf24a63304acd5ab585c12 hwmon: (asb100): Fix checkp=
atch issues

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7417463445975949559==--


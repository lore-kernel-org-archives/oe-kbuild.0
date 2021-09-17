Content-Type: multipart/mixed; boundary="===============0615477561052636279=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to 'unit' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 17 Sep 2021 13:10:56 +0800
Message-ID: <202109171349.E6l9HHSc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0615477561052636279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@dell.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bdb575f872175ed0ecf2638369da1cb7a6e86a14
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-c001-20210916 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8cbbd7=
e0b2aa21ce7e416cfb63d9965518948c35)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   sound/core/device.c:237:2: note: Taking false branch
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/device.c:237:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:762:13: note: expanded from macro 'list_for_each_en=
try_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
                      ^
   include/linux/list.h:533:2: note: expanded from macro 'list_last_entry'
           list_entry((ptr)->prev, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:763:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:563:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:693:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/fbdev/core/fbmem.c:809:3: warning: Value stored to 'dst' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:809:3: note: Value stored to 'dst' is n=
ever read
                   dst +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: warning: Value stored to 'src' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   src +=3D c;
                   ^      ~
   drivers/video/fbdev/core/fbmem.c:887:3: note: Value stored to 'src' is n=
ever read
                   src +=3D c;
                   ^      ~
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1596:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/hwmon/adc128d818.c:218:29: warning: The result of the left shift=
 is undefined because the left operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
           data->temp[index] =3D regval << 1;
                               ~~~~~~ ^
   drivers/hwmon/adc128d818.c:207:14: note: Left side of '&&' is false
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/adc128d818.c:207:14: note: Taking false branch
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/adc128d818.c:207:14: note: Loop condition is false.  Exiti=
ng loop
           int index =3D to_sensor_dev_attr(attr)->index;
                       ^
   include/linux/hwmon-sysfs.h:17:2: note: expanded from macro 'to_sensor_d=
ev_attr'
           container_of(_dev_attr, struct sensor_device_attribute, dev_attr)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/adc128d818.c:213:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/hwmon/adc128d818.c:213:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/hwmon/adc128d818.c:217:21: note: Left side of '||' is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                              ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/adc128d818.c:217:21: note: Left side of '||' is false
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                              ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/adc128d818.c:217:21: note: Assuming '__x' is <=3D 0
           regval =3D clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
                              ^
   include/linux/math.h:91:5: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \

vim +/unit +1596 drivers/platform/x86/dell/dell-laptop.c

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1532  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1533  static ssize_t kbd_led_timeout_store(struct device *dev,
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1534  				     struct device_attribute *attr,
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1535  				     const char *buf, size_t count)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1536  {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1537  	struct kbd_state new_state;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1538  	struct kbd_state state;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1539  	bool convert;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1540  	int value;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1541  	int ret;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1542  	char ch;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1543  	u8 unit;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1544  	int i;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1545  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1546  	ret =3D sscanf(buf, "%d %c", &value, &ch);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1547  	if (ret < 1)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1548  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1549  	else if (ret =3D=3D 1)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1550  		ch =3D 's';
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1551  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1552  	if (value < 0)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1553  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1554  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1555  	convert =3D false;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1556  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1557  	switch (ch) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1558  	case 's':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1559  		if (value > kbd_info.seconds)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1560  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1561  		unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1562  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1563  	case 'm':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1564  		if (value > kbd_info.minutes)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1565  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1566  		unit =3D KBD_TIMEOUT_MINUTES;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1567  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1568  	case 'h':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1569  		if (value > kbd_info.hours)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1570  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1571  		unit =3D KBD_TIMEOUT_HOURS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1572  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1573  	case 'd':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1574  		if (value > kbd_info.days)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1575  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1576  		unit =3D KBD_TIMEOUT_DAYS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1577  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1578  	default:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1579  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1580  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1581  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1582  	if (quirks && quirks->needs_kbd_timeouts)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1583  		convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1584  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1585  	if (convert) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1586  		/* Convert value from current units to seconds */
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1587  		switch (unit) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1588  		case KBD_TIMEOUT_DAYS:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1589  			value *=3D 24;
df561f6688fef7 drivers/platform/x86/dell-laptop.c Gustavo A. R. Silva 2020-=
08-23  1590  			fallthrough;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1591  		case KBD_TIMEOUT_HOURS:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1592  			value *=3D 60;
df561f6688fef7 drivers/platform/x86/dell-laptop.c Gustavo A. R. Silva 2020-=
08-23  1593  			fallthrough;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1594  		case KBD_TIMEOUT_MINUTES:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1595  			value *=3D 60;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19 @1596  			unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1597  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1598  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1599  		if (quirks && quirks->needs_kbd_timeouts) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1600  			for (i =3D 0; quirks->kbd_timeouts[i] !=3D -1; i++) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1601  				if (value <=3D quirks->kbd_timeouts[i]) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1602  					value =3D quirks->kbd_timeouts[i];
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1603  					break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1604  				}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1605  			}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1606  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1607  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1608  		if (value <=3D kbd_info.seconds && kbd_info.seconds) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1609  			unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1610  		} else if (value / 60 <=3D kbd_info.minutes && kbd_info.minu=
tes) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1611  			value /=3D 60;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1612  			unit =3D KBD_TIMEOUT_MINUTES;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1613  		} else if (value / (60 * 60) <=3D kbd_info.hours && kbd_info=
.hours) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1614  			value /=3D (60 * 60);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1615  			unit =3D KBD_TIMEOUT_HOURS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1616  		} else if (value / (60 * 60 * 24) <=3D kbd_info.days && kbd_=
info.days) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1617  			value /=3D (60 * 60 * 24);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1618  			unit =3D KBD_TIMEOUT_DAYS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1619  		} else {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1620  			return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1621  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1622  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1623  =

e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1624  	mutex_lock(&kbd_led_mutex);
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1625  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1626  	ret =3D kbd_get_state(&state);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1627  	if (ret)
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1628  		goto out;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1629  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1630  	new_state =3D state;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1631  =

9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1632  	if (kbd_timeout_ac_supported && power_supply_is_system_s=
upplied() > 0) {
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1633  		new_state.timeout_value_ac =3D value;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1634  		new_state.timeout_unit_ac =3D unit;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1635  	} else {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1636  		new_state.timeout_value =3D value;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1637  		new_state.timeout_unit =3D unit;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1638  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1639  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1640  	ret =3D kbd_set_state_safe(&new_state, &state);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1641  	if (ret)
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1642  		goto out;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1643  =

e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1644  	ret =3D count;
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1645  out:
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1646  	mutex_unlock(&kbd_led_mutex);
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1647  	return ret;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1648  }
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1649  =


:::::: The code at line 1596 was first introduced by commit
:::::: 6cff8d60aa0aba5583ecda09984dbcb2f24cc28d platform: x86: dell-laptop:=
 Add support for keyboard backlight

:::::: TO: Gabriele Mazzotta <gabriele.mzt@gmail.com>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0615477561052636279==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICO3tQ2EAAy5jb25maWcAlFxbd9w2kn7Pr+jjvMw8xFFLsuzdPXpAk2A30gRBA2Bf9IKjyC1H
O7p4WlIm/vdbBfACgKCcdc5x3KjCvVD1VaHAn3/6eUZeX54erl/ubq7v77/Pvh4eD8frl8OX2e3d
/eF/ZrmYVULPaM70e2Au7x5f//r17uzTxezD+/n8/ckvx5v5bH04Ph7uZ9nT4+3d11eofvf0+NPP
P2WiKtjSZJnZUKmYqIymO3357ub++vHr7M/D8Rn4ZvPz9yfvT2b/+Hr38t+//gp/P9wdj0/HX+/v
/3ww345P/3u4eZndfPr97MvHLxfw3+Hs4/XtxaffT2/PPv7XlxP4eXZyfvvx02E+/3D7z3ddr8uh
28uTrrDMx2XAx5TJSlItL797jFBYlvlQZDn66vPzE/jTs3sNhxRoPSOVKVm19poaCo3SRLMsoK2I
MkRxsxRaTBKMaHTd6CSdVdA0HUhMfjZbIb0RLBpW5ppxajRZlNQoIb2m9EpSAitQFQL+AhaFVWFH
f54trXzcz54PL6/fhj1mFdOGVhtDJKwG40xfnp0Cezc2wWsG3Wiq9Ozuefb49IIt9MsnMlJ26/fu
XarYkMZfDDt+o0ipPf4V2VCzprKipVlesXpg9ykLoJymSeUVJ2nK7mqqhpginKcJV0qjUPVL443X
X5mYbkedWLpw5HGt3dVbbcLg3yafv0XGiSQGlNOCNKW2EuHtTVe8EkpXhNPLd/94fHo8wHnt21Vb
kl4CtVcbVmdJWi0U2xn+uaENTTJsic5WZkTvBFMKpQynXMi9IVqTbOUvY6NoyRaJeqQBhRhtMJHQ
kSXAgEFyy4EeldqTBIdy9vz6+/P355fDw3CSlrSikmX2zNZSLLxj7JPUSmzTFFoUNNMMB1QUhruz
G/HVtMpZZRVDuhHOlhL0EhzHJJlVv2EfPnlFZA4kBdtoJFXQQah/csEJq1JlZsWoxMXbT4yFaAl7
DEsH+kALmebCPuXGjtlwkUfarxAyo3mr2Jiv6VVNpKLTK5HTRbMslJWKw+OX2dNttHODfRDZWokG
OnJClwuvGyscPos9H99TlTekZDnR1JREaZPtszIhA1Z3b0aC1pFte3RDK63eJJqFFCTPoKO32Ths
E8l/a5J8XCjT1Djk6ES4w5nVjR2uVNaSRJboTR57UPTdA0CF1FlZXYEkSyZya0D7U1sJpLC8TGsE
S05SVmy5QkFqhxLytJs/Gk0/EUkprzU0b03voKHa8o0om0oTuU/rMceVUDVd/UxA9W5NYL1+1dfP
/5q9wHBm1zC055frl+fZ9c3N0+vjy93j12GVAF6s7QKTzLbhxL/vGYXcStNATozC7qfKVnCIyKZT
HH0bC5WjssooKFNoRieniBuLaEelJqmYJxKK9fYiZwoBSu6fv78x+f5cwbSZEmWny+ziyayZqbE0
aVhoA7RhIPDD0B2ImCf1KuCwdaIinKat2h6QBGlU1OQ0Va4lyRJjglUsSwRV3NfASKkobJCiy2xR
Mv+sIq0gFWBGxGWjQlNSUlzOL4KmRLbA9Zsck7EgkS/8rQmXttfAa/cPTyeve+kWmV+8gjbh6F0+
DCAQ0V4BBo8V+vL0xC/H3eVk59Hnp8OxYZUGeE0KGrUxPwuEuqlUi4GtdFut10mKuvnj8OX1/nCc
3R6uX16Ph2d3+lp0AC4Br+2yJFVFonZgDrak0maBpgL6bSpOoK1yYYqyUSvPNCylaGpPjddkSZ02
oJ4tBAyTLaOfZg3/80BzuW5bi1s3W8k0XZBsPaLYVRlKC8KkCSkDyi/AnpAq37JcrxKHXGqTbLPt
qWa5GhXK3IfkbWEBp+7KTn7o21FWzZLCGqaQXg1gzreGKHnYZ0sZdZLTDcvoqBi4UcMl+gY9USQV
X98gIInEyJTI1j0P0QGOR6gMCAUUa7rlFc3WtQBJR7MF2CiFcVutDf5Tt/c+soY9yynYGIBWNE92
ImlJ9ol2UZxgkSySkT7aw9+EQ8MO0HhegMw7x2xoPZ/0bYAUemRQYB0xv3LkxPiE86Bm63h1gxcC
TWqolcCFFjXYQnZFETHaHRWSkyoLLHrMpuAfKa82N0LWK3D0t0R6ehpBm/Ywm9NCLJ9fxDxgfDJa
W0hrtW4MrzJVr2GUYN1wmN7k6mL4ERuwqCcOVpbBAQhOk4JThJ6DaQFmSqqs6IwAaAHzzX3A6vCd
A1T+4UPtHP82FfdgAJwWf0y0LGDDZBrTRUuRklYCKL9ogrE2mu6in6ARvKWrhc+v2LIiZeFJkZ2W
X2Dhsl+gVoEKJkwE2EuYRqYBF8k3DEbcLrC3dNDegkjJfOW/RpY9V+MSE+xOX2pXAw82OooBkquL
1Kb7HrG0yKxIOf/WrGEUahgktFZlduO806hoAB+tZrSliTahJZrnvr1wwg/jML2H4wnC/CQIW1iD
3QYo68Px9un4cP14c5jRPw+PgBkJmOoMUSOA+gEKTjTuxmmJsA5mw61PmrT9f7PHrsMNd911dj3o
VpXNYmw9QrKz9+5Qiipl/wSvCcAN61d5dUnKWGKTIZtIsxHsWQIeafF63LY11QhFjQS9IPjEBHxG
DCQAcE6Jl1o1RQFIzSKgRDzArgSCQvDpNSP+0d0rTbk1rxioZQXLOpfAc8FEwcr0abTq1xraIBIQ
RkM75t2nC3PmhRjht28dlZaNDZ7AomUi98+xi+kaa3T05bvD/e3Z6S8Ybfdjomuw10Y1dR3EbAHE
ZmuHzUc0zj0Ub88oR7ApK7C9zHn3l5/eopOd5xyEDJ1c/aCdgC1org+2KGICsNcRnB0IWiX7zgKa
Is/GVUB9sYXEGEqO4CWqjgoKpQT13y5FI4CYMDpPrWlPcICcwCE19RJkJg4DApZ0YND53OAkDQzW
PetIVrFBUxKjPKvGvyAI+Ky0J9nceNiCysoFvsDYKrYo4yGrRmHEb4ps/RC7dKTsEHQgvSDNRvF6
1KoVM4z9YJzSMz4FWHxKZLnPMBjn27966XytErQdGLXeW2svLxTBNUdJxoWlmTvdVoXXx6ebw/Pz
03H28v2b8/o9n6xt5kpA/UCIgmHjVApKdCOpQ9Yhidc2FuiJkyjzgqkgJCypBlQAspFUZdiMEy3A
bzJtQpFnwZYwskky3WnYL5SBBKAJOEEjYai+VmkHAVkIH9ppvZokLxOqAHeeJdRfKwNMstAwWc9C
cAYqCxA/BvxwPDIVP9qDOAOiAbi8bKgfmoA1JxsmA9PRlU36TD2DqlllY6fhVq42qANK9GhB32eB
lViDsY3G4KKzdYMxQxDEUofAr96sxuONg2YJji6W0M+Ln3+6ULvk6iMpTfjwBkGr9LUI0jjfJVaO
X1hrNHCCZgAHgDOWbqgnv01PS2hHTV8k8fXExNYfJ8o/pcsz2SiRFmpOC7D1NIREA3XLqmzF6mxi
IC35LO0Yc7AfE+0uKRj25W7+BtWUE4KQ7SXbTa73hpHszJxOEyfWDhH4RC0AUdMKpjWpE0rBHvcK
Z+OMpouwffBZyvk0DVF0DareBTJUw8NTDNIdFmS83mWr5cV5XCw2kSpnFeMNt7q4IJyV+8sLn271
CnjYXHmKgRHQcWgfTOCfI/+G70aWwweOGPnGSAAtaZYK4uM4wF46de0FHNpiu+UBZuwooLzHhav9
0g/89q3AYSONHBMAFlaKU8C+qS4aniXLr1ZE7Pwru1VNndbzush9j72ygEUh1gfIsqBLqH2aJuL9
4KeY1DkRMWEocBZHcR/42iKejQ0TzKuWLBUesnKJ2QWG1CySMfDJ28LgHEgqAZ27gM9CijWtXAwJ
7zwnDw8PTa0DMp5L+PD0ePfydAyuazzfs7XuTRW6z2MOSeryLXqG9y7hrZTHYwGC2IZ2u/dxJsYb
LCVdkmwPh8R3dNpfIVoRdYl/0WSIRgtQEQsyxP7ZpzX8iLYBVx0AZlOnl52zDI4jaKTpTVEpgNIi
NxZEtCuBV4KAYFOIxlHOgyBVW3hxngItG67qErDSWVBlKMWoYnLUHctpOgAwkH/YwjwNpuBAiqLA
KPjJX9mJ+xPNM97KrCYud0lplqWu9CymKgB3QmU47iThlli4PU22yrRLzsA7fU/GWYlCV3aIEy/N
G3p5Eu5ErVNxWTt6tDeAwoXC0JRs6jgYYEE6SBpiOd6NYWB1DUw07lIR8Nppe3lx7ommljK5O3a6
4wCJ16QCPzpUUwDJohJ31LXa2bXCDR0dv4gjDV4SnHh5kOSlRcpdWF2Z+clJcC6uzOmHk/Sl+5U5
O5kkQTsnyR4u54OIrumOBgo7k0StTN6ELlYn7qu9Yqj7QXwlSvw8FHhJbWCplcjB8bP7gzF/DJ5O
7JN13G0DfrC765CUbFlBh6fhAQMpK5tleNc6yJ5HPvHsrg1FpmltrGWTqyDYnPHcxjSg6bRjClvN
ir0pc50OAXcG4Q1PPDjA7lR3h6cda+/PP/3ncJyBWbn+eng4PL7YdkhWs9nTN8wf9bz6Nnzhmfw2
njHcA0YEtWa1DTx7m8CNKimtxyVhjABKUdrHvFuyppGn6Ze2WY+eVAbUZTCUoAm7lYFt5hj9x1un
fNoB5jaZcrw2/axSzbZ39zoF54GclV5wafvZgQJjPSiGwekhyNsdf/ANliPdHEaHcE892uhXhx7s
gYNlFGLdxKEmDspct1l2WKX2g362pA3wuhFbtKO8OOigaZHXrswyGaZwbdWZNDqySJYQCoUtk3Rj
xIZKyXLqB9jCLmnWJZJNdUriGS2IBsO2j0sbrUNLZYs30HsK6FpiQcYVNEn7tG6BRNK2WZr1qCQF
4VAqGtvgB/V4M01m+Whpe2JUHirHcJhDg2S5lCBFWkzuqV4B5vRvBFwLXVjMxf7pAD37UG+7WqjI
mnopSR6PPKYlZG16pesMpUqkXEa32gJcOlDaU8vCROyrOEFdpMGxqztxz+86bJQWCHj0SrzBJmne
oHrCy5otkYglylSOwHBkSU29gx+Wt/e+YRdIeENEa51OtuiWDf5dpBehBhcBgDIIDEvelKEdR13Z
OrqDU5nEOjbCCuxosL1NAh3veS7IAKYfvDh7gdpp7fQE0CSI1nhOctjEtqkMR9sEA8RP9mZRkmo9
yYWXaFtEe8FSdSmGs+J4+Pfr4fHm++z55vo+cFM7PRDGDaxmWIoN5lJjOERPkOPctZ6IiiMALR2h
SwjE2l5eRjotJlkJTYMCufv7VXCvbPbNRERnVEFUOYVh5T+cAdDadOX/z3hsWKPRLJWPESxvmLiS
5OhWY1B5Ab2f+gT9zZm+NcMUbz+vyyG9dXYby97sy/HuT3dNn/BVamtyJh2aGt/c1A12OX1R0tq3
N5nswlVwaMLgdZLjY+igeYQOB4Wh1p1VDHxC8Vo/sAYHA5COC/ZJVk1FtwZGlq2GPQxJCtRuQKrP
3Z0FDCEktKtiKptIfxoSS1EtZVPFoRosXoHsTt9yDVIoR+rn+Y/r4+HL2BkIZ1CyRdztQLT3u5jS
Seqxv+5nEyf0XC+G7Mv9IdR6IXrpSqwglyTPo7xEn8xp1Uye9p5L07SvHTB1l1RJm+tI3YXWZZg6
7WbkXfvZ4zO2JZ2390M/zS7V4vW5K5j9A1DN7PBy8/6f/lFFqLMUGHKZyOBCMufu5xssOZPpGLsj
k8qDzFiEPYYlroWwrOs4cJigPKsWpyew5p8bJtNmFPMWFk0K17cZDRhO9puF4lRuS4ZhAV+YXclK
OiSS7FuUdcqVIyXz8hoqqj98OJn7Q1hSkXREeG6qRayWMKlokZSNiU13AnH3eH38PqMPr/fX0RFu
4xP2zmFoa8QfYkVApZgkIlwgzHZR3B0f/gNaYpaPDQPNUwlEBZPcwlVOeRBRyzljefDT5VJFRfhq
k5NshWGUSlQY/gLvyt0z+8tWbE1WtOlYiWEshViWtB9NsDOOBJo5ueEtGe8D7O2DngSJLSfmhYEl
FvDPIVI/Urb68PV4Pbvt1tMZWkvpXr2kGTryaCeCvVtvgugxXo03IKJXNmclJYbgdW12H+benRTm
hqzI3FQsLjv9cBGX6po0No0jeLF6fbz54+7lcIOBql++HL7B0FGdjQyMix2GNy42wBiVdS5YcBnV
JSChcfb0kF0G0TmZQ7pXW4L+T3yxto6Tan5rONg7svAjLe7xMAxvrzBcXuggq6GlYiAvQRW1jruw
wxzCPU1lA5aYPJ6hox0FZfDyFt/halaZBT7e9AaPWTKpxhksIaaEJfKmRhN2pVMtTQ2/bQYAqilS
SdNFU7nkOyolhiJSLxk3NMxEHp532hZXQqwjIqp59NXZshFN4smdgr2zttu9QIxW0qaUCakx+trm
zI8ZwJlqQ6kTRGfWTKDXvJG7N90u+dBsV0zT8IlQnwqmTL6vCGpb+xTP1Yj4zk4XTOMVgxm9glUc
44Hts+14d8DphsONEVpM8mrlqjWQAZ/yPctw4/CJ+WTF1dYsYKLuUURE4wzR4EBWdjgRk/XPQega
WYGKhy0JEq3j1OOEnGBIBDG0ffHhcthsjVQjif677GLZLhFeYqT2M6UOUlQ/y7tl47wxS4IRsTZ4
hXH0JBlfeaVYWrlz58S9sWpTM+LBtAqkFTu8aYw42nruOn6ClotmImuR1ZlxD3i7zwckFkPRDCHH
G6Q2odNTnXGVHzC2KS5dzH3cD+5lCYIXEUe5joPq/hvluKyiSna4ZRpQSitDNjlvpIrH7z7j8yJQ
Hps4894V87i4048VXuui+cBM0nDDh31DGraBFlzGIgHqo7sgphmmanuyKfIGbwnQ9uCDEDm6d0Bt
aCnddV1qmEF6c2z/dqDZkmo6rNXnpLQOQKiMwI3GqzZYfUB4/rs2gd+tYMs2Ang2IpDIGvVgGRUu
7ldK+2uwMbr7MIPc7nyBmSTF1d3aJqunSMNq1rALZ6fdvWmr9Xu4h7rQf9wwmSvQvhsB7JTJfT1K
qx7ATEqgph5bhXdR7QMOEEr7eqCHiJnY/PL79fPhy+xf7t3Gt+PT7V0b8BwgNbC1K/nWHCxbh+zc
cIcHA2/0FEwXP1+D8JJVyQcHPwCzXVMStg5fNfmH3z79Ufh0ZfgGTru/Cl0X9/YgPnFxgfuiAmwu
CUKALbGpkDB1ydxhgym6HYrM+i+/JKMcw5BHQ2un4aMoj9LtyJiCHsabY3I8p6cT6awh14dUfDDk
Oft0Pj0U8H/ebgBkbXX57vmPa2jm3agV1BuSTqSFtzwu+s+ZUvgxkP6tqWHcHpdE900Fmhf01J4v
RDkSCuXew8dXuIs2Dbr/uTZge+wJjDQaklSm8H7pc5ihPbxdBi3UXhJ4JHyHulBB9MYrTn/DZXi/
qulSMr0fN9mTjJ4HsZmOAR8cpAINHR3siNC6DGzrmGYzhaKhd9kaFt2krjWRabtILxHDLx6AHt1P
UDOhdNwhtGV46gGeGy8qTj8eYrcKs/9rUsZNue9PdYo8cvJd9sf18eUOddVMf/8Wvqq3b7cc0G+T
IFLHQOVCDazDsDAi4xcPccyoR38e/DPG+sK52SQN96EeMbzk9+IEUIkJl2iaA1awX9zyJMQjr/eL
5A529EXxeQioww/TbdPohT0Sp16TD5+nCcb7U7+s7dvyzlypaj78aqp2z/A9hVXfWfzOaEjocKE4
yb0PEFkr4yrDxoltcGMNBxbM+gTRwoMJWh9msJ9vylOPPaYpcWW5TVcdlfeGHCN8mNpRkrrGU0ry
HDWqcfdiCRzVvXQ1C1p0d73ht4g8XptgZbYSGvfnPOQ0WeGjfx1uXl+uf78/2A/yzWwq7osnhgtW
FVwj5PUOQVmEsaqWSWWS+cCqLQYDkHnXfAIv93ntH56pUdgh8sPD0/H7jA9XBOMMrmQq5xAubbNE
Oakaknxs3meKOhYPoHaURNHo23oujoBfVfo/zp5kO3Icx1/x68O87kNNORaHw4c6UBIVwQxtFhWL
86LnynR1+bXtzJd2Tvf8/QCkFoICI+rNoSodALiIKwBi2bj3U9ctN07MUBUazVaNWaTGEn1J+HKP
VzeGtLXEbUJOfCaaVmyURW3PhvYTAgyyu7Ssn1GJ4sUI3GnnY/vnYSOb2ChNSf3b8vpuNQ4vJ5Rx
T7IgnxZGjnW6SaJv5MKXcAeQezUgEFoT+rfbHvS5Kktn1j5He3KufV6kIP4wffqs836IRuIOZqaX
0673Olj0QOw1jm4FRhFn5grVeTve49c6tA2+Y67hvHGQ8AMZjVICOlzwcQ6H3V810gq37lLe4RT2
apBh64V3V1+ucK0s4Adcv5uaqGsRKD2Y3kXWzbBX05m9XDx9/Pvbj3/ha/tkE8Ny30nPTQ8hbaIE
N4JwpzjiIv6CA4i8BBiYX3pctlnAsSKtc3O0slj81p3kbJFUQXuvKhv8AqOf8S971WiHaZw/2Eu8
aqvCOUzs7zbZxpXXGIKNWW+oMSSoRc3jzcRWgSCRFgkzDJsx33Nuf5aibfZFQc9euLTgMCp3KhBi
xhY8NPx7FGLTkn/U7nBjs3wDOC2t2IZxIJSEkarCgzgw2+PnukBccB6oiaseTKvfJ1V4gRqKWhwv
UCAW5gV1dXzsN2wd/tycY3gHmngfuVdaf/73+N/+9uXn789f/kZrz5Mbrbg9CjO7osv0sOrWOqp1
eBM7Q2Qj4KDzR5sERH38+tW5qV2dndsVM7m0D7mqeMdNg/XWrIvSqpl8NcDaVc2NvUEXCXBJLbo6
Ng+VnJS2K+1MV/GkqbIu3m5gJxhCM/phvJabVZsdL7VnyLa54N2D7TRX2fmKYA7MEwKvQqhgYYWK
YfhGVI3nouYMiXFXVE2FIZW1VukDualM2Wr7YFQDcM3mlRewEGisFp5tParOIOEoSuJAt9FjIA4c
znXCz1gTCksL/CwLz+aBFqJaJSxXZl9Z8BjRwhsFBLGVHTJRtOvr+YwT5xMZE47B/u42vSOXZTH5
4T7GNyLbjQID6jJAiMkkBasqSSpXIjYAVAoI7rw+zW+I1lhUEftt1baE7rKoVVYeK8FZFCgpJY7H
DdG3jdC2yLo/TLQsWHhFwwoiThEM2wbjOHwv7LWuiVd3nfcyvGGv7n8+/XwC5urXTkAnFrUddRtH
9+6w9eBtwymxBmzqynA9FN1fKRuIUHMW3U/hNVU29GDP+meCZWpq5H3GQKN02sU40lyjkpp3+zUJ
/ss2+AmTJhKN5xDXCvzL+nYOJeuaGb570/ikGeCoeUS8LXeSm9L7lNugQzEjJk9qQxUQj4nFTk67
6yqXhtWyZWaiUmxpHj7KGJOvwmeLIENo5zbMappRtzzN1CL95fH9/fmP5y9eggEsF2eevAMAfOrw
IgN3iCZWRSL5+As9jTkQl4H5QYL0OG1xv5i7E92BzoSG7Aj8i3LaG33gTk0XvfKXmOkknIlnyvnh
QIeRcyMIunXBFfHqw3MMYeo9qxjG3SDOtC5iT3IVaCNQZiTuZg/fEOqNIa3LaEqYq3pyDCBcAyvh
uvj08EJwvZAkwPtQh8orpuZd1JGT70dUrPehA8b0tcq0P20IP4Qii/QEMEFn8dClkB15T6JSjt/o
sZYvRFF6+r0bdO4i0CbuFQrMEaJS4oeaxNx9khRojqNLTPjgPlY2uTAvAeT1ZYD2fx64dwuHKhNc
nRgPjoW7jqMOOO8CpXMdCTt6OUSob/LUTaMtbyWLgz4qfsscLLtBFksPCylgBnxWlpUxUR3mDBWL
qhwpOn8cuhJNfpJA3WbheusdYe1G89brBolnauj7sYZCc9++1fXknjHjBJxnsKpsgbkPUI71qDqa
+7pxjjL81eo88SAN9WowsHwbVoUUseZkztoN31ynJka6q5Y4ufjufcfISITJcRBWcEroXqsxELZ+
aGnsquiePs9VaftJccpJo67B92DryEwVglcfT+8fnjmE6eGu2cjwSZXUZdXCwlKeZ+ag3ZxU7yFc
ReQoEeW1SMzIdG+JX/719HFVP359/obmFB/fvnx7cfSWwooWzi/Y97nAsJMHes/UZT4ugLrUeMiZ
JsTpv+c3V29dZ78+/c/zlyfHHalf4jvlalhXld1yztjfSzSrY8+qB9iCLZr9pcnJPXwG+JaBV6Km
56KByoqXMR9Ezk7C2a8bVp9wXy/gPKsFebNGUBTzUi/iNhwbgohPs7vFHa1a6bKp+rEHwFVi+8TY
+SP5IWaFPoM6Yb9fXZDOJiA4IQjXBqBYZDHaeaGSK3BgIdnuIHBuqljJlL9tK8OYh/pnEkHRztjc
UENQZ79fFhvzZ5ChiG9vuZAZZmBThf+mCW0y73pB6skvtpSTngbJKil2zAi5U/JJYAwOvwcy12fb
T9ez1TVvsUPn5mLXwgTZycdP+40WgH7fe9SZiNSGrEzNU6FX2ppb2FiNfBoSZlc45wCvHxEp3BF1
SGOVtruY62aqorbuTMAG6qOqZRayLqrTnWJttvBKuKv8u/wuHBo/Fip1l6pKp2EtDBTq4a95g91r
4iUYy2rb8jZBRepqUdIY2J+NakRGOCMAF4E1g7gtxXXX6OOPq/T56QVjP7++/nzrhNirv0OJf3Rn
LjnYsCaQNvg+tlVxs1jQnhpQq+bxFDxv9xjp5tW9Xv9Sf/qKKk52AvnBHRZOldzz9hi6lj4sbzDo
nySBzVOhsvJA3SfhvmzKMuu50ZB+VHZsTc8STO4LQqyoJlXyDnldgGE3L433o8tf5cUfV+b9n/cI
RKzQJP5LB+ECaA+4867rlAztdP4S8QUfeiRsq4Aa23hMsqwuYoyvpD8qZwQkEwSj2XP7EVFofIFn
zZiugZRUJS8EIA4Y6DBOAAcdarLzq6CjgUbesMZNaK3A5BqawFQaHPpKhMcbKf7SxFhCWc/xfyxZ
755WMacRwr58e/v48e0Fs9OMjGy3ed6f//l2RHc+JIy/wR/65/fv3358uC6B58isXdC336He5xdE
PwWrOUNlj8PHr08YetCgx05jBq5JXZdpB2tAfgSG0ZFvX79/e3778B2YZZEY1yH2TiYFh6re//38
8eVPfrzpFjh2Ym0j+ZwC52tzK4tFHcjlIiqV0JCYo5Pk85fuxLwqfduPvTXg38qMGKsRMOyoZktS
Ph6avEq9DAoWBkLhvuCkUN2IIhFZ6aYvrWrbzOC9a7J//uZ7Ab98g+n/MfY5PRrzdGJc14OM+U+C
SaFGpDw1tRidcscPGUsZvyx/EFi06xY8oettswmuvyCnTrXdh/W0xt8BH92IpV7PxhmTbhfLroOO
wazVIXB8DBxoHXistgQmBpmtpq0legZxB2Pe3pe63e0xSSx1QjXlhTGc7GqxOS8dvsIW67HBHLJD
6H8Mur9vykDuTEQf9hnGuo9UphrlujbUckO8J+1vw1P5sONsAspzV1vTl3XzSqKXqHF4MisvpawO
IlMJp751MmVPgMA2HSIwjHxkV2m+VcZ40DVMtqAz93FPYQIqTMM/E/d/n1OEfwprMzfwiptCa/oL
9RlKZB4wx3RtHEKrOh0xQzcNbh+dOhSnpHQzPsEPs3Z0r1gYLcK/P/549w5kpBb1rbEl5zg5xDsm
+lQxi0iYZOOhP6mAsUjv2zcd2MOfcCui+bZNFtP8eHx7t0ERrrLH/6UqJ2gpynawTzX9Uutz8ToB
tbWzRtPGfUWc/GprouFRCOO0m2liahpNC7VNyjGU1HnLF8VulWU1GbzBgh+jOBst7uTGqkX+a13m
v6Yvj+9wH/75/J1RyOEkpYoOwyeZyNg7HRAOK31IuEs6AzUY5X1pXBlCiwE3eySKXWuy37UzWrmH
nZ/FLikW21czBjZnYBjMhbzCDF+QJ17m6R4DVy4n//ToLi6Tu7RF7tdTs5FrzSaKtCwa9147M3OW
b3z8/t0J94TG5pbq8QvGHfWmt0TB9IRDiHZC3i7AyKt4or8ywM6zki0whIZd09CwLkkmnSTyLgJn
0kzkGPvcRW8qjDCOVtreGOoobjcnNmcDYk00GAzNmGbo+EU+CSb3dnUi6msEq3jbAUlDUkfzOhDy
34zpbn29PJ2j0HE0b00/giQgsX88vQQ+Jlsurzenya4PKFXMp5goRYe6LdgYj6Z4JjDvoKvmuLSU
bJLPp5c/fkGG+vH57enrFVQ11fDTfubxzc0sNE+Z7QOZebtj3B3fJD4MY/02ZYNxidFr2ZjwUyzw
LLpLSTSbr2mfzOE+z2lKdivOPb//65fy7ZcYvzukGMEqYGltHJ1SZExQCuDP8t9myym0+W05DvTl
MbRqMGDuaaMI6QOrkA+Csx9xwQWBdrc+gfWYiWPo1T+hH46I6LcIRHRCeihKYVuR59R/gyeAe+1M
LVGXSr53oWG6NWjjcFhM57MKDoar/7L/zkHiy69erQNAYC3aAhx7cbkqt+f7yLsmAdAeM+MIr7cl
iFvegjQEkYy658L5tY9DPxvCTfeITbaXpjXyIaa6jA88i3iTQMhjZUtODeMHDLYRImhCtB7w6gGA
2K2/hwYZzLHYxMrBQRmNHJuHoicSp/X69m417Q/s8+Wk2xiXBHs6wl0HBON9YISzHERMEHMH545q
+jYKxDQic+ecSp6MO3/VYp9l+IM3cuiIQq9gAuMjny2Jei2t8WhU1WJ+4o2zPtf+G6ZXy95L1jAh
QFuIswRJHfHfMIzDBbw+8WmKenzoE+KkxifdXRMnh0Bo2EYYh0RUi59v4kIXa03H1x7Oh1w6Grpe
EACoPaAZ92dThH0HwVLW5l2wuaANwfZIgsAaWCoikDcdgdFCyb40IODQNr4hcH+eul9iecrn9y/c
K4tIbuY3pzap2BDMyT7PH/xc9yrKMcgRv8y3ogglU2pUmk8S2PZ1xvpuMdfL69n43bKIs1JjwiGM
o4oPgW4vtlWrMt7SRlSJvltfz0XGByXM5nfX1wvySQY255MwAPuuy1q3DRDd3HAvyz1FtJ3d3jp5
CHq46dDd9Wn8tm0erxY3jvyS6NlqTUwn8d282u55I3Ad2kOujjakKTphks9Tq5NUumfooRKF61kT
z7srYtygBgKrAloXdTuf0dGw3IeskHF2ldP9fBoM7OE5Z1TaYW18PrfRDpGL02p9exMuebeIT8SV
p4ODINKu77aV1Jxk0RFJObu+Xrqcs/cdziBEt7PryTruogj+5/H9Sr29f/z4+Wpy3XZBXD9Qg4H1
XL0g//MVNuPzd/zTHZ8GJVF2O/8/6p0u30xp8zrKbxn0GDH5bKqAT40RP/JARPIB2waOw5GgOfEU
B6vZPuSssYGMt4S5QI9t6HRchs0bDEmNGVxCFFsBkqpohWIHnZyY5E1U0TD33r1uRSq0g+sEgAkT
bgJ8YIThUVcqVGIihnvZJTXfNa52cknyA8JfifYaCWcWT/eaC2CBjiBXs8Xd8urv6fOPpyP89w9u
16eqlmgswdfdIYGh0w/sp55txvk2NCvF9Fmdnpw7+K2JRHePjLCJ8BWVRcK7RJvr0LcC2ewF6zQn
702MT6rjVkFXkka6UnMPsdmHoroUiTG9DRDU5b4A5ilSRZDCRAPzLa1HPHryHyS+1+zDHrYjOb7j
RCLz32jH2UD7bbJhAdSIoCtjyNr7cAphUC8feOKP4CDZJ3xbm4bzIoDeaUndh2IbNNYbsQ7aB4jk
55LanxorURONuiyaGv6gK6LZc6ZxAG0PZnHWpYaz2w2JALyv09OMcJDGntkaMveftlXGQd5NxlDH
ngdZf7UZ+yK7gVyDRIA2DbmUDWzrH08u0hpYc8qYjx/Pv//8gNtL26dc4YTyIlJ+/87+F4sMGw9N
TAs/JsABuCK4LRZxSWPxAkMT8INpHqptycbndeoTiagamnurAxkVaqpYdtetYCPp8SOb2WIW8mDv
C2UirhU0QjIz60zFpQ4cfWPRRvr5c2ShzrIFDZvuy600F5+JIOOiiM4dfq5ns1lQgKtwaS74PK0Y
nfu0iS71Bc7dolGC700d83BcMyW5fUWTBbrRZLzNJSIC+UgAExrhS1O9r8uamGtZCEjh6zWbGs4p
bC8OuuKjJR+9LYpzPFN5y8moOPGDEYeWTqM2ZbEIVsZvOZvECoWMUMGQ4f74wbGXhSgquMcdpwwW
sEFn3NsqdE8PhQ7KzdbrorYy04pmnrOgtgkY6/ZofrwGND9xI/oQchntewYsMemXv/GZIiaUD1l/
8QnYccHPUMJfLE6FiZw4JDb7TIV8+/pSaPxIjAWyOa+H08AJBdgSpz6Z7zN5IstEzi/2XX7GZNjs
pNto8yxquxdHN/WTg1Lr+c3pxKO6RMnjXM3Y3S6N4bhHdx2Qwja8NgHgh0Cki1OoiH8Qj5hlsHX+
pPiUX5isXNQH6QWtPOSeFde4AHYbvn29e+ACSroNQSuiKMm6yLPTsg14+ADuJiw4AVYfz6LTkGdq
3x8V13QR7PR6veRPYkTdzKBaXoDf6c9QNGTM7zVadut8KA3DcrtcXLiqTEktc36t5w81yQKCv2fX
gblKpciKC80VoukaG08TC+IFGL1erOcXLkz0h6+9TLh6HlhphxMbsIJWV5dFmfMHQ0H7roC5kRjf
DVhCjL/Q+rfxtIb14u6anqbziTsH0+5BJYoc6SZYbCJ5RfVYsNyRHqOGMnQKYPq8C1dLFzxLFhtV
eLpdYXKMsBU/SDTwS9UFvryShUaRlx34+6zcUL/4+0wsToEnl/ssyORAnSdZtCH0PRvJyO3IHnVY
OeHP7o0HWyhwTZ1fXBQ1tT2qV9fLC6u+lsjok/tVBMK0rGeLu0D8GEQ1Jb9V6vVsdXepE7AKhGYn
rEYv3ZpFaZHDlU+M4jXeTb6EwZSU8p6vssxAcoP/CE+oU35GAI62rvElSVErTyWi47v59YIzoyCl
qEpQ6btArmhAze4uTLTONVkbslLxLFQf0N7NZgFGHZHLS6epLmM0YfN94ntsYy4M8nlNDgv/L0zd
vqDnRVU95FLwNx8uj8CbaIxexEXgvlD7C514KMoKJBbClh7j9pRtvN07LdvI7b4hh6mFXChFS2Cu
PuAwMFSUDgSpajLW89Kp80BvAvjZ1pjeib/xAHvAKPeq4QIMOtUe1eeCRhu0kPZ4E1pwA8Hiklhr
H7DcyrsnLXFS4aOzo8kyGOsQTZokgbcCVVVht3cdBdK0w9xghr7xRfAIkPFnJpO2qRXmYm4JIjWZ
WizIvt8qdQU/zxhmoXYEKVgtQ6KKMLJTmPgEPdqaZkS0g71mwYPG+c1ytrw2UPe5PM5v4XoNtADY
9XK9nk3qWt/aMgRoFareuMYKpHjRNdvDrOhKK0hAbu+7PUbqiqsMzb1dWHZq/K+wj1ino3gIfAiI
4ai+u57NYtpqJ8F0QEfNYMHABgdnx8oAgQYHXt3v6ohoZufKIrdMv7swcXpF5kFPUNMnAdfByW9K
NOvrxWRqR3amb4LnCyznEehixxLQriAvwH0yXknBdnQDYvGJUzKgghNWlIq9ZpIKxYW53wqCm3g9
m4wqoYDlfB6/ur2AvwsMyUE1UmtJ+9qdbBs4JOY1/t9ZeSAmd37UHpCEVO7JaukDI9VEwjhoEyjs
w32h4Bj1EGjcSxYiAmFmYlhv1JnXHmsoxec/Xz6ev788/cfxwatiHQwzAbj2BP9zrQsZekdQ4fVL
VeUYRsOPNtKJSXpEgInE6NySAv0sSAjLq4o8FxkYWgAFHHcBX3rVGkcgCjKuQfb1pV/L8DXur21M
cYN3FY1mZ1AYCI71OkOkednDv1b9rbP99v7xy/vz16ervY76Z1dT/Onp69NXY06MmD6Kifj6+P3j
6Qf3DnzkOZEj5Ym3SRbgsqMAm+YEJGSefkfOJT/hwwJ/6e8/qUbv23AAYHQv4V3RMWZM77Y93ic6
cR5DcuZnm+jKB2WzUg2pPV8RdPXn44+vTr5JavxqCm3T+IwBhCUwi/AMiTjkaa2az2dITE7hVPDC
gCVR8Hchy4CmzJAcV6s7Xnll8TCanwIPEMVheniot+8/P4JWFqqo9jTILQKQ5WKtwgwyTTEWfkY8
Ey3GxtTfEXtei8kFcHCnnfWyGByYXjBL8PMbbIY/Hj2Tu65YiYlkAvGbLMmn8oGP6WDR8mDtVD2g
jQ7hDFDI5N0W2MmHqBQ1OSp6GPCN1c1NwCyOEq15k0+PiFMBjCTNLuK7cQ881c2FXiDN7UWa+Wx1
gSbpgn7Vq/XNecpstwtYmQ4keBtepjDmAfJCVU0sVssZH+3ZJVovZxemwi7YC9+Wrxdz/rQkNIsL
NLk43S5u7i4QxfzBOxJU9WzOP50NNIU8NoHDZ6DBCHOoj7/QXKdSujBxZZakSm+7PJgXamzKowC5
4QLVvri4otS9XgUeT8dVkM/bptzHWy8NwJTy1FxsEIWE1vfHn0xQg/mCFKf0cE4758LDn22l5wyo
FVn1f4xdSZfbNpf9K152L3LCQRy0yIICKQkuTiagEqs2OpXEnfi0y86xK/3F/77xAJAEiAcqizgl
3EsQE4EH4A3WmcqCHJ7QUEgzDse64v99jz8uRKmiB0l/M5OZJYQlW0aeKeSpX/t+NQpBjxCaGr+d
XGgy8gbiSsEhVkJwAk2POzQwMqxqz0G08Vo5Lui9lx4hCsf6rQ7rsfH1K9522oTZaTblPBtKtlEs
OFvYZ77Ic8AgT0WPGnJ2Klom+P+KLD16G/Fqx65osm4bxEc2jiNuUipxZ4+kGmced9vFWHggefs+
OCE7QGgCw/vClHIrxO6+MzZ0CxCXWGpJkVTSHYYCyfx0jB4Q+mmw7xMt4Obx0bCQLlQskA1qojCT
4HRmsFzkzhCjZXUFh8cDAvKmJEiJqQqg6ANuke3oeIavxTBQ1ERzpjTFSV40I5nLyFrdcEDbSoIH
PBrkQgJ3auZmZKnolZbiB1rq53PVni/YkJ0p5WGPdWzRVKTDqsIvw6E7DcVxxAYVS4IwRACQeVce
PWZs7D1xNmZGPw4eHYOJcWS0SP2fjQxOYe0aVAp8a6AoRzwlMFm05xU++xusc9GKra8n7s9CeziI
H/dIfXUqGOpuS5PUvCuGJukawzu/rjLMu4wMVWVsUo1E8AnQV4PtKMTE87xv8tS0bjHRoszybG+1
qIOuZzyMyBswIDCvklD4xuPMQ7kIQZuOhA6+whwuURiEuETr8CJcqDV5cEoJQZApafMkwExXLPZT
TnhThLvAVz7FOIUhdtNgEzln/WS05idYvvJcfHc3h50/i7LYB/HOVxVAE/wowKLBWjfgWyiTdy6a
np1xXVuTV1Wc4qNDfEJ1MS4SCkYZSbxy0mnC+hTpTglOXVdSz6dyFstU1eMYrakYdJ4HWcqesjT0
Nfbp0j7fbZkHfozCKPPVrsKP72xK5yuBnHlu1zwIsOtul7kS00yC2FGGYX43H7GnTJRiHAY2LAy9
Y1PMJEeIxE17zE7NYsof+DtoW41mLAzruYcsjHyvF3tUn28wq7VLfjvyZAxSX0vJvwewA7+Tlfxb
yEe+EnFwnhLHyXjj7N48Pc+wWN+WXN7oKXdS6KtgOYPj645Rfm/Iyr8pj8LY2wKMyC/6/gQimFEQ
4JsLl5fdKdnQCCLeBozWVVH6MLbVNoyHUYxpMNqk5uh995inyQ7HeM/SJMhGHH2ueBpFMT6an1eS
stUS3bnR62Xsqxf9wBKP6pX1GtpS7jm30ocMFB2eQ0N3jgG3TMTFDgmJPZ5DPwaxjx6V2s7S0ryS
D4XYVKWhyKXH2OKuoR1Cx2R2BZldrVOS+WJnuligP3fv4NzcilVred1H3EmsGPLnjebBLlonin9t
PxMqmfA8IpmMKG6l98UAZ8Dmra5KJ3Cug91bSbimB+ssSaWCf/ZV/tqeBSGLpEa5LLUfGAjGVqe2
zNoBXpyZRgOwRbK9b0wpt5YlSW65dJuQGp+LZrxqLmHwgJ+JzqRjk6/dg+vrUqz/Z5NL7FpFXWD8
+fLt5Te44HP87HFuaTY8YmsORDvd57ee2zpTyuRbJqPVqWXgQXBpCFaHzi0Q+/jt08tn95ZYb3pk
EFxixTRWQB4lAZp4K6t+AAsHGdyd6+iwCE95HbGG6gSFaZIExe2xEEm+02GTf4TTC+yS2CQRbZKI
F9oMVGyV0nTabALVWAy+8jdShML2ySarHaRfbSMotIkOQoihTTVT0BfJCLwlqidr1e6q1H3QPMrr
3fYdeJTnmD65Sap75unphs7eVtuvX36CNJGJHHfyRhy579aPQ+VrXJbRDDtQuZFo9Pc61/cMu4zW
IJwX0w/IUwqYsvVnwAhpx94pk0r2jkJGwpQyId+tp28T855taqIYMIdqKIvaY8KhWAfSpDHqKE4T
9Dz/nhcn7fgdxe9hsNmAidQd4CbpUFzKATREwjARwqFTWlCTv3jULnRuA3GLIVYe8X2p14dOpkPv
Ww4FeGSis3tZO3cULCA2ElA2bY91NW7XAWaM5zBOsN7v186YZ6dp1tS9zpHwoVaH5eux1oIDNvCT
bN9bSzVx7jUfJE+kLkrP7V/TjYXS8Ks9+wXJkAo0Psujp5bI2+OTJ5y2x166ddRepoV8umNUqyuS
qmO8O9+k2PQz29q/e+48hjHS267YfKBKSrrBwdeRdaFjpMtuEmWxZRwoXD+IBjWuA5Y0seg/VvUv
sz81mWqeWtfIRNP3qzg1OojX1jCmfUPhsLWsPcHLm4NWj1MXCMfCVJQ7XxHHCXOiDNArZL4GDaG5
0JQp36sLFGa8rSX5UOziEANOVVdWGABK3EjySPuzmKYsbc2+BytxXB2ede2TR8u5ufoCKmi/nGtV
h6nPSJ7F6T/Tndc0GoVAZ6eIPhDNaKnSV48PeMu2jysHrDIEuePKe8lHj8ylB3vUhkYMkxM5V3B3
AR1rjGUi/jODVsgEylZrt0619rmaCNeG8owa274bnEmJyvhmDLS9PHbcNk4DuMVPZchJvdI6HSEn
VFHLgMlwsKv0yCFaxtCNT+ucoFyMx/FzHzmb6YVY1WTt1nAGR1rXT85t6hTNwNlumF2uvsDhwsQK
3HVceZZ3dgdQKlc1zPRnDu7/ZOt2Quo/UXOnAKlSwUE0WWcnr33nyrSzoNozFCQ3F8+hhcC0r3zY
3GCz03TZPGmWQW2Kz398/fbp7c/X71aFhEhy6g50VSRI7MnRUoObkwu01VfvmN87bxnB6/nSpFpb
950op0j/8+v3tzuRHtT7aZjEuH7VjKf4TcyMjxt4U2YJriulYXBCsYXfmh6/npBfqbOtNkHmUWNQ
YOORDQTYUzri23758ctjNn+hlFWnmFYvXgqjLEn2/mYXeBrj+nEa3qf+sSwWoS1sdY+jwgqKb883
Rhhp3MAt8nP+8f3t4+u7X8H5vnZr/F+vYtx9/vHu4+uvH38HxeSfNesnsVsDf8f/vc6dgH9/z5oF
uBAT6amVLsnsSX4FrmIortA5iN3q+zMpHu1doFWnKPAPl6qpHrFNAGBrFZMp7SYD84gl4L2MUeB5
upNKcutCiwljK5qbGiENN/0oQdpsrKXcA/4j5vMvQugX0M9qznjRSuPOCY586dpRLSTyAnTSHptp
Wuze/hTPLzkaQ8POTSuz6di+1lZFSTErvx/WpIhOgKsxiwdxkpA7UGSS9kC47iyFgQNHiP7hHQPK
z63Xx8BCgRn/DsW3DJtL6Fz82LqmIBC8WKQhsQomKexq4KbmOyy+sYwZZ+1Ve8wUkglh3pBzmXGw
JX5YS7U65WZmkKPZtkQmf/4EjhTNaQGygCUck2JtjUTx0xuxr+W9pquVsWfTu1w5BPIRO0aw9X9Y
iZwGJM8/UcT14rxgegaYC/EHRE55efv6zV28eS+K+PW3/0UKKCoTJnl+kxKcJZ33eZwqQz+svazn
btq+Hwd7YrgzW2EPj40XoyXPoz62rpVciicg64r42OBHiCtat7Z8n4yPnBacy0xb2B4blaetkAet
3/CXsbvXcXoWwNgRwWeqs8TLqzAQYLBe0WhD+ihmQW7LwWvUaleNsTFMAlwCmCiH4okPBd0un9hl
DcPTI608za5p9VM7+lVk58rWQvCviwdPtLipXGID41MQn4tVtG3X3s2KVGUBIerwLc3EKqtWbEjv
vbKqH85wRHzvnVXTUM4Ol8ETQVDTTlVDW3o3N0qqu5z3Bev/RbsC4Uir2uP2fGJVV3q/9OzSDpRV
97uc05NbNBUVR0xz31++v/vr05ff3r59xvwJ+ijOhwAbSuNcZe5+tsvqMHG/HAnsjctCmIMtM2Wd
IEMDgF9wHTsgCSOTcbM90k8P0eGD7X5KzQf6gHS5/YMc2BM74uecEia4XZHE9ARkv18ZcgSzGNeo
QAqvL3/9JaRtKUcjYryqTFP2eG9KuLwWPa7hKGG4pLpTUlTKlgSK6q+r+hzylGWj80hTtc9hlPkL
9DjmCb6DkrCSdn1vhY3l0Q6LsdGSanUWy8lPGoXL2s22Pmbh6ppr1SA836iab+M6gXGI+qWU8JW2
4DfXac8rC1OyW1kkTcvmVtXm7Z5M/fjPXy9ffrfkeR1GSNqeLR+pMVgDbAhH44ordjX7JPak2tHr
FiSztAB1+jFPMm/78J6SKA8Ds+uR2qmP61i6tV59VK5hnvVRSfVKpzNkMqaHKtG6zzOnIdaToEwc
SMKTPF61jFIhylOnaSSQe04O1Chp8thj4Dfh+/0OHURIY82RR+814sYxkCQceO5RTFJtIxbSbuOT
6be+Jxm5F4zjPTZ9E6lSrMijDyK7oyRxtHbUY4RMxZrn8dO3t7/FNnw1nVjNczoN1angtlKTqnnn
+onWL0QznvI1g0ZeQ7i4mRaU8Kf/fNJb6+bl+9uquwRX7Ryl8WKH98lCKlm0y7GjEZMSXq1N9wJ5
jTYXCjvhjtmRWpi1Y59f/s9UmhEZ6n2+kIcbq2lUOlN3IutkqF+QmL1iQzle9YVhq0zaD6f3Ho5i
vEh5kHjKGhuKXjYQ+oDYC9zIQLxVj+9VPQlGvJBZHviA0Pe6vAowFWGbEmZmWAl7JMwSpAxcPlTM
tj0xkm8NT1cWuQhJ/MsLK87TFBG9r5/cnFX6VmBy8KkDVKyWcs5WsHFdBfFsVZrpXLXg4rN5mk1F
kOzg5AXcIMHKFqTGPDE9S65RECbLm6Z06KI0cPm6T1G+3aUWgh+wTxR2wKXqqfQ+fHr+8CHKfH4G
52KA5QS2tJuEJEJqVuzDJMBqBkrz2coNoI+EzZsWRSw1S2tPFRdILopteF/SAEgVtlnBhHjn2SVP
cIWJjb05cx6nSYiWJsvSfYy9VpZ0j80TE0N00i5MkEpKYB+4lQQgSjLrSNSAshgTugxG4ntdku8D
HNjnSDlYc4h3mfstnIrLqRKtRaL9Dvm0Jo0SbOgMPAlibN6Z3jnw/S5JsKrL0/YLO/TYYdRcl3K/
3yeGVZqKiWX/vD1SSytYJerD77Pt3Edp6b28CckD2yfNMZkOlF9OlwEz2HE4xriesTLbhTtPeo6l
N2EQhbZ6lAlhQ8RmpP6HMccaFsNcaU0gzDIU2AtJAH8dF/XbCoKlGOjrBJBGHiALfECCloPF2WYp
GMnSCCvFCJEZ2ykaB5b3Qw5O6NGpaaaEwV3OsWjC5Oyun25dmhJ8/Q4n7Ch9iSHW1xXE23RrJL0P
4o0Ebnu2MuVjjw7JkqXo7nLBQ7R1S3Bnx5oGzVMuW6JTMW0Vi4T2OE0eREvhKsm6wbNQyKBHt1Ty
WCQ6nrBsj1kSZwlmPDszGDmbilpzOhd7gQsvhMjjgqc6CXPWoEAUMLSBTkKOwa/QDQau9qngMz2n
YYwOBZokqIPKCYcrRBjRboHhzMhNfU92yJcsxvoQRhHyKUOceLGYY0VTy9LW9KcYSCk0YFuhWuAe
bQ0F4aKewRFSAGa8YzKiEB2sEoq2+koydgla7F2UYk0oAeSjA6nMFrFMJA1S/LzSIoVbK4hkpMii
BsDe9+Y4zFAx1qCk6CQigXjvAXaR531p6jlCsjh7zHjPLvUeafyG9HGAFZaTNEHEgKZqj1F4aMha
npkJQyYmghgdPI1H9WkhZHcJ230uCFvtIGCkt+smx4al2AeiqdjYbrC5pG48X2lz7xNt9vfaYZ9E
MbZHtxg7pF8VgNRBabQiDQHALkLq13KiTngog8M0pKYt4eL7wqRsk5FlSHEEILa5yFwMwD5Ahmbb
S2+8WDnkIfYem/N6rYa4fqBZRaQ2Zcsoxc6SLAZWowO4uz2iSwWEniXHY7+1XNOW9ZfhRnvWIwWm
Q5xE2HcsgDxIkeaiQ88SKzDtjLA6zcMYnf/qJkqCzfrLNQj9zBRwg9CCtT5+dSlxjq88esrHj4vt
CR01ojcoUZDhwoTCNtdGNZNicwAgu90Om2PFzjzNsWWmFw2CfYpNmqU7jn5S/ViJVW1r/fmQ7Nj7
MMgLdEHhPdsFu2h7AhKkJE6zrbXzQsq98hqBABEGjGVfCSEKK9RznXrd9WsKO3CPmcnMOPNwe3UQ
jGircwUe/+MWXCQTdDeB6J2uxf6mEtICMndWDQl3AbLACCAK8fVTQCkcFm7XsWFklzX/jnRnHVK0
Q7wpW4hdRJKOI2iOowKBxLHlQwJxigCcM/EVIkDTCGEI20+TMMrLPMzxKZtleYQ7j5w5omlzjyvG
ZQIuomDrkwACvv4IJI7uZM9JtrWg83NDEnTW4k0fBlsiuSSgI0oi2JGhQUCXCEjHD30Eknh8DU0U
iLZA+svdgwbBS/MUcwQwM3gYhWgxHnkeoTFIJsI1j7MsPrlVAyAPSyxTgPbh1sGDZETIploCaB9I
ZGsOEYRarDgcWfUVlLZ4NcRXd0ZODRRSoZC8+/jldVuLff5owMLkXxwD8YfA49sJhEfLLZFKAIfJ
OjDeCmC84BQ8njEXq5pqOFUtmNxDmbrjEY5tiqdbw34J1uTrQKUTMQhTYSvBToyyUjrlp+4R3Oz3
tytluMoY9sSxoINYOArcdRPyALhZUJ7w3JrZGeL4XEQcBl/38h8ctt7uVAwY6matqOuOFCsN+5lf
Vo/HofowPbfZWBCpUIZkcM646Ze3j5/fger768tn1IpCxquQBSJ14ZlEFIl15FZyhpVoGeKCGu+C
8c4rgYLXTF+BbubllJ6cNzPDG2HqumvBybnsjM6cUlZWHXNy212Lp852HD6Dyo5UmpvdqhY+C2yO
m+ngbliaEkJ+gQNLHb1J/+H68vbbn79//eNd/+3j26fXj1//fnt3+ioq8+XrShVierwfKp03jDun
x+YMfe6/WXfkSAPpU9oZeLWABHliOepAsecg3ZvZLTUpCw4+oXBdC3W7PD2HNLMOeuG+85nSAW7f
sXdKgPVb+epwsOjj5RV9csbhhCkex21SQT5cIOb9quoTWj4qf7+Am6OwqGkDRnPeJgNCFgahJ+Pq
QG5i17jT+epUeWaeV+uXsR7CNAlZy2PpLvI6Ut6TaLuq1WXoprogRaKHTLxk9Wqxxy8YqnBQHMXM
umancRBU7OBtFVqB0O1FRQ19heN5FkZH+cJXM1GnLJeRm8OJCZFbV9I1N8LfLA+Swnj9TPvo7Y80
2Kij6CwhyfheJtAs2gV2NYXUmdgpMrqO1gG1RxAgcXbIdMMsy+aHRmzn1/0FMq33m9eimKekAs6z
7LjOUSTvdTLyEASSfHZaXwzfqhdbsXh7+LZ0D6GNfOVtKcmCMPfi4BKjiJzvcVJP/OnXl+8ff18m
avLy7XdrqgevV2SzgCJnPNonA7ewHWP0sPIfg7qMPpCmQOkAOEWX4Xr+5+8vv719+vrFG6SnOZbT
Grs0CKSxJEHVIQCEW93QUFAAn/KTrus6o6LgUZ4FjvGbQZEuwwN7qynTy32Shc0V04GXWY99ZPra
XNLsmyZZH21SaMXiAGDWnLVerVI9nudU+0zWBatmE8kei+kZ90SsmHE0POSCRquGl4pII5KYRHZV
tcxgmRPN6U5VIDX1hIGZYOwoXIMrFSfZqCSE6K0brdr0URoZN0pnDqaljBJDlxHSRA59Xa7zV6Lo
h0sxPMyWtGj5656sjQ4szGsaPgvh6ygKHsqNnPn13xJLcvPF/5krB76v5Eb13/C8EYdmWi+kwcPo
mRYNFjplH6cwF+t+eF+0zzfSdL7Q38B5qJreY4wEsNRARG/CFzSxv/DZv/V61BVjuEvQezQNKx20
H05qvnNT832QuZOFSEYVg2Z0nyE57XOnrDyNU1+tAXTymYT6dU5i14E7GACwJ8dEfLz4sZZ82lVV
N1Gpa2a3/mJrYGXEKrI18zO6y9Jx5b9aAk1intPNSY4ZlUQennLRxfhcVRzGJHCXHzuDJ0ZQRysA
Wm51i9Jp6bqP9zvfRAhqlbnTzSLLutnonqIWsjV20NKzNAwSa4grcw78PGpyFmu1I2b/saTv8WuL
iZDvUHWuqVLKNOWH87o8dT5Lmb4Pt18nCJE/zoYiiWkixo+i+bXeBfFG3wsCRN3eGqHXOoyyeHUM
IXu2iZM4dhpx2zGepEiB2wv7DdekeDPQ567dEkzEjnwXOEsv7NPDrZVXH5X+cNNceUGZ+Sxp0259
liMnm58tCXR+2L0+nZOU6igGqMC7j13NQVsJIYDPsYv00Niyi2Wyv3DglFAeEi6sV5cl1pUTjF/z
eMIEYdHBFpeFVBCe5+ZFjwGVSWwvAwam+7ouO3x8u1QhSYCxwD22FN+3i7wSrRfEENbd7po03pGX
ukZtOClCp7IVJcTefixasWVJEqyr145WFoT+P2XX0ty2rqT38yu0mptTM7fCN6mpuguKpCQe8xWC
kulsVD6OkriOY6ds51Yyv37QACkCYDedWbhK7q8BAo0G0Hh1s2LtolEfNB6+4rVjLGcY/kO0PAJx
8LYV1+3x9wU6E/oOUGeJIrxmcPsAj+Wn8wRhgBUf7CY+cGN1FjcAvDWRKgrUdx46ZFhPBkhM4QYX
enxr8hB9arT23sqBG38OLpUminy85tw8wxVTvgmiED+ikDUhK3jb6vnL3aQ5RpGFt4OA1CtiBrS2
cNk117iTjonjAwSFAO8vv8MHMQSOVISuibeNWbMBNxRNboSS6fKKilZ9SSyt0re4Og+PVKGyDCYv
mrw8orewJxZW7GCj1sIzgOspdoDGDNCYpO2HNBtgjou3tjTrdLf+Joq+hzaZIrQ/CMx2HfLThuk3
ofPHxBiLZ6G1upgglHYV8Sbf4A4LWnJJkgyrFc16ysBdGyAws9aob13JM+DqqYpCnmJRG1mzwyZt
j8K3IMuKLJlvQpbnT/e3o/30+uu7Hqd2KGBcwobVW2WUQeVO3ZEqbZrv8g48PKscxrfaGJ46vymO
tKWzGH1BYLkYrOKpIsp2cc0wE89YkmOeZrWx5yfFVYtnJYVqGKbHzdj6w9vrT+cnr7h//PFz9fQd
bFhl31TmfPQKRfMnmm4zK3Ro7Iw3tuo4RMJxeryYu8o2PEDS2C3zSgyH1Y5wjSw+sC1itofoyaeE
/8IWkZLtugIftYqxjtVW0T7FWeQkC1MHL0IFWS60FZKZyC29/3L/evuw6o5zgUPrlFpcZ6BUWacT
+NzNRRk3vKuxf9mBcibIQYhTBZttQpSYbARTVh4gwlQCp/mnomYMApbqXzkUmdJYQ92Q0qvd97Lz
Lqs6uET8fP/wen4+f1rdvvCCPJzvXuH36+ofWwGsvqmJ/zGXOfgnoHui0J/NYesYC9iJjmiwoJdZ
WTcMTVGKWxPaQk+roVLp28e7+4eH2+dfyMGDHI+6LhaOVuT1hR+f7p94T757Ag8I/736/vx0d355
AWdoEKf72/1PLQvZO7pjfEhV5+MDOY1Dz531Tk5eR+qt1gvZ5oZlP6NnEM7ZT1C6Y5m5l6xxPX2a
l0DCXBe9mTbCvuv5WDLfLVwHf200lKQ4uo4V54nj4tOdZDvwCroebl9LDj6lhiG22phg9bHHMKg1
TsjKZiY3cFF92nTbk8SmSyW/1cLSRVTKLoxmm7M4DvxhX210F6WyT+M3mQUfb+FMHRmGOdmdD8IA
BKgfgQmPPAdPyAEwIRakv+ki9G3PBfWDuXpwcoDvJEn8ilmGkyRdW4so4JUKwnmhuYBD/JKbivez
3gUrztBDxDciphiMrtz4tjfvhED253322ISW5czF0l070UJLdddreAJvFh2owewbnGrPlOTY9K4j
er+iaKC/t5p6I1ob2mGPdPPe8SPz2b86L6OafX5c+IwTmoUW5MhHFT7E+0GIcrueO6+CAIhnPhOH
T7jxGTnWbrReGsXiqyhCjyWG1tqzyLGsmVkziUoR3/03Pvj8+/zt/Pi6At/DmkEzDJpNGniWay+N
v5LHXGNqX59/aZrt3kuWuyfOwwdC2CgdCzMb8ULf2bPZaErmIMMupe3q9ccjtyRmdQQDHZ6I2OYj
tDHsh5FUzuv3L3dnPqU/np/Aj/j54buStdkYoas+CRgGHd8J1zN1MyJJDnXuhOPZ1HJwW5Iuiqx6
k5sFnOpmYrpZ0h0qsTKQ4vrx8vr07f5/z2DZCYEgtq9IAY6VG2rrX2EDa0MEJ6LWThe2yFFfOc5A
7Wxn9oFQu0pu4OsoQo9EVa4s9kP1JescDHGw7BzzPoeB4qecJpNLZu8Eys6kgdmu5jdGRT90tkWd
OSlsfeJYDmau6Uy+9mJIxzwtrKlWwr7gCX22hIbImnnAE89jkUWc3aqM0LWJN8VzXbHxByUq4zax
LPTYYMbk4FUTGNGkQykcqtoZyPM3isgn0jc1K4paFvDsOqIoh3htWYTas9yx/RCvX96tbZfU+jYy
vMTjje9adrvFv/2htFOby1B/Wj3j2FizEKljpA5kJFOHuJfzChbu22e+PudJLotVcZD38sotnNvn
T6t3L7evfNy9fz3/sfqssGpLbdZtrGiNWbQDGhjOMCT5aK2tn2QijqrBKAdiwA3Vn/r6XFJtnQg9
q59co+p1urv96+G8+q8VX3PzWfQVAl7ptVN3CNr+Si/FON4mTpoa5cuhE6paLYpSRZEX4quxCdf6
uNw1OG7+yX6vAbhN6eEW/AVVzyTEVzvXdnTSx4I3k/qobSKujYr6e9tz5q3Dx9HIbJxNYOlH1Bfe
NR6uXWnpJeWYaxTMkhb6YntsNstSz7jGNJoDByAeM2b36i0hwTl0+9TWJoIJko3gmlWVX8DsWJk0
HjrHrDmNkkpiaFZaNi4pKa6R6vGt+CTj852lZ54yd1YrcMcbm6WQUgztsWeBknard7/Tk1jDrRBT
Z4DWzyrqhJaFEZ2ZHoEioocpQ99NzRRF4IURvjCZ6ufhp7ViE7LvAgu9rDb0Kh/pVa5vKFOab0Dg
IqAxQk5m5BDIZtsPdPwKwMCwpgs71NXosVky00fob65q/skWSR0+y5l76kD1bHOr/WNq87kOtlvr
dHyiB6qTDIMxqTTQFSNzpJEFd2yU6iKjkrhJJ9dhEC79XfX0/Pp1FX87P9/f3T6+v3p6Pt8+rrpJ
id8nYopIuyNZMq4IfPlp6G7d+uJV54wIp2ZauTZJ6fq2oeXFLu1c18x0oPp6BsWOTzZmQ0F3sIzB
Oj5EvuPoWUraidcP44WNYmMYh4ztS6/PWbrc7fVOukZfrg8KGllmXxcDj2Mx7Wv6TPif/88idAlc
VqHGCTEDe+7FXBg395W8V0+PD78GM+p9UxS6LnACNiPw2vGxcjb5KaB+A0+uZLNkPDMZY6ytPj89
S3NgZpu46/7mz9kYV232Dr4YuMCUtcbBxuxZguaYow9clPEs+jMCJ1teosawCEtg11R+Fu2Kme5z
Ym90k7jbcGvfnY8VQeD/1Il5zxfk/tFQO1gqODNtjLdryzUKta/bA3Njo++wpO6czBTTPiuyah4U
IXn69u3pUbyVfP58e3devcsq33Ic+483YrWNo6xFG9yNo24ckfa+fqIzP74RX909337/en/3gsVT
jncNUoTjLj7FasDCgSCO63bNQT+qA5Bd5x2EH6mxyF+p6oWZ/3NKGz5M9ZfIfjom3E+WZgpBZVmx
hfNlHbsq2RDxD0vDv1Wy7tTVTV3Uu5tTm221B9fAuRWnvOibYIULYiGe+OotPW3ztoQwY7NaJVmi
0xgXymW6hOucw9bmig8H+G4cpJJhD7lhoFryA53lhR14+ldEoLq+EftE66g3q6fBpjcvxWs+VTY5
7balEp9+2tNUyPpX2zjNiDAtAMdlSgXVA7iqD8cspvF8TXhbAfC4y/C7TwLk+kKD5fVuS5iOHN6V
sU/sa4g6MfxmBGDlLt45C2k/9PiLdcA2dbJHz7851sQQc+0y7b18f7j9tWpuH88PWjsZiJrDps3T
naHLItcJ0TKfBrzN8/2nL2dDeeWdlbznP/ow0pYuKpo26ghH560mzroqPuZaKFCFvPjwH/iSvOWD
/ulDRlzmFwqwqXuxnU1yFNkuTjCfoqIovbw8BNep+EDFMKnWLYQSEyPNCd4sXxlcEJVmiI88SH77
fPvtvPrrx+fPvE+ml044pNny2aRMwRXklA+nVXWXb29Ukiq3cQgTAxpSGciU/23zomizRNl6G4Ck
bm548ngG5GW8yzZFridhNwzPCwA0LwDUvKaSb0C8Wb6rTlmV5jE2XI9frFVnZVu4LLLN2jZLT+oF
hC3M8Mlho3+fL3OyYVrR5gsOdXkhStXl1W5mFWht9XUMbohYASAvoZCopnG0KfEdJ0h4s8laB18X
cjhuE0NifI62MbdpHOLjLNOrXnm6VxsQ0A5zhMMB8MYg41pqjWen4u2gkYsMpkpVqs2PJJaHhJt1
jhVZZPkhviEODUnHtoCP0rMUCLK7sQnfTRKlIIZv+AMSH7lSk2hOqgMVCBbkmtW8p+T4hQWOX920
+HjGMTcl5jv4ZF2nNfGaAeAuChyyoh2fPPg4RwqPCPQmFJ/MNOH2Rl6R4hOh3EnZwos0UsE2fHbv
Ow/35wtZj97cVT0fnq3oA0fG9a2qy8xQflgTO0SQAlG60MYPTtHRX4wkm9u7vx/uv3x95avpIknH
S5WInc9RecMQblfmCXabdhMnV0W+23ca4zRMTvhVlzrqdtiEzF9ZTZhxH32GD++iv+GI/k5lwoQD
b1SmE4+4YXyNu5WZuFjMlyMxVqvxqTxSNA5FUWBEh9DAEB+3Jq6F6B2aYAPXinEZCBDfiVeYmsj3
qRAZClMYYQepSqVGZwJIciLys5L/kcsxLBpMlJs0sK0QlX+b9ElVYYmGt2zqFZI3OsWYxz4tlUu9
3Cat9f/AtzZfo5a8K6OAmFFVMShYUhw6x4wtNRRvthof82b1QUR6U/89wXVW/S6oTgd/Rby75spy
mVWqA7hKPHJUn8oBqUnKGeGUFamWiyDmWbL2I52elnFW7fgwPM+nja9LPsfrxD/j5ErPASinvGoO
nX7bm8mqwUpcJ5Z5n7UAzYstidM1mYl8aooDLyY+o458QjqI0oqKaheQjRLFPcxGKfuX6+i5ji8I
+IQBN8eJvJu2Tk76VgSQj1m7qVkm4C3qkFdjyqvOEK3xBvNCGhOZH0y64nSMizyltj6GFj+x3eaw
NVOz7MMB/DpREiybg2fZp0OsxlMWOXJrLzNlmh7K8kbn46vFutFJZdfER5PEhJNho2xtHhengx34
6N2dqXyGUvHGK+PK6T1T2XKz+nFqRxE+8srCw6HcEkxek5B47ns+4bcTcJbvCdcSAu7yvCd8XF5g
sc7BN0sE0yGKiAs4I+wsw+4CfE04gAXsY+e6lNtUjm+6KMRnM6HUsWVb+FVbAZc55WxDjED9zS7D
1wQiNfMc4vxxgAPCzJOw7y/IRDryEVfkaZ6u39KlT+O2iBcaZSc8yZJwEd8sJpfZE46wx+xpWGZP
43y+JYJ1iFmAxrJkX7u4PyeA8yrNd7RIJbwgc8mQ/vlmDnTLj1nQHHzes60rWrUGfCGDitkuYXFO
+MIHmL126U4HcEDD2zKi3ENzdJ8yejACkB6F+DrEnq2OTHxBqYRfnKin5TIy0EW4qtud7SyUoagL
WjmLPvACj3gIJq2JjPFlI+G5WBpAMfHuDuCqdHx6vGuSfk94yQWbLW+6nFg2C7zMXLreHF3TXxYo
8U5cztFEAFsB5iy0bHp6ZXWVJ8d8syDXpU0IYUnlcUQtyhX8jVlSbAPUjB49jr1D+bzn6E25NaYj
sXTfp/8UN8a1S+Cir8RSYdH1xSXVfxhJ+EpBvATjYv2YTY5TpSAT3dQBP1djHHDd2jftvxo8ydGT
kcDLFHxg/Q6P+/NNrjar6pwyN+OulF669OpsklI4EM0ddrre56wrsta0FtOM5btKbIlztlljsKdk
eA0FJ/nb5/P55e724bxKmsPl3uVwIDyxDu8KkST/o3iMHSq3ZQW36FqkJQBhcT6zbweo/EDr/yXj
A1/uYlsM2jdYTny8SfMt9fmMF+2NjPkaapsXeN7ZUGc07z45Uk0NLHnZi5odtEdri02lZgHqsM8D
xwanObNFpPwAbVEIXHqFk+fLRXY0+6TBXnZX3HBNjgz3pDaysXqL5icVsSvv756fxNvT56dH2Eng
JD5A85TDgyZ1/2+Uye+nMoU8eASWEsIxYa7CqUwpwluSfKMemWi3bXax2QYf+1OXYluGF+E7fESA
300+nrAnfJhOUKfx4wiSrMOT5KIzjtP4cDp0eYHUGDBuQjk0YoRNU9HQsjEtk1hgE/6eVDbzBZ2G
2XZ02l8vj6AjH+Wl68J45dk2GpthYvBUXygK3fc9lB7oAbJVBI2POzH4rurOQqH7foRmWSR+gMZ1
Hjk2qQOHF/NMN92JJfWcPnokFcqDwMz1CxdRCwkgH5LAfNfiAqFRGTQORCawOC08tBwc8G0SwNVW
gmR2AV56DoVLwgcOF9ERoAc+lScemVRlIGoX2uaDNRXt+1lvmHO5tnorTQU8tEsLBI3WcmGAp+JY
nhAEyumxTNM4dOwlufI5HmlD2Omm1DZjoY21BKc7eM0yFrnoUbLK4CADg6RTLbHrymBh8Sgn26o+
tVeu5S59voz7dWRF6LAgMNcP0aAuKo9vITIRSBCSGa/Rt9v6t0NkIBgRvAdKdI1oiiwPBrAyWtvB
6TpJh/s2yzyDE5k5Ezf47SBCehUAYbQmAbwqAlz3JEDpBsBRQLlDVLhcCxPHACzkzhU6opw0Kmy+
bTkxkYVvOz/fyIGrLtox2oJPRIiQ284PbHSEBQQPLzRakLuu0F87XpB8V8Ypa2gEbzv5VJavwJoi
3+aYjTdwjMb4DG23g534lvlFrjYYKx2XuK6s8gQW7YVU4fP8YKnDsi528XEYEPJEQTLkfMGGWI9d
zBzfRy04AREOvFWekApCqPIsTpWcw3Qoq0Lhwv7ihQcPYz1xcIMOGUGFkxd7jX55G68jPOTfyDF5
TkFynkBcfy8Mrt2jjToxOL33pvpM3G8IS/KlSW8TF5gunMyNHSekt+Ekk7RY3mby0WhuA4fwLoNN
+9dl5NvIqAF0BzXeBbL0LWCI8CxDGxn1gI6NksKhDWqRCGSpJwODR3zKCGqnIkuWlvC+g5jfQI/Q
/s2RyJop1pxpbVFyXpvPhBEW9J2+xkAVbo3H/1MZ8FZZR6jF/lFsC6yDZmHjc7RiQn+p4wuvm2jL
S3+cy0kDzCSo4gO3YtFyA+R7S2Ks5KEonmvkoAKW0BsjdxNDnPl4WV5FA5ezrlkMQViIa3067xFl
HZ+WaDsmWo3kfA53HNDNkAnWgV480JU72HmKXUbb6zeOL28jCHbY5zGSaM8WtGSXbXCFOJYOXJjW
+yQ/wd1dXnZ5fXi6ggA44gIRyOChr2tzfDcQGA5Fk58o96jAwH9W1AUpwOM22Z/2MTvtk9T4OpFC
3kcQkgImqKrptg7ozddfL/d3tw+r4vYX/h6pqhuRYZ9k+ZGsAJQd8QA7yHvhS0Y2cbrL8AOZ7qYh
nG5BwrbmTSbfGSECKY2YChApo6gT/I4pAzP0EOPeMHlK8cZo2FLk/79n6XtIsto/vbyukult1yz6
GySeeYUEIkv3VHQPiPC2IXaERWHybXlawMeLqSRDsgkpHyocPQrfn/wXyXHghc8DLn7UUwd84AOv
3DQIAGnPPqjDoKhHzfb5JqbDnJRigxz7RlZC0M0r3dmIpElxz4aT8vzt6fkXe72/+xvzZTikPVQs
3manNgNv8oqTENa0tVQfpVZsoPyaf4HWi3l5RXMSL5AuTH+WOR+wq5Mb4abehbH119jOaZVdw5Cl
XK+C/+TFXowm/ZBOlVWQ8lDwL9VFrZ2YCYZNC3cwq4xz7a/hNV+1y+YjO9y7RQYdkQN291XniPU3
YhrE3MDzY6PU4gqyhREdo+aXy8oGMdAdtlzIFurKTMCmy3BBBL/f868O1FlkFAES84MsAgQu8WZJ
gOxjOjCgvub8fyCaXuiH9s6ONTcV8oLKTZTd72cpB/pi8YEncM2iXOJY6BnKu+BUVpdgWUYp0Avm
ApqiVuifh1MAa97a47Ge56CvAaT2mZfCBbVLYnDQbVKLxF8b606pN6SD/IuG+j8NBao7Lb69zEeJ
K2R0OnEI+tfD/ePf7+w/xDTd7jar4TL8j0d478m+n+/ggTzYTENPXb3j/5y6fV7tyj9m3XYD4ZHx
6xCyOEWfGOGiDJg3yEwYEN+DzhPCAkYbUidkjJ5ZGHiJIXF4BMB2pWusyy/S657vv3zRpg2ZFx/z
dtrFVZU83LU2vzOiNR8r9zVmdWhsZZeSWewzbrZssvjNTC535MmsEnpoHVnipMuPeXdjCnSAhzAd
GDQGlxaNIYR6//0VPHK8rF6lZCf9q86v0q8yvJv/fP9l9Q4a4PX2+cv5da58F1G3ccVy43IPWk/h
a32mbiPcxFy1aL0b2aqsSzPcOjaygyNw7CK1LlnhBPkiuzhJMggUmRcg7aET8355+/eP7yCV/2Ps
yZrb1nn9K5k83TvTfk3sOHEe+kAttlVriyg5dl80burTek4SZ+JkvtP76y9AihIX0DkvTQ2AFHcC
IJbj4XF3dnzZ7R5+G8/6NIUmO8G/OXBdObUZ44iFLZyKaOLOw6rRHP4Fyok5X9UheqeagCy8vLqe
Xk5djMVuIGgRAhu4oYHK4+j89e3h4lwnAGQNgptZqgNapfqeI4nDG2q4fAVMlBppAJztleuxtuWR
EC6DWZ9V2oajmb6+wXqEtVb0RlUrQ8BAERa/77CpirjPlPdkY1gQTL7HfGw2TGLi4vstVWI91YPT
KHjEL8f6tWXC2xC2WVNt7J4qClJ1pBFc6/YSCt5zIRYcsz3fGmkkBoSTkEZH3dKWqSYNmYymo6j4
JJSmHU7hhKeXIzIiuEkxIkuvAUMmBurwZTjr9KsUAuNqEgMvcGMyp6dBcu2rd0ogsqvL2sg1Y8DN
VMQKF9yNR0sX3KcTcSpTyQcdBAeG/PaCUb2dZfgEf3KCK1jadDaqgWAyvaRqx6KecDuKJM7GF+QD
b1/HCgiI9YzwMbksKkzfc2r+eASbb6oOCgyC6z0odGOoPwM9Rrn+8ICJOAgvI3cGYZWMjMjURldv
Q2JTSwyIg8iFueXWGBJQta983L4Bc/pkNc4ZpjArKEco7XwZGXmvBvhEj+Olwydjaj7wpJpO2hnL
ktSTqmigvPFE5x9IRldkVPOewEr5a8AnLpzXy8ubmk2Jg/FqWlMjgPAxURPCJ8TlkPHsenRFLtXg
7mp6QWY8UlNbTsILcm/hiji9cf2phdQKkLZXauEcnj8j7/rBspnV8L/TB0KftavXVvMdMFKv9HaJ
MMs08hp6vI4eZjveaZiVQskwKhlzY3igg520sjZqGPIiLliex6n5ZZFZeIAwTFjEYBbngBtmVwqz
CcBMF7kyXGAl5MyU6dqL62w5v2/yu6xso9Ki66iEz/UCv9pm80xz/hsQWl/u8Wuh5enaQfU2K0I6
PfuCN61RLwcGTQL6kQ8f97vnN2PBML7Jw7b29xjgyLA5YiLAg2bm5r4R9c0SK0f8vYBTunxZjxG1
SUDarFjFXRwXX8OQTIXFIkMESRIQG0tOfEHABSvti5ik04X2AKnoPeZAaEPbrKOElymj219iPBxq
REzVWINGI8mMfhkAXIl7eR7nSXVHVwa9iLOOwq6Y+Z4cMGdWXIWFJ5SH+HCYKDcJLw3IjbR6U1RQ
NdzzZATYbHbteTLEY0G50HoJsIY4p0MdraKS2rWrRcHrNinqVA/+hkDrp6jZhhnZnSRoxQ0lugTi
cc6717cunFKvVUcr9ePhr7ezxZ+X3evn1dmv993xjXxF3JRxtSLX40e1qObMq3gTNLoTcs3gDNZO
cTisYt2dXf62z/oeKnUeYk8m3+N2GXwdXVxNT5CBUKJTXgzd64izhIcnZ7qjSzj7N2S4Ygkyk2g6
mkycLiOw1QMFdfCl/IvCvxnvhGc3dqw5c5RlKHTnVGXPP18P+59GkLkONFQx5y36DAQFqU1r8gSO
NF4yLSJgN9e24sUAt6wMekvZ4VsdCX6sKigds6KQ+janbsMAcwAWZcDMRy2FK4t70qNe4St2TxVb
JUGFSu4TJWVEt6gtFxuqi7YC3yGgzVf6dt9nbkc5Od5dRAAZoHJ7/Hv3RkUXtDDa+kriNMJ6fDq5
ZRna8bF63F3qCcB0n8B+pCw/yiwBnoUn42s9/PV6ej1kRhxYw+H2A/YMmFv6uZOFcbWI6EsNcdCY
Kk5jz/WAnnCl581WhMRp51lD3zuM4+pjZV3QLnkCT32c7LU8S6D3qR5vOIwCpvOqgO0+OYyeAFZB
Y0F4FiQFJ4HwJ7Mq5VkBMrRhwzVrviU1cIInuqhIahakHluEeYmBIMJlXGOiapJkUQq1Le3yBciT
E4jxpqqaYn54nPMChnQRsdJwiMLXmGXJhKMkvaYkq48vN/HK5/XaiQN5Dbtj1K68O17SwTWfFrRL
kSRYBTU9OmUo5RnxhEt697CMN3ALdOtCZ5U7zJ3HbEFZEgR1W82WSUrPgKJawDB6dhlszzAr6V0E
vCkTDsanFpJknG+u/VMCJeG6q05Vgqob8coOQwq0eZ2AuEE/+4NYprae52tDxuXIc/B0C8AzKBJb
eQKZdg+jGRzeAMmt7LcWWZm5mXttEripgd/0TEH3tbDx2oxoFMSwqJnM5CuHxgt0JjNtmZSawBku
4HqP+6qMs1ziCurktClgwlGOfSIK10FG3Z+DfsMEdHlph3o6cFqeqAXfJOrCKbYMImHF1r8L0myi
8nKToZlP0ohaAka/2SoiwSmTgYwUhTzvFvrrU48Sry5PBrjhARzNfXDTYW/AdcDygt4gars21Qzu
VnqGFXIs2a+2KKt4nnhiQyrieekx2FZfqooxMPp1/UE9bA6M0dzDvC0wyFmYajp2+IERq4GHXDZa
il1FiL7+wPzGhoSSFXlXiS4UdFBhhns1pVXgGhlPJuMr2k3LovLELTKprmjxViMKozC+8YTy0clE
2PfWE2VAI7SMRIb7+p6XSW5bDEp58/Hw8PcZP7y/PuxcrSBUyivYqVMjJCJA41VNQIM06qGDES71
BVUIDXKCwjBeKEMP59dpAIOC4mITGIVGe9SVvPfuGVNonAnkWbn9tROv9Gfc9SH/iFQ7lsWXiK0v
H1t3T4e3HaaSJdW3cVbUMb6rkqI9UVhW+vJ0/EU8cZQZ1wR18VMcbpr2W8ByblMJReUcLV38GAQY
Om+Bl8oXuvlGM7VzAKP6IcPojBaHgfgf/uf4tns6K57Pwt/7l//Fd/6H/V8wF5Fp78ueHg+/AIwh
EPSxVXI0gZaBRF8P258PhydfQRIvCPJ1+WUIsXB3eE3ufJV8RCqtRP6TrX0VODiBjJ/FKkz3bzuJ
Dd73j2hW0g8SUdW/LyRK3b1vH6H73vEh8f2tg7b9/avcev+4f/7HqUgJV1K5vgobcvlQhXtbkH+1
UAamCCXWWRXf9dpx+fNsfgDC54OVskIigXNaKcv/Io/ijDYs0anLuBKBIfLQUIcbJHjfcri7PqgK
DcR4CdelLh1q1TDOQRq1+0MY4w6ddwWljiReI4erNBTxP28Ph+fu2YaqUZK3bF2OyPipHX7GGdyy
hrjaYbxyWIfvxbbx1S3l/tyRwTU+HuvauwF+c3N9Oya+LFDTK1rLPdDYthM2SVnnmPXZ37Sqnt7e
jBnRAp5NJuTjYodX3gdOrwDRB2agkTX8Ox4ZA57BBVPR7xGJZw7y2pPlGKQFyyFCrbB7TdyAH7YB
EYIcRwEEdr2hRVIsdE+x/ohJ7vj1yAwRjOC0xECoHvlpIDglVSKVMN81+UNpvVTdiSwhmoa+51si
ZEbwyUULzuPQ99xJiTFhpTa+/3JQoPdRDc2nLXG7EJ9JWYSGA3sV87hGl5u6KtLUtMiUuKAKM14H
+Cv0pIyQhOjKu+Ghyb9L+4XFBnifH0dx5A79VnGzUMVqexHNMwSTXwvCrF0WOUPCkU2lJmKxacs1
a0fTPGsXPNEkRgOFVRjrAJDyAMEWxI6zRzc3Zof6mvF0DpmhoUkiuACS/JulAFAzHxpvAfDT7/QB
OEualWO7e0XTkO0zHLdPh+f92+GVCmt0ikybSOZ1y7pyvqw/Pyi2Oo+qwuOA1j9NqAuJadZ1ysZQ
/2mfBB0QNcw8Ypr+vAtt3cbIDPeWiov7s7fX7cP++Ze743ith4GuM6kJAIlfrhTt/UWh0OqSmkGk
kMF4jfqAS61AWAUIL1LtFtZwvX0yiZ3VlXF9y0VZL/TlomAfKH2A4AM9KFDMa8pXrEdzz5czTr+a
Dk2rKfuDHj2c7Mob0Z21oVZ8yKK1eTHFEQHzUpSmvtQbdTRNMp9PIja2Cl0lXi8yN0hgaFgKWyuo
nv9NtkimQdmjObI4SXQzl5CFi7i9L6qoM3nWP9CFoYZlAhcSqzj5BgY4EC+ZpvWA+37UzrjFWCCo
XbO6pioB/LjVd2EHgMOOY+aiMHVRPA6bSlpnD5gru5Yrfy1XJ2qxHpQFbCmUozKNUL9jvgWR4fmC
v712zvC9LBBDbl6ACQwt4Gb0yvjmR639KJD0Rz4chjK3keraq2VLhr4rCDWKPQ66JCLI1/G8G83h
IlU0VQOsJYMx3LSOdYxF7QyghQfJIia9RYePxTOMsG5kXMqTVPZ7mL7ZSPZWf69CEK9ZTQ9QV0Iu
5aFuBdYHyaxSW2y+auUo6oMvSwrzBHm9J8KO06k5LLKyQo8FMmQ8jqh+D/q2BCqizP0jIdLTsi1K
vWUJsBwINuwzUABFrenGg5+hnUlYbcquIxS4ZencTPHExVTS48btvFqRDUgkQIirRrXMNeXqUHdN
UWt2a+InmtMIHZM4qVFLrHF7GPi/I7tnVW70WYKtE0UC6yrWbt+7WVa3K81EVgI0s15RKqy1SWNN
Xcy4eexJmLmOoPNWdoMQQLQUJW2VyNVfwESkbGPUPcBg10UJphRr4Y/+LYqEpfdM5ARLrRdNt0yS
R/Ga/GAWw3gUZW+vFG4ffu/MtF5cHLjkRdlRS/LoM7B1X6JVJO5K56pMeHF7fX1hHRbfijTxvFh/
hxKe87eJZs7RrJpEN0NqUAr+ZcbqL/Ea/81ruqEzcXJpW5JDOQOysknwt7KCQnObks3jr1fjGwqf
FKiuBUns6/n+eJhOJ7efL88pwqaeTfU1IFpNr6q8VstVE/Gpa0BHVvc6R3dybKQIc9y9/zyc/UWN
GZH8Q4CW9nupjkQxVN+KAohDh0HzE3RutasLF0kaVTF1RMvCSSTjTuD1o9vBLeMq1yfMklnqrHR+
Uie8RFg316KZw8EW6BV0INEZbSHF2SxqwwqECeMlC/8M86ckQXe0+3rQhA6vB/lar58kFbqsqxtZ
nWaRc0V3IFgCxEiymUMfi6uFXnsL63Pwu0wbiwWKnfUpQL71GVinr92lbzObD1GQ7pq4cOD3cP8B
ajYz77ABj9aLkuEhGiTJOEiQzPQa68v7OHNJoLEXwAXgJc3dWr6nCa2Wk+j0O+WLLnEV+um6NVZN
kNDvtF2zRFLIvMipPaqTwP1c2Hypjkebzw+/M2MrkJqtbgxnepA4zLjaIhXL9OUgf0umyki31CEs
f2N+1zC+8FwlqxMiQJbkcAL4ZIDMX3BR+nF3+frK11HAXVtLvwM5utXq1PelxQYtQm/4iv54Y20y
+VtunKE9zczxDImrwj0xOtgJSaQncbaOS/I9oR/CgaUE2Xupn4bUdaf7mcAPdcUaN/BQZ8r7S7y9
IgOxGSQ3Y83P1MTcTDyY6eTCbJGGGXnLTIwL3sR92EyZ1Y/GXHoxI/8nSU9Ni+TK15frE325pq0j
LCI6jYZBdEsG1jVJzHh5VnEyFI1BcnXr6+HNlV0x8LO42FrardcofTkiX55sGmveGA+TxGyP+qZF
qcAjXxvp1zOdgrZ00Slo4xudwj/RisK3rBX+1l5GfYd9q7MnuKKH5HJiwpdFMm0rAtaYI41uXHAo
6/HXFDiMMeQQBQdJuKkKAlMVrMZYbs4nwk2VpGkS2hOHuDmLAePptyAAcXnpfi2BBjKRZdGpMsmb
hNITGT2WQeecsnVTLa04XhqFLd5EKf1Y1+RJ6CTBVZlkdaWstC7ZPby/7t/+uE5sy3hjCAQbFKXv
mhj9d2yNIubITuA2yWskrJJ8Tqr6hloHFXfVQLlIwOkrTappCJKhZW20wDzUFXMYRaUAQwcwLl70
6ioh9d2uXlZBDDlI1dddpASmZPVCk2zwEUfYUubQhUY4lJWbViTiYZbI5pBR6qeiErol+Z6iv85A
50NREnlHmbf8A7Rs6vmX44/985f34+716fBz9/n37vFl93pOjCGPRXZTmk3qiWAle4LuKZK6yIoN
xZv3FKwsGTS0IqdSITFYIh30ziX1CU4u5aB0Jz+eFiwqEzJNpiLZsIyRZTHWHI9r+yHR/QRw6cV9
3qacsmEldd49EKN45yDLk1qEgQq9nTRfvUR3mk3QZTdmvMHssmHVJtH66+WFjoWGgaiUms4uiAB+
Eg0JPBbfQJDPSRqNgicDidkmpefpsef7p+3n4/7XufkNRYfLo+ULRsVJp+hGk2u7PzbJxJP/zaXN
qOvUJvt6fvy9hc9aHRASRFsWcDdRRwCSVDGLOgq7zbCSK5Zw3/iqmWV8k2GmcjgVzJMeieCYb+I2
ZlW6EV5vzrEdr6ilqfp2ch87RBGjrmBYY1/PH7fPP9E09hP+8/Pw3+dPf7ZPW/i1/fmyf/503P61
gyL7n58wds8vvMc+bV9etnCQvX467h73z+//fDo+baGCt8PT4c/h04+Xv87lxbfcvT7vHs9+b19/
7p7xXXa4ALXwjmf75/3bfvu4/78tYjWr31DEakXNd7tisEnw1OhCP2nyNUX1PdY5GAGC4zlcCr2C
ual7FNwXVGApHyl+gtz/CQbkkrePHqHrj00xA8bHJBh8a+mBUWj/uPZ2ijbLoT6+huNX6CgM1QVc
/kWvbX/98/J2OHs4vO7ODq9n8qrSJkUQ43MO0+MiGOCRC4e9RAJdUr4Mk3KhX6wWwi0i9jkFdEkr
w/G4h5GEvUjuNNzbEuZr/LIsXeplWbo1oFrOJQWOFuQrt94ObojEHcoO9UcWbKOEo4Ne9wRuVz+f
XY6mRqLwDpE3KQ10m16Kvw5Y/CEWRVMvgB/VHVIEvIvmZS2JJHNrmKcNmsgI7mstUjDIp4L3H4/7
h89/7/6cPYgl/guTxP9xVnbFmVNl5C6vOAwJmCC0JyIOq4hTkQBULzJ30ODcXsWjyUQkcpA2U+9v
v3fPb/uH7dvu51n8LDoBe/vsv/u332fseDw87AUq2r5tnV6FYeYOFAELFyB3sNEF3Huby/HFxBly
Fs8TDAZE9JPHdwkVkK0fhgWDs2+lOhQIhwzkh49ucwN3dMNZ4LQmrN0tERLrOA4DosFpRXtdduhi
Rqu++3Ud0B5iArsmWgE3/H3FSqcX+aIfbmc7YPyGusmoZYWW2I5p3WJ7/O0bVAz04hyTEmhXvj7Z
uZUsJB8w9792xzf3Y1U4th3rNISbXJWgcqcboTDwKXUkrdfkPRCkbBmPqOmXGFq5rz5XX15gohxn
65Cf8m6aLLpyiLPIne0sgT0Si1yeRHurLLocUYbvGv7aUB0OCF/m4oFiTKabUVsbWHz3Qlb8vAMG
Hp4Cj11gRsDQgCIo5sQI1PPq8pYWDzqK+9KSHyRPs3/5bTqUqcPM3aQAQ08S99zD8Lhy2bpl8iZI
uFumCt15B+7rHv1ivQgVX9c51xi6Xybu7RQy1Bf5CvHaXWcIdScuit0uzOTl7a6p5YJ9Z7SUreaR
pZydWlTqriGvkpjyeemxVRnnBDsg4S3n8aidmNmX+gXn8YZUXAZtJarQ94WdBYAkcEIkW+jJwJaE
h6eX193xaEo+akJmpoiu7q3vhQObmjHlekoqOt6AXFDnzHdeuxHmKxATD09n+fvTj92rdFNU4ppd
HkMGt2EJHLT/21EVzK34RjrGcytJnE8lpROF5MO3RuF891uCol+M3gzlxsEiM91SEo9C0EJIj/VK
NT0FJZnoSNi0q5IYk54GxSl/n3uyOBf8fhGgeTmxuIRuJclntkD4uP/xugWh9PXw/rZ/JtiLNAnI
A1XAqZMQEd0drBw6nB2j0ZA4eYb0xalPSBIa1XPZWgOcPWQQnthOQEcdoQhXnAFIF5gY/vIUyam+
ePnEoaMa704RuUo4Ne+k3Y2hwRLJY4ZaNWTZBGlHw5vAJFtPLm7bMEadehKi5bk0OzfeNpYhn6JB
xwrxWIvXNB1Jb+Dk4BzfG+mqboS0iPXQWuBkji8AZSztWYWBDbYsIfyPwt3rG/p2gmQlU8wf97+e
t2/vr7uzh9+7h7/3z780b6wiajB/TiJeTL6eP0Dh4xcsAWQtSJ7/edk99XZ10jZAf52pDBNTF8+/
ntul43VdMX10nfIOhTCM+Xp1cXvdU8bwn4hVmw8bA1sRI1vw+l9QiIME/4etHmwh/8WAqiqDJMdG
CUPcmTqOUu85VLEkum5LI/qggrVBnIdwq1RU7ps0yWNWtcJQTfcfZJahc5AAa4qhmLRRVp5owLXm
YblpZ1WRKatkgiSNcw82j+suBZiDmiV5BP9UMKiB/qQQFlVk+KdVSRa3eZMFRvIE+WbHUrdijFRn
OXoolAXuM2fNkNkUkXTKNNH7ISjQIhlOBWAB8qLunwr7gyZswxCuWQN0eW1SdBLXkw5L6qY1S40t
jRfKhSpEp4c5ECRwSsXBhrZ2MEh8bKIgYdU9/boi8eYkVaFucvL/lV1bb9y6EX7vr8hjC7SBfWqk
aYE8aCXtrrqri3XxbvwiuMnWMHKcBLENBOfXd74hJQ3J4Tp9iJHlDCmKIuc+wxScUP4SpZ+JPs9q
84Igyl37Ki67mEKGQRs5q0uxIguIxMQ58G8ZF61ZHrYj+g+ygCuF3hpO57WSULqM7LSKkUU7yZ4q
/pWKD5lUQedmDf94i2a5R0wLLILql7VgTsSMlEqyKEXyThOqLTRpS+Wp1Npv6VzG+6GQYurPf1yl
/w7a3A+6vPy4uS0aFbC/dQoBL4DjbQT/Sm3HagtqmMqd2HV1WtCJv8npZdtESNCgGkRNZJKmaUIe
yuhQGbQ7xYUr0gPHzhRiJtK5kW5/tKXOi1FDk7dE/yaAMVCd/nv38vsz7u94frh/+fby9ObR+Ffu
fpzuiP/8cfqXEGbZP3qbj+XqI630ErU7A+gRCJJBGLUsJTqBO9hvuK9OQSTeMtTruKXqEXdRZD4Q
IMmeRJ0SqvJ74RxkB2YR9ddzOemkWTim4PGbvXFsOcS3oQXvdmO9XrN3TJtlM4yt86Wza8mO9vXK
/aVQrmrvhrin+1vUFlwaivYa8rEYt2wK576UushwSxWJJK2zP2nPTmzvJuuEbj21bvIewcz1OpMb
W/YZZW1/B9AzT5bxLUj3rmW6j80OSHeHRBag4qYsb2qxCh3xltLNE0e4TbWJcD8rdQVCk+ufneRY
bv3+4+Hr8xe+1eDz4+npPgxbYoFsN9r4brcxTWwtgFlG4Txm1Gfdk+y0n51q/4hiXA9F3n+4mr+i
lfWDEa6WNWAHup1BlsdKYWcfqwT38MTjfx2MoLDeLOmWK4QFjHnbErqsps7d6B8Jiau6M55m+wmi
yzqbgR5+P/3t+eHRCsJPjPrJtP8IP4J5llXUgzakZA1p7sScC2hHwpsuJwmk7JC0a43VNckWHwzU
mgcaV70wkW+yFW46KhrpAbFWh3KAqRIZkQto3dIacobdh8uL367+JLZ1Q3wFyfxuETkEZvBoSRep
M5ajLEZnSj3uNS+DecvO5F4ieaVMesnOfAhPb6yr/cdwQdc1Z90PVWoTHYnmEjnQeL151aYubNq3
Ms4hT3bgC6CZcvv88gZxKo7ZE56d/vNyf49IgeLr0/OPl0dbnn86Ycmm4NQnrtweNs5RCuYrfrj4
ebksgsQzpUKi6y2j/KYW5icH/FVWtmP3NCOUyJU/s2PnkSKZI0zlmdLuaIPKZ+G3ZvqYNJ5h1SU2
yRmMNpEchmFyMINMGrdavTIVA65QjUxqRxLIIlSAond8vUe3LdZ9OMusuAmiWDyUoaLDlm7x1bXs
DDO6MacggXNNHyB8zlB5KGceWK+QEB3P3ZmWoNbLyRhwTiLgGfAsFcVfSf3YbFQyX/zR2Va7FJ0g
JhdTHRyvnN/Zc+geCaQF5sphQIZdYJ6ygULzuIJHg2Xmxz6vOi+93AwHOItyKn2nvvWh8ixrbHCr
CxTsrSLscx4aufpnUNo6S5Aq7ckr/tEzyIdjOP2DVnxxNmv02VAKYdP89m4+sY22gKJPmMw+jDUr
4qkLR2xXDMbXV3bhK01wxDxHSeiE1KYDs7n4MNAtmmGqMfLqgJZBT7KVIPDdflhxcLOaaYn9bzcu
qXh74l7+e7/WjhxUloiNYfLy3cXFhf9SM27UvuPhzXF163PbcEbn6MEujRQht9ICh/4NXUxb60iu
ySxWXmVGzHl9d9/Qy2+4SLq/QDdl+HUJG8EXfva7j9OuwsHoMet9sgn2tDYBf47mhqSg59zs0you
/8aRjtFZWhkHqmYwpR30T0TvB1qSKazaCQwrN7napTeKg+PNdVtstmWuhdqKvc1fVeNwCjjO+HcJ
+ETo35HQ7kBa7SaUC0AVoOZV9cKcsqydqvu4gaMLP/AE3q25nMfaRQjpTf3t+9Nf3+y/ffry8t1I
lNu7r/dS2cPVrYhXrZ1SIU4zqgoNwq1lgKwyD/1iQkHc6QCS2xPJqWXqRL3uo0Dodk1CkrNE4yf8
Co4/NSSAeI/i8pnSHhBgyC++PEogNv79tq8i23ldLB8Ijxq3qMnfJ51DLW00+wSaFxZ32YQPmtGi
a+Sh+Et0uCZ1h5SezI3BYfHHvIJqYzi/n0wmFCkun1+grSgSi6GfXh6vaXS1XG5jhiS3vja2f06x
cLs8bzz5xfiVEI24CGh/fvr+8BURivQ2jy/Pp58n+s/p+dPbt2//Iq6rRgkdHpsv2wku821a3C62
VMxZhCkGtMnBDFHR2saEKkbA60ZJKcyoQ58f84CQTvW2/fYI+uFgIMTz64ObZGWfdOic4g6mlWc4
2QXFrLNcobcWEH2Z6a7kfR7rjZXmmIozV7LxlOjkIkvHix1eXnIR4gQTXzvddGva/7FVZuUBRflg
o/R4sNs+VqUIMWG2Yqr5zW1siED+AWlVeZ7R4TDennCpdka0Oyf+WG0LV6gkXVgW25zoL0Z3+Xz3
fPcGSssnOGsDQxQ7er190dhGn1uqVmcGcfGmwvFespBKyir0BZLg26GZ62U5hCcyTXf8tKUlw+Uf
7GY1gU3poOpP5oCmg3+YIXm7L6tvM+Ch7KnW7vVYLFsEQ5GzpZ+yUkCC4MS2rZkX/HbpDsPbJtI7
v9aKN2C+nLk5bnhPElcsar0gp7tmHg25ttJWu9iwHARTd4xUU/p9E3HW0uttiVvtjWzV51OZWe2k
E7hKP5rrbSYtHsFOy+kJ6XJVN2aFZM0ciHuzGe88lFao2eo4kwl57R1cBTgein4Lj0T3C2i2whbs
6z66RStZ16PxEBfgoaCuEW8XYLIB0h8ktR3NKD6BSl0uwh6HuXKNbeQy34zvXe9HCih97Y5eIw0X
rSFVuaQz3V7rkwvGsw3io877Zh3seofhFlk+1tu0uPz7P6/YzeUrKAsbSFB+XWMsQjPiorKFtTu6
pnZ7kAxOQFd/vn+nkRyPFQSbNmQVIY7JJ7SekKETaiCuFLNuCRYF5Z0msldkrGy1iXTgqsvHbJWG
Rx0lqPaDGjDLe64si9o/oYvrnCYM53OGs3wutAN3j8LnM14c3+uXWQmMXI9ZnjGGwH3kY9gUQpem
sf8JwrVbjq9J4m5W7oh4U8WnwN/23DubxWHDd6PX0TXXPkGaik5hqA6owtcGfomZ0Ls7VToN+9PT
M4QfSPgpbjO4uz+JwgZ4uGNk59kot5V4GBGeZ4D5kY9lwDYNlMlbRByc5Aq47OpWL7vZlDqaNlze
42ogFV04tiZuceahXhnQuO2AtP60vrE0oJHBPkSt4WLujQoxBVUv6sMu6yMXmbFCh1C9rm71bcYo
ZVHx3cRxjGj/HZHdVd7JErGalrwwatrzQWGAdoWMkLjpr+UgkXpf4/6hOJXA3iZNdzw/mDWbxizT
rJy8u1J1B16KbX6EXfnMWhl3vUlQ1PbqhNWljXN/qIlpJUCv3jzE4DlUUjaGIQPGkzFEqiQw9MgO
pTj8rC+HMVrEqvUR15FZKxPM5nYrMi1V0uzVnSjdPr1a7V3giOabMubaMG8O8ZArjHqjNWu/BdGs
7OxGTTdZUBghmSu4vrW4Unc266ItSW3T5RLztbnqpAqnZ/A9rIbIaQJ9buu+i6oaS1l4HlgFmShe
FSCiYf282zIDWO1HM53RvZ0WD8mwm50rp0Tr05idX/rKiIQ6BukzpCwv04SOydm5wMIQkQunQSKW
bfO5QV/gAwv3pcerLYjGm0mJm+GvM9mgDIAJ3/kfacliBhEQAgA=
--===============0615477561052636279==--


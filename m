Content-Type: multipart/mixed; boundary="===============1208564425229541405=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/watchdog/dw_wdt.c:124:25: warning: Array accessed at index 16, which is out of bounds.
Date: Fri, 26 Mar 2021 05:45:09 +0800
Message-ID: <202103260559.s7rU3OMi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1208564425229541405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e138138003eb3b3d06cc91cf2e8c5dec77e2a31e
commit: 86445535887e580036d0094a849126703a33fd62 watchdog: dw_wdt: Support =
devices with non-fixed TOP values
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/watchdog/dw_wdt.c:124:25: warning: Array 'dw_wdt->timeouts[16]' =
accessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                           ^
   drivers/watchdog/dw_wdt.c:119:2: note: After for loop, idx has value 16
    for (idx =3D 0; idx < DW_WDT_NUM_TOPS; ++idx) {
    ^
   drivers/watchdog/dw_wdt.c:124:25: note: Array index out of bounds
    return dw_wdt->timeouts[idx].sec;
                           ^
   drivers/watchdog/dw_wdt.c:147:25: warning: Array 'dw_wdt->timeouts[16]' =
accessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                           ^
   drivers/watchdog/dw_wdt.c:142:2: note: After for loop, idx has value 16
    for (idx =3D 0; idx < DW_WDT_NUM_TOPS; ++idx) {
    ^
   drivers/watchdog/dw_wdt.c:147:25: note: Array index out of bounds
    return dw_wdt->timeouts[idx].sec;
                           ^
>> drivers/watchdog/dw_wdt.c:124:17: warning: Array 'dw_wdt.timeouts[16]' a=
ccessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                   ^
   drivers/watchdog/dw_wdt.c:147:17: warning: Array 'dw_wdt.timeouts[16]' a=
ccessed at index 16, which is out of bounds. [arrayIndexOutOfBounds]
    return dw_wdt->timeouts[idx].sec;
                   ^

vim +124 drivers/watchdog/dw_wdt.c

86445535887e580 Serge Semin 2020-05-30  110  =

86445535887e580 Serge Semin 2020-05-30  111  static unsigned int dw_wdt_get=
_min_timeout(struct dw_wdt *dw_wdt)
c9353ae1c69ba13 Jamie Iles  2011-01-24  112  {
86445535887e580 Serge Semin 2020-05-30  113  	int idx;
86445535887e580 Serge Semin 2020-05-30  114  =

86445535887e580 Serge Semin 2020-05-30  115  	/*
86445535887e580 Serge Semin 2020-05-30  116  	 * We'll find a timeout great=
er or equal to one second anyway because
86445535887e580 Serge Semin 2020-05-30  117  	 * the driver probe would hav=
e failed if there was none.
86445535887e580 Serge Semin 2020-05-30  118  	 */
86445535887e580 Serge Semin 2020-05-30  119  	for (idx =3D 0; idx < DW_WDT_=
NUM_TOPS; ++idx) {
86445535887e580 Serge Semin 2020-05-30  120  		if (dw_wdt->timeouts[idx].se=
c)
86445535887e580 Serge Semin 2020-05-30  121  			break;
86445535887e580 Serge Semin 2020-05-30  122  	}
c9353ae1c69ba13 Jamie Iles  2011-01-24  123  =

86445535887e580 Serge Semin 2020-05-30 @124  	return dw_wdt->timeouts[idx].=
sec;
86445535887e580 Serge Semin 2020-05-30  125  }
86445535887e580 Serge Semin 2020-05-30  126  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1208564425229541405==--


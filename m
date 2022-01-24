Content-Type: multipart/mixed; boundary="===============0841543657565037681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/chemical/scd4x.c:482:0: warning: syntax error [syntaxError]
Date: Tue, 25 Jan 2022 03:23:21 +0800
Message-ID: <202201250128.YEbVeyuR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0841543657565037681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Roan van Dijk <roan@protonic.nl>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
commit: 49d22b695cbb690b1d1a9d21b61eaf8f61a525d4 drivers: iio: chemical: Ad=
d support for Sensirion SCD4x CO2 sensor
date:   3 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/chemical/scd4x.c:482:0: warning: syntax error [syntaxError]
   =

   ^

vim +482 drivers/iio/chemical/scd4x.c

49d22b695cbb69 Roan van Dijk 2021-10-08  480  =

49d22b695cbb69 Roan van Dijk 2021-10-08  481  static IIO_CONST_ATTR(calibra=
tion_forced_value_available,
49d22b695cbb69 Roan van Dijk 2021-10-08 @482  	       __stringify([SCD4X_FR=
C_MIN_PPM 1 SCD4X_FRC_MAX_PPM]));
49d22b695cbb69 Roan van Dijk 2021-10-08  483  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0841543657565037681==--


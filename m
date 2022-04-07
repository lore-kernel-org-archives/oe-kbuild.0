Content-Type: multipart/mixed; boundary="===============6710401339621464562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/chemical/scd4x.c:482:22: warning: syntax error [syntaxError]
Date: Thu, 07 Apr 2022 18:06:00 +0800
Message-ID: <202204071747.vbg8yUrt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6710401339621464562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Roan van Dijk <roan@protonic.nl>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 49d22b695cbb690b1d1a9d21b61eaf8f61a525d4 drivers: iio: chemical: Ad=
d support for Sensirion SCD4x CO2 sensor
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
compiler: xtensa-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 49d22b695cbb690b1d1a9d21b61eaf8f61a525d4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/chemical/scd4x.c:482:22: warning: syntax error [syntaxError]
           __stringify([SCD4X_FRC_MIN_PPM 1 SCD4X_FRC_MAX_PPM]));
                        ^

vim +482 drivers/iio/chemical/scd4x.c

49d22b695cbb69 Roan van Dijk 2021-10-08  480  =

49d22b695cbb69 Roan van Dijk 2021-10-08  481  static IIO_CONST_ATTR(calibra=
tion_forced_value_available,
49d22b695cbb69 Roan van Dijk 2021-10-08 @482  	       __stringify([SCD4X_FR=
C_MIN_PPM 1 SCD4X_FRC_MAX_PPM]));
49d22b695cbb69 Roan van Dijk 2021-10-08  483  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6710401339621464562==--


Content-Type: multipart/mixed; boundary="===============7610739648107583422=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/chemical/scd4x.c:482:0: warning: syntax error [syntaxError]
Date: Mon, 21 Mar 2022 11:02:55 +0800
Message-ID: <202203211013.R4mYVb2i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7610739648107583422==
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
head:   f443e374ae131c168a065ea1748feac6b2e76613
commit: 49d22b695cbb690b1d1a9d21b61eaf8f61a525d4 drivers: iio: chemical: Ad=
d support for Sensirion SCD4x CO2 sensor
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/common/st_sensors/st_sensors_buffer.c:43:3: warning: Assignm=
ent of function parameter has no effect outside the function. Did you forge=
t dereferencing it? [uselessAssignmentPtrArg]
     buf +=3D storage_bytes;
     ^
--
>> drivers/iio/dac/ad5592r-base.c:478:9: warning: %u in format string (no. =
2) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
    return sprintf(buf, "%d.%09u %d.%09un",
           ^
   drivers/iio/dac/ad5592r-base.c:478:9: warning: %u in format string (no. =
4) requires 'unsigned int' but the argument type is 'signed int'. [invalidP=
rintfArgType_uint]
    return sprintf(buf, "%d.%09u %d.%09un",
           ^
>> drivers/iio/chemical/scd4x.c:482:0: warning: syntax error [syntaxError]
   =

   ^
--
>> drivers/iio/light/isl29018.c:275:10: warning: %d in format string (no. 1=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
     len +=3D sprintf(buf + len, "%d.%06d ",
            ^
   drivers/iio/light/isl29018.c:275:10: warning: %d in format string (no. 2=
) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArg=
Type_sint]
     len +=3D sprintf(buf + len, "%d.%06d ",
            ^
--

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
--===============7610739648107583422==--


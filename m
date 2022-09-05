Content-Type: multipart/mixed; boundary="===============7665368838361390028=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/asb100.c:243:1: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 06 Sep 2022 04:07:19 +0800
Message-ID: <202209060428.ooQlZSMh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7665368838361390028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/hwmon/asb100.c:243:1: warning: %d in format string (no. 1) require=
s 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint=
]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.de>

Hi Uwe,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e18e42e4b280c85b76967a9106a13ca61c16179
commit: b97adb596399581df42a5f94e14235359f150373 hwmon: Allow to compile AS=
B100 and FSCHMD on !X86
date:   8 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 weeks ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b97adb596399581df42a5f94e14235359f150373
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


vim +243 drivers/hwmon/asb100.c

^1da177e4c3f41 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  242  =

^1da177e4c3f41 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16 @243  s=
how_in_reg(in)
^1da177e4c3f41 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  244  s=
how_in_reg(in_min)
^1da177e4c3f41 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  245  s=
how_in_reg(in_max)
^1da177e4c3f41 drivers/i2c/chips/asb100.c Linus Torvalds 2005-04-16  246  =


:::::: The code at line 243 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7665368838361390028==--


Content-Type: multipart/mixed; boundary="===============5505051132001009130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/chrome/chromeos_acpi.c:202 chromeos_attr_show_gpio_0() error: uninitialized symbol 'num'.
Date: Wed, 31 Aug 2022 14:41:11 +0800
Message-ID: <202208311429.pOoOxQ5c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5505051132001009130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: "Tzung-Bi Shih" <tzungbi@kernel.org>
CC: Guenter Roeck <groeck@chromium.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcf8e5633e2e69ad60b730ab5905608b756a032f
commit: 0a4cad9c11ad46662ede48d94f08ecb7cd9f6916 platform/chrome: Add Chrom=
eOS ACPI device driver
date:   4 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20220829 (https://download.01.org/0day-ci/ar=
chive/20220831/202208311429.pOoOxQ5c-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/chrome/chromeos_acpi.c:202 chromeos_attr_show_gpio_0() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:203 chromeos_attr_show_gpio_1() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:204 chromeos_attr_show_gpio_2() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:205 chromeos_attr_show_gpio_3() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:206 chromeos_attr_show_gpio_4() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:207 chromeos_attr_show_gpio_5() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:208 chromeos_attr_show_gpio_6() err=
or: uninitialized symbol 'num'.
drivers/platform/chrome/chromeos_acpi.c:209 chromeos_attr_show_gpio_7() err=
or: uninitialized symbol 'num'.

vim +/num +202 drivers/platform/chrome/chromeos_acpi.c

0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  196  =

0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  197  /*
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  198   * Every platform ca=
n have a different number of GPIO attribute groups.
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  199   * Define upper limi=
t groups. At run time, the platform decides to show
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  200   * the present numbe=
r of groups only, others are hidden.
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  201   */
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @202  GPIO_ATTR_GROUP(gpio=
0, "GPIO.0", 0)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @203  GPIO_ATTR_GROUP(gpio=
1, "GPIO.1", 1)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @204  GPIO_ATTR_GROUP(gpio=
2, "GPIO.2", 2)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @205  GPIO_ATTR_GROUP(gpio=
3, "GPIO.3", 3)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @206  GPIO_ATTR_GROUP(gpio=
4, "GPIO.4", 4)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @207  GPIO_ATTR_GROUP(gpio=
5, "GPIO.5", 5)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @208  GPIO_ATTR_GROUP(gpio=
6, "GPIO.6", 6)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13 @209  GPIO_ATTR_GROUP(gpio=
7, "GPIO.7", 7)
0a4cad9c11ad46 Enric Balletbo i Serra 2022-05-13  210  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5505051132001009130==--


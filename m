Content-Type: multipart/mixed; boundary="===============1165359176822452265=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4624/9128] drivers/platform/x86/x86-android-tablets.c:275 asus_me176c_tf103c_init() error: uninitialized symbol 'gpiod'.
Date: Tue, 01 Mar 2022 01:34:50 +0800
Message-ID: <202202281730.CbE9khYB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1165359176822452265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hans de Goede <hdegoede@redhat.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 66d1d6665a6166078112d4fbbf76153080b2e4d9 [4624/9128] platform/x86: =
x86-android-tablets: Add lid-switch gpio-keys pdev to Asus ME176C + TF103C
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20220228 (https://download.01.org/0day-ci/ar=
chive/20220228/202202281730.CbE9khYB-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/x86-android-tablets.c:275 asus_me176c_tf103c_init() er=
ror: uninitialized symbol 'gpiod'.

Old smatch warnings:
drivers/platform/x86/x86-android-tablets.c:103 x86_acpi_irq_helper_get() er=
ror: uninitialized symbol 'gpiod'.

vim +/gpiod +275 drivers/platform/x86/x86-android-tablets.c

66d1d6665a6166 Hans de Goede 2022-02-05  266  =

66d1d6665a6166 Hans de Goede 2022-02-05  267  static int __init asus_me176c=
_tf103c_init(void)
66d1d6665a6166 Hans de Goede 2022-02-05  268  {
66d1d6665a6166 Hans de Goede 2022-02-05  269  	struct gpio_desc *gpiod;
66d1d6665a6166 Hans de Goede 2022-02-05  270  	int ret;
66d1d6665a6166 Hans de Goede 2022-02-05  271  =

66d1d6665a6166 Hans de Goede 2022-02-05  272  	ret =3D x86_android_tablet_g=
et_gpiod("INT33FC:02", 12, &gpiod);
66d1d6665a6166 Hans de Goede 2022-02-05  273  	if (ret < 0)
66d1d6665a6166 Hans de Goede 2022-02-05  274  		return ret;
66d1d6665a6166 Hans de Goede 2022-02-05 @275  	asus_me176c_tf103c_lid.gpio =
=3D desc_to_gpio(gpiod);
66d1d6665a6166 Hans de Goede 2022-02-05  276  =

66d1d6665a6166 Hans de Goede 2022-02-05  277  	return 0;
66d1d6665a6166 Hans de Goede 2022-02-05  278  }
66d1d6665a6166 Hans de Goede 2022-02-05  279  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1165359176822452265==--


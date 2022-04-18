Content-Type: multipart/mixed; boundary="===============1721249826122093049=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/x86-android-tablets.c:850 lenovo_yoga_tab2_830_1050_init_display() error: uninitialized symbol 'gpiod'.
Date: Mon, 18 Apr 2022 17:32:22 +0800
Message-ID: <202204181718.XqQ3AGRf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1721249826122093049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: 67dfc2b441b4b724acb74361e9e2e23506721e4f platform/x86: x86-android-=
tablets: Add Lenovo Yoga Tablet 2 830 / 1050 data
date:   7 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m031-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204181718.XqQ3AGRf-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/x86-android-tablets.c:850 lenovo_yoga_tab2_830_1050_in=
it_display() error: uninitialized symbol 'gpiod'.

Old smatch warnings:
drivers/platform/x86/x86-android-tablets.c:111 x86_acpi_irq_helper_get() er=
ror: uninitialized symbol 'gpiod'.
drivers/platform/x86/x86-android-tablets.c:302 asus_me176c_tf103c_init() er=
ror: uninitialized symbol 'gpiod'.

vim +/gpiod +850 drivers/platform/x86/x86-android-tablets.c

67dfc2b441b4b72 Hans de Goede 2022-02-23  821  =

67dfc2b441b4b72 Hans de Goede 2022-02-23  822  /*
67dfc2b441b4b72 Hans de Goede 2022-02-23  823   * The Lenovo Yoga Tablet 2 =
830 and 1050 (8" vs 10") versions use the same
67dfc2b441b4b72 Hans de Goede 2022-02-23  824   * mainboard, but they need =
some different treatment related to the display:
67dfc2b441b4b72 Hans de Goede 2022-02-23  825   * 1. The 830 uses a portrai=
t LCD panel with a landscape touchscreen, requiring
67dfc2b441b4b72 Hans de Goede 2022-02-23  826   *    the touchscreen driver=
 to adjust the touch-coords to match the LCD.
67dfc2b441b4b72 Hans de Goede 2022-02-23  827   * 2. Both use an TI LP8557 =
LED backlight controller. On the 1050 the LP8557's
67dfc2b441b4b72 Hans de Goede 2022-02-23  828   *    PWM input is connected=
 to the PMIC's PWM output and everything works fine
67dfc2b441b4b72 Hans de Goede 2022-02-23  829   *    with the defaults prog=
rammed into the LP8557 by the BIOS.
67dfc2b441b4b72 Hans de Goede 2022-02-23  830   *    But on the 830 the LP8=
557's PWM input is connected to a PWM output coming
67dfc2b441b4b72 Hans de Goede 2022-02-23  831   *    from the LCD panel's c=
ontroller. The Android code has a hack in the i915
67dfc2b441b4b72 Hans de Goede 2022-02-23  832   *    driver to write the no=
n-standard DSI reg 0x9f with the desired backlight
67dfc2b441b4b72 Hans de Goede 2022-02-23  833   *    level to set the duty-=
cycle of the LCD's PWM output.
67dfc2b441b4b72 Hans de Goede 2022-02-23  834   *
67dfc2b441b4b72 Hans de Goede 2022-02-23  835   *    To avoid having to hav=
e a similar hack in the mainline kernel the LP8557
67dfc2b441b4b72 Hans de Goede 2022-02-23  836   *    entry in lenovo_yoga_t=
ab2_830_1050_i2c_clients instead just programs the
67dfc2b441b4b72 Hans de Goede 2022-02-23  837   *    LP8557 to directly set=
 the level, ignoring the PWM input. This means that
67dfc2b441b4b72 Hans de Goede 2022-02-23  838   *    the LP8557 i2c_client =
should only be instantiated on the 830.
67dfc2b441b4b72 Hans de Goede 2022-02-23  839   */
67dfc2b441b4b72 Hans de Goede 2022-02-23  840  static int __init lenovo_yog=
a_tab2_830_1050_init_display(void)
67dfc2b441b4b72 Hans de Goede 2022-02-23  841  {
67dfc2b441b4b72 Hans de Goede 2022-02-23  842  	struct gpio_desc *gpiod;
67dfc2b441b4b72 Hans de Goede 2022-02-23  843  	int ret;
67dfc2b441b4b72 Hans de Goede 2022-02-23  844  =

67dfc2b441b4b72 Hans de Goede 2022-02-23  845  	/* Use PMIC GPIO 10 bootstr=
ap pin to differentiate 830 vs 1050 */
67dfc2b441b4b72 Hans de Goede 2022-02-23  846  	ret =3D x86_android_tablet_=
get_gpiod("gpio_crystalcove", 10, &gpiod);
67dfc2b441b4b72 Hans de Goede 2022-02-23  847  	if (ret)
67dfc2b441b4b72 Hans de Goede 2022-02-23  848  		return ret;
67dfc2b441b4b72 Hans de Goede 2022-02-23  849  =

67dfc2b441b4b72 Hans de Goede 2022-02-23 @850  	ret =3D gpiod_get_value_can=
sleep(gpiod);
67dfc2b441b4b72 Hans de Goede 2022-02-23  851  	if (ret) {
67dfc2b441b4b72 Hans de Goede 2022-02-23  852  		pr_info("detected Lenovo Y=
oga Tablet 2 1050F/L\n");
67dfc2b441b4b72 Hans de Goede 2022-02-23  853  		lenovo_yoga_tab2_830_1050_=
info.i2c_client_count =3D
67dfc2b441b4b72 Hans de Goede 2022-02-23  854  			ARRAY_SIZE(lenovo_yoga_ta=
b2_830_1050_i2c_clients) - 1;
67dfc2b441b4b72 Hans de Goede 2022-02-23  855  	} else {
67dfc2b441b4b72 Hans de Goede 2022-02-23  856  		pr_info("detected Lenovo Y=
oga Tablet 2 830F/L\n");
67dfc2b441b4b72 Hans de Goede 2022-02-23  857  		lenovo_yoga_tab2_830_1050_=
rmi_pdata.sensor_pdata.axis_align.swap_axes =3D true;
67dfc2b441b4b72 Hans de Goede 2022-02-23  858  		lenovo_yoga_tab2_830_1050_=
rmi_pdata.sensor_pdata.axis_align.flip_y =3D true;
67dfc2b441b4b72 Hans de Goede 2022-02-23  859  		lenovo_yoga_tab2_830_1050_=
info.i2c_client_count =3D
67dfc2b441b4b72 Hans de Goede 2022-02-23  860  			ARRAY_SIZE(lenovo_yoga_ta=
b2_830_1050_i2c_clients);
67dfc2b441b4b72 Hans de Goede 2022-02-23  861  	}
67dfc2b441b4b72 Hans de Goede 2022-02-23  862  =

67dfc2b441b4b72 Hans de Goede 2022-02-23  863  	return 0;
67dfc2b441b4b72 Hans de Goede 2022-02-23  864  }
67dfc2b441b4b72 Hans de Goede 2022-02-23  865  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1721249826122093049==--


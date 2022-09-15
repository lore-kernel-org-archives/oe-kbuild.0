Content-Type: multipart/mixed; boundary="===============8149192431698658308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 05/13] gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
Date: Fri, 16 Sep 2022 05:23:38 +0800
Message-ID: <202209160502.nU0timC5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8149192431698658308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220914155914.v3.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4=
@changeid>
References: <20220914155914.v3.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4(=
a)changeid>
TO: Raul E Rangel <rrangel@chromium.org>
TO: linux-acpi(a)vger.kernel.org
TO: linux-input(a)vger.kernel.org
CC: jingle.wu(a)emc.com.tw
CC: rafael(a)kernel.org
CC: andriy.shevchenko(a)linux.intel.com
CC: mario.limonciello(a)amd.com
CC: hdegoede(a)redhat.com
CC: linus.walleij(a)linaro.org
CC: timvp(a)google.com
CC: dmitry.torokhov(a)gmail.com
CC: Raul E Rangel <rrangel@chromium.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Len Brown <lenb@kernel.org>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: linux-gpio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Raul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on rafael-pm/linux-next linus/master v6.0-rc5 next=
-20220915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raul-E-Rangel/acpi-i=
2c-Use-SharedAndWake-and-ExclusiveAndWake-to-enable-wake-irq/20220915-080234
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
916/202209160502.nU0timC5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpio/gpiolib-acpi.c:1038 acpi_dev_gpio_irq_wake_get_by() warn: pass=
ing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1038 drivers/gpio/gpiolib-acpi.c

664e3e5ac64c8a Mika Westerberg   2014-01-08   990  =

c884fbd452147e Mika Westerberg   2015-05-06   991  /**
454efb6237ff29 Raul E Rangel     2022-09-14   992   * acpi_dev_gpio_irq_wak=
e_get_by() - Find GpioInt and translate it to Linux IRQ
454efb6237ff29 Raul E Rangel     2022-09-14   993   *                      =
             number
c884fbd452147e Mika Westerberg   2015-05-06   994   * @adev: pointer to a A=
CPI device to get IRQ from
809390219fb9c2 Andy Shevchenko   2021-02-25   995   * @name: optional name =
of GpioInt resource
c884fbd452147e Mika Westerberg   2015-05-06   996   * @index: index of Gpio=
Int resource (starting from %0)
454efb6237ff29 Raul E Rangel     2022-09-14   997   * @wake_capable: Set to=
 true if the IRQ is wake capable
c884fbd452147e Mika Westerberg   2015-05-06   998   *
c884fbd452147e Mika Westerberg   2015-05-06   999   * If the device has one=
 or more GpioInt resources, this function can be
c884fbd452147e Mika Westerberg   2015-05-06  1000   * used to translate fro=
m the GPIO offset in the resource to the Linux IRQ
c884fbd452147e Mika Westerberg   2015-05-06  1001   * number.
c884fbd452147e Mika Westerberg   2015-05-06  1002   *
a31f5c3a68520e Andy Shevchenko   2017-05-23  1003   * The function is idemp=
otent, though each time it runs it will configure GPIO
a31f5c3a68520e Andy Shevchenko   2017-05-23  1004   * pin direction accordi=
ng to the flags in GpioInt resource.
a31f5c3a68520e Andy Shevchenko   2017-05-23  1005   *
809390219fb9c2 Andy Shevchenko   2021-02-25  1006   * The function takes op=
tional @name parameter. If the resource has a property
809390219fb9c2 Andy Shevchenko   2021-02-25  1007   * name, then only those=
 will be taken into account.
809390219fb9c2 Andy Shevchenko   2021-02-25  1008   *
454efb6237ff29 Raul E Rangel     2022-09-14  1009   * The GPIO is considere=
d wake capable if the GpioInt resource specifies
454efb6237ff29 Raul E Rangel     2022-09-14  1010   * SharedAndWake or Excl=
usiveAndWake.
454efb6237ff29 Raul E Rangel     2022-09-14  1011   *
c884fbd452147e Mika Westerberg   2015-05-06  1012   * Return: Linux IRQ num=
ber (> %0) on success, negative errno on failure.
c884fbd452147e Mika Westerberg   2015-05-06  1013   */
454efb6237ff29 Raul E Rangel     2022-09-14  1014  int acpi_dev_gpio_irq_wa=
ke_get_by(struct acpi_device *adev, const char *name,
454efb6237ff29 Raul E Rangel     2022-09-14  1015  				  int index, bool *w=
ake_capable)
c884fbd452147e Mika Westerberg   2015-05-06  1016  {
c884fbd452147e Mika Westerberg   2015-05-06  1017  	int idx, i;
52044723cd27ae Christophe Ricard 2015-12-23  1018  	unsigned int irq_flags;
a31f5c3a68520e Andy Shevchenko   2017-05-23  1019  	int ret;
c884fbd452147e Mika Westerberg   2015-05-06  1020  =

c884fbd452147e Mika Westerberg   2015-05-06  1021  	for (i =3D 0, idx =3D 0=
; idx <=3D index; i++) {
c884fbd452147e Mika Westerberg   2015-05-06  1022  		struct acpi_gpio_info =
info;
c884fbd452147e Mika Westerberg   2015-05-06  1023  		struct gpio_desc *desc;
c884fbd452147e Mika Westerberg   2015-05-06  1024  =

809390219fb9c2 Andy Shevchenko   2021-02-25  1025  		desc =3D acpi_get_gpio=
d_by_index(adev, name, i, &info);
6798d7271cb44b Hans de Goede     2017-03-13  1026  =

6798d7271cb44b Hans de Goede     2017-03-13  1027  		/* Ignore -EPROBE_DEFE=
R, it only matters if idx matches */
6798d7271cb44b Hans de Goede     2017-03-13  1028  		if (IS_ERR(desc) && PT=
R_ERR(desc) !=3D -EPROBE_DEFER)
6798d7271cb44b Hans de Goede     2017-03-13  1029  			return PTR_ERR(desc);
6798d7271cb44b Hans de Goede     2017-03-13  1030  =

52044723cd27ae Christophe Ricard 2015-12-23  1031  		if (info.gpioint && id=
x++ =3D=3D index) {
2d6c06f5a4094a Andy Shevchenko   2019-04-10  1032  			unsigned long lflags =
=3D GPIO_LOOKUP_FLAGS_DEFAULT;
e7b731327aeac9 Andy Shevchenko   2020-11-09  1033  			enum gpiod_flags dfla=
gs =3D GPIOD_ASIS;
a31f5c3a68520e Andy Shevchenko   2017-05-23  1034  			char label[32];
6798d7271cb44b Hans de Goede     2017-03-13  1035  			int irq;
52044723cd27ae Christophe Ricard 2015-12-23  1036  =

6798d7271cb44b Hans de Goede     2017-03-13  1037  			if (IS_ERR(desc))
6798d7271cb44b Hans de Goede     2017-03-13 @1038  				return PTR_ERR(desc);
52044723cd27ae Christophe Ricard 2015-12-23  1039  =

6798d7271cb44b Hans de Goede     2017-03-13  1040  			irq =3D gpiod_to_irq(=
desc);
52044723cd27ae Christophe Ricard 2015-12-23  1041  			if (irq < 0)
52044723cd27ae Christophe Ricard 2015-12-23  1042  				return irq;
52044723cd27ae Christophe Ricard 2015-12-23  1043  =

e7b731327aeac9 Andy Shevchenko   2020-11-09  1044  			acpi_gpio_update_gpio=
d_flags(&dflags, &info);
e7b731327aeac9 Andy Shevchenko   2020-11-09  1045  			acpi_gpio_update_gpio=
d_lookup_flags(&lflags, &info);
e7b731327aeac9 Andy Shevchenko   2020-11-09  1046  =

a31f5c3a68520e Andy Shevchenko   2017-05-23  1047  			snprintf(label, sizeo=
f(label), "GpioInt() %d", index);
e7b731327aeac9 Andy Shevchenko   2020-11-09  1048  			ret =3D gpiod_configu=
re_flags(desc, label, lflags, dflags);
a31f5c3a68520e Andy Shevchenko   2017-05-23  1049  			if (ret < 0)
a31f5c3a68520e Andy Shevchenko   2017-05-23  1050  				return ret;
a31f5c3a68520e Andy Shevchenko   2017-05-23  1051  =

660c619b9d7ccd Andy Shevchenko   2022-03-07  1052  			/* ACPI uses hundredt=
hs of milliseconds units */
660c619b9d7ccd Andy Shevchenko   2022-03-07  1053  			ret =3D gpio_set_debo=
unce_timeout(desc, info.debounce * 10);
8dcb7a15a585b6 Andy Shevchenko   2020-11-09  1054  			if (ret)
8dcb7a15a585b6 Andy Shevchenko   2020-11-09  1055  				return ret;
8dcb7a15a585b6 Andy Shevchenko   2020-11-09  1056  =

52044723cd27ae Christophe Ricard 2015-12-23  1057  			irq_flags =3D acpi_de=
v_get_irq_type(info.triggering,
52044723cd27ae Christophe Ricard 2015-12-23  1058  							  info.polarity);
52044723cd27ae Christophe Ricard 2015-12-23  1059  =

bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1060  			/*
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1061  			 * If the IRQ is not =
already in use then set type
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1062  			 * if specified and d=
ifferent than the current one.
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1063  			 */
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1064  			if (can_request_irq(i=
rq, irq_flags)) {
52044723cd27ae Christophe Ricard 2015-12-23  1065  				if (irq_flags !=3D I=
RQ_TYPE_NONE &&
52044723cd27ae Christophe Ricard 2015-12-23  1066  				    irq_flags !=3D i=
rq_get_trigger_type(irq))
52044723cd27ae Christophe Ricard 2015-12-23  1067  					irq_set_irq_type(ir=
q, irq_flags);
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1068  			} else {
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1069  				dev_dbg(&adev->dev, =
"IRQ %d already in use\n", irq);
bdfd6ab8fdccd8 Hans de Goede     2021-11-25  1070  			}
52044723cd27ae Christophe Ricard 2015-12-23  1071  =

454efb6237ff29 Raul E Rangel     2022-09-14  1072  			if (wake_capable)
454efb6237ff29 Raul E Rangel     2022-09-14  1073  				*wake_capable =3D in=
fo.wake_capable;
454efb6237ff29 Raul E Rangel     2022-09-14  1074  =

52044723cd27ae Christophe Ricard 2015-12-23  1075  			return irq;
52044723cd27ae Christophe Ricard 2015-12-23  1076  		}
52044723cd27ae Christophe Ricard 2015-12-23  1077  =

c884fbd452147e Mika Westerberg   2015-05-06  1078  	}
6798d7271cb44b Hans de Goede     2017-03-13  1079  	return -ENOENT;
c884fbd452147e Mika Westerberg   2015-05-06  1080  }
454efb6237ff29 Raul E Rangel     2022-09-14  1081  EXPORT_SYMBOL_GPL(acpi_d=
ev_gpio_irq_wake_get_by);
c884fbd452147e Mika Westerberg   2015-05-06  1082  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8149192431698658308==--


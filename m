Content-Type: multipart/mixed; boundary="===============0766866400091343519=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4623/9128] drivers/platform/x86/x86-android-tablets.c:101 x86_acpi_irq_helper_get() error: uninitialized symbol 'gpiod'.
Date: Mon, 28 Feb 2022 16:21:31 +0800
Message-ID: <202202281654.TVt7G4sn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0766866400091343519==
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
commit: 381d785d9eefd2516985f662c71fde1f028b014d [4623/9128] platform/x86: =
x86-android-tablets: Add x86_android_tablet_get_gpiod() helper
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20220228 (https://download.01.org/0day-ci/ar=
chive/20220228/202202281654.TVt7G4sn-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/x86/x86-android-tablets.c:101 x86_acpi_irq_helper_get() er=
ror: uninitialized symbol 'gpiod'.

vim +/gpiod +101 drivers/platform/x86/x86-android-tablets.c

381d785d9eefd2 Hans de Goede     2022-02-05   76  =

55fa3c9665bfcf Hans de Goede     2021-12-23   77  static int x86_acpi_irq_h=
elper_get(const struct x86_acpi_irq_data *data)
55fa3c9665bfcf Hans de Goede     2021-12-23   78  {
cd26465fbc03be Hans de Goede     2021-12-30   79  	struct irq_fwspec fwspec=
 =3D { };
cd26465fbc03be Hans de Goede     2021-12-30   80  	struct irq_domain *domai=
n;
cd26465fbc03be Hans de Goede     2021-12-30   81  	struct acpi_device *adev;
55fa3c9665bfcf Hans de Goede     2021-12-23   82  	struct gpio_desc *gpiod;
55fa3c9665bfcf Hans de Goede     2021-12-23   83  	unsigned int irq_type;
cd26465fbc03be Hans de Goede     2021-12-30   84  	acpi_handle handle;
cd26465fbc03be Hans de Goede     2021-12-30   85  	acpi_status status;
55fa3c9665bfcf Hans de Goede     2021-12-23   86  	int irq, ret;
55fa3c9665bfcf Hans de Goede     2021-12-23   87  =

55fa3c9665bfcf Hans de Goede     2021-12-23   88  	switch (data->type) {
55fa3c9665bfcf Hans de Goede     2021-12-23   89  	case X86_ACPI_IRQ_TYPE_A=
PIC:
55fa3c9665bfcf Hans de Goede     2021-12-23   90  		irq =3D acpi_register_g=
si(NULL, data->index, data->trigger, data->polarity);
55fa3c9665bfcf Hans de Goede     2021-12-23   91  		if (irq < 0)
55fa3c9665bfcf Hans de Goede     2021-12-23   92  			pr_err("error %d getti=
ng APIC IRQ %d\n", irq, data->index);
55fa3c9665bfcf Hans de Goede     2021-12-23   93  =

55fa3c9665bfcf Hans de Goede     2021-12-23   94  		return irq;
55fa3c9665bfcf Hans de Goede     2021-12-23   95  	case X86_ACPI_IRQ_TYPE_G=
PIOINT:
55fa3c9665bfcf Hans de Goede     2021-12-23   96  		/* Like acpi_dev_gpio_i=
rq_get(), but without parsing ACPI resources */
381d785d9eefd2 Hans de Goede     2022-02-05   97  		ret =3D x86_android_tab=
let_get_gpiod(data->chip, data->index, &gpiod);
381d785d9eefd2 Hans de Goede     2022-02-05   98  		if (ret)
55fa3c9665bfcf Hans de Goede     2021-12-23   99  			return ret;
55fa3c9665bfcf Hans de Goede     2021-12-23  100  =

55fa3c9665bfcf Hans de Goede     2021-12-23 @101  		irq =3D gpiod_to_irq(gp=
iod);
55fa3c9665bfcf Hans de Goede     2021-12-23  102  		if (irq < 0) {
55fa3c9665bfcf Hans de Goede     2021-12-23  103  			pr_err("error %d getti=
ng IRQ %s %d\n", irq, data->chip, data->index);
55fa3c9665bfcf Hans de Goede     2021-12-23  104  			return irq;
55fa3c9665bfcf Hans de Goede     2021-12-23  105  		}
55fa3c9665bfcf Hans de Goede     2021-12-23  106  =

55fa3c9665bfcf Hans de Goede     2021-12-23  107  		irq_type =3D acpi_dev_g=
et_irq_type(data->trigger, data->polarity);
55fa3c9665bfcf Hans de Goede     2021-12-23  108  		if (irq_type !=3D IRQ_T=
YPE_NONE && irq_type !=3D irq_get_trigger_type(irq))
55fa3c9665bfcf Hans de Goede     2021-12-23  109  			irq_set_irq_type(irq, =
irq_type);
55fa3c9665bfcf Hans de Goede     2021-12-23  110  =

55fa3c9665bfcf Hans de Goede     2021-12-23  111  		return irq;
cd26465fbc03be Hans de Goede     2021-12-30  112  	case X86_ACPI_IRQ_TYPE_P=
MIC:
cd26465fbc03be Hans de Goede     2021-12-30  113  		status =3D acpi_get_han=
dle(NULL, data->chip, &handle);
cd26465fbc03be Hans de Goede     2021-12-30  114  		if (ACPI_FAILURE(status=
)) {
cd26465fbc03be Hans de Goede     2021-12-30  115  			pr_err("error could no=
t get %s handle\n", data->chip);
cd26465fbc03be Hans de Goede     2021-12-30  116  			return -ENODEV;
cd26465fbc03be Hans de Goede     2021-12-30  117  		}
cd26465fbc03be Hans de Goede     2021-12-30  118  =

f7e62c5890f085 Rafael J. Wysocki 2022-01-26  119  		adev =3D acpi_fetch_acp=
i_dev(handle);
cd26465fbc03be Hans de Goede     2021-12-30  120  		if (!adev) {
cd26465fbc03be Hans de Goede     2021-12-30  121  			pr_err("error could no=
t get %s adev\n", data->chip);
cd26465fbc03be Hans de Goede     2021-12-30  122  			return -ENODEV;
cd26465fbc03be Hans de Goede     2021-12-30  123  		}
cd26465fbc03be Hans de Goede     2021-12-30  124  =

cd26465fbc03be Hans de Goede     2021-12-30  125  		fwspec.fwnode =3D acpi_=
fwnode_handle(adev);
cd26465fbc03be Hans de Goede     2021-12-30  126  		domain =3D irq_find_mat=
ching_fwspec(&fwspec, data->domain);
cd26465fbc03be Hans de Goede     2021-12-30  127  		if (!domain) {
cd26465fbc03be Hans de Goede     2021-12-30  128  			pr_err("error could no=
t find IRQ domain for %s\n", data->chip);
cd26465fbc03be Hans de Goede     2021-12-30  129  			return -ENODEV;
cd26465fbc03be Hans de Goede     2021-12-30  130  		}
cd26465fbc03be Hans de Goede     2021-12-30  131  =

cd26465fbc03be Hans de Goede     2021-12-30  132  		return irq_create_mappi=
ng(domain, data->index);
55fa3c9665bfcf Hans de Goede     2021-12-23  133  	default:
55fa3c9665bfcf Hans de Goede     2021-12-23  134  		return 0;
55fa3c9665bfcf Hans de Goede     2021-12-23  135  	}
55fa3c9665bfcf Hans de Goede     2021-12-23  136  }
55fa3c9665bfcf Hans de Goede     2021-12-23  137  =


:::::: The code at line 101 was first introduced by commit
:::::: 55fa3c9665bfcf32b21af8ecdeb48d5c5177d8d7 platform/x86: x86-android-t=
ablets: New driver for x86 Android tablets

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0766866400091343519==--


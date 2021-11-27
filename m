Content-Type: multipart/mixed; boundary="===============0292142272952556420=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/surface/surface_hotplug.c:163 shps_setup_irq() warn: should '(((1))) << dsm' be a 64 bit type?
Date: Sat, 27 Nov 2021 18:42:52 +0800
Message-ID: <202111271850.Jw1O8RTa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0292142272952556420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: bd69bcce4aa089435e2891222236b1cb20395bec platform/surface: Add Surf=
ace Hot-Plug driver
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20211116 (https://download.01.org/0day-ci/arch=
ive/20211127/202111271850.Jw1O8RTa-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/surface/surface_hotplug.c:163 shps_setup_irq() warn: shoul=
d '(((1))) << dsm' be a 64 bit type?

vim +163 drivers/platform/surface/surface_hotplug.c

bd69bcce4aa089 Maximilian Luz 2021-02-05  147  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  148  static int shps_setup_irq(st=
ruct platform_device *pdev, enum shps_irq_type type)
bd69bcce4aa089 Maximilian Luz 2021-02-05  149  {
bd69bcce4aa089 Maximilian Luz 2021-02-05  150  	unsigned long flags =3D IRQ=
F_ONESHOT | IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING;
bd69bcce4aa089 Maximilian Luz 2021-02-05  151  	struct shps_device *sdev =
=3D platform_get_drvdata(pdev);
bd69bcce4aa089 Maximilian Luz 2021-02-05  152  	struct gpio_desc *gpiod;
bd69bcce4aa089 Maximilian Luz 2021-02-05  153  	acpi_handle handle =3D ACPI=
_HANDLE(&pdev->dev);
bd69bcce4aa089 Maximilian Luz 2021-02-05  154  	const char *irq_name;
bd69bcce4aa089 Maximilian Luz 2021-02-05  155  	const int dsm =3D shps_dsm_=
fn_for_irq(type);
bd69bcce4aa089 Maximilian Luz 2021-02-05  156  	int status, irq;
bd69bcce4aa089 Maximilian Luz 2021-02-05  157  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  158  	/*
bd69bcce4aa089 Maximilian Luz 2021-02-05  159  	 * Only set up interrupts t=
hat we actually need: The Surface Book 3
bd69bcce4aa089 Maximilian Luz 2021-02-05  160  	 * does not have a DSM for =
base presence, so don't set up an interrupt
bd69bcce4aa089 Maximilian Luz 2021-02-05  161  	 * for that.
bd69bcce4aa089 Maximilian Luz 2021-02-05  162  	 */
bd69bcce4aa089 Maximilian Luz 2021-02-05 @163  	if (!acpi_check_dsm(handle,=
 &shps_dsm_guid, SHPS_DSM_REVISION, BIT(dsm))) {
bd69bcce4aa089 Maximilian Luz 2021-02-05  164  		dev_dbg(&pdev->dev, "IRQ n=
otification via DSM not present (irq=3D%d)\n", type);
bd69bcce4aa089 Maximilian Luz 2021-02-05  165  		return 0;
bd69bcce4aa089 Maximilian Luz 2021-02-05  166  	}
bd69bcce4aa089 Maximilian Luz 2021-02-05  167  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  168  	gpiod =3D devm_gpiod_get(&p=
dev->dev, shps_gpio_names[type], GPIOD_ASIS);
bd69bcce4aa089 Maximilian Luz 2021-02-05  169  	if (IS_ERR(gpiod))
bd69bcce4aa089 Maximilian Luz 2021-02-05  170  		return PTR_ERR(gpiod);
bd69bcce4aa089 Maximilian Luz 2021-02-05  171  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  172  	irq =3D gpiod_to_irq(gpiod);
bd69bcce4aa089 Maximilian Luz 2021-02-05  173  	if (irq < 0)
bd69bcce4aa089 Maximilian Luz 2021-02-05  174  		return irq;
bd69bcce4aa089 Maximilian Luz 2021-02-05  175  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  176  	irq_name =3D devm_kasprintf=
(&pdev->dev, GFP_KERNEL, "shps-irq-%d", type);
bd69bcce4aa089 Maximilian Luz 2021-02-05  177  	if (!irq_name)
bd69bcce4aa089 Maximilian Luz 2021-02-05  178  		return -ENOMEM;
bd69bcce4aa089 Maximilian Luz 2021-02-05  179  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  180  	status =3D devm_request_thr=
eaded_irq(&pdev->dev, irq, NULL, shps_handle_irq,
bd69bcce4aa089 Maximilian Luz 2021-02-05  181  					   flags, irq_name, pde=
v);
bd69bcce4aa089 Maximilian Luz 2021-02-05  182  	if (status)
bd69bcce4aa089 Maximilian Luz 2021-02-05  183  		return status;
bd69bcce4aa089 Maximilian Luz 2021-02-05  184  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  185  	dev_dbg(&pdev->dev, "set up=
 irq %d as type %d\n", irq, type);
bd69bcce4aa089 Maximilian Luz 2021-02-05  186  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  187  	sdev->gpio[type] =3D gpiod;
bd69bcce4aa089 Maximilian Luz 2021-02-05  188  	sdev->irq[type] =3D irq;
bd69bcce4aa089 Maximilian Luz 2021-02-05  189  =

bd69bcce4aa089 Maximilian Luz 2021-02-05  190  	return 0;
bd69bcce4aa089 Maximilian Luz 2021-02-05  191  }
bd69bcce4aa089 Maximilian Luz 2021-02-05  192  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0292142272952556420==--


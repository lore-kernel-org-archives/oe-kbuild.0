Content-Type: multipart/mixed; boundary="===============0122862511556482395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/thinkpad_acpi.c:11770 thinkpad_acpi_module_init() error: we previously assumed 'dmi_id' could be null (see line 11676)
Date: Fri, 02 Sep 2022 05:32:00 +0800
Message-ID: <202209020520.uq0ngSDE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0122862511556482395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@amd.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42e66b1cc3a070671001f8a1e933a80818a192bf
commit: 455cd867b85b53fd3602345f9b8a8facc551adc9 platform/x86: thinkpad_acp=
i: Add a s2idle resume quirk for a number of laptops
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m031-20220829 (https://download.01.org/0day-ci/ar=
chive/20220902/202209020520.uq0ngSDE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:11770 thinkpad_acpi_module_init() erro=
r: we previously assumed 'dmi_id' could be null (see line 11676)

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:2606 hotkey_inputdev_close() warn: bit=
wise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3776 hotkey_notify_hotkey() warn: bitw=
ise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:10495 dytc_profile_refresh() error: un=
initialized symbol 'output'.

vim +/dmi_id +11770 drivers/platform/x86/thinkpad_acpi.c

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11631  =

f74a27d4bda42ee drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11632  =

1def7115f0277ce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11633  static int __init thinkpad_acpi_module_init(void)
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11634  {
c25d7f32e3e2094 drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11635  	const struct dmi_system_id *dmi_id;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11636  	int ret, i;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11637  =

8fef502e5a14df0 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-23  11638  	tpacpi_lifecycle =3D TPACPI_LIFE_INIT;
8fef502e5a14df0 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-23  11639  =

54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11640  	/* Driver-level probe */
d5a2f2f1d68e2da drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11641  =

bf20e740a4bcc68 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-07-21  11642  	ret =3D get_thinkpad_model_data(&thinkpad_id);
bf20e740a4bcc68 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-07-21  11643  	if (ret) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches           =
      2011-04-04  11644  		pr_err("unable to get DMI data: %d\n", ret);
bf20e740a4bcc68 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-07-21  11645  		thinkpad_acpi_module_exit();
bf20e740a4bcc68 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-07-21  11646  		return ret;
bf20e740a4bcc68 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-07-21  11647  	}
5fba344cfdbaa79 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11648  	ret =3D probe_for_thinkpad();
d5a2f2f1d68e2da drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11649  	if (ret) {
d5a2f2f1d68e2da drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11650  		thinkpad_acpi_module_exit();
5fba344cfdbaa79 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11651  		return ret;
d5a2f2f1d68e2da drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11652  	}
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11653  =

54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11654  	/* Driver initialization */
d5a2f2f1d68e2da drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11655  =

7a43f788988ac47 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11656  	thinkpad_acpi_init_banner();
7a43f788988ac47 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11657  	tpacpi_check_outdated_fw();
7a43f788988ac47 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11658  =

e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11659  	TPACPI_ACPIHANDLE_INIT(ecrd);
e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11660  	TPACPI_ACPIHANDLE_INIT(ecwr);
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11661  =

e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11662  	tpacpi_wq =3D create_singlethread_workqueue(TPACP=
I_WORKQUEUE_NAME);
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11663  	if (!tpacpi_wq) {
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11664  		thinkpad_acpi_module_exit();
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11665  		return -ENOMEM;
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11666  	}
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11667  =

e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11668  	proc_dir =3D proc_mkdir(TPACPI_PROC_DIR, acpi_roo=
t_dir);
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11669  	if (!proc_dir) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches           =
      2011-04-04  11670  		pr_err("unable to create proc dir " TPACPI_PROC_=
DIR "\n");
1def7115f0277ce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11671  		thinkpad_acpi_module_exit();
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11672  		return -ENODEV;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11673  	}
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11674  =

c25d7f32e3e2094 drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11675  	dmi_id =3D dmi_first_match(fwbug_list);
c25d7f32e3e2094 drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28 @11676  	if (dmi_id)
c25d7f32e3e2094 drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11677  		tp_features.quirks =3D dmi_id->driver_data;
c25d7f32e3e2094 drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11678  =

54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11679  	/* Device initialization */
e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11680  	tpacpi_pdev =3D platform_device_register_simple(T=
PACPI_DRVR_NAME, -1,
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11681  							NULL, 0);
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11682  	if (IS_ERR(tpacpi_pdev)) {
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11683  		ret =3D PTR_ERR(tpacpi_pdev);
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11684  		tpacpi_pdev =3D NULL;
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches           =
      2011-04-04  11685  		pr_err("unable to register platform device\n");
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11686  		thinkpad_acpi_module_exit();
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11687  		return ret;
54ae15014c306b3 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-24  11688  	}
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11689  	tpacpi_sensors_pdev =3D platform_device_register_=
simple(
e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11690  						TPACPI_HWMON_DRVR_NAME,
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11691  						-1, NULL, 0);
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11692  	if (IS_ERR(tpacpi_sensors_pdev)) {
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11693  		ret =3D PTR_ERR(tpacpi_sensors_pdev);
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11694  		tpacpi_sensors_pdev =3D NULL;
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches           =
      2011-04-04  11695  		pr_err("unable to register hwmon platform device=
\n");
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11696  		thinkpad_acpi_module_exit();
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11697  		return ret;
7fd400297978a2c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-25  11698  	}
6b99e3569ba17b9 drivers/platform/x86/thinkpad_acpi.c Stanislav Fomichev    =
      2017-06-20  11699  =

8523ed6fb2ca049 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-09-23  11700  	mutex_init(&tpacpi_inputdev_send_mutex);
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11701  	tpacpi_inputdev =3D input_allocate_device();
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11702  	if (!tpacpi_inputdev) {
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11703  		thinkpad_acpi_module_exit();
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11704  		return -ENOMEM;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11705  	} else {
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11706  		/* Prepare input device, but don't register */
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11707  		tpacpi_inputdev->name =3D "ThinkPad Extra Button=
s";
e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11708  		tpacpi_inputdev->phys =3D TPACPI_DRVR_NAME "/inp=
ut0";
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11709  		tpacpi_inputdev->id.bustype =3D BUS_HOST;
e28393c0c4416df drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11710  		tpacpi_inputdev->id.vendor =3D thinkpad_id.vendo=
r;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11711  		tpacpi_inputdev->id.product =3D TPACPI_HKEY_INPU=
T_PRODUCT;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11712  		tpacpi_inputdev->id.version =3D TPACPI_HKEY_INPU=
T_VERSION;
d112ef95d4ec1ee drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2009-12-09  11713  		tpacpi_inputdev->dev.parent =3D &tpacpi_pdev->de=
v;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11714  	}
77775838bb76173 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11715  =

77775838bb76173 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11716  	/* Init subdriver dependencies */
77775838bb76173 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11717  	tpacpi_detect_brightness_capabilities();
77775838bb76173 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11718  =

77775838bb76173 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-05-16  11719  	/* Init subdrivers */
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11720  	for (i =3D 0; i < ARRAY_SIZE(ibms_init); i++) {
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11721  		ret =3D ibm_init(&ibms_init[i]);
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11722  		if (ret >=3D 0 && *ibms_init[i].param)
a5763f2223ce3fd drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11723  			ret =3D ibms_init[i].data->write(ibms_init[i].p=
aram);
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11724  		if (ret < 0) {
1def7115f0277ce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-04-21  11725  			thinkpad_acpi_module_exit();
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11726  			return ret;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11727  		}
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11728  	}
b589ea4c44170d3 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-02-25  11729  =

b589ea4c44170d3 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-02-25  11730  	tpacpi_lifecycle =3D TPACPI_LIFE_RUNNING;
b589ea4c44170d3 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2010-02-25  11731  =

2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11732  	ret =3D platform_driver_register(&tpacpi_pdriver);
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11733  	if (ret) {
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11734  		pr_err("unable to register main platform driver\=
n");
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11735  		thinkpad_acpi_module_exit();
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11736  		return ret;
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11737  	}
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11738  	tp_features.platform_drv_registered =3D 1;
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11739  =

2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11740  	ret =3D platform_driver_register(&tpacpi_hwmon_pd=
river);
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11741  	if (ret) {
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11742  		pr_err("unable to register hwmon platform driver=
\n");
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11743  		thinkpad_acpi_module_exit();
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11744  		return ret;
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11745  	}
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11746  	tp_features.sensors_pdrv_registered =3D 1;
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11747  =

526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11748  	tpacpi_hwmon =3D hwmon_device_register_with_group=
s(
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11749  		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tp=
acpi_hwmon_groups);
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11750  	if (IS_ERR(tpacpi_hwmon)) {
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11751  		ret =3D PTR_ERR(tpacpi_hwmon);
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11752  		tpacpi_hwmon =3D NULL;
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11753  		pr_err("unable to register hwmon device\n");
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11754  		thinkpad_acpi_module_exit();
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11755  		return ret;
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11756  	}
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11757  =

7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11758  	ret =3D input_register_device(tpacpi_inputdev);
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11759  	if (ret < 0) {
0978e012cfbaca8 drivers/platform/x86/thinkpad_acpi.c Joe Perches           =
      2011-04-04  11760  		pr_err("unable to register input device\n");
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11761  		thinkpad_acpi_module_exit();
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11762  		return ret;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11763  	} else {
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11764  		tp_features.input_device_registered =3D 1;
7f5d1cd6287b7b2 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2007-07-18  11765  	}
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11766  =

455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11767  #ifdef CONFIG_SUSPEND
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11768  	if (tp_features.quirks && tp_features.quirks->s2i=
dle_bug_mmio) {
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11769  		if (!acpi_register_lps0_dev(&thinkpad_acpi_s2idl=
e_dev_ops))
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28 @11770  			pr_info("Using s2idle quirk to avoid %s platfor=
m firmware bug\n",
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11771  				(dmi_id && dmi_id->ident) ? dmi_id->ident : ""=
);
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11772  	}
455cd867b85b53f drivers/platform/x86/thinkpad_acpi.c Mario Limonciello     =
      2022-04-28  11773  #endif
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11774  	return 0;
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11775  }
^1da177e4c3f415 drivers/acpi/ibm_acpi.c              Linus Torvalds        =
      2005-04-16  11776  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0122862511556482395==--


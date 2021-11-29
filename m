Content-Type: multipart/mixed; boundary="===============0384909532074500576=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pdx86-platform-drivers-x86:for-next 31/36] drivers/platform/x86/thinkpad_acpi.c:11154 thinkpad_acpi_module_exit() error: don't call input_free_device() after input_unregister_device()
Date: Mon, 29 Nov 2021 23:16:58 +0800
Message-ID: <202111292341.pt8nIc7T-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0384909532074500576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git for-next
head:   e9ff190973df2c417c2a97a8b70e709e0bdc2716
commit: 67e7d50d13e94abeaf82e9945dce929352771b94 [31/36] platform/x86: thin=
kpad_acpi: Move input_unregister_device() to the top of thinkpad_acpi_modul=
e_exit()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20211129 (https://download.01.org/0day-ci/arch=
ive/20211129/202111292341.pt8nIc7T-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:11154 thinkpad_acpi_module_exit() erro=
r: don't call input_free_device() after input_unregister_device()

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:2591 hotkey_inputdev_close() warn: bit=
wise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3739 hotkey_notify_hotkey() warn: bitw=
ise AND condition is false here

vim +11154 drivers/platform/x86/thinkpad_acpi.c

a73f30916ee5244 drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hol=
schuh 2009-01-11  11129  =

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11130  static void thinkpad_acpi_module_exit(void)
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11131  {
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11132  	struct ibm_struct *ibm, *itmp;
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11133  =

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11134  	tpacpi_lifecycle =3D TPACPI_LIFE_EXITING;
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11135  =

67e7d50d13e94ab drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11136  	if (tp_features.input_device_registered)
67e7d50d13e94ab drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11137  		input_unregister_device(tpacpi_inputdev);
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11138  	if (tpacpi_hwmon)
526ac103dbc6729 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11139  		hwmon_device_unregister(tpacpi_hwmon);
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11140  	if (tp_features.sensors_pdrv_registered)
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11141  		platform_driver_unregister(&tpacpi_hwmon_pdriver=
);
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11142  	if (tp_features.platform_drv_registered)
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11143  		platform_driver_unregister(&tpacpi_pdriver);
2f5ad08f3eec8d4 drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11144  =

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11145  	list_for_each_entry_safe_reverse(ibm, itmp,
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11146  					 &tpacpi_all_drivers,
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11147  					 all_drivers) {
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11148  		ibm_exit(ibm);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11149  	}
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11150  =

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11151  	dbg_printk(TPACPI_DBG_INIT, "finished subdriver e=
xit path...\n");
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11152  =

67e7d50d13e94ab drivers/platform/x86/thinkpad_acpi.c Hans de Goede         =
      2021-11-23  11153  	if (tpacpi_inputdev)
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08 @11154  		input_free_device(tpacpi_inputdev);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11155  	if (tpacpi_sensors_pdev)
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11156  		platform_device_unregister(tpacpi_sensors_pdev);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11157  	if (tpacpi_pdev)
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11158  		platform_device_unregister(tpacpi_pdev);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11159  	if (proc_dir)
e0c7dfe70170cce drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11160  		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir=
);
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11161  	if (tpacpi_wq)
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11162  		destroy_workqueue(tpacpi_wq);
e0e3c0615abdb1c drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-04-26  11163  =

b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11164  	kfree(thinkpad_id.bios_version_str);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11165  	kfree(thinkpad_id.ec_version_str);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11166  	kfree(thinkpad_id.model_str);
d2be15bdda45b18 drivers/platform/x86/thinkpad_acpi.c Li Dongyang           =
      2012-07-25  11167  	kfree(thinkpad_id.nummodel_str);
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11168  }
b21a15f6d065e83 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hol=
schuh 2008-01-08  11169  =


:::::: The code at line 11154 was first introduced by commit
:::::: b21a15f6d065e837076cf417720afe1c3d6ed10d ACPI: thinkpad-acpi: spring=
 cleanup part 3

:::::: TO: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
:::::: CC: Len Brown <len.brown@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0384909532074500576==--


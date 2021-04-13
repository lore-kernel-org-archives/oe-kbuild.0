Content-Type: multipart/mixed; boundary="===============3864215874190557299=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/panasonic-laptop.c:495:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Wed, 14 Apr 2021 00:08:36 +0800
Message-ID: <202104140027.i5znf4iK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3864215874190557299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kenneth Chan <kenneth.t.chan@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   89698becf06d341a700913c3d89ce2a914af69a2
commit: 008563513348a5ab0324fb8976172fe56c939450 platform/x86: panasonic-la=
ptop: Fix sticky key init bug
date:   5 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +495 drivers/platform/x86/panasonic-laptop.c

709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  485  =

80373ad0edb53b drivers/platform/x86/panasonic-laptop.c Kenneth Chan 2020-08=
-22  486  static ssize_t sticky_key_show(struct device *dev, struct device_=
attribute *attr,
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  487  			   char *buf)
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  488  {
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  489  	struct acpi_device *acpi =3D to_acpi_device(dev);
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  490  	struct pcc_acpi *pcc =3D acpi_driver_data(acpi);
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  491  =

e253fb944d3335 drivers/platform/x86/panasonic-laptop.c Jean Delvare 2010-10=
-21  492  	if (!acpi_pcc_retrieve_biosdata(pcc))
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  493  		return -EIO;
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  494  =

008563513348a5 drivers/platform/x86/panasonic-laptop.c Kenneth Chan 2020-08=
-22 @495  	return snprintf(buf, PAGE_SIZE, "%u\n", pcc->sticky_key);
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  496  }
709ee531c15303 drivers/misc/panasonic-laptop.c         Harald Welte 2008-09=
-23  497  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3864215874190557299==--


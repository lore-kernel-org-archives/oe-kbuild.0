Content-Type: multipart/mixed; boundary="===============3886981174762970563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-rebased 120/133] drivers/acpi/svkl.c:164 acpi_svkl_init() warn: '&acpi_svkl_dev' not released on lines: 157.
Date: Wed, 16 Feb 2022 00:51:15 +0800
Message-ID: <202202160009.rI543Li4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3886981174762970563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-rebased
head:   36c91f6d572820e8556972fd7644bd96798e85d6
commit: 370c68664d53ff13dbd36847e140df02364387a5 [120/133] ACPI: Add SVKL t=
able support
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001-20220214 (https://download.01.org/0day-ci/ar=
chive/20220216/202202160009.rI543Li4-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/svkl.c:164 acpi_svkl_init() warn: '&acpi_svkl_dev' not release=
d on lines: 157.

vim +164 drivers/acpi/svkl.c

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  139  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  140  static int __ini=
t acpi_svkl_init(void)
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  141  {
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  142  	acpi_status sta=
tus =3D AE_OK;
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  143  	int ret;
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  144  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  145  	ret =3D misc_re=
gister(&acpi_svkl_dev);
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  146  	if (ret) {
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  147  		pr_err("SVKL: =
can't misc_register on minor=3D%d\n",
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  148  		       MISC_DY=
NAMIC_MINOR);
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  149  		return ret;
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  150  	}
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  151  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  152  	mutex_init(&svk=
l_lock);
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  153  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  154  	status =3D acpi=
_get_table(ACPI_SIG_SVKL, 0, &svkl_tbl_hdr);
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  155  	if (ACPI_FAILUR=
E(status) || !svkl_tbl_hdr) {
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  156  		pr_err("get ta=
ble failed\n");
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  157  		return -ENODEV;
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  158  	}
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  159  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  160  	dump_svkl_heade=
r();
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  161  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  162  	pr_info("ACPI: =
SVKL module loaded\n");
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  163  =

370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19 @164  	return 0;
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  165  }
370c68664d53ff Kuppuswamy Sathyanarayanan 2020-06-19  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3886981174762970563==--


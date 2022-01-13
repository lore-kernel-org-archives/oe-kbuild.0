Content-Type: multipart/mixed; boundary="===============9170457820897557979=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:tdx/guest-rebased 123/133] drivers/acpi/svkl.c:164 acpi_svkl_init() warn: '&acpi_svkl_dev' not released on lines: 157.
Date: Fri, 14 Jan 2022 07:04:56 +0800
Message-ID: <202201140712.0FfPwB6d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9170457820897557979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

tree:   https://github.com/intel/tdx.git tdx/guest-rebased
head:   e3995864d37c56f431c93fc3dc454d9c65f5e9ea
commit: 26c864b08bf871eb0ef04b33df5e7888594314eb [123/133] ACPI: Add SVKL t=
able support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20114/202201140712.0FfPwB6d-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/svkl.c:164 acpi_svkl_init() warn: '&acpi_svkl_dev' not release=
d on lines: 157.

vim +164 drivers/acpi/svkl.c

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  139  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  140  static int __ini=
t acpi_svkl_init(void)
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  141  {
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  142  	acpi_status sta=
tus =3D AE_OK;
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  143  	int ret;
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  144  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  145  	ret =3D misc_re=
gister(&acpi_svkl_dev);
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  146  	if (ret) {
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  147  		pr_err("SVKL: =
can't misc_register on minor=3D%d\n",
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  148  		       MISC_DY=
NAMIC_MINOR);
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  149  		return ret;
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  150  	}
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  151  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  152  	mutex_init(&svk=
l_lock);
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  153  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  154  	status =3D acpi=
_get_table(ACPI_SIG_SVKL, 0, &svkl_tbl_hdr);
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  155  	if (ACPI_FAILUR=
E(status) || !svkl_tbl_hdr) {
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  156  		pr_err("get ta=
ble failed\n");
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  157  		return -ENODEV;
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  158  	}
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  159  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  160  	dump_svkl_heade=
r();
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  161  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  162  	pr_info("ACPI: =
SVKL module loaded\n");
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  163  =

26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19 @164  	return 0;
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  165  }
26c864b08bf871 Kuppuswamy Sathyanarayanan 2020-06-19  166  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9170457820897557979==--


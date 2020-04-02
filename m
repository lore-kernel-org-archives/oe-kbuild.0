Content-Type: multipart/mixed; boundary="===============6122372521850432311=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] acpica: clear global_lock bits at FACS initialization
Date: Thu, 02 Apr 2020 14:28:41 +0300
Message-ID: <20200402112712.GN2001@kadam>
In-Reply-To: <20200330085852.31328-1-jengelh@inai.de>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6122372521850432311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jan,

url:    https://github.com/0day-ci/linux/commits/Jan-Engelhardt/acpica-clea=
r-global_lock-bits-at-FACS-initialization/20200330-183705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/acpica/tbutils.c:60 acpi_tb_initialize_facs() error: uninitial=
ized symbol 'facs'.

# https://github.com/0day-ci/linux/commit/cc0fd9e263391ff230ac700aa76dbcf71=
95c8c42
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout cc0fd9e263391ff230ac700aa76dbcf7195c8c42
vim +/facs +60 drivers/acpi/acpica/tbutils.c

009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  35 =
 acpi_status acpi_tb_initialize_facs(void)
009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  36 =
 {
7484619bff495c drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  37 =
 	struct acpi_table_facs *facs;
009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  38  =

22e5b40ab21fca drivers/acpi/acpica/tbutils.c Bob Moore      2011-11-16  39 =
 	/* If Hardware Reduced flag is set, there is no FACS */
22e5b40ab21fca drivers/acpi/acpica/tbutils.c Bob Moore      2011-11-16  40  =

22e5b40ab21fca drivers/acpi/acpica/tbutils.c Bob Moore      2011-11-16  41 =
 	if (acpi_gbl_reduced_hardware) {
22e5b40ab21fca drivers/acpi/acpica/tbutils.c Bob Moore      2011-11-16  42 =
 		acpi_gbl_FACS =3D NULL;
22e5b40ab21fca drivers/acpi/acpica/tbutils.c Bob Moore      2011-11-16  43 =
 		return (AE_OK);
8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  44 =
 	} else if (acpi_gbl_FADT.Xfacs &&
8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  45 =
 		   (!acpi_gbl_FADT.facs
8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  46 =
 		    || !acpi_gbl_use32_bit_facs_addresses)) {
8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  47 =
 		(void)acpi_get_table_by_index(acpi_gbl_xfacs_index,
c04e1fb4396d27 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  48 =
 					      ACPI_CAST_INDIRECT_PTR(struct
c04e1fb4396d27 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  49 =
 								     acpi_table_header,
7484619bff495c drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  50 =
 								     &facs));
7484619bff495c drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  51 =
 		acpi_gbl_FACS =3D facs;
8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  52 =
 	} else if (acpi_gbl_FADT.facs) {
                                                                           =
       ^^^^^^^

8ec3f459073e67 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  53 =
 		(void)acpi_get_table_by_index(acpi_gbl_facs_index,
009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  54 =
 					      ACPI_CAST_INDIRECT_PTR(struct
009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  55 =
 								     acpi_table_header,
7484619bff495c drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  56 =
 								     &facs));
7484619bff495c drivers/acpi/acpica/tbutils.c Lv Zheng       2015-08-25  57 =
 		acpi_gbl_FACS =3D facs;
c04e1fb4396d27 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  58 =
 	}

There is no else path, only else if paths.

cc0fd9e263391f drivers/acpi/acpica/tbutils.c Jan Engelhardt 2020-03-30  59 =
 	/* Clear potential garbage from the initial FACS table. */
cc0fd9e263391f drivers/acpi/acpica/tbutils.c Jan Engelhardt 2020-03-30 @60 =
 	if (facs !=3D NULL)
cc0fd9e263391f drivers/acpi/acpica/tbutils.c Jan Engelhardt 2020-03-30  61 =
 		facs->global_lock &=3D ~0x3;
c04e1fb4396d27 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  62  =

f06147f9fbf134 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  63 =
 	/* If there is no FACS, just continue. There was already an error msg */
f06147f9fbf134 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  64  =

c04e1fb4396d27 drivers/acpi/acpica/tbutils.c Lv Zheng       2015-07-01  65 =
 	return (AE_OK);
009c4cbe99bea2 drivers/acpi/tables/tbutils.c Bob Moore      2008-11-12  66 =
 }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6122372521850432311==--


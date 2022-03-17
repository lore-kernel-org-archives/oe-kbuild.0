Content-Type: multipart/mixed; boundary="===============7329125819614067533=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/3] ACPI / x86: Add support for LPS0 callback handler
Date: Thu, 17 Mar 2022 16:23:18 +0800
Message-ID: <202203171657.uF7h6TEG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7329125819614067533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220316212924.5619-1-mario.limonciello@amd.com>
References: <20220316212924.5619-1-mario.limonciello@amd.com>
TO: Mario Limonciello <mario.limonciello@amd.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: Mark Gross <mgross@linux.intel.com>
TO: "Rafael J . Wysocki" <rjw@rjwysocki.net>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
CC: linux-acpi(a)vger.kernel.org
CC: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC: Goswami Sanket <Sanket.Goswami@amd.com>
CC: Mario Limonciello <mario.limonciello@amd.com>

Hi Mario,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220315]
[also build test WARNING on v5.17-rc8]
[cannot apply to rafael-pm/linux-next linus/master platform-drivers-x86/for=
-next v5.17-rc8 v5.17-rc7 v5.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mario-Limonciello/ACPI-x86=
-Add-support-for-LPS0-callback-handler/20220317-053103
base:    a32cd981a6da2373c093d471ee4405a915e217d5
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
317/202203171657.uF7h6TEG-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/acpi/x86/s2idle.c:478 acpi_s2idle_prepare_late() error: we previous=
ly assumed 'handler' could be null (see line 479)

vim +/handler +478 drivers/acpi/x86/s2idle.c

fef98671194be0 Rafael J. Wysocki  2020-12-17  442  =

fef98671194be0 Rafael J. Wysocki  2020-12-17  443  int acpi_s2idle_prepare_=
late(void)
fef98671194be0 Rafael J. Wysocki  2020-12-17  444  {
4be2feac72a3ad Mario Limonciello  2022-03-16  445  	struct acpi_s2idle_dev_=
ops *handler;
4be2feac72a3ad Mario Limonciello  2022-03-16  446  =

fef98671194be0 Rafael J. Wysocki  2020-12-17  447  	if (!lps0_device_handle=
 || sleep_no_lps0)
fef98671194be0 Rafael J. Wysocki  2020-12-17  448  		return 0;
fef98671194be0 Rafael J. Wysocki  2020-12-17  449  =

fef98671194be0 Rafael J. Wysocki  2020-12-17  450  	if (pm_debug_messages_o=
n)
fef98671194be0 Rafael J. Wysocki  2020-12-17  451  		lpi_check_constraints(=
);
fef98671194be0 Rafael J. Wysocki  2020-12-17  452  =

fa209644a7124b Mario Limonciello  2021-09-01  453  	/* Screen off */
fa209644a7124b Mario Limonciello  2021-09-01  454  	if (lps0_dsm_func_mask =
> 0)
fa209644a7124b Mario Limonciello  2021-09-01  455  		acpi_sleep_run_lps0_ds=
m(acpi_s2idle_vendor_amd() ?
fa209644a7124b Mario Limonciello  2021-09-01  456  					ACPI_LPS0_SCREEN_OF=
F_AMD :
fa209644a7124b Mario Limonciello  2021-09-01  457  					ACPI_LPS0_SCREEN_OF=
F,
3f4b116c0b3955 Pratik Vishwakarma 2021-06-17  458  					lps0_dsm_func_mask,=
 lps0_dsm_guid);
fa209644a7124b Mario Limonciello  2021-09-01  459  =

fa209644a7124b Mario Limonciello  2021-09-01  460  	if (lps0_dsm_func_mask_=
microsoft > 0)
3f4b116c0b3955 Pratik Vishwakarma 2021-06-17  461  		acpi_sleep_run_lps0_ds=
m(ACPI_LPS0_SCREEN_OFF,
fa209644a7124b Mario Limonciello  2021-09-01  462  				lps0_dsm_func_mask_m=
icrosoft, lps0_dsm_guid_microsoft);
fa209644a7124b Mario Limonciello  2021-09-01  463  =

fa209644a7124b Mario Limonciello  2021-09-01  464  	/* LPS0 entry */
fa209644a7124b Mario Limonciello  2021-09-01  465  	if (lps0_dsm_func_mask =
> 0)
fa209644a7124b Mario Limonciello  2021-09-01  466  		acpi_sleep_run_lps0_ds=
m(acpi_s2idle_vendor_amd() ?
fa209644a7124b Mario Limonciello  2021-09-01  467  					ACPI_LPS0_ENTRY_AMD=
 :
fa209644a7124b Mario Limonciello  2021-09-01  468  					ACPI_LPS0_ENTRY,
3f4b116c0b3955 Pratik Vishwakarma 2021-06-17  469  					lps0_dsm_func_mask,=
 lps0_dsm_guid);
fa209644a7124b Mario Limonciello  2021-09-01  470  	if (lps0_dsm_func_mask_=
microsoft > 0) {
3f4b116c0b3955 Pratik Vishwakarma 2021-06-17  471  		acpi_sleep_run_lps0_ds=
m(ACPI_LPS0_ENTRY,
fa209644a7124b Mario Limonciello  2021-09-01  472  				lps0_dsm_func_mask_m=
icrosoft, lps0_dsm_guid_microsoft);
fa209644a7124b Mario Limonciello  2021-09-01  473  		/* modern standby entr=
y */
fa209644a7124b Mario Limonciello  2021-09-01  474  		acpi_sleep_run_lps0_ds=
m(ACPI_LPS0_MS_ENTRY,
fa209644a7124b Mario Limonciello  2021-09-01  475  				lps0_dsm_func_mask_m=
icrosoft, lps0_dsm_guid_microsoft);
fef98671194be0 Rafael J. Wysocki  2020-12-17  476  	}
4be2feac72a3ad Mario Limonciello  2022-03-16  477  =

4be2feac72a3ad Mario Limonciello  2022-03-16 @478  	list_for_each_entry(han=
dler, &lps0_s2idle_devops_head, list_node) {
4be2feac72a3ad Mario Limonciello  2022-03-16 @479  		if (handler)
4be2feac72a3ad Mario Limonciello  2022-03-16  480  			handler->prepare();
4be2feac72a3ad Mario Limonciello  2022-03-16  481  	}
4be2feac72a3ad Mario Limonciello  2022-03-16  482  =

fef98671194be0 Rafael J. Wysocki  2020-12-17  483  	return 0;
fef98671194be0 Rafael J. Wysocki  2020-12-17  484  }
fef98671194be0 Rafael J. Wysocki  2020-12-17  485  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7329125819614067533==--


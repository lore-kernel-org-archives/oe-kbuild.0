Content-Type: multipart/mixed; boundary="===============7474433316494794135=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/thinkpad_acpi.c:10370 dytc_profile_refresh() error: uninitialized symbol 'output'.
Date: Tue, 09 Aug 2022 23:12:46 +0800
Message-ID: <202208092323.733iC81l-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7474433316494794135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mark Pearson <markpearson@lenovo.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eb555cb5b794f4e12a9897f3d46d5a72104cd4a7
commit: e1c21608e3cfc4b44ecdf04e12986b6564667095 platform/x86: thinkpad_acp=
i: Add PSC mode support
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021-20220808 (https://download.01.org/0day-ci/arch=
ive/20220809/202208092323.733iC81l-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:10370 dytc_profile_refresh() error: un=
initialized symbol 'output'.

Old smatch warnings:
drivers/platform/x86/thinkpad_acpi.c:2591 hotkey_inputdev_close() warn: bit=
wise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:3761 hotkey_notify_hotkey() warn: bitw=
ise AND condition is false here
drivers/platform/x86/thinkpad_acpi.c:10367 dytc_profile_refresh() error: un=
initialized symbol 'err'.

vim +/output +10370 drivers/platform/x86/thinkpad_acpi.c

c3bfcd4c676238e Mark Pearson 2021-01-11  10350  =

c3bfcd4c676238e Mark Pearson 2021-01-11  10351  static void dytc_profile_re=
fresh(void)
c3bfcd4c676238e Mark Pearson 2021-01-11  10352  {
c3bfcd4c676238e Mark Pearson 2021-01-11  10353  	enum platform_profile_opti=
on profile;
c3bfcd4c676238e Mark Pearson 2021-01-11  10354  	int output, err;
c3bfcd4c676238e Mark Pearson 2021-01-11  10355  	int perfmode;
c3bfcd4c676238e Mark Pearson 2021-01-11  10356  =

c3bfcd4c676238e Mark Pearson 2021-01-11  10357  	mutex_lock(&dytc_mutex);
e1c21608e3cfc4b Mark Pearson 2022-02-25  10358  	if (dytc_profile_available=
 =3D=3D DYTC_FUNCMODE_MMC) {
7a47f86bba748b3 Mark Pearson 2021-04-06  10359  		if (dytc_mmc_get_availabl=
e)
7a47f86bba748b3 Mark Pearson 2021-04-06  10360  			err =3D dytc_command(DYT=
C_CMD_MMC_GET, &output);
7a47f86bba748b3 Mark Pearson 2021-04-06  10361  		else
c3bfcd4c676238e Mark Pearson 2021-01-11  10362  			err =3D dytc_cql_command=
(DYTC_CMD_GET, &output);
e1c21608e3cfc4b Mark Pearson 2022-02-25  10363  	} else if (dytc_profile_av=
ailable =3D=3D DYTC_FUNCMODE_PSC)
e1c21608e3cfc4b Mark Pearson 2022-02-25  10364  		err =3D dytc_command(DYTC=
_CMD_GET, &output);
e1c21608e3cfc4b Mark Pearson 2022-02-25  10365  =

c3bfcd4c676238e Mark Pearson 2021-01-11  10366  	mutex_unlock(&dytc_mutex);
c3bfcd4c676238e Mark Pearson 2021-01-11  10367  	if (err)
c3bfcd4c676238e Mark Pearson 2021-01-11  10368  		return;
c3bfcd4c676238e Mark Pearson 2021-01-11  10369  =

c3bfcd4c676238e Mark Pearson 2021-01-11 @10370  	perfmode =3D (output >> DY=
TC_GET_MODE_BIT) & 0xF;
c3bfcd4c676238e Mark Pearson 2021-01-11  10371  	convert_dytc_to_profile(pe=
rfmode, &profile);
c3bfcd4c676238e Mark Pearson 2021-01-11  10372  	if (profile !=3D dytc_curr=
ent_profile) {
c3bfcd4c676238e Mark Pearson 2021-01-11  10373  		dytc_current_profile =3D =
profile;
c3bfcd4c676238e Mark Pearson 2021-01-11  10374  		platform_profile_notify();
c3bfcd4c676238e Mark Pearson 2021-01-11  10375  	}
c3bfcd4c676238e Mark Pearson 2021-01-11  10376  }
c3bfcd4c676238e Mark Pearson 2021-01-11  10377  =


:::::: The code at line 10370 was first introduced by commit
:::::: c3bfcd4c676238e198d5a798b50e5d424bf05497 platform/x86: thinkpad_acpi=
: Add platform profile support

:::::: TO: Mark Pearson <markpearson@lenovo.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7474433316494794135==--


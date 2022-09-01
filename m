Content-Type: multipart/mixed; boundary="===============6582624183409816042=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/thinkpad_acpi.c:10370 dytc_profile_refresh() error: uninitialized symbol 'output'.
Date: Thu, 01 Sep 2022 22:42:50 +0800
Message-ID: <202209012248.1qKtUn8f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6582624183409816042==
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
head:   c5e4d5e99162ba8025d58a3af7ad103f155d2df7
commit: e1c21608e3cfc4b44ecdf04e12986b6564667095 platform/x86: thinkpad_acp=
i: Add PSC mode support
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m031-20220829 (https://download.01.org/0day-ci/ar=
chive/20220901/202209012248.1qKtUn8f-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

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

c3bfcd4c676238 Mark Pearson 2021-01-11  10350  =

c3bfcd4c676238 Mark Pearson 2021-01-11  10351  static void dytc_profile_ref=
resh(void)
c3bfcd4c676238 Mark Pearson 2021-01-11  10352  {
c3bfcd4c676238 Mark Pearson 2021-01-11  10353  	enum platform_profile_optio=
n profile;
c3bfcd4c676238 Mark Pearson 2021-01-11  10354  	int output, err;
c3bfcd4c676238 Mark Pearson 2021-01-11  10355  	int perfmode;
c3bfcd4c676238 Mark Pearson 2021-01-11  10356  =

c3bfcd4c676238 Mark Pearson 2021-01-11  10357  	mutex_lock(&dytc_mutex);
e1c21608e3cfc4 Mark Pearson 2022-02-25  10358  	if (dytc_profile_available =
=3D=3D DYTC_FUNCMODE_MMC) {
7a47f86bba748b Mark Pearson 2021-04-06  10359  		if (dytc_mmc_get_available)
7a47f86bba748b Mark Pearson 2021-04-06  10360  			err =3D dytc_command(DYTC=
_CMD_MMC_GET, &output);
7a47f86bba748b Mark Pearson 2021-04-06  10361  		else
c3bfcd4c676238 Mark Pearson 2021-01-11  10362  			err =3D dytc_cql_command(=
DYTC_CMD_GET, &output);
e1c21608e3cfc4 Mark Pearson 2022-02-25  10363  	} else if (dytc_profile_ava=
ilable =3D=3D DYTC_FUNCMODE_PSC)
e1c21608e3cfc4 Mark Pearson 2022-02-25  10364  		err =3D dytc_command(DYTC_=
CMD_GET, &output);
e1c21608e3cfc4 Mark Pearson 2022-02-25  10365  =

c3bfcd4c676238 Mark Pearson 2021-01-11  10366  	mutex_unlock(&dytc_mutex);
c3bfcd4c676238 Mark Pearson 2021-01-11  10367  	if (err)
c3bfcd4c676238 Mark Pearson 2021-01-11  10368  		return;
c3bfcd4c676238 Mark Pearson 2021-01-11  10369  =

c3bfcd4c676238 Mark Pearson 2021-01-11 @10370  	perfmode =3D (output >> DYT=
C_GET_MODE_BIT) & 0xF;
c3bfcd4c676238 Mark Pearson 2021-01-11  10371  	convert_dytc_to_profile(per=
fmode, &profile);
c3bfcd4c676238 Mark Pearson 2021-01-11  10372  	if (profile !=3D dytc_curre=
nt_profile) {
c3bfcd4c676238 Mark Pearson 2021-01-11  10373  		dytc_current_profile =3D p=
rofile;
c3bfcd4c676238 Mark Pearson 2021-01-11  10374  		platform_profile_notify();
c3bfcd4c676238 Mark Pearson 2021-01-11  10375  	}
c3bfcd4c676238 Mark Pearson 2021-01-11  10376  }
c3bfcd4c676238 Mark Pearson 2021-01-11  10377  =


:::::: The code at line 10370 was first introduced by commit
:::::: c3bfcd4c676238e198d5a798b50e5d424bf05497 platform/x86: thinkpad_acpi=
: Add platform profile support

:::::: TO: Mark Pearson <markpearson@lenovo.com>
:::::: CC: Hans de Goede <hdegoede@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6582624183409816042==--


Content-Type: multipart/mixed; boundary="===============5953534134075913562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 2/21] drivers/platform/x86/intel/pmc/core.c:702:60-61: WARNING opportunity for kobj_to_dev()
Date: Tue, 26 Apr 2022 19:23:58 +0800
Message-ID: <202204261959.XjOAEMVu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5953534134075913562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Dutta, Ranjan" <ranjan.dutta@intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   6410aba3b60feba47b9713f297d9b3bdb79981f5
commit: 7dedd84bf98ed8d614e6803403d773c9566b333a [2/21] platform/x86: intel=
_pmc_core: Move to intel sub-directory
:::::: branch date: 6 days ago
:::::: commit date: 7 months ago
config: i386-randconfig-c021-20220425 (https://download.01.org/0day-ci/arch=
ive/20220426/202204261959.XjOAEMVu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/intel/pmc/core.c:702:60-61: WARNING opportunity for=
 kobj_to_dev()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5953534134075913562==--


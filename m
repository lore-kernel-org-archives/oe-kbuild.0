Content-Type: multipart/mixed; boundary="===============7601819180682646846=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 5/12] Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs from latest version at 'include/uapi/linux/sched.h': 13> #define CLONE_PIDFD 0x00001000 /* set if a pidfd should be placed in parent */
Date: Tue, 27 Jul 2021 08:32:07 +0800
Message-ID: <202107270852.AaqmfquY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7601819180682646846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   0c4addb71853e2be2d0895b8d9f1fc3f20811ac8
commit: 66faab946ab578e5fdac93ceb45207ee96e634b9 [5/12] UPSTREAM: clone: ad=
d CLONE_PIDFD
:::::: branch date: 1 year, 11 months ago
:::::: commit date: 1 year, 11 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/linux/sched.h' differs=
 from latest version at 'include/uapi/linux/sched.h':   13> #define CLONE_P=
IDFD	0x00001000	/* set if a pidfd should be placed in parent */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7601819180682646846==--


Content-Type: multipart/mixed; boundary="===============6737803559580311878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 78/106] Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from latest version at 'include/linux/bits.h': 4>
Date: Tue, 27 Jul 2021 09:19:11 +0800
Message-ID: <202107270957.JXUqPG1Q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6737803559580311878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   a1728ecf5aed447128ca7143f29d8b0f5f6263c5
commit: a75454a7af71b491674d0432edb3644bd62b9f37 [78/106] BACKPORT: linux/b=
its.h: Extract common header for vDSO
:::::: branch date: 1 year, 3 months ago
:::::: commit date: 1 year, 3 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from =
latest version at 'include/linux/bits.h':    4> =

>> Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from =
latest version at 'include/linux/bits.h':    5> #include <linux/const.h>
   Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from =
latest version at 'include/linux/bits.h':    6> #include <vdso/bits.h>
>> Warning: Kernel ABI header at 'tools/include/linux/bits.h' differs from =
latest version at 'include/linux/bits.h':    6< #define BIT(nr)			(1UL << (=
nr))

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6737803559580311878==--


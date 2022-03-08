Content-Type: multipart/mixed; boundary="===============8810455241920624090=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [andrea-aa:main 38/51] mm/userfaultfd.c:743:13-14: WARNING opportunity for swap()
Date: Tue, 08 Mar 2022 21:05:07 +0800
Message-ID: <202203082010.aZticNAg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8810455241920624090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andrea Arcangeli <aarcange@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git main
head:   597056f5070bec9190a9b6389eb5fcc07ce2cd14
commit: e551a4a9e99d2595c4f1c1ca7b6a62f4b70da1f4 [38/51] userfaultfd: UFFDI=
O_REMAP uABI
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20308/202203082010.aZticNAg-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/userfaultfd.c:743:13-14: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8810455241920624090==--


Content-Type: multipart/mixed; boundary="===============6941228584088593019=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [andrea-aa:main 38/50] mm/huge_memory.c:1987:2-5: WARNING: Use BUG_ON instead of if condition followed by BUG.
Date: Thu, 23 Dec 2021 10:54:39 +0800
Message-ID: <202112231022.y4gialKQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6941228584088593019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrea Arcangeli <aarcange@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git main
head:   e37fc15fcde08ff18027c1a1e34b2371ac2c449b
commit: f656fca095eaa2bc257fee306e02c92f229031c9 [38/50] userfaultfd: UFFDI=
O_REMAP uABI
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: sparc64-randconfig-c004-20211222 (https://download.01.org/0day-ci/a=
rchive/20211223/202112231022.y4gialKQ-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/huge_memory.c:1987:2-5: WARNING: Use BUG_ON instead of if condition f=
ollowed by BUG.
   Please make sure the condition has no side effects (see conditional BUG_=
ON definition in include/asm-generic/bug.h)
--
>> mm/userfaultfd.c:865:3-6: WARNING: Use BUG_ON instead of if condition fo=
llowed by BUG.
   Please make sure the condition has no side effects (see conditional BUG_=
ON definition in include/asm-generic/bug.h)
   mm/userfaultfd.c:917:3-6: WARNING: Use BUG_ON instead of if condition fo=
llowed by BUG.
   Please make sure the condition has no side effects (see conditional BUG_=
ON definition in include/asm-generic/bug.h)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6941228584088593019==--


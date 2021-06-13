Content-Type: multipart/mixed; boundary="===============6176869003729329939=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 176/364] fs/ocfs2/dir.c: linux/iversion.h is included more than once.
Date: Mon, 14 Jun 2021 05:07:07 +0800
Message-ID: <202106140504.3i6qcifs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6176869003729329939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: be65473fb5b77d57d8955beffd5aa370cfdae467 [176/364] sched/headers, r=
cu: Remove <linux/sched/signal.h> dependency from <linux/rcuwait.h>
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/ocfs2/dir.c: linux/iversion.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6176869003729329939==--


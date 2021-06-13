Content-Type: multipart/mixed; boundary="===============6772275837873695718=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 223/364] fs/namei.c: linux/audit.h is included more than once.
Date: Mon, 14 Jun 2021 05:18:54 +0800
Message-ID: <202106140551.0OCae6Pb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6772275837873695718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 25f492130c2aeb29ca88f0207dd616730af84ea9 [223/364] sched/headers, a=
udit: Uninline audit_inode_child()
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/namei.c: linux/audit.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6772275837873695718==--


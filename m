Content-Type: multipart/mixed; boundary="===============8697403958145791313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 290/364] fs/ocfs2/dlm/dlmrecovery.c: linux/stringhash.h is included more than once.
Date: Mon, 14 Jun 2021 05:30:27 +0800
Message-ID: <202106140518.jzHE1rg3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8697403958145791313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Mark Fasheh <mark@fasheh.com>
CC: Joel Becker <jlbec@evilplan.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Wengang Wang <wen.gang.wang@oracle.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: b6aa10593ad119b8d92047471b69297bcdf70684 [290/364] sched/headers, f=
s: Optimize <linux/fs.h> header dependencies
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/ocfs2/dlm/dlmrecovery.c: linux/stringhash.h is included more than onc=
e.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8697403958145791313==--


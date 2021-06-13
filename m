Content-Type: multipart/mixed; boundary="===============7945635735707994259=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 324/364] net/core/sock.c: linux/poll.h is included more than once.
Date: Mon, 14 Jun 2021 05:54:39 +0800
Message-ID: <202106140531.d6mTrw0o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7945635735707994259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Miaohe Lin <linmiaohe@huawei.com>
CC: Tonghao Zhang <xiangxia.m.yue@gmail.com>
CC: Kees Cook <keescook@chromium.org>
CC: Alexander Aring <aahringo@redhat.com>
CC: netdev(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 35a241c0a90b26d9d234159ba6bab28fb5b5b490 [324/364] sched/headers, n=
et: Uninline sock_poll_wait()
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> net/core/sock.c: linux/poll.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7945635735707994259==--


Content-Type: multipart/mixed; boundary="===============2831949639638319424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:tmp.tmp2 341/364] kernel/bpf/inode.c: linux/seq_file.h is included more than once.
Date: Mon, 14 Jun 2021 06:07:38 +0800
Message-ID: <202106140635.xPl1Nnzg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2831949639638319424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Ingo Molnar <mingo@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Song Liu <songliubraving@fb.com>
CC: Yonghong Song <yhs@fb.com>
CC: John Fastabend <john.fastabend@gmail.com>
CC: KP Singh <kpsingh@kernel.org>
CC: netdev(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tmp.tmp2
head:   adcceb5eb7aee38e4a9c15bdf599655f0e1b1324
commit: 324790b01da9f4a1e5ed4ab395e18a27a8768b8f [341/364] sched/headers, n=
et: Optimize <net/net_namespace_types.h> and <net/net_namespace.h>
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> kernel/bpf/inode.c: linux/seq_file.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2831949639638319424==--


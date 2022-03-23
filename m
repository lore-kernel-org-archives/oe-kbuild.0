Content-Type: multipart/mixed; boundary="===============6305646905499511734=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12708/14268] kernel/trace/bpf_trace.c:2452:12-20: WARNING opportunity for vmemdup_user
Date: Thu, 24 Mar 2022 01:51:56 +0800
Message-ID: <202203240123.fekjlTYX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6305646905499511734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiri Olsa <jolsa@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b61581ae229d8eb9f21f8753be3f4011f7692384
commit: ca74823c6e16dd42b7cf60d9fdde80e2a81a67bb [12708/14268] bpf: Add coo=
kie support to programs attached with kprobe multi link
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20324/202203240123.fekjlTYX-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:2452:12-20: WARNING opportunity for vmemdup_user
--
>> kernel/trace/bpf_trace.c:2267:34-35: WARNING opportunity for swap()
   kernel/trace/bpf_trace.c:2268:40-41: WARNING opportunity for swap()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6305646905499511734==--


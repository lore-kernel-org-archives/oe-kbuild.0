Content-Type: multipart/mixed; boundary="===============2549153848965989923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] mm: introduce process_reap system call
Date: Thu, 24 Jun 2021 04:43:52 +0800
Message-ID: <202106240437.qSlLOd46-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2549153848965989923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210623192822.3072029-1-surenb@google.com>
References: <20210623192822.3072029-1-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>
TO: akpm(a)linux-foundation.org
CC: mhocko(a)kernel.org
CC: mhocko(a)suse.com
CC: rientjes(a)google.com
CC: willy(a)infradead.org
CC: hannes(a)cmpxchg.org
CC: guro(a)fb.com
CC: riel(a)surriel.com
CC: minchan(a)kernel.org
CC: christian(a)brauner.io

Hi Suren,

I love your patch! Perhaps something to improve:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on tip/x86/asm linus/master v5.13-rc7]
[cannot apply to hnaz-linux-mm/master next-20210623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Suren-Baghdasaryan/mm-intr=
oduce-process_reap-system-call/20210624-032923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
:::::: branch date: 74 minutes ago
:::::: commit date: 74 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/sy=
scall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/sys=
call.tbl':  525< 443	common	quotactl_path			sys_quotactl_path
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/sy=
scall.tbl' differs from latest version@'arch/powerpc/kernel/syscalls/sys=
call.tbl':  525> # 443 reserved for quotactl_path
>> Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/sy=
scall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/sys=
call.tbl':  529> 447	common	process_reap			sys_process_reap
--
   Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_6=
4.tbl':  367< 443	common	quotactl_path		sys_quotactl_path
   Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version@'arch/x86/entry/syscalls/syscall_6=
4.tbl':  367> # 443 reserved for quotactl_path
>> Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_6=
4.tbl':  371> 447	common	process_reap		sys_process_reap
--
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.t=
bl':  448< 443  common	quotactl_path		sys_quotactl_path		sys_quotactl_path
   Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version@'arch/s390/kernel/syscalls/syscall.t=
bl':  448> # 443 reserved for quotactl_path
>> Warning: Kernel ABI header at 'tools/perf/arch/s390/entry/syscalls/sysca=
ll.tbl' differs from latest version at 'arch/s390/kernel/syscalls/syscall.t=
bl':  452> 447  common	process_reap		sys_process_reap		sys_process_reap
--
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  875> #=
define __NR_process_reap 447
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  876> _=
_SYSCALL(__NR_process_reap, sys_process_reap)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  877< #=
define __NR_syscalls 447
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version@'include/uapi/asm-generic/unistd.h':  879> #=
define __NR_syscalls 448
--
   Warning: Kernel ABI header at 'tools/perf/arch/mips/entry/syscalls/sysca=
ll_n64.tbl' differs from latest version at 'arch/mips/kernel/syscalls/sysca=
ll_n64.tbl':  360< 443	n64	quotactl_path			sys_quotactl_path
   Warning: Kernel ABI header at 'tools/perf/arch/mips/entry/syscalls/sysca=
ll_n64.tbl' differs from latest version@'arch/mips/kernel/syscalls/sysca=
ll_n64.tbl':  360> # 443 reserved for quotactl_path
>> Warning: Kernel ABI header at 'tools/perf/arch/mips/entry/syscalls/sysca=
ll_n64.tbl' differs from latest version at 'arch/mips/kernel/syscalls/sysca=
ll_n64.tbl':  364> 447	n64	process_reap			sys_process_reap

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2549153848965989923==--


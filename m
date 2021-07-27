Content-Type: multipart/mixed; boundary="===============0930417716950716854=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 11/12] Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h': 741> #define __NR_pidfd_open 434
Date: Tue, 27 Jul 2021 08:42:10 +0800
Message-ID: <202107270856.cTnfQPwE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0930417716950716854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   0c4addb71853e2be2d0895b8d9f1fc3f20811ac8
commit: 6c0620339fa75a3df127fd63c3f145c7dab9d523 [11/12] BACKPORT: arch: wi=
re-up pidfd_open()
:::::: branch date: 1 year, 11 months ago
:::::: commit date: 1 year, 11 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  739> #=
define __NR_pidfd_send_signal 424
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  740> _=
_SYSCALL(__NR_pidfd_send_signal, sys_pidfd_send_signal)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  741> #=
define __NR_pidfd_open 434
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  742> _=
_SYSCALL(__NR_pidfd_open, sys_pidfd_open)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  741< #=
define __NR_syscalls 294
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version@'include/uapi/asm-generic/unistd.h':  745> #=
define __NR_syscalls 435
--
   Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_6=
4.tbl':  346> 424	common	pidfd_send_signal	__x64_sys_pidfd_send_signal
>> Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_6=
4.tbl':  347> 434	common	pidfd_open		__x64_sys_pidfd_open

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0930417716950716854==--


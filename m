Content-Type: multipart/mixed; boundary="===============1979375886586406871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android-4.19 1/12] Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h': 739> #define __NR_pidfd_send_signal 424
Date: Tue, 27 Jul 2021 08:16:31 +0800
Message-ID: <202107270817.M4PsimZv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1979375886586406871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-4.19
head:   0c4addb71853e2be2d0895b8d9f1fc3f20811ac8
commit: 1f27ef8d9ba35de13165823031fec2a365749ca1 [1/12] BACKPORT: signal: a=
dd pidfd_send_signal() syscall
:::::: branch date: 1 year, 11 months ago
:::::: commit date: 1 year, 11 months ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  739> #=
define __NR_pidfd_send_signal 424
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  740> _=
_SYSCALL(__NR_pidfd_send_signal, sys_pidfd_send_signal)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  741< #=
define __NR_syscalls 294
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version@'include/uapi/asm-generic/unistd.h':  743> #=
define __NR_syscalls 425
--
>> Warning: Kernel ABI header at 'tools/perf/arch/x86/entry/syscalls/syscal=
l_64.tbl' differs from latest version at 'arch/x86/entry/syscalls/syscall_6=
4.tbl':  346> 424	common	pidfd_send_signal	__x64_sys_pidfd_send_signal

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1979375886586406871==--


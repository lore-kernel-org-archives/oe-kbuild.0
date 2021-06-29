Content-Type: multipart/mixed; boundary="===============4866249479408472589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.13/futex2 1/8] Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' differs from latest version at 'include/uapi/asm-generic/unistd.h': 876< __SYSCALL(__NR_futex_wait, sys_futex_wait)
Date: Tue, 29 Jun 2021 08:24:39 +0800
Message-ID: <202106290835.6m9tmsAw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4866249479408472589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.13/futex2
head:   2568c65603cd0168a29fdf4564d80e447117916a
commit: c193c6dd67f30469a90c1bb22a7b0a86f77d6717 [1/8] futex2: Implement wa=
it and wake functions
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  876< _=
_SYSCALL(__NR_futex_wait, sys_futex_wait)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  876> _=
_SC_COMP(__NR_futex_wait, sys_futex_wait, compat_sys_futex_wait)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4866249479408472589==--


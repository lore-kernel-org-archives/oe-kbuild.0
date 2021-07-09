Content-Type: multipart/mixed; boundary="===============4978193480513788074=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 01/11] futex2: Implement wait and wake functions
Date: Fri, 09 Jul 2021 09:37:01 +0800
Message-ID: <202107090935.Wk1iWR1f-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4978193480513788074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210709001328.329716-2-andrealmeid@collabora.com>
References: <20210709001328.329716-2-andrealmeid@collabora.com>
TO: "Andr=C3=A9 Almeida" <andrealmeid@collabora.com>

Hi "Andr=C3=A9,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on tip/x86/asm asm-generic/master tip/master linus=
/master v5.13]
[cannot apply to next-20210708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andr-Almeida/Add-futex2-sy=
scalls/20210709-081529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git d1bbfd0=
c7c9f985e57795a7e0cefc209ebf689c0
:::::: branch date: 81 minutes ago
:::::: commit date: 81 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  876> #=
define __NR_futex_wait 447
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  877> _=
_SC_COMP(__NR_futex_wait, sys_futex_wait, compat_sys_futex_wait)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  878> #=
define __NR_futex_wake 448
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  879> _=
_SYSCALL(__NR_futex_wake, sys_futex_wake)
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  880> =

   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version at 'include/uapi/asm-generic/unistd.h':  877< #=
define __NR_syscalls 447
   Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/unistd.h' =
differs from latest version@'include/uapi/asm-generic/unistd.h':  882> #=
define __NR_syscalls 449

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4978193480513788074==--


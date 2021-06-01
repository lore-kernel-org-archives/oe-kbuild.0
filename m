Content-Type: multipart/mixed; boundary="===============5585994378815194957=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/cpu 4/4] Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h': 111< /* free ( 3*32+29) */
Date: Wed, 02 Jun 2021 04:10:02 +0800
Message-ID: <202106020455.g80vwFUH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5585994378815194957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
head:   cbcddaa33d7e11a053cb80a4a635c023b4f8b906
commit: cbcddaa33d7e11a053cb80a4a635c023b4f8b906 [4/4] perf/x86/rapl: Use C=
PUID bit on AMD and Hygon parts
:::::: branch date: 59 minutes ago
:::::: commit date: 59 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':   87<=
 #define X86_FEATURE_K7			( 3*32+ 5) /* "" Athlon */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version@'arch/x86/include/asm/cpufeatures.h':   87>=
 /* FREE, was #define X86_FEATURE_K7			( 3*32+ 5) "" Athlon */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  111<=
 /* free					( 3*32+29) */
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  111>=
 #define X86_FEATURE_RAPL		( 3*32+29) /* AMD/Hygon RAPL interface */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  239>=
 #define X86_FEATURE_PVUNLOCK		( 8*32+20) /* "" PV unlock function */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  240>=
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* "" PV vcpu_is_preempted fun=
ction */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  295>=
 #define X86_FEATURE_SGX1		(11*32+ 8) /* "" Basic SGX */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  296>=
 #define X86_FEATURE_SGX2		(11*32+ 9) /* "" SGX Enclave Dynamic Memory Mana=
gement (EDMM) */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  343>=
 #define X86_FEATURE_V_SPEC_CTRL		(15*32+20) /* Virtual SPEC_CTRL */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  362>=
 #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* Bus Lock detect */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  383>=
 #define X86_FEATURE_HYBRID_CPU		(18*32+15) /* "" This part has CPUs of mor=
e than one type */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5585994378815194957==--


Content-Type: multipart/mixed; boundary="===============2678633992904491705=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/cpu 5/7] Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h': 381> #define X86_FEATURE_RTM_ALWAYS_ABORT (18*32+11) /* "" RTM transaction always aborts */
Date: Wed, 16 Jun 2021 05:36:13 +0800
Message-ID: <202106160510.VI5EbMmJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2678633992904491705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Borislav Petkov <bp@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Andi Kleen <ak@linux.intel.com>
CC: Tony Luck <tony.luck@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cpu
head:   293649307ef9abcd4f83f6dac4d4400dfd97c936
commit: 1348924ba8169f35cedfd0a0087872b81a632b8e [5/7] x86/msr: Define new =
bits in TSX_FORCE_ABORT MSR
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
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
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  111<=
 /* free					( 3*32+29) */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version@'arch/x86/include/asm/cpufeatures.h':  111>=
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
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  381>=
 #define X86_FEATURE_RTM_ALWAYS_ABORT	(18*32+11) /* "" RTM transaction alwa=
ys aborts */
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h'=
 differs from latest version at 'arch/x86/include/asm/cpufeatures.h':  384>=
 #define X86_FEATURE_HYBRID_CPU		(18*32+15) /* "" This part has CPUs of mor=
e than one type */
--
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  188> #de=
fine PERF_CAP_METRICS_IDX		15
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  189> #de=
fine PERF_CAP_PT_IDX			16
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  190> =

   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  271> #de=
fine DEBUGCTLMSR_BUS_LOCK_DETECT	(1UL <<  2)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  775> #de=
fine MSR_TFA_TSX_CPUID_CLEAR_BIT	1
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  776> #de=
fine MSR_TFA_TSX_CPUID_CLEAR		BIT_ULL(MSR_TFA_TSX_CPUID_CLEAR_BIT)
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  777> #de=
fine MSR_TFA_SDV_ENABLE_RTM_BIT	2
>> Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' d=
iffers from latest version at 'arch/x86/include/asm/msr-index.h':  778> #de=
fine MSR_TFA_SDV_ENABLE_RTM		BIT_ULL(MSR_TFA_SDV_ENABLE_RTM_BIT)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2678633992904491705==--


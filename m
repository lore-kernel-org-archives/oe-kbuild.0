Content-Type: multipart/mixed; boundary="===============8190445697742668200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/intel_pstate.c:1790:9: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Thu, 21 Apr 2022 14:44:22 +0800
Message-ID: <202204210901.gi6tW0kO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8190445697742668200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: 46573fd6369f098f15e11768850b6430f374905f cpufreq: intel_pstate: hyb=
rid: Rework HWP calibration
date:   8 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220418 (https://download.01.org/0day-ci/ar=
chive/20220421/202204210901.gi6tW0kO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46573fd6369f098f15e11768850b6430f374905f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46573fd6369f098f15e11768850b6430f374905f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:90:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 16, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:742:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:91:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 17, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:742:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:92:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 18, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:742:6: note: Left side of '&&' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:93:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
              CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK, 19, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:22: note: expanded from macro 'CHEC=
K_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
                               ^
   drivers/cpufreq/intel_pstate.c:742:6: note: Left side of '||' is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:32: note: expanded from macro 'cpu=
_has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
                                         ^
   arch/x86/include/asm/cpufeature.h:74:5: note: expanded from macro 'REQUI=
RED_MASK_BIT_SET'
            ( CHECK_BIT_IN_MASK_WORD(REQUIRED_MASK,  0, feature_bit) ||    \
              ^
   arch/x86/include/asm/cpufeature.h:64:2: note: expanded from macro 'CHECK=
_BIT_IN_MASK_WORD'
           (((bit)>>5)=3D=3D(word) && (1UL<<((bit)&31) & maskname##word ))
           ^
   drivers/cpufreq/intel_pstate.c:742:6: note: '?' condition is false
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^
   drivers/cpufreq/intel_pstate.c:742:6: note: Assuming the condition is fa=
lse
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
               ^
   arch/x86/include/asm/cpufeature.h:141:27: note: expanded from macro 'boo=
t_cpu_has'
   #define boot_cpu_has(bit)       cpu_has(&boot_cpu_data, bit)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cpufeature.h:122:3: note: expanded from macro 'cpu_=
has'
           (__builtin_constant_p(bit) && REQUIRED_MASK_BIT_SET(bit) ? 1 :  \
            ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:742:2: note: Taking false branch
           if (boot_cpu_has(X86_FEATURE_HWP_EPP)) {
           ^
   drivers/cpufreq/intel_pstate.c:758:7: note: Assuming the condition is tr=
ue
                   if (epp =3D=3D -EINVAL)
                       ^~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:758:3: note: Taking true branch
                   if (epp =3D=3D -EINVAL)
                   ^
   drivers/cpufreq/intel_pstate.c:759:27: note: The result of the left shif=
t is undefined because the left operand is negative
                           epp =3D (pref_index - 1) << 2;
                                 ~~~~~~~~~~~~~~~~ ^
>> drivers/cpufreq/intel_pstate.c:1790:9: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           return DIV_ROUND_UP(core_get_scaling() * hybrid_ref_perf,
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/cpufreq/intel_pstate.c:1791:8: note: Calling 'intel_pstate_cppc_=
nominal'
                               intel_pstate_cppc_nominal(cpu));
                               ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:57: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                           ^
   drivers/cpufreq/intel_pstate.c:393:6: note: Assuming the condition is tr=
ue
           if (cppc_get_nominal_perf(cpu, &nominal_perf))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:393:2: note: Taking true branch
           if (cppc_get_nominal_perf(cpu, &nominal_perf))
           ^
   drivers/cpufreq/intel_pstate.c:394:3: note: Returning zero
                   return 0;
                   ^~~~~~~~
   drivers/cpufreq/intel_pstate.c:1791:8: note: Returning from 'intel_pstat=
e_cppc_nominal'
                               intel_pstate_cppc_nominal(cpu));
                               ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:57: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                                           ^
   drivers/cpufreq/intel_pstate.c:1790:9: note: Division by zero
           return DIV_ROUND_UP(core_get_scaling() * hybrid_ref_perf,
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   mm/memblock.c:1158:36: warning: The result of the '<<' expression is und=
efined [clang-analyzer-core.UndefinedBinaryOperatorResult]
                                   *idx =3D (u32)idx_a | (u64)idx_b << 32;
                                                       ~~~~~~~~~~~^~~~~
   mm/memblock.c:1096:16: note: Assuming the condition is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
                         ^
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   mm/memblock.c:1096:6: note: '__ret_do_once' is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   mm/memblock.c:1096:6: note: Left side of '&&' is false
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   mm/memblock.c:1096:6: note: Taking false branch
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
               ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   mm/memblock.c:1096:2: note: Taking false branch
           if (WARN_ONCE(nid =3D=3D MAX_NUMNODES, "Usage of MAX_NUMNODES is=
 deprecated. Use NUMA_NO_NODE instead\n"))
           ^
   mm/memblock.c:1099:6: note: Assuming the condition is false
           if (*idx =3D=3D (u64)ULLONG_MAX) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/memblock.c:1099:2: note: Taking false branch
           if (*idx =3D=3D (u64)ULLONG_MAX) {

vim +1790 drivers/cpufreq/intel_pstate.c

46573fd6369f098 Rafael J. Wysocki 2021-09-04  1787  =

46573fd6369f098 Rafael J. Wysocki 2021-09-04  1788  static int hybrid_get_c=
pu_scaling(int cpu)
46573fd6369f098 Rafael J. Wysocki 2021-09-04  1789  {
46573fd6369f098 Rafael J. Wysocki 2021-09-04 @1790  	return DIV_ROUND_UP(co=
re_get_scaling() * hybrid_ref_perf,
46573fd6369f098 Rafael J. Wysocki 2021-09-04  1791  			    intel_pstate_cpp=
c_nominal(cpu));
46573fd6369f098 Rafael J. Wysocki 2021-09-04  1792  }
46573fd6369f098 Rafael J. Wysocki 2021-09-04  1793  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8190445697742668200==--


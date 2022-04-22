Content-Type: multipart/mixed; boundary="===============6266065947440251639=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cpufreq/intel_pstate.c:1790:9: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Fri, 22 Apr 2022 14:11:39 +0800
Message-ID: <202204221418.KNC7bNZT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6266065947440251639==
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
head:   d569e86915b7f2f9795588591c8d5ea0b66481cb
commit: 46573fd6369f098f15e11768850b6430f374905f cpufreq: intel_pstate: hyb=
rid: Rework HWP calibration
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220418 (https://download.01.org/0day-ci/ar=
chive/20220422/202204221418.KNC7bNZT-lkp(a)intel.com/config)
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   net/caif/cfveil.c:84:14: warning: Access to field 'transmit' results in =
a dereference of a null pointer (loaded from field 'dn') [clang-analyzer-co=
re.NullDereference]
           caif_assert(layr->dn->transmit !=3D NULL);
                       ^
   include/net/caif/caif_layer.h:29:8: note: expanded from macro 'caif_asse=
rt'
           if (!(assert)) {                                        \
                 ^~~~~~
   net/caif/cfveil.c:80:27: note: Left side of '&&' is false
           struct cfsrvl *service =3D container_obj(layr);
                                    ^
   net/caif/cfveil.c:21:29: note: expanded from macro 'container_obj'
   #define container_obj(layr) container_of(layr, struct cfsrvl, layer)
                               ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/caif/cfveil.c:80:27: note: Taking false branch
           struct cfsrvl *service =3D container_obj(layr);
                                    ^
   net/caif/cfveil.c:21:29: note: expanded from macro 'container_obj'
   #define container_obj(layr) container_of(layr, struct cfsrvl, layer)
                               ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/caif/cfveil.c:80:27: note: Loop condition is false.  Exiting loop
           struct cfsrvl *service =3D container_obj(layr);
                                    ^
   net/caif/cfveil.c:21:29: note: expanded from macro 'container_obj'
   #define container_obj(layr) container_of(layr, struct cfsrvl, layer)
                               ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \

vim +1790 drivers/cpufreq/intel_pstate.c

46573fd6369f09 Rafael J. Wysocki 2021-09-04  1787  =

46573fd6369f09 Rafael J. Wysocki 2021-09-04  1788  static int hybrid_get_cp=
u_scaling(int cpu)
46573fd6369f09 Rafael J. Wysocki 2021-09-04  1789  {
46573fd6369f09 Rafael J. Wysocki 2021-09-04 @1790  	return DIV_ROUND_UP(cor=
e_get_scaling() * hybrid_ref_perf,
46573fd6369f09 Rafael J. Wysocki 2021-09-04  1791  			    intel_pstate_cppc=
_nominal(cpu));
46573fd6369f09 Rafael J. Wysocki 2021-09-04  1792  }
46573fd6369f09 Rafael J. Wysocki 2021-09-04  1793  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6266065947440251639==--


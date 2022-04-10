Content-Type: multipart/mixed; boundary="===============5267003250928400562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:perf/core 3/10] arch/x86/events/amd/core.c:722:3: warning: Value stored to 'hwc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 11 Apr 2022 05:00:42 +0800
Message-ID: <202204110431.SBvb4g5G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5267003250928400562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Stephane Eranian <eranian@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/co=
re
head:   7bebfe9dd802b80abff5a43e00ab68d98893a22c
commit: ada543459cab7f653dcacdaba4011a8bb19c627c [3/10] perf/x86/amd: Add A=
MD Fam19h Branch Sampling support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20411/202204110431.SBvb4g5G-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commi=
t/?id=3Dada543459cab7f653dcacdaba4011a8bb19c627c
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/=
tip/tip.git
        git fetch --no-tags tip perf/core
        git checkout ada543459cab7f653dcacdaba4011a8bb19c627c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   crypto/asymmetric_keys/asymmetric_type.c:64:2: note: Loop condition is f=
alse.  Exiting loop
           WARN_ON(!id_0 && !id_1 && !id_2);
           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:79:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   crypto/asymmetric_keys/asymmetric_type.c:66:6: note: 'id_0' is null
           if (id_0) {
               ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:66:2: note: Taking false branch
           if (id_0) {
           ^
   crypto/asymmetric_keys/asymmetric_type.c:69:13: note: 'id_1' is null
           } else if (id_1) {
                      ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:69:9: note: Taking false branch
           } else if (id_1) {
                  ^
   crypto/asymmetric_keys/asymmetric_type.c:74:9: note: Access to field 'le=
n' results in a dereference of a null pointer (loaded from variable 'id_2')
                   len =3D id_2->len;
                         ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:160:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kid->data, val_1, len_1);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:160:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(kid->data, val_1, len_1);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:161:2: warning: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(kid->data + len_1, val_2, len_2);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:161:2: note: Call to function '=
memcpy' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(kid->data + len_1, val_2, len_2);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   arch/x86/events/rapl.c:432:1: warning: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/rapl.c:432:1: note: Call to function 'sprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> arch/x86/events/amd/core.c:722:3: warning: Value stored to 'hwc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:722:3: note: Value stored to 'hwc' is never r=
ead
                   hwc =3D &cpuc->events[idx]->hw;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:842:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event,  "config:0-7,32-35");
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:842:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event,  "config:0-7,32-35");
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:843:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(umask,  "config:8-15"   );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:843:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(umask,  "config:8-15"   );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:844:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(edge,   "config:18"     );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:844:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(edge,   "config:18"     );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:845:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(inv,    "config:23"     );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:845:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(inv,    "config:23"     );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:846:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(cmask,  "config:24-31"  );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:846:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(cmask,  "config:24-31"  );
   ^
   include/linux/perf_event.h:1635:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/core.c:1126:9: warning: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", x86_pmu.lbr_nr);
                  ^~~~~~~~
   arch/x86/events/amd/core.c:1126:9: note: Call to function 'snprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", x86_pmu.lbr_nr);
                  ^~~~~~~~
   arch/x86/events/amd/core.c:1244:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hw_cache_event_ids, amd_hw_cache_event_ids_f17h, =
sizeof(hw_cache_event_ids));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:1244:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(hw_cache_event_ids, amd_hw_cache_event_ids_f17h, =
sizeof(hw_cache_event_ids));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   arch/x86/events/amd/core.c:1246:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(hw_cache_event_ids, amd_hw_cache_event_ids, sizeo=
f(hw_cache_event_ids));
                   ^

vim +/hwc +722 arch/x86/events/amd/core.c

ada543459cab7f Stephane Eranian 2022-03-22  712  =

ada543459cab7f Stephane Eranian 2022-03-22  713  static void amd_pmu_enable=
_all(int added)
ada543459cab7f Stephane Eranian 2022-03-22  714  {
ada543459cab7f Stephane Eranian 2022-03-22  715  	struct cpu_hw_events *cpu=
c =3D this_cpu_ptr(&cpu_hw_events);
ada543459cab7f Stephane Eranian 2022-03-22  716  	struct hw_perf_event *hwc;
ada543459cab7f Stephane Eranian 2022-03-22  717  	int idx;
ada543459cab7f Stephane Eranian 2022-03-22  718  =

ada543459cab7f Stephane Eranian 2022-03-22  719  	amd_brs_enable_all();
ada543459cab7f Stephane Eranian 2022-03-22  720  =

ada543459cab7f Stephane Eranian 2022-03-22  721  	for (idx =3D 0; idx < x86=
_pmu.num_counters; idx++) {
ada543459cab7f Stephane Eranian 2022-03-22 @722  		hwc =3D &cpuc->events[id=
x]->hw;
ada543459cab7f Stephane Eranian 2022-03-22  723  =

ada543459cab7f Stephane Eranian 2022-03-22  724  		/* only activate events =
which are marked as active */
ada543459cab7f Stephane Eranian 2022-03-22  725  		if (!test_bit(idx, cpuc-=
>active_mask))
ada543459cab7f Stephane Eranian 2022-03-22  726  			continue;
ada543459cab7f Stephane Eranian 2022-03-22  727  =

ada543459cab7f Stephane Eranian 2022-03-22  728  		amd_pmu_enable_event(cpu=
c->events[idx]);
ada543459cab7f Stephane Eranian 2022-03-22  729  	}
ada543459cab7f Stephane Eranian 2022-03-22  730  }
ada543459cab7f Stephane Eranian 2022-03-22  731  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5267003250928400562==--


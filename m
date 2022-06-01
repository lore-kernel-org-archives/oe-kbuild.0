Content-Type: multipart/mixed; boundary="===============6091921708264096613=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: snprintf(err->loc, TRACING_LOG_LOC_MAX, "%s: error: ", loc);
Date: Thu, 02 Jun 2022 03:26:26 +0800
Message-ID: <202206020341.VJfT8Qsk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6091921708264096613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 snprintf(err->loc, TRACING_LOG_LOC_MAX, "%s: error: ", loc);"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20220530 (https://download.01.org/0day-ci/ar=
chive/20220602/202206020341.VJfT8Qsk-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c4=
8f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>>         snprintf(err->loc, TRACING_LOG_LOC_MAX, "%s: error: ", loc);
           ^~~~~~~~
   kernel/trace/trace.c:7828:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
>>         snprintf(err->loc, TRACING_LOG_LOC_MAX, "%s: error: ", loc);
           ^~~~~~~~
   kernel/trace/trace.c:7829:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(err->cmd, MAX_FILTER_STR_VAL,"\n" CMD_PREFIX "%s\n", cm=
d);
           ^~~~~~~~
   kernel/trace/trace.c:7829:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(err->cmd, MAX_FILTER_STR_VAL,"\n" CMD_PREFIX "%s\n", cm=
d);
           ^~~~~~~~
   kernel/trace/trace.c:8594:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cpu_dir, 30, "cpu%ld", cpu);
           ^~~~~~~~
   kernel/trace/trace.c:8594:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(cpu_dir, 30, "cpu%ld", cpu);
           ^~~~~~~~
   kernel/trace/trace.c:8935:6: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           r =3D sprintf(buf, "%d\n", r);
               ^~~~~~~
   kernel/trace/trace.c:8935:6: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           r =3D sprintf(buf, "%d\n", r);
               ^~~~~~~
   kernel/trace/trace.c:8991:6: warning: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           r =3D sprintf(buf, "%d\n", r);
               ^~~~~~~
   kernel/trace/trace.c:8991:6: note: Call to function 'sprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'sprintf_s' in case of C11
           r =3D sprintf(buf, "%d\n", r);
               ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   arch/x86/events/intel/cstate.c:195:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_CSTATE_FORMAT_ATTR(core_event, event, "config:0-63");
   ^
   arch/x86/events/intel/cstate.c:118:9: note: expanded from macro 'DEFINE_=
CSTATE_FORMAT_ATTR'
           return sprintf(page, _format "\n");                     \
                  ^~~~~~~
   arch/x86/events/intel/cstate.c:195:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   DEFINE_CSTATE_FORMAT_ATTR(core_event, event, "config:0-63");
   ^
   arch/x86/events/intel/cstate.c:118:9: note: expanded from macro 'DEFINE_=
CSTATE_FORMAT_ATTR'
           return sprintf(page, _format "\n");                     \
                  ^~~~~~~
   arch/x86/events/intel/cstate.c:274:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   DEFINE_CSTATE_FORMAT_ATTR(pkg_event, event, "config:0-63");
   ^
   arch/x86/events/intel/cstate.c:118:9: note: expanded from macro 'DEFINE_=
CSTATE_FORMAT_ATTR'
           return sprintf(page, _format "\n");                     \
                  ^~~~~~~
   arch/x86/events/intel/cstate.c:274:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   DEFINE_CSTATE_FORMAT_ATTR(pkg_event, event, "config:0-63");
   ^
   arch/x86/events/intel/cstate.c:118:9: note: expanded from macro 'DEFINE_=
CSTATE_FORMAT_ATTR'
           return sprintf(page, _format "\n");                     \
                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   arch/x86/events/zhaoxin/core.c:437:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event,  "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:437:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event,  "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:438:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(umask,  "config:8-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:438:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(umask,  "config:8-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:439:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(edge,   "config:18");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:439:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(edge,   "config:18");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:440:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(inv,    "config:23");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:440:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(inv,    "config:23");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:441:1: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(cmask,  "config:24-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:441:1: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(cmask,  "config:24-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/zhaoxin/core.c:571:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(hw_cache_event_ids, zxd_hw_cache_event_id=
s,
                           ^~~~~~
   arch/x86/events/zhaoxin/core.c:571:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(hw_cache_event_ids, zxd_hw_cache_event_id=
s,
                           ^~~~~~
   arch/x86/events/zhaoxin/core.c:582:4: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(hw_cache_event_ids, zxe_hw_cache_event_id=
s,
                           ^~~~~~
   arch/x86/events/zhaoxin/core.c:582:4: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(hw_cache_event_ids, zxe_hw_cache_event_id=
s,
                           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   arch/x86/events/amd/ibs.c:521:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(rand_en,        "config:57");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/ibs.c:521:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(rand_en,        "config:57");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/ibs.c:522:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(cnt_ctl,        "config:19");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/ibs.c:522:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(cnt_ctl,        "config:19");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   arch/x86/events/amd/ibs.c:744:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&perf_ibs->format_group, 0, sizeof(perf_ibs->form=
at_group));
                   ^~~~~~
   arch/x86/events/amd/ibs.c:744:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&perf_ibs->format_group, 0, sizeof(perf_ibs->form=
at_group));
                   ^~~~~~
   arch/x86/events/amd/ibs.c:748:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&perf_ibs->attr_groups, 0, sizeof(perf_ibs->attr_=
groups));
                   ^~~~~~
   arch/x86/events/amd/ibs.c:748:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&perf_ibs->attr_groups, 0, sizeof(perf_ibs->attr_=
groups));
                   ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (27 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   arch/x86/kernel/pci-iommu_table.c:37:10: warning: Dereference of null po=
inter (loaded from variable 'p') [clang-analyzer-core.NullDereference]
                           tmp =3D *p;
                                 ^~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: Assuming 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^~~~~~~~~~
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: 'q' is <=3D 'p'
                   if (q > p) {
                       ^
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking false branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:30:30: note: Null pointer value stored=
 to 'p'
           for (p =3D start; p < finish; p++) {
                                       ^~~
   arch/x86/kernel/pci-iommu_table.c:30:18: note: 'p' is < 'finish'
           for (p =3D start; p < finish; p++) {
                           ^
   arch/x86/kernel/pci-iommu_table.c:30:2: note: Loop condition is true.  E=
ntering loop body
           for (p =3D start; p < finish; p++) {
           ^
   arch/x86/kernel/pci-iommu_table.c:36:7: note: Assuming 'q' is > 'p'
                   if (q > p) {
                       ^~~~~
   arch/x86/kernel/pci-iommu_table.c:36:3: note: Taking true branch
                   if (q > p) {
                   ^
   arch/x86/kernel/pci-iommu_table.c:37:10: note: Dereference of null point=
er (loaded from variable 'p')
                           tmp =3D *p;
                                 ^~
   arch/x86/kernel/pci-iommu_table.c:38:4: warning: Call to function 'memmo=
ve' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memmove_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(p, q, sizeof(*p));
                           ^~~~~~~
   arch/x86/kernel/pci-iommu_table.c:38:4: note: Call to function 'memmove'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memmove_s' in case of C11
                           memmove(p, q, sizeof(*p));
                           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   fs/fuse/readdir.c:82:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(addr + offset, dirent, reclen);
           ^~~~~~
   fs/fuse/readdir.c:82:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(addr + offset, dirent, reclen);
           ^~~~~~
   fs/fuse/readdir.c:262:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   fs/fuse/readdir.c:262:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&inarg, 0, sizeof(inarg));
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   kernel/kexec.c:45:2: warning: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecure=
API.DeprecatedOrUnsafeBufferHandling]
           memcpy(image->segment, segments, nr_segments * sizeof(*segments)=
);
           ^~~~~~
   kernel/kexec.c:45:2: note: Call to function 'memcpy' is insecure as it d=
oes not provide security checks introduced in the C11 standard. Replace wit=
h analogous functions that support length arguments or provides boundary ch=
ecks such as 'memcpy_s' in case of C11
           memcpy(image->segment, segments, nr_segments * sizeof(*segments)=
);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   kernel/kexec_file.c:919:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sechdrs, (void *)pi->ehdr + pi->ehdr->e_shoff,
           ^~~~~~
   kernel/kexec_file.c:919:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(sechdrs, (void *)pi->ehdr + pi->ehdr->e_shoff,
           ^~~~~~
   kernel/kexec_file.c:953:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, src, sechdrs[i].sh_size);
                   ^~~~~~
   kernel/kexec_file.c:953:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, src, sechdrs[i].sh_size);
                   ^~~~~~
   kernel/kexec_file.c:1173:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((void *)buf, sym_buf, size);
                   ^~~~~~
   kernel/kexec_file.c:1173:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy((void *)buf, sym_buf, size);
                   ^~~~~~
   kernel/kexec_file.c:1175:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy((void *)sym_buf, buf, size);
                   ^~~~~~
   kernel/kexec_file.c:1175:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy((void *)sym_buf, buf, size);
                   ^~~~~~
   kernel/kexec_file.c:1296:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
           ^~~~~~
   kernel/kexec_file.c:1296:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
           ^~~~~~
   kernel/kexec_file.c:1301:2: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
           ^~~~~~
   kernel/kexec_file.c:1301:2: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
           memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   arch/x86/crypto/blowfish_glue.c:159:10: warning: Although the value stor=
ed to 'nbytes' is used in the enclosing expression, the value is never actu=
ally read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   arch/x86/crypto/blowfish_glue.c:159:10: note: Although the value stored =
to 'nbytes' is used in the enclosing expression, the value is never actuall=
y read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   arch/x86/crypto/blowfish_glue.c:240:10: warning: Although the value stor=
ed to 'nbytes' is used in the enclosing expression, the value is never actu=
ally read from 'nbytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
..

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6091921708264096613==--


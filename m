Content-Type: multipart/mixed; boundary="===============0369559846519644826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next v7 2/2] net: sched: support hash/classid/cpuid selecting tx queue
Date: Tue, 28 Dec 2021 06:13:45 +0800
Message-ID: <202112280602.UuBkQ7jr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0369559846519644826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211224164926.80733-3-xiangxia.m.yue@gmail.com>
References: <20211224164926.80733-3-xiangxia.m.yue@gmail.com>
TO: xiangxia.m.yue(a)gmail.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/xiangxia-m-yue-gmail-com/n=
et-sched-allow-user-to-select-txqueue/20211225-005116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
7467d716583eec12ae84a33fb1fb27d22333fc64
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20211226 (https://download.01.org/0day-ci/arch=
ive/20211228/202112280602.UuBkQ7jr-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1=
ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6ede36fda618b75206f5cd31a=
9c06c1667f1864b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review xiangxia-m-yue-gmail-com/net-sched=
-allow-user-to-select-txqueue/20211225-005116
        git checkout 6ede36fda618b75206f5cd31a9c06c1667f1864b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                ^
   fs/f2fs/segment.h:104:3: note: expanded from macro 'GET_SEC_FROM_SEG'
           (((segno) =3D=3D -1) ? -1: (segno) / (sbi)->segs_per_sec)
            ^
   fs/f2fs/gc.c:319:2: note: 'usable_segs_per_sec' initialized here
           unsigned int usable_segs_per_sec =3D f2fs_usable_segs_in_sec(sbi=
, segno);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:321:14: note: Assuming 'i' is >=3D 'usable_segs_per_sec'
           for (i =3D 0; i < usable_segs_per_sec; i++)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:321:2: note: Loop condition is false. Execution continues o=
n line 323
           for (i =3D 0; i < usable_segs_per_sec; i++)
           ^
   fs/f2fs/gc.c:325:25: note: Passing the value 0 via 2nd parameter 'diviso=
r'
           mtime =3D div_u64(mtime, usable_segs_per_sec);
                                  ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:325:10: note: Calling 'div_u64'
           mtime =3D div_u64(mtime, usable_segs_per_sec);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^
   arch/x86/include/asm/div64.h:61:21: note: expanded from macro 'div_u64_r=
em'
   #define div_u64_rem     div_u64_rem
                           ^
   arch/x86/include/asm/div64.h:53:6: note: 'upper' is >=3D 'divisor'
           if (upper >=3D divisor) {
               ^~~~~
   arch/x86/include/asm/div64.h:53:2: note: Taking true branch
           if (upper >=3D divisor) {
           ^
   arch/x86/include/asm/div64.h:54:20: note: Division by zero
                   d.v32[1] =3D upper / divisor;
                              ~~~~~~^~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mmc/core/sdio_cis.c:63:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(string, buf);
                   ^~~~~~
   drivers/mmc/core/sdio_cis.c:63:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(string, buf);
                   ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> net/sched/act_skbedit.c:272:26: warning: Dereference of null pointer (lo=
aded from variable 'priority') [clang-analyzer-core.NullDereference]
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
   net/sched/act_skbedit.c:147:18: note: 'priority' initialized to a null p=
ointer value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                           ^~~~~~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking true branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:272:26: note: Dereference of null pointer (loade=
d from variable 'priority')
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
>> net/sched/act_skbedit.c:278:22: warning: Dereference of null pointer (lo=
aded from variable 'mark') [clang-analyzer-core.NullDereference]
                   params_new->mark =3D *mark;
                                      ^~~~~
   net/sched/act_skbedit.c:147:36: note: 'mark' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                             ^~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:273:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:273:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:277:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:277:2: note: Taking true branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:278:22: note: Dereference of null pointer (loade=
d from variable 'mark')
                   params_new->mark =3D *mark;
                                      ^~~~~
>> net/sched/act_skbedit.c:280:23: warning: Dereference of null pointer (lo=
aded from variable 'ptype') [clang-analyzer-core.NullDereference]
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
   net/sched/act_skbedit.c:148:30: note: 'ptype' initialized to a null poin=
ter value
           u16 *queue_mapping =3D NULL, *ptype =3D NULL;
                                       ^~~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:229:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:229:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:232:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:232:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:235:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:235:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:243:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:243:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:255:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:255:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:261:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:261:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:265:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:265:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:271:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:271:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:273:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:273:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:277:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:277:2: note: Taking false branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:279:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PTYPE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:279:2: note: Taking true branch
           if (flags & SKBEDIT_F_PTYPE)
           ^
   net/sched/act_skbedit.c:280:23: note: Dereference of null pointer (loade=
d from variable 'ptype')
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
>> net/sched/act_skbedit.c:284:22: warning: Dereference of null pointer (lo=
aded from variable 'mask') [clang-analyzer-core.NullDereference]
                   params_new->mask =3D *mask;
                                      ^~~~~
   net/sched/act_skbedit.c:147:50: note: 'mask' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                                           ^~~~
   net/sched/act_skbedit.c:154:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:154:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:157:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:157:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:159:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:159:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:162:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:162:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:182:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:182:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:187:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:187:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:192:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:192:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:197:7: note: Assuming 'mapping_hash_type' is not=
 equal to 0
                   if (mapping_hash_type) {
                       ^~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:197:3: note: Taking true branch
                   if (mapping_hash_type) {
                   ^
   net/sched/act_skbedit.c:201:8: note: Assuming the condition is false
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:201:4: note: Taking false branch
                           if (mapping_hash_type & (mapping_hash_type - 1))=
 {
                           ^
   net/sched/act_skbedit.c:206:8: note: Left side of '||' is false
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                               ^
   net/sched/act_skbedit.c:207:8: note: Assuming the condition is false
                               !tb[TCA_SKBEDIT_QUEUE_MAPPING_MAX]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:206:4: note: Taking false branch
                           if (!tb[TCA_SKBEDIT_QUEUE_MAPPING] ||
                           ^
   net/sched/act_skbedit.c:214:8: note: Assuming the condition is false
                           if (*queue_mapping_max < *queue_mapping) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:214:4: note: Taking false branch
                           if (*queue_mapping_max < *queue_mapping) {
                           ^
   net/sched/act_skbedit.c:222:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:222:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)

vim +/priority +272 net/sched/act_skbedit.c

ca9b0e27e072be Alexander Duyck   2008-09-12  134  =

c1b52739e45f59 Benjamin LaHaise  2013-01-14  135  static int tcf_skbedit_in=
it(struct net *net, struct nlattr *nla,
a85a970af265f1 WANG Cong         2016-07-25  136  			    struct nlattr *est=
, struct tc_action **a,
abbb0d33632ce9 Vlad Buslov       2019-10-30  137  			    struct tcf_proto *=
tp, u32 act_flags,
789871bb2a0381 Vlad Buslov       2018-07-05  138  			    struct netlink_ext=
_ack *extack)
ca9b0e27e072be Alexander Duyck   2008-09-12  139  {
ddf97ccdd7cb7e WANG Cong         2016-02-22  140  	struct tc_action_net *tn=
 =3D net_generic(net, skbedit_net_id);
695176bfe5dec2 Cong Wang         2021-07-29  141  	bool bind =3D act_flags =
& TCA_ACT_FLAGS_BIND;
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  142  	struct tcf_skbedit_param=
s *params_new;
ca9b0e27e072be Alexander Duyck   2008-09-12  143  	struct nlattr *tb[TCA_SK=
BEDIT_MAX + 1];
ec7727bb24b01e Davide Caratti    2019-03-20  144  	struct tcf_chain *goto_c=
h =3D NULL;
ca9b0e27e072be Alexander Duyck   2008-09-12  145  	struct tc_skbedit *parm;
ca9b0e27e072be Alexander Duyck   2008-09-12  146  	struct tcf_skbedit *d;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  147  	u32 flags =3D 0, *priori=
ty =3D NULL, *mark =3D NULL, *mask =3D NULL;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  148  	u16 *queue_mapping =3D N=
ULL, *ptype =3D NULL;
6ede36fda618b7 Tonghao Zhang     2021-12-25  149  	u16 mapping_mod =3D 1;
b2313077ed0db3 WANG Cong         2016-06-13  150  	bool exists =3D false;
b2313077ed0db3 WANG Cong         2016-06-13  151  	int ret =3D 0, err;
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  152  	u32 index;
ca9b0e27e072be Alexander Duyck   2008-09-12  153  =

ca9b0e27e072be Alexander Duyck   2008-09-12  154  	if (nla =3D=3D NULL)
ca9b0e27e072be Alexander Duyck   2008-09-12  155  		return -EINVAL;
ca9b0e27e072be Alexander Duyck   2008-09-12  156  =

8cb081746c031f Johannes Berg     2019-04-26  157  	err =3D nla_parse_nested=
_deprecated(tb, TCA_SKBEDIT_MAX, nla,
8cb081746c031f Johannes Berg     2019-04-26  158  					  skbedit_policy, NU=
LL);
ca9b0e27e072be Alexander Duyck   2008-09-12  159  	if (err < 0)
ca9b0e27e072be Alexander Duyck   2008-09-12  160  		return err;
ca9b0e27e072be Alexander Duyck   2008-09-12  161  =

ca9b0e27e072be Alexander Duyck   2008-09-12  162  	if (tb[TCA_SKBEDIT_PARMS=
] =3D=3D NULL)
ca9b0e27e072be Alexander Duyck   2008-09-12  163  		return -EINVAL;
ca9b0e27e072be Alexander Duyck   2008-09-12  164  =

ca9b0e27e072be Alexander Duyck   2008-09-12  165  	if (tb[TCA_SKBEDIT_PRIOR=
ITY] !=3D NULL) {
ca9b0e27e072be Alexander Duyck   2008-09-12  166  		flags |=3D SKBEDIT_F_PR=
IORITY;
ca9b0e27e072be Alexander Duyck   2008-09-12  167  		priority =3D nla_data(t=
b[TCA_SKBEDIT_PRIORITY]);
ca9b0e27e072be Alexander Duyck   2008-09-12  168  	}
ca9b0e27e072be Alexander Duyck   2008-09-12  169  =

ca9b0e27e072be Alexander Duyck   2008-09-12  170  	if (tb[TCA_SKBEDIT_QUEUE=
_MAPPING] !=3D NULL) {
ca9b0e27e072be Alexander Duyck   2008-09-12  171  		flags |=3D SKBEDIT_F_QU=
EUE_MAPPING;
ca9b0e27e072be Alexander Duyck   2008-09-12  172  		queue_mapping =3D nla_d=
ata(tb[TCA_SKBEDIT_QUEUE_MAPPING]);
ca9b0e27e072be Alexander Duyck   2008-09-12  173  	}
1c55d62e77fa16 jamal             2009-10-15  174  =

ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  175  	if (tb[TCA_SKBEDIT_PTYPE=
] !=3D NULL) {
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  176  		ptype =3D nla_data(tb[T=
CA_SKBEDIT_PTYPE]);
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  177  		if (!skb_pkt_type_ok(*p=
type))
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  178  			return -EINVAL;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  179  		flags |=3D SKBEDIT_F_PT=
YPE;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  180  	}
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  181  =

1c55d62e77fa16 jamal             2009-10-15  182  	if (tb[TCA_SKBEDIT_MARK]=
 !=3D NULL) {
1c55d62e77fa16 jamal             2009-10-15  183  		flags |=3D SKBEDIT_F_MA=
RK;
1c55d62e77fa16 jamal             2009-10-15  184  		mark =3D nla_data(tb[TC=
A_SKBEDIT_MARK]);
1c55d62e77fa16 jamal             2009-10-15  185  	}
1c55d62e77fa16 jamal             2009-10-15  186  =

4fe77d82ef80c7 Antonio Quartulli 2016-10-24  187  	if (tb[TCA_SKBEDIT_MASK]=
 !=3D NULL) {
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  188  		flags |=3D SKBEDIT_F_MA=
SK;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  189  		mask =3D nla_data(tb[TC=
A_SKBEDIT_MASK]);
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  190  	}
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  191  =

e7e3728bd776d1 Qiaobin Fu        2018-07-01  192  	if (tb[TCA_SKBEDIT_FLAGS=
] !=3D NULL) {
e7e3728bd776d1 Qiaobin Fu        2018-07-01  193  		u64 *pure_flags =3D nla=
_data(tb[TCA_SKBEDIT_FLAGS]);
6ede36fda618b7 Tonghao Zhang     2021-12-25  194  		u64 mapping_hash_type;
e7e3728bd776d1 Qiaobin Fu        2018-07-01  195  =

6ede36fda618b7 Tonghao Zhang     2021-12-25  196  		mapping_hash_type =3D *=
pure_flags & SKBEDIT_F_TXQ_HASH_MASK;
6ede36fda618b7 Tonghao Zhang     2021-12-25  197  		if (mapping_hash_type) {
6ede36fda618b7 Tonghao Zhang     2021-12-25  198  			u16 *queue_mapping_max;
6ede36fda618b7 Tonghao Zhang     2021-12-25  199  =

6ede36fda618b7 Tonghao Zhang     2021-12-25  200  			/* Hash types are mutu=
ally exclusive. */
6ede36fda618b7 Tonghao Zhang     2021-12-25  201  			if (mapping_hash_type =
& (mapping_hash_type - 1)) {
6ede36fda618b7 Tonghao Zhang     2021-12-25  202  				NL_SET_ERR_MSG_MOD(ex=
tack, "Multi types of hash are specified.");
6ede36fda618b7 Tonghao Zhang     2021-12-25  203  				return -EINVAL;
6ede36fda618b7 Tonghao Zhang     2021-12-25  204  			}
6ede36fda618b7 Tonghao Zhang     2021-12-25  205  =

6ede36fda618b7 Tonghao Zhang     2021-12-25  206  			if (!tb[TCA_SKBEDIT_QU=
EUE_MAPPING] ||
6ede36fda618b7 Tonghao Zhang     2021-12-25  207  			    !tb[TCA_SKBEDIT_QU=
EUE_MAPPING_MAX]) {
6ede36fda618b7 Tonghao Zhang     2021-12-25  208  				NL_SET_ERR_MSG_MOD(ex=
tack, "Missing required range of queue_mapping.");
6ede36fda618b7 Tonghao Zhang     2021-12-25  209  				return -EINVAL;
6ede36fda618b7 Tonghao Zhang     2021-12-25  210  			}
6ede36fda618b7 Tonghao Zhang     2021-12-25  211  =

6ede36fda618b7 Tonghao Zhang     2021-12-25  212  			queue_mapping_max =3D
6ede36fda618b7 Tonghao Zhang     2021-12-25  213  				nla_data(tb[TCA_SKBED=
IT_QUEUE_MAPPING_MAX]);
6ede36fda618b7 Tonghao Zhang     2021-12-25  214  			if (*queue_mapping_max=
 < *queue_mapping) {
6ede36fda618b7 Tonghao Zhang     2021-12-25  215  				NL_SET_ERR_MSG_MOD(ex=
tack, "The range of queue_mapping is invalid, max < min.");
6ede36fda618b7 Tonghao Zhang     2021-12-25  216  				return -EINVAL;
6ede36fda618b7 Tonghao Zhang     2021-12-25  217  			}
6ede36fda618b7 Tonghao Zhang     2021-12-25  218  =

6ede36fda618b7 Tonghao Zhang     2021-12-25  219  			mapping_mod =3D *queue=
_mapping_max - *queue_mapping + 1;
6ede36fda618b7 Tonghao Zhang     2021-12-25  220  			flags |=3D mapping_has=
h_type;
6ede36fda618b7 Tonghao Zhang     2021-12-25  221  		}
e7e3728bd776d1 Qiaobin Fu        2018-07-01  222  		if (*pure_flags & SKBED=
IT_F_INHERITDSFIELD)
e7e3728bd776d1 Qiaobin Fu        2018-07-01  223  			flags |=3D SKBEDIT_F_I=
NHERITDSFIELD;
e7e3728bd776d1 Qiaobin Fu        2018-07-01  224  	}
e7e3728bd776d1 Qiaobin Fu        2018-07-01  225  =

ca9b0e27e072be Alexander Duyck   2008-09-12  226  	parm =3D nla_data(tb[TCA=
_SKBEDIT_PARMS]);
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  227  	index =3D parm->index;
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  228  	err =3D tcf_idr_check_al=
loc(tn, &index, a, bind);
0190c1d452a91c Vlad Buslov       2018-07-05  229  	if (err < 0)
0190c1d452a91c Vlad Buslov       2018-07-05  230  		return err;
0190c1d452a91c Vlad Buslov       2018-07-05  231  	exists =3D err;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  232  	if (exists && bind)
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  233  		return 0;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  234  =

5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  235  	if (!flags) {
af5d01842fe1fb Roman Mashak      2018-05-11  236  		if (exists)
65a206c01e8e7f Chris Mi          2017-08-30  237  			tcf_idr_release(*a, bi=
nd);
0190c1d452a91c Vlad Buslov       2018-07-05  238  		else
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  239  			tcf_idr_cleanup(tn, in=
dex);
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  240  		return -EINVAL;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  241  	}
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  242  =

5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  243  	if (!exists) {
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  244  		ret =3D tcf_idr_create(=
tn, index, est, a,
40bd094d65fc9f Baowen Zheng      2021-12-17  245  				     &act_skbedit_ops=
, bind, true, act_flags);
0190c1d452a91c Vlad Buslov       2018-07-05  246  		if (ret) {
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  247  			tcf_idr_cleanup(tn, in=
dex);
86062033feb8a1 WANG Cong         2014-02-11  248  			return ret;
0190c1d452a91c Vlad Buslov       2018-07-05  249  		}
ca9b0e27e072be Alexander Duyck   2008-09-12  250  =

a85a970af265f1 WANG Cong         2016-07-25  251  		d =3D to_skbedit(*a);
ca9b0e27e072be Alexander Duyck   2008-09-12  252  		ret =3D ACT_P_CREATED;
ca9b0e27e072be Alexander Duyck   2008-09-12  253  	} else {
a85a970af265f1 WANG Cong         2016-07-25  254  		d =3D to_skbedit(*a);
695176bfe5dec2 Cong Wang         2021-07-29  255  		if (!(act_flags & TCA_A=
CT_FLAGS_REPLACE)) {
65a206c01e8e7f Chris Mi          2017-08-30  256  			tcf_idr_release(*a, bi=
nd);
ca9b0e27e072be Alexander Duyck   2008-09-12  257  			return -EEXIST;
ca9b0e27e072be Alexander Duyck   2008-09-12  258  		}
4e8ddd7f1758ca Vlad Buslov       2018-07-05  259  	}
ec7727bb24b01e Davide Caratti    2019-03-20  260  	err =3D tcf_action_check=
_ctrlact(parm->action, tp, &goto_ch, extack);
ec7727bb24b01e Davide Caratti    2019-03-20  261  	if (err < 0)
ec7727bb24b01e Davide Caratti    2019-03-20  262  		goto release_idr;
ca9b0e27e072be Alexander Duyck   2008-09-12  263  =

c749cdda9089eb Davide Caratti    2018-07-11  264  	params_new =3D kzalloc(s=
izeof(*params_new), GFP_KERNEL);
c749cdda9089eb Davide Caratti    2018-07-11  265  	if (unlikely(!params_new=
)) {
ec7727bb24b01e Davide Caratti    2019-03-20  266  		err =3D -ENOMEM;
ec7727bb24b01e Davide Caratti    2019-03-20  267  		goto put_chain;
c749cdda9089eb Davide Caratti    2018-07-11  268  	}
ca9b0e27e072be Alexander Duyck   2008-09-12  269  =

c749cdda9089eb Davide Caratti    2018-07-11  270  	params_new->flags =3D fl=
ags;
ca9b0e27e072be Alexander Duyck   2008-09-12  271  	if (flags & SKBEDIT_F_PR=
IORITY)
c749cdda9089eb Davide Caratti    2018-07-11 @272  		params_new->priority =
=3D *priority;
6ede36fda618b7 Tonghao Zhang     2021-12-25  273  	if (flags & SKBEDIT_F_QU=
EUE_MAPPING) {
c749cdda9089eb Davide Caratti    2018-07-11  274  		params_new->queue_mappi=
ng =3D *queue_mapping;
6ede36fda618b7 Tonghao Zhang     2021-12-25  275  		params_new->mapping_mod=
 =3D mapping_mod;
6ede36fda618b7 Tonghao Zhang     2021-12-25  276  	}
1c55d62e77fa16 jamal             2009-10-15  277  	if (flags & SKBEDIT_F_MA=
RK)
c749cdda9089eb Davide Caratti    2018-07-11 @278  		params_new->mark =3D *m=
ark;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  279  	if (flags & SKBEDIT_F_PT=
YPE)
c749cdda9089eb Davide Caratti    2018-07-11 @280  		params_new->ptype =3D *=
ptype;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  281  	/* default behaviour is =
to use all the bits */
c749cdda9089eb Davide Caratti    2018-07-11  282  	params_new->mask =3D 0xf=
fffffff;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  283  	if (flags & SKBEDIT_F_MA=
SK)
c749cdda9089eb Davide Caratti    2018-07-11 @284  		params_new->mask =3D *m=
ask;
1c55d62e77fa16 jamal             2009-10-15  285  =

6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  286  	spin_lock_bh(&d->tcf_loc=
k);
ec7727bb24b01e Davide Caratti    2019-03-20  287  	goto_ch =3D tcf_action_s=
et_ctrlact(*a, parm->action, goto_ch);
445d3749315f34 Paul E. McKenney  2019-09-23  288  	params_new =3D rcu_repla=
ce_pointer(d->params, params_new,
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  289  					 lockdep_is_held(&d-=
>tcf_lock));
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  290  	spin_unlock_bh(&d->tcf_l=
ock);
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  291  	if (params_new)
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  292  		kfree_rcu(params_new, r=
cu);
ec7727bb24b01e Davide Caratti    2019-03-20  293  	if (goto_ch)
ec7727bb24b01e Davide Caratti    2019-03-20  294  		tcf_chain_put_by_act(go=
to_ch);
ca9b0e27e072be Alexander Duyck   2008-09-12  295  =

ca9b0e27e072be Alexander Duyck   2008-09-12  296  	return ret;
ec7727bb24b01e Davide Caratti    2019-03-20  297  put_chain:
ec7727bb24b01e Davide Caratti    2019-03-20  298  	if (goto_ch)
ec7727bb24b01e Davide Caratti    2019-03-20  299  		tcf_chain_put_by_act(go=
to_ch);
ec7727bb24b01e Davide Caratti    2019-03-20  300  release_idr:
ec7727bb24b01e Davide Caratti    2019-03-20  301  	tcf_idr_release(*a, bind=
);
ec7727bb24b01e Davide Caratti    2019-03-20  302  	return err;
ca9b0e27e072be Alexander Duyck   2008-09-12  303  }
ca9b0e27e072be Alexander Duyck   2008-09-12  304  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0369559846519644826==--


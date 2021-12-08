Content-Type: multipart/mixed; boundary="===============6135170292035841406=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next v1 2/2] net: sched: support hash/classid selecting queue_mapping
Date: Wed, 08 Dec 2021 14:12:16 +0800
Message-ID: <202112081406.0E2JDerN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6135170292035841406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211206080512.36610-3-xiangxia.m.yue@gmail.com>
References: <20211206080512.36610-3-xiangxia.m.yue@gmail.com>
TO: xiangxia.m.yue(a)gmail.com
TO: netdev(a)vger.kernel.org
CC: Tonghao Zhang <xiangxia.m.yue@gmail.com>
CC: Jamal Hadi Salim <jhs@mojatatu.com>
CC: Cong Wang <xiyou.wangcong@gmail.com>
CC: Jiri Pirko <jiri@resnulli.us>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jonathan Lemon <jonathan.lemon@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Alexander Lobakin <alobakin@pm.me>
CC: Paolo Abeni <pabeni@redhat.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/xiangxia-m-yue-gmail-com/n=
et-sched-allow-user-to-select-txqueue/20211206-160708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
ce83278f313ce65a9bbd780a3e07fa3f62d82525
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20211208/202112081406.0E2JDerN-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/8c116fa6e5382fb2594f0587f=
114802201e9bef2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review xiangxia-m-yue-gmail-com/net-sched=
-allow-user-to-select-txqueue/20211206-160708
        git checkout 8c116fa6e5382fb2594f0587f114802201e9bef2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:41:2: note: Loop condition is false. Execution con=
tinues on line 48
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:48:2: note: Loop condition is true.  Entering loop=
 body
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:790:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:49:7: note: Assuming 'q' is >=3D 'nr_queues'
                   if (q >=3D nr_queues)
                       ^~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:49:3: note: Taking true branch
                   if (q >=3D nr_queues)
                   ^
   block/blk-mq-cpumap.c:50:4: note:  Execution continues on line 54
                           break;
                           ^
   block/blk-mq-cpumap.c:54:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:179:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:55:3: note: Taking false branch
                   if (map[cpu] !=3D -1)
                   ^
   block/blk-mq-cpumap.c:63:7: note: 'q' is >=3D 'nr_queues'
                   if (q < nr_queues) {
                       ^
   block/blk-mq-cpumap.c:63:3: note: Taking false branch
                   if (q < nr_queues) {
                   ^
   block/blk-mq-cpumap.c:67:8: note: 'first_sibling' is equal to 'cpu'
                           if (first_sibling =3D=3D cpu)
                               ^~~~~~~~~~~~~
   block/blk-mq-cpumap.c:67:4: note: Taking true branch
                           if (first_sibling =3D=3D cpu)
                           ^
   block/blk-mq-cpumap.c:68:34: note: Passing the value 0 via 2nd parameter=
 'nr_queues'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                                                ^~~~~~~~~
   block/blk-mq-cpumap.c:68:16: note: Calling 'queue_index'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   block/blk-mq-cpumap.c:21:33: note: Division by zero
           return qmap->queue_offset + (q % nr_queues);
                                        ~~^~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> net/sched/act_skbedit.c:243:26: warning: Dereference of null pointer (lo=
aded from variable 'priority') [clang-analyzer-core.NullDereference]
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
   net/sched/act_skbedit.c:130:18: note: 'priority' initialized to a null p=
ointer value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                           ^~~~~~~~
   net/sched/act_skbedit.c:137:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:137:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:140:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:140:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:142:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:142:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:145:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:145:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:148:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:148:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:153:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:153:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:158:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:158:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:178:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:178:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:180:7: note: Assuming the condition is true
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:180:3: note: Taking true branch
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                   ^
   net/sched/act_skbedit.c:183:9: note: 'queue_mapping' is non-null
                           if (!queue_mapping)
                                ^~~~~~~~~~~~~
   net/sched/act_skbedit.c:183:4: note: Taking false branch
                           if (!queue_mapping)
                           ^
   net/sched/act_skbedit.c:188:8: note: Assuming 'max' is >=3D 'min'
                           if (max < min)
                               ^~~~~~~~~
   net/sched/act_skbedit.c:188:4: note: Taking false branch
                           if (max < min)
                           ^
   net/sched/act_skbedit.c:200:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:200:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:203:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:203:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:203:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:203:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:206:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:206:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:214:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:214:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:226:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:226:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:236:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:236:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:242:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:242:2: note: Taking true branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:243:26: note: Dereference of null pointer (loade=
d from variable 'priority')
                   params_new->priority =3D *priority;
                                          ^~~~~~~~~
>> net/sched/act_skbedit.c:249:22: warning: Dereference of null pointer (lo=
aded from variable 'mark') [clang-analyzer-core.NullDereference]
                   params_new->mark =3D *mark;
                                      ^~~~~
   net/sched/act_skbedit.c:130:36: note: 'mark' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                             ^~~~
   net/sched/act_skbedit.c:137:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:137:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:140:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:140:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:142:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:142:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:145:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:145:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:148:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:148:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:153:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:153:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:158:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:158:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:178:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:178:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:180:7: note: Assuming the condition is true
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:180:3: note: Taking true branch
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                   ^
   net/sched/act_skbedit.c:183:9: note: 'queue_mapping' is non-null
                           if (!queue_mapping)
                                ^~~~~~~~~~~~~
   net/sched/act_skbedit.c:183:4: note: Taking false branch
                           if (!queue_mapping)
                           ^
   net/sched/act_skbedit.c:188:8: note: Assuming 'max' is >=3D 'min'
                           if (max < min)
                               ^~~~~~~~~
   net/sched/act_skbedit.c:188:4: note: Taking false branch
                           if (max < min)
                           ^
   net/sched/act_skbedit.c:200:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:200:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:203:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:203:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:203:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:203:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:206:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:206:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:214:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:214:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:226:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:226:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:236:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:236:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:242:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:242:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:244:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:244:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:248:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:248:2: note: Taking true branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:249:22: note: Dereference of null pointer (loade=
d from variable 'mark')
                   params_new->mark =3D *mark;
                                      ^~~~~
>> net/sched/act_skbedit.c:251:23: warning: Dereference of null pointer (lo=
aded from variable 'ptype') [clang-analyzer-core.NullDereference]
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
   net/sched/act_skbedit.c:131:30: note: 'ptype' initialized to a null poin=
ter value
           u16 *queue_mapping =3D NULL, *ptype =3D NULL;
                                       ^~~~~
   net/sched/act_skbedit.c:137:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:137:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:140:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:140:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:142:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:142:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:145:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:145:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:148:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:148:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:153:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:153:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:158:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:158:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:178:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:178:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:180:7: note: Assuming the condition is true
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:180:3: note: Taking true branch
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                   ^
   net/sched/act_skbedit.c:183:9: note: 'queue_mapping' is non-null
                           if (!queue_mapping)
                                ^~~~~~~~~~~~~
   net/sched/act_skbedit.c:183:4: note: Taking false branch
                           if (!queue_mapping)
                           ^
   net/sched/act_skbedit.c:188:8: note: Assuming 'max' is >=3D 'min'
                           if (max < min)
                               ^~~~~~~~~
   net/sched/act_skbedit.c:188:4: note: Taking false branch
                           if (max < min)
                           ^
   net/sched/act_skbedit.c:200:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:200:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:203:6: note: Assuming 'exists' is true
           if (exists && bind)
               ^~~~~~
   net/sched/act_skbedit.c:203:6: note: Left side of '&&' is true
   net/sched/act_skbedit.c:203:16: note: Assuming 'bind' is false
           if (exists && bind)
                         ^~~~
   net/sched/act_skbedit.c:203:2: note: Taking false branch
           if (exists && bind)
           ^
   net/sched/act_skbedit.c:206:7: note: 'flags' is not equal to 0
           if (!flags) {
                ^~~~~
   net/sched/act_skbedit.c:206:2: note: Taking false branch
           if (!flags) {
           ^
   net/sched/act_skbedit.c:214:7: note: 'exists' is true
           if (!exists) {
                ^~~~~~
   net/sched/act_skbedit.c:214:2: note: Taking false branch
           if (!exists) {
           ^
   net/sched/act_skbedit.c:226:7: note: Assuming the condition is false
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:226:3: note: Taking false branch
                   if (!(act_flags & TCA_ACT_FLAGS_REPLACE)) {
                   ^
   net/sched/act_skbedit.c:232:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:232:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:236:15: note: Assuming 'params_new' is non-null
           if (unlikely(!params_new)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/sched/act_skbedit.c:236:2: note: Taking false branch
           if (unlikely(!params_new)) {
           ^
   net/sched/act_skbedit.c:242:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_PRIORITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:242:2: note: Taking false branch
           if (flags & SKBEDIT_F_PRIORITY)
           ^
   net/sched/act_skbedit.c:244:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:244:2: note: Taking false branch
           if (flags & SKBEDIT_F_QUEUE_MAPPING) {
           ^
   net/sched/act_skbedit.c:248:6: note: Assuming the condition is false
           if (flags & SKBEDIT_F_MARK)
               ^~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:248:2: note: Taking false branch
           if (flags & SKBEDIT_F_MARK)
           ^
   net/sched/act_skbedit.c:250:6: note: Assuming the condition is true
           if (flags & SKBEDIT_F_PTYPE)
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:250:2: note: Taking true branch
           if (flags & SKBEDIT_F_PTYPE)
           ^
   net/sched/act_skbedit.c:251:23: note: Dereference of null pointer (loade=
d from variable 'ptype')
                   params_new->ptype =3D *ptype;
                                       ^~~~~~
>> net/sched/act_skbedit.c:255:22: warning: Dereference of null pointer (lo=
aded from variable 'mask') [clang-analyzer-core.NullDereference]
                   params_new->mask =3D *mask;
                                      ^~~~~
   net/sched/act_skbedit.c:130:50: note: 'mask' initialized to a null point=
er value
           u32 flags =3D 0, *priority =3D NULL, *mark =3D NULL, *mask =3D N=
ULL;
                                                           ^~~~
   net/sched/act_skbedit.c:137:6: note: Assuming 'nla' is not equal to NULL
           if (nla =3D=3D NULL)
               ^~~~~~~~~~~
   net/sched/act_skbedit.c:137:2: note: Taking false branch
           if (nla =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:140:8: note: Calling 'nla_parse_nested_deprecate=
d'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netlink.h:1231:9: note: Assigning value, which participates =
in a condition later
           return __nla_parse(tb, maxtype, nla_data(nla), nla_len(nla), pol=
icy,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/sched/act_skbedit.c:140:8: note: Returning from 'nla_parse_nested_de=
precated'
           err =3D nla_parse_nested_deprecated(tb, TCA_SKBEDIT_MAX, nla,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:142:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:142:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:145:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:145:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PARMS] =3D=3D NULL)
           ^
   net/sched/act_skbedit.c:148:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:148:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PRIORITY] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:153:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:153:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_QUEUE_MAPPING] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:158:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:158:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_PTYPE] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:165:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:165:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MARK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:170:6: note: Assuming the condition is false
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:170:2: note: Taking false branch
           if (tb[TCA_SKBEDIT_MASK] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:175:6: note: Assuming the condition is true
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:175:2: note: Taking true branch
           if (tb[TCA_SKBEDIT_FLAGS] !=3D NULL) {
           ^
   net/sched/act_skbedit.c:178:7: note: Assuming the condition is false
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:178:3: note: Taking false branch
                   if (*pure_flags & SKBEDIT_F_INHERITDSFIELD)
                   ^
   net/sched/act_skbedit.c:180:7: note: Assuming the condition is true
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_skbedit.c:180:3: note: Taking true branch
                   if (*pure_flags & SKBEDIT_F_QUEUE_MAPPING_HASH_MASK) {
                   ^
   net/sched/act_skbedit.c:183:9: note: 'queue_mapping' is non-null
                           if (!queue_mapping)
                                ^~~~~~~~~~~~~
   net/sched/act_skbedit.c:183:4: note: Taking false branch
                           if (!queue_mapping)
                           ^
   net/sched/act_skbedit.c:188:8: note: Assuming 'max' is >=3D 'min'
                           if (max < min)
                               ^~~~~~~~~
   net/sched/act_skbedit.c:188:4: note: Taking false branch
                           if (max < min)
                           ^
   net/sched/act_skbedit.c:200:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/sched/act_skbedit.c:200:2: note: Taking false branch
           if (err < 0)
           ^
   net/sched/act_skbedit.c:203:6: note: Assuming 'exists' is true
           if (exists && bind)

vim +/priority +243 net/sched/act_skbedit.c

ca9b0e27e072be Alexander Duyck   2008-09-12  117  =

c1b52739e45f59 Benjamin LaHaise  2013-01-14  118  static int tcf_skbedit_in=
it(struct net *net, struct nlattr *nla,
a85a970af265f1 WANG Cong         2016-07-25  119  			    struct nlattr *est=
, struct tc_action **a,
abbb0d33632ce9 Vlad Buslov       2019-10-30  120  			    struct tcf_proto *=
tp, u32 act_flags,
789871bb2a0381 Vlad Buslov       2018-07-05  121  			    struct netlink_ext=
_ack *extack)
ca9b0e27e072be Alexander Duyck   2008-09-12  122  {
ddf97ccdd7cb7e WANG Cong         2016-02-22  123  	struct tc_action_net *tn=
 =3D net_generic(net, skbedit_net_id);
695176bfe5dec2 Cong Wang         2021-07-29  124  	bool bind =3D act_flags =
& TCA_ACT_FLAGS_BIND;
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  125  	struct tcf_skbedit_param=
s *params_new;
ca9b0e27e072be Alexander Duyck   2008-09-12  126  	struct nlattr *tb[TCA_SK=
BEDIT_MAX + 1];
ec7727bb24b01e Davide Caratti    2019-03-20  127  	struct tcf_chain *goto_c=
h =3D NULL;
ca9b0e27e072be Alexander Duyck   2008-09-12  128  	struct tc_skbedit *parm;
ca9b0e27e072be Alexander Duyck   2008-09-12  129  	struct tcf_skbedit *d;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  130  	u32 flags =3D 0, *priori=
ty =3D NULL, *mark =3D NULL, *mask =3D NULL;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  131  	u16 *queue_mapping =3D N=
ULL, *ptype =3D NULL;
8c116fa6e5382f Tonghao Zhang     2021-12-06  132  	u16 mapping_mod =3D 0;
b2313077ed0db3 WANG Cong         2016-06-13  133  	bool exists =3D false;
b2313077ed0db3 WANG Cong         2016-06-13  134  	int ret =3D 0, err;
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  135  	u32 index;
ca9b0e27e072be Alexander Duyck   2008-09-12  136  =

ca9b0e27e072be Alexander Duyck   2008-09-12  137  	if (nla =3D=3D NULL)
ca9b0e27e072be Alexander Duyck   2008-09-12  138  		return -EINVAL;
ca9b0e27e072be Alexander Duyck   2008-09-12  139  =

8cb081746c031f Johannes Berg     2019-04-26  140  	err =3D nla_parse_nested=
_deprecated(tb, TCA_SKBEDIT_MAX, nla,
8cb081746c031f Johannes Berg     2019-04-26  141  					  skbedit_policy, NU=
LL);
ca9b0e27e072be Alexander Duyck   2008-09-12  142  	if (err < 0)
ca9b0e27e072be Alexander Duyck   2008-09-12  143  		return err;
ca9b0e27e072be Alexander Duyck   2008-09-12  144  =

ca9b0e27e072be Alexander Duyck   2008-09-12  145  	if (tb[TCA_SKBEDIT_PARMS=
] =3D=3D NULL)
ca9b0e27e072be Alexander Duyck   2008-09-12  146  		return -EINVAL;
ca9b0e27e072be Alexander Duyck   2008-09-12  147  =

ca9b0e27e072be Alexander Duyck   2008-09-12  148  	if (tb[TCA_SKBEDIT_PRIOR=
ITY] !=3D NULL) {
ca9b0e27e072be Alexander Duyck   2008-09-12  149  		flags |=3D SKBEDIT_F_PR=
IORITY;
ca9b0e27e072be Alexander Duyck   2008-09-12  150  		priority =3D nla_data(t=
b[TCA_SKBEDIT_PRIORITY]);
ca9b0e27e072be Alexander Duyck   2008-09-12  151  	}
ca9b0e27e072be Alexander Duyck   2008-09-12  152  =

ca9b0e27e072be Alexander Duyck   2008-09-12  153  	if (tb[TCA_SKBEDIT_QUEUE=
_MAPPING] !=3D NULL) {
ca9b0e27e072be Alexander Duyck   2008-09-12  154  		flags |=3D SKBEDIT_F_QU=
EUE_MAPPING;
ca9b0e27e072be Alexander Duyck   2008-09-12  155  		queue_mapping =3D nla_d=
ata(tb[TCA_SKBEDIT_QUEUE_MAPPING]);
ca9b0e27e072be Alexander Duyck   2008-09-12  156  	}
1c55d62e77fa16 jamal             2009-10-15  157  =

ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  158  	if (tb[TCA_SKBEDIT_PTYPE=
] !=3D NULL) {
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  159  		ptype =3D nla_data(tb[T=
CA_SKBEDIT_PTYPE]);
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  160  		if (!skb_pkt_type_ok(*p=
type))
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  161  			return -EINVAL;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  162  		flags |=3D SKBEDIT_F_PT=
YPE;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  163  	}
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  164  =

1c55d62e77fa16 jamal             2009-10-15  165  	if (tb[TCA_SKBEDIT_MARK]=
 !=3D NULL) {
1c55d62e77fa16 jamal             2009-10-15  166  		flags |=3D SKBEDIT_F_MA=
RK;
1c55d62e77fa16 jamal             2009-10-15  167  		mark =3D nla_data(tb[TC=
A_SKBEDIT_MARK]);
1c55d62e77fa16 jamal             2009-10-15  168  	}
1c55d62e77fa16 jamal             2009-10-15  169  =

4fe77d82ef80c7 Antonio Quartulli 2016-10-24  170  	if (tb[TCA_SKBEDIT_MASK]=
 !=3D NULL) {
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  171  		flags |=3D SKBEDIT_F_MA=
SK;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  172  		mask =3D nla_data(tb[TC=
A_SKBEDIT_MASK]);
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  173  	}
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  174  =

e7e3728bd776d1 Qiaobin Fu        2018-07-01  175  	if (tb[TCA_SKBEDIT_FLAGS=
] !=3D NULL) {
e7e3728bd776d1 Qiaobin Fu        2018-07-01  176  		u64 *pure_flags =3D nla=
_data(tb[TCA_SKBEDIT_FLAGS]);
e7e3728bd776d1 Qiaobin Fu        2018-07-01  177  =

e7e3728bd776d1 Qiaobin Fu        2018-07-01  178  		if (*pure_flags & SKBED=
IT_F_INHERITDSFIELD)
e7e3728bd776d1 Qiaobin Fu        2018-07-01  179  			flags |=3D SKBEDIT_F_I=
NHERITDSFIELD;
8c116fa6e5382f Tonghao Zhang     2021-12-06  180  		if (*pure_flags & SKBED=
IT_F_QUEUE_MAPPING_HASH_MASK) {
8c116fa6e5382f Tonghao Zhang     2021-12-06  181  			u16 max, min;
8c116fa6e5382f Tonghao Zhang     2021-12-06  182  =

8c116fa6e5382f Tonghao Zhang     2021-12-06  183  			if (!queue_mapping)
8c116fa6e5382f Tonghao Zhang     2021-12-06  184  				return -EINVAL;
8c116fa6e5382f Tonghao Zhang     2021-12-06  185  =

8c116fa6e5382f Tonghao Zhang     2021-12-06  186  			max =3D *queue_mapping=
 >> 8;
8c116fa6e5382f Tonghao Zhang     2021-12-06  187  			min =3D *queue_mapping=
 & 0xff;
8c116fa6e5382f Tonghao Zhang     2021-12-06  188  			if (max < min)
8c116fa6e5382f Tonghao Zhang     2021-12-06  189  				return -EINVAL;
8c116fa6e5382f Tonghao Zhang     2021-12-06  190  =

8c116fa6e5382f Tonghao Zhang     2021-12-06  191  			mapping_mod =3D max - =
min + 1;
8c116fa6e5382f Tonghao Zhang     2021-12-06  192  			flags |=3D *pure_flags=
 &
8c116fa6e5382f Tonghao Zhang     2021-12-06  193  				 SKBEDIT_F_QUEUE_MAPP=
ING_HASH_MASK;
8c116fa6e5382f Tonghao Zhang     2021-12-06  194  		}
e7e3728bd776d1 Qiaobin Fu        2018-07-01  195  	}
e7e3728bd776d1 Qiaobin Fu        2018-07-01  196  =

ca9b0e27e072be Alexander Duyck   2008-09-12  197  	parm =3D nla_data(tb[TCA=
_SKBEDIT_PARMS]);
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  198  	index =3D parm->index;
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  199  	err =3D tcf_idr_check_al=
loc(tn, &index, a, bind);
0190c1d452a91c Vlad Buslov       2018-07-05  200  	if (err < 0)
0190c1d452a91c Vlad Buslov       2018-07-05  201  		return err;
0190c1d452a91c Vlad Buslov       2018-07-05  202  	exists =3D err;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  203  	if (exists && bind)
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  204  		return 0;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  205  =

5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  206  	if (!flags) {
af5d01842fe1fb Roman Mashak      2018-05-11  207  		if (exists)
65a206c01e8e7f Chris Mi          2017-08-30  208  			tcf_idr_release(*a, bi=
nd);
0190c1d452a91c Vlad Buslov       2018-07-05  209  		else
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  210  			tcf_idr_cleanup(tn, in=
dex);
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  211  		return -EINVAL;
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  212  	}
5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  213  =

5e1567aeb7fe0c Jamal Hadi Salim  2016-05-10  214  	if (!exists) {
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  215  		ret =3D tcf_idr_create(=
tn, index, est, a,
e38226786022d2 Vlad Buslov       2019-10-30  216  				     &act_skbedit_ops=
, bind, true, 0);
0190c1d452a91c Vlad Buslov       2018-07-05  217  		if (ret) {
7be8ef2cdbfe41 Dmytro Linkin     2019-08-01  218  			tcf_idr_cleanup(tn, in=
dex);
86062033feb8a1 WANG Cong         2014-02-11  219  			return ret;
0190c1d452a91c Vlad Buslov       2018-07-05  220  		}
ca9b0e27e072be Alexander Duyck   2008-09-12  221  =

a85a970af265f1 WANG Cong         2016-07-25  222  		d =3D to_skbedit(*a);
ca9b0e27e072be Alexander Duyck   2008-09-12  223  		ret =3D ACT_P_CREATED;
ca9b0e27e072be Alexander Duyck   2008-09-12  224  	} else {
a85a970af265f1 WANG Cong         2016-07-25  225  		d =3D to_skbedit(*a);
695176bfe5dec2 Cong Wang         2021-07-29  226  		if (!(act_flags & TCA_A=
CT_FLAGS_REPLACE)) {
65a206c01e8e7f Chris Mi          2017-08-30  227  			tcf_idr_release(*a, bi=
nd);
ca9b0e27e072be Alexander Duyck   2008-09-12  228  			return -EEXIST;
ca9b0e27e072be Alexander Duyck   2008-09-12  229  		}
4e8ddd7f1758ca Vlad Buslov       2018-07-05  230  	}
ec7727bb24b01e Davide Caratti    2019-03-20  231  	err =3D tcf_action_check=
_ctrlact(parm->action, tp, &goto_ch, extack);
ec7727bb24b01e Davide Caratti    2019-03-20  232  	if (err < 0)
ec7727bb24b01e Davide Caratti    2019-03-20  233  		goto release_idr;
ca9b0e27e072be Alexander Duyck   2008-09-12  234  =

c749cdda9089eb Davide Caratti    2018-07-11  235  	params_new =3D kzalloc(s=
izeof(*params_new), GFP_KERNEL);
c749cdda9089eb Davide Caratti    2018-07-11  236  	if (unlikely(!params_new=
)) {
ec7727bb24b01e Davide Caratti    2019-03-20  237  		err =3D -ENOMEM;
ec7727bb24b01e Davide Caratti    2019-03-20  238  		goto put_chain;
c749cdda9089eb Davide Caratti    2018-07-11  239  	}
ca9b0e27e072be Alexander Duyck   2008-09-12  240  =

c749cdda9089eb Davide Caratti    2018-07-11  241  	params_new->flags =3D fl=
ags;
ca9b0e27e072be Alexander Duyck   2008-09-12  242  	if (flags & SKBEDIT_F_PR=
IORITY)
c749cdda9089eb Davide Caratti    2018-07-11 @243  		params_new->priority =
=3D *priority;
8c116fa6e5382f Tonghao Zhang     2021-12-06  244  	if (flags & SKBEDIT_F_QU=
EUE_MAPPING) {
c749cdda9089eb Davide Caratti    2018-07-11  245  		params_new->queue_mappi=
ng =3D *queue_mapping;
8c116fa6e5382f Tonghao Zhang     2021-12-06  246  		params_new->mapping_mod=
 =3D mapping_mod;
8c116fa6e5382f Tonghao Zhang     2021-12-06  247  	}
1c55d62e77fa16 jamal             2009-10-15  248  	if (flags & SKBEDIT_F_MA=
RK)
c749cdda9089eb Davide Caratti    2018-07-11 @249  		params_new->mark =3D *m=
ark;
ff202ee1ed8f03 Jamal Hadi Salim  2016-07-02  250  	if (flags & SKBEDIT_F_PT=
YPE)
c749cdda9089eb Davide Caratti    2018-07-11 @251  		params_new->ptype =3D *=
ptype;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  252  	/* default behaviour is =
to use all the bits */
c749cdda9089eb Davide Caratti    2018-07-11  253  	params_new->mask =3D 0xf=
fffffff;
4fe77d82ef80c7 Antonio Quartulli 2016-10-24  254  	if (flags & SKBEDIT_F_MA=
SK)
c749cdda9089eb Davide Caratti    2018-07-11 @255  		params_new->mask =3D *m=
ask;
1c55d62e77fa16 jamal             2009-10-15  256  =

6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  257  	spin_lock_bh(&d->tcf_loc=
k);
ec7727bb24b01e Davide Caratti    2019-03-20  258  	goto_ch =3D tcf_action_s=
et_ctrlact(*a, parm->action, goto_ch);
445d3749315f34 Paul E. McKenney  2019-09-23  259  	params_new =3D rcu_repla=
ce_pointer(d->params, params_new,
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  260  					 lockdep_is_held(&d-=
>tcf_lock));
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  261  	spin_unlock_bh(&d->tcf_l=
ock);
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  262  	if (params_new)
6d7a8df6dfe4d6 Vlad Buslov       2018-09-03  263  		kfree_rcu(params_new, r=
cu);
ec7727bb24b01e Davide Caratti    2019-03-20  264  	if (goto_ch)
ec7727bb24b01e Davide Caratti    2019-03-20  265  		tcf_chain_put_by_act(go=
to_ch);
ca9b0e27e072be Alexander Duyck   2008-09-12  266  =

ca9b0e27e072be Alexander Duyck   2008-09-12  267  	return ret;
ec7727bb24b01e Davide Caratti    2019-03-20  268  put_chain:
ec7727bb24b01e Davide Caratti    2019-03-20  269  	if (goto_ch)
ec7727bb24b01e Davide Caratti    2019-03-20  270  		tcf_chain_put_by_act(go=
to_ch);
ec7727bb24b01e Davide Caratti    2019-03-20  271  release_idr:
ec7727bb24b01e Davide Caratti    2019-03-20  272  	tcf_idr_release(*a, bind=
);
ec7727bb24b01e Davide Caratti    2019-03-20  273  	return err;
ca9b0e27e072be Alexander Duyck   2008-09-12  274  }
ca9b0e27e072be Alexander Duyck   2008-09-12  275  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6135170292035841406==--


Content-Type: multipart/mixed; boundary="===============1228875838500873465=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 19/40] lib/maple_tree.c:319:2: warning: Value stored to 'node' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 07 Apr 2022 15:12:40 +0800
Message-ID: <202204071501.N97YJGfd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1228875838500873465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: David Howells <dhowells@redhat.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   674eea41fc70a740ff83ec590f9833f805852464
commit: 51b63e667ad83864c161cf2b8ef462e907536070 [19/40] Maple Tree: Add ne=
w data structure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220405 (https://download.01.org/0day-ci/archi=
ve/20220407/202204071501.N97YJGfd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/51b63e667ad8386=
4c161cf2b8ef462e907536070
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-maple
        git checkout 51b63e667ad83864c161cf2b8ef462e907536070
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwtracing/coresight/coresight-stm.c:311:3: note: Call to functio=
n 'memcpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(paload, data, size);
                   ^~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:616:9: warning: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:616:9: note: Call to functio=
n 'sprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%#lx\n", val);
                  ^~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   drivers/hwtracing/coresight/coresight-stm.c:418:8: note: Assuming 'drvda=
ta' is non-null
           if (!(drvdata && local_read(&drvdata->mode)))
                 ^~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:418:8: note: Left side of '&=
&' is true
   drivers/hwtracing/coresight/coresight-stm.c:418:6: note: Assuming the co=
ndition is false
           if (!(drvdata && local_read(&drvdata->mode)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:418:2: note: Taking false br=
anch
           if (!(drvdata && local_read(&drvdata->mode)))
           ^
   drivers/hwtracing/coresight/coresight-stm.c:421:6: note: Assuming 'chann=
el' is < field 'numsp'
           if (channel >=3D drvdata->numsp)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:421:2: note: Taking false br=
anch
           if (channel >=3D drvdata->numsp)
           ^
   drivers/hwtracing/coresight/coresight-stm.c:426:15: note: Assuming the c=
ondition is false
           stm_flags =3D (flags & STP_PACKET_TIMESTAMPED) ?
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:426:14: note: '?' condition =
is false
           stm_flags =3D (flags & STP_PACKET_TIMESTAMPED) ?
                       ^
   drivers/hwtracing/coresight/coresight-stm.c:428:15: note: Assuming the c=
ondition is false
           stm_flags |=3D test_bit(channel, drvdata->chs.guaranteed) ?
                        ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/hwtracing/coresight/coresight-stm.c:428:15: note: '?' condition =
is false
           stm_flags |=3D test_bit(channel, drvdata->chs.guaranteed) ?
                        ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   drivers/hwtracing/coresight/coresight-stm.c:431:6: note: Assuming 'size'=
 is <=3D field 'write_bytes'
           if (size > drvdata->write_bytes)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-stm.c:431:2: note: Taking false br=
anch
           if (size > drvdata->write_bytes)
           ^
   drivers/hwtracing/coresight/coresight-stm.c:434:10: note: '?' condition =
is false
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/hwtracing/coresight/coresight-stm.c:434:10: note: Calling '__rou=
nddown_pow_of_two'
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   lib/kobject_uevent.c:296:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]
           sprintf(scratch, "%s@%s", action_string, devpath);
           ^~~~~~~
   lib/kobject_uevent.c:296:2: note: Call to function 'sprintf' is insecure=
 as it does not provide bounding of the memory buffer or security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'sprintf_s' in case o=
f C11
           sprintf(scratch, "%s@%s", action_string, devpath);
           ^~~~~~~
   lib/kobject_uevent.c:435:4: warning: Call to function 'memmove' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memmove_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:435:4: note: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11
                           memmove(env->envp[i], env->envp[i + 1],
                           ^~~~~~~
   lib/kobject_uevent.c:665:8: warning: Call to function 'vsnprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'vsnprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:665:8: note: Call to function 'vsnprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'vsnprintf_s' in case of C11
           len =3D vsnprintf(&env->buf[env->buflen],
                 ^~~~~~~~~
   lib/kobject_uevent.c:691:8: warning: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, sizeof(buf), "SEQNUM=3D%llu", ++uevent_seq=
num);
                 ^~~~~~~~
   lib/kobject_uevent.c:691:8: note: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, sizeof(buf), "SEQNUM=3D%llu", ++uevent_seq=
num);
                 ^~~~~~~~
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
>> lib/maple_tree.c:319:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:319:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:324:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:324:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:470:3: warning: Value stored to 'shift' is never read [=
clang-analyzer-deadcode.DeadStores]
                   shift =3D type =3D 0;
                   ^       ~~~~~~~~
   lib/maple_tree.c:470:3: note: Value stored to 'shift' is never read
                   shift =3D type =3D 0;
                   ^       ~~~~~~~~
>> lib/maple_tree.c:470:11: warning: Although the value stored to 'type' is=
 used in the enclosing expression, the value is never actually read from 't=
ype' [clang-analyzer-deadcode.DeadStores]
                   shift =3D type =3D 0;
                           ^      ~
   lib/maple_tree.c:470:11: note: Although the value stored to 'type' is us=
ed in the enclosing expression, the value is never actually read from 'type'
                   shift =3D type =3D 0;
                           ^      ~
   lib/maple_tree.c:1176:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reuse, 0, sizeof(*reuse));
           ^~~~~~
   lib/maple_tree.c:1176:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(reuse, 0, sizeof(*reuse));
           ^~~~~~
>> lib/maple_tree.c:1208:23: warning: Value stored to 'nodep' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1208:23: note: Value stored to 'nodep' during its initi=
alization is never read
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1218:20: warning: Access to field 'node_count' results =
in a dereference of a null pointer (loaded from field 'alloc') [clang-analy=
zer-core.NullDereference]
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
                             ^
   lib/maple_tree.c:6266:2: note: Calling 'trace_ma_op'
           trace_ma_op(__func__, &mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/maple_tree.h:13:1: note: Returning without writing =
to 'mas->alloc', which participates in a condition later
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   include/trace/events/maple_tree.h:13:1: note: Returning without writing =
to 'mas->alloc'
   TRACE_EVENT(ma_op,
   ^
   include/linux/tracepoint.h:553:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:419:2: note: expanded from macro 'DECLARE_TRA=
CE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:343:4: note: expanded from macro '__DECLARE_T=
RACE'
           { }                                                             \
             ^
   lib/maple_tree.c:6266:2: note: Returning from 'trace_ma_op'
           trace_ma_op(__func__, &mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Calling 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:476:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_NONE;
           ^
   include/linux/maple_tree.h:476:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5981:6: note: Returning from 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
   lib/maple_tree.c:5981:26: note: Calling 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:482:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_PAUSE;
           ^
   include/linux/maple_tree.h:482:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5981:26: note: Returning from 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5985:10: note: Calling 'mas_state_walk'
           entry =3D mas_state_walk(mas);
                   ^~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3741:10: note: Calling 'mas_start'
           entry =3D mas_start(mas);
                   ^~~~~~~~~~~~~~
   lib/maple_tree.c:1316:13: note: Calling 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:236:2: note: Returning without writing to 'mas->alloc',=
 which participates in a condition later
           return mas->node =3D=3D MAS_START;
           ^
   lib/maple_tree.c:236:2: note: Returning without writing to 'mas->alloc'
   lib/maple_tree.c:1316:13: note: Returning from 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:1316:2: note: Taking true branch
           if (likely(mas_is_start(mas))) {
           ^
   lib/maple_tree.c:1325:10: note: Calling 'mas_root'
                   root =3D mas_root(mas);
                          ^~~~~~~~~~~~~
   lib/maple_tree.c:847:9: note: Left side of '||' is false
           return rcu_dereference_check(mas->tree->ma_root, mt_locked(mas->=
tree));
                  ^
   include/linux/rcupdate.h:531:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
           ^
   include/linux/rcupdate.h:391:43: note: expanded from macro '__rcu_derefe=
rence_check'
--
                   ^
   lib/maple_tree.c:2788:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   lib/maple_tree.c:2833:2: note: Returning without writing to 'mas->alloc'=
, which participates in a condition later
           return (void *) next;
           ^
   lib/maple_tree.c:2833:2: note: Returning without writing to 'mas->alloc'
   lib/maple_tree.c:2983:2: note: Returning from 'mtree_range_walk'
           mtree_range_walk(mas);
           ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3940:9: note: Returning from 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4269:3: note: Returning from 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5993:2: note: Returning from 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5994:6: note: Calling 'mas_nomem'
           if (mas_nomem(mas, GFP_KERNEL))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6011:13: note: Assuming the condition is false
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:6011:2: note: Taking false branch
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
           ^
   lib/maple_tree.c:6016:6: note: Left side of '&&' is true
           if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)=
) {
               ^
   lib/maple_tree.c:6016:2: note: Taking false branch
           if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)=
) {
           ^
   lib/maple_tree.c:6021:3: note: Calling 'mas_alloc_nodes'
                   mas_alloc_nodes(mas, gfp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1209:28: note: Calling 'mas_allocated'
           unsigned long allocated =3D mas_allocated(mas);
                                     ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:554:6: note: Assuming field 'alloc' is non-null, which =
participates in a condition later
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
               ^~~~~~~~~~~
   lib/maple_tree.c:554:6: note: Left side of '||' is false
   lib/maple_tree.c:554:22: note: Assuming the condition is false
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:554:2: note: Taking false branch
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
           ^
   lib/maple_tree.c:557:2: note: Returning value, which participates in a c=
ondition later
           return mas->alloc->total;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1209:28: note: Returning from 'mas_allocated'
           unsigned long allocated =3D mas_allocated(mas);
                                     ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1214:6: note: Assuming 'requested' is not equal to 0
           if (!requested)
               ^~~~~~~~~~
   lib/maple_tree.c:1214:2: note: Taking false branch
           if (!requested)
           ^
   lib/maple_tree.c:1217:2: note: Calling 'mas_set_alloc_req'
           mas_set_alloc_req(mas, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:572:12: note: Field 'alloc' is non-null, which particip=
ates in a condition later
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
                     ^
   lib/maple_tree.c:572:6: note: Left side of '||' is false
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
               ^
   lib/maple_tree.c:572:22: note: Assuming the condition is true
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:572:2: note: Taking true branch
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
           ^
   lib/maple_tree.c:573:8: note: 'count' is 0
                   if (!count)
                        ^~~~~
   lib/maple_tree.c:573:3: note: Taking true branch
                   if (!count)
                   ^
   lib/maple_tree.c:574:4: note: Null pointer value stored to 'mas.alloc'
                           mas->alloc =3D NULL;
                           ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1217:2: note: Returning from 'mas_set_alloc_req'
           mas_set_alloc_req(mas, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1218:6: note: Assuming 'allocated' is not equal to 0
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
               ^~~~~~~~~~
   lib/maple_tree.c:1218:6: note: Left side of '||' is false
   lib/maple_tree.c:1218:20: note: Access to field 'node_count' results in =
a dereference of a null pointer (loaded from field 'alloc')
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
                             ^    ~~~~~
>> lib/maple_tree.c:1690:3: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:190:2: note: expanded from macro 'smp_stor=
e_release'
           WRITE_ONCE(*p, v);                                              \
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                       ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5994:2: note: Taking true branch
           if (mas_nomem(mas, GFP_KERNEL))
           ^
   lib/maple_tree.c:5995:3: note: Control jumps to line 5991
                   goto write_retry;
                   ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking false branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4277:15: note: Field 'entry' is non-null
           if (!wr_mas->entry)
                        ^
   lib/maple_tree.c:4277:2: note: Taking false branch
           if (!wr_mas->entry)
           ^
   lib/maple_tree.c:4281:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:4281:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                                    ^
   lib/maple_tree.c:4281:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
           ^
   lib/maple_tree.c:4286:2: note: Calling 'mas_wr_modify'
           mas_wr_modify(wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4211:6: note: Assuming field 'r_min' is not equal to fi=
eld 'index'
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4211:34: note: Left side of '&&' is false
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
                                           ^
   lib/maple_tree.c:4221:15: note: Assuming the condition is false
           if (unlikely(wr_mas->offset_end + 1 >=3D node_slots))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:4221:2: note: Taking false branch
           if (unlikely(wr_mas->offset_end + 1 >=3D node_slots))
           ^
   lib/maple_tree.c:4224:14: note: Field 'entry' is non-null
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                       ^
   lib/maple_tree.c:4224:6: note: Left side of '&&' is true
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
               ^
   lib/maple_tree.c:4224:24: note: Assuming the condition is false
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4224:59: note: Left side of '&&' is false
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                                                                    ^
   lib/maple_tree.c:4231:7: note: Assuming the condition is false
--
           piv_end =3D min(mas_end, mt_pivots[mt]);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   lib/maple_tree.c:1897:12: note: '?' condition is false
           piv_end =3D min(mas_end, mt_pivots[mt]);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   lib/maple_tree.c:1898:9: note: 'i' is >=3D 'piv_end'
           for (; i < piv_end; i++, j++) {
                  ^
   lib/maple_tree.c:1898:2: note: Loop condition is false. Execution contin=
ues on line 1907
           for (; i < piv_end; i++, j++) {
           ^
   lib/maple_tree.c:1907:13: note: Assuming 'i' is > 'mas_end'
           if (likely(i <=3D mas_end))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:1907:2: note: Taking false branch
           if (likely(i <=3D mas_end))
           ^
   lib/maple_tree.c:1915:22: note: Left side of '&&' is false
           if (!ma_is_leaf(mt) && mt_is_alloc(mas->tree)) {
                               ^
   lib/maple_tree.c:3931:2: note: Returning from 'mas_mab_cp'
           mas_mab_cp(&r_mas, r_mas.offset, r_wr_mas.node_end,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is false. Execution contin=
ues on line 2954
           while (count--) {
           ^
   lib/maple_tree.c:2957:2: note: Calling 'mab_mas_cp'
           mab_mas_cp(mast->bn, 0, mt_slots[mast->bn->type] - 1, &l_mas, tr=
ue);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   lib/maple_tree.c:1941:6: note: Assuming the condition is false
           if (mab_end - mab_start > mt_pivots[mt])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1941:2: note: Taking false branch
           if (mab_end - mab_start > mt_pivots[mt])
           ^
   lib/maple_tree.c:1944:6: note: Assuming the condition is false
           if (!pivots[mt_pivots[mt] - 1])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1944:2: note: Taking false branch
           if (!pivots[mt_pivots[mt] - 1])
           ^
   lib/maple_tree.c:1951:11: note: 'i' is <=3D 'mab_end'
           } while (i <=3D mab_end && likely(b_node->pivot[i]));
                    ^
   lib/maple_tree.c:1951:11: note: Left side of '&&' is true
   lib/maple_tree.c:1949:2: note: Loop condition is true. Execution continu=
es on line 1950
           do {
           ^
   lib/maple_tree.c:1950:31: note: The value 3 is assigned to 'i'
                   pivots[j++] =3D b_node->pivot[i++];
                                               ^~~
   lib/maple_tree.c:1951:11: note: 'i' is <=3D 'mab_end'
           } while (i <=3D mab_end && likely(b_node->pivot[i]));
                    ^
   lib/maple_tree.c:1951:11: note: Left side of '&&' is true
   lib/maple_tree.c:1951:27: note: 1st function call argument is an uniniti=
alized value
           } while (i <=3D mab_end && likely(b_node->pivot[i]));
                                    ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^                ~~~~~
   lib/maple_tree.c:1953:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots, b_node->slot + mab_start,
           ^~~~~~
   lib/maple_tree.c:1953:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots, b_node->slot + mab_start,
           ^~~~~~
>> lib/maple_tree.c:1966:14: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                           gaps[--j] =3D b_node->gap[--i];
                                     ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5994:2: note: Taking true branch
           if (mas_nomem(mas, GFP_KERNEL))
           ^
   lib/maple_tree.c:5995:3: note: Control jumps to line 5991
                   goto write_retry;
                   ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking false branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4277:15: note: Field 'entry' is non-null
           if (!wr_mas->entry)
                        ^
   lib/maple_tree.c:4277:2: note: Taking false branch
           if (!wr_mas->entry)
           ^
   lib/maple_tree.c:4281:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:4281:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                                    ^
   lib/maple_tree.c:4281:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
           ^
   lib/maple_tree.c:4286:2: note: Calling 'mas_wr_modify'
           mas_wr_modify(wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4211:6: note: Assuming field 'r_min' is not equal to fi=
eld 'index'
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4211:34: note: Left side of '&&' is false
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
                                           ^
   lib/maple_tree.c:4221:15: note: Assuming the condition is false
           if (unlikely(wr_mas->offset_end + 1 >=3D node_slots))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:4221:2: note: Taking false branch
           if (unlikely(wr_mas->offset_end + 1 >=3D node_slots))
           ^
   lib/maple_tree.c:4224:14: note: Field 'entry' is non-null
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                       ^
   lib/maple_tree.c:4224:6: note: Left side of '&&' is true
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
               ^
   lib/maple_tree.c:4224:24: note: Assuming the condition is false
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4224:59: note: Left side of '&&' is false
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                                                                    ^
   lib/maple_tree.c:4231:7: note: Assuming the condition is false
           if ((wr_mas->offset_end - mas->offset <=3D 1) && mas_wr_slot_sto=
re(wr_mas))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4231:46: note: Left side of '&&' is false
           if ((wr_mas->offset_end - mas->offset <=3D 1) && mas_wr_slot_sto=
re(wr_mas))
                                                       ^
   lib/maple_tree.c:4233:11: note: Assuming the condition is false
           else if (mas_wr_node_store(wr_mas))
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4233:7: note: Taking false branch
           else if (mas_wr_node_store(wr_mas))
                ^
   lib/maple_tree.c:4236:2: note: Taking false branch
--
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   lib/maple_tree.c:1897:12: note: '?' condition is false
           piv_end =3D min(mas_end, mt_pivots[mt]);
                     ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   lib/maple_tree.c:1898:9: note: 'i' is >=3D 'piv_end'
           for (; i < piv_end; i++, j++) {
                  ^
   lib/maple_tree.c:1898:2: note: Loop condition is false. Execution contin=
ues on line 1907
           for (; i < piv_end; i++, j++) {
           ^
   lib/maple_tree.c:1907:13: note: 'i' is > 'mas_end'
           if (likely(i <=3D mas_end))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:1907:2: note: Taking false branch
           if (likely(i <=3D mas_end))
           ^
   lib/maple_tree.c:1915:22: note: Left side of '&&' is false
           if (!ma_is_leaf(mt) && mt_is_alloc(mas->tree)) {
                               ^
   lib/maple_tree.c:3931:2: note: Returning from 'mas_mab_cp'
           mas_mab_cp(&r_mas, r_mas.offset, r_wr_mas.node_end,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2904:3: note: Calling 'mast_setup_bnode_for_split'
                   mast_setup_bnode_for_split(mast);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2768:2: note: The value 4 is assigned to 'b_node.b_end'
           mast->bn->b_end--;
           ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2904:3: note: Returning from 'mast_setup_bnode_for_spli=
t'
                   mast_setup_bnode_for_split(mast);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2905:11: note: Calling 'mas_mab_to_node'
                   split =3D mas_mab_to_node(mas, mast->bn, &left, &right, =
&middle,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   lib/maple_tree.c:2484:10: note: Calling 'mas_new_ma_node'
           *left =3D mas_new_ma_node(mas, b_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2459:2: note: Returning without writing to 'b_node->b_e=
nd'
           return mt_mk_node(ma_mnode_ptr(mas_pop_node(mas)), b_node->type);
           ^
   lib/maple_tree.c:2484:10: note: Returning from 'mas_new_ma_node'
           *left =3D mas_new_ma_node(mas, b_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2489:6: note: Assuming 'slot_count' is > field 'b_end'
           if (b_node->b_end < slot_count) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2489:2: note: Taking true branch
           if (b_node->b_end < slot_count) {
           ^
   lib/maple_tree.c:2490:3: note: The value 4 is assigned to 'split'
                   split =3D b_node->b_end;
                   ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2496:2: note: Taking false branch
           if (*mid_split)
           ^
   lib/maple_tree.c:2499:2: note: Returning the value 4 (loaded from 'split=
')
           return split;
           ^~~~~~~~~~~~
   lib/maple_tree.c:2905:11: note: Returning from 'mas_mab_to_node'
                   split =3D mas_mab_to_node(mas, mast->bn, &left, &right, =
&middle,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   lib/maple_tree.c:2905:3: note: The value 4 is assigned to 'split'
                   split =3D mas_mab_to_node(mas, mast->bn, &left, &right, =
&middle,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   lib/maple_tree.c:2909:47: note: Passing the value 4 via 5th parameter 's=
plit'
                   mast_cp_to_nodes(mast, left, middle, right, split, mid_s=
plit);
                                                               ^~~~~
   lib/maple_tree.c:2909:3: note: Calling 'mast_cp_to_nodes'
                   mast_cp_to_nodes(mast, left, middle, right, split, mid_s=
plit);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   lib/maple_tree.c:2686:15: note: Assigned value is garbage or undefined
           mast->l->max =3D mast->bn->pivot[split];
                        ^ ~~~~~~~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:2785:2: warning: Value stored to 'last' is never read [=
clang-analyzer-deadcode.DeadStores]
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2785:2: note: Value stored to 'last' is never read
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:2786:2: warning: Value stored to 'prev_min' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2786:2: note: Value stored to 'prev_min' is never read
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2915:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^~~~~~
   lib/maple_tree.c:2915:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^~~~~~
>> lib/maple_tree.c:2984:2: warning: Address of stack memory associated wit=
h local variable 'destroy' is still referred to by the stack variable 'mast=
' upon returning to the caller.  This will be a dangling reference [clang-a=
nalyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4269:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3892:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3892:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2920:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2935:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2938:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2942:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2946:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2947:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2948:5: note:  Execution continues on line 2954
                                   break;
                                   ^
   lib/maple_tree.c:2959:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2959:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2962:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2962:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2966:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2971:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2984:2: note: Address of stack memory associated with l=
ocal variable 'destroy' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2984:2: warning: Address of stack memory associated wit=
h local variable 'free' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference [clang-anal=
yzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4269:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3892:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3892:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2920:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2935:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2938:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2942:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2946:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2947:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2948:5: note:  Execution continues on line 2954
                                   break;
                                   ^
   lib/maple_tree.c:2959:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2959:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2962:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2962:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2966:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2971:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2984:2: note: Address of stack memory associated with l=
ocal variable 'free' is still referred to by the stack variable 'mast' upon=
 returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2984:2: warning: Address of stack memory associated wit=
h local variable 'l_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4269:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3892:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3892:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2920:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2935:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2938:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2942:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2946:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2947:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2948:5: note:  Execution continues on line 2954
                                   break;
                                   ^
   lib/maple_tree.c:2959:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2959:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2962:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2962:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2966:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2971:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2984:2: note: Address of stack memory associated with l=
ocal variable 'l_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2984:2: warning: Address of stack memory associated wit=
h local variable 'm_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4269:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3892:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3892:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2920:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2935:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2938:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2942:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2946:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2947:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2948:5: note:  Execution continues on line 2954
                                   break;
                                   ^
   lib/maple_tree.c:2959:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2959:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2962:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2962:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2966:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2971:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2984:2: note: Address of stack memory associated with l=
ocal variable 'm_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2984:2: warning: Address of stack memory associated wit=
h local variable 'r_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6269:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5981:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5981:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5986:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5986:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5993:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4262:6: note: Left side of '||' is false
   lib/maple_tree.c:4262:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4268:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4269:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3892:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3892:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2881:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2903:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2920:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2935:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2938:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2942:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2946:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2947:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2948:5: note:  Execution continues on line 2954
                                   break;
                                   ^
   lib/maple_tree.c:2959:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2959:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2962:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2962:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2966:2: note: Taking false branch
--
                   ^~~~~~
   lib/maple_tree.c:3122:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(l_slots + tmp, 0, sizeof(void *) * (max_s - tmp));
                   ^~~~~~
   lib/maple_tree.c:3137:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots, l_slots, sizeof(void *) * split);
           ^~~~~~
   lib/maple_tree.c:3137:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots, l_slots, sizeof(void *) * split);
           ^~~~~~
   lib/maple_tree.c:3138:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pivs, l_pivs, sizeof(unsigned long) * split);
           ^~~~~~
   lib/maple_tree.c:3138:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(pivs, l_pivs, sizeof(unsigned long) * split);
           ^~~~~~
   lib/maple_tree.c:3148:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(parent, mte_to_node(eparent), sizeof(struct maple_node));
           ^~~~~~
   lib/maple_tree.c:3148:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(parent, mte_to_node(eparent), sizeof(struct maple_node));
           ^~~~~~
   lib/maple_tree.c:3241:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mast->bn->gap + mast->bn->b_end + 1, 0,
           ^~~~~~
   lib/maple_tree.c:3241:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(mast->bn->gap + mast->bn->b_end + 1, 0,
           ^~~~~~
   lib/maple_tree.c:3243:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mast->bn->slot + mast->bn->b_end + 1, 0, sizeof(void*) * =
zero--);
           ^~~~~~
   lib/maple_tree.c:3243:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(mast->bn->slot + mast->bn->b_end + 1, 0, sizeof(void*) * =
zero--);
           ^~~~~~
   lib/maple_tree.c:3244:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mast->bn->pivot + mast->bn->b_end + 1, 0,
           ^~~~~~
   lib/maple_tree.c:3244:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(mast->bn->pivot + mast->bn->b_end + 1, 0,
           ^~~~~~
   lib/maple_tree.c:3474:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(slots + bn->b_end + 1, 0,
                           ^~~~~~
   lib/maple_tree.c:3474:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(slots + bn->b_end + 1, 0,
                           ^~~~~~
   lib/maple_tree.c:3476:4: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(pivots + bn->b_end + 1, 0,
                           ^~~~~~
   lib/maple_tree.c:3476:4: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                           memset(pivots + bn->b_end + 1, 0,
                           ^~~~~~
   lib/maple_tree.c:4007:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&reuse, 0, sizeof(struct maple_node));
                   ^~~~~~
   lib/maple_tree.c:4007:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(&reuse, 0, sizeof(struct maple_node));
                   ^~~~~~
   lib/maple_tree.c:4015:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_pivots, wr_mas->pivots, sizeof(unsigned long) * (offs=
et + 1));
           ^~~~~~
   lib/maple_tree.c:4015:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_pivots, wr_mas->pivots, sizeof(unsigned long) * (offs=
et + 1));
           ^~~~~~
   lib/maple_tree.c:4016:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_slots, wr_mas->slots, sizeof(void *) * (offset + 1));
           ^~~~~~
   lib/maple_tree.c:4016:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_slots, wr_mas->slots, sizeof(void *) * (offset + 1));
           ^~~~~~
   lib/maple_tree.c:4038:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst_slots + dst_offset, wr_mas->slots + wr_mas->offset_en=
d,
           ^~~~~~
   lib/maple_tree.c:4038:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_slots + dst_offset, wr_mas->slots + wr_mas->offset_en=
d,
           ^~~~~~
   lib/maple_tree.c:4043:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
                   ^~~~~~
   lib/maple_tree.c:4043:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
                   ^~~~~~
   lib/maple_tree.c:4061:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
                   ^~~~~~
   lib/maple_tree.c:4061:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
                   ^~~~~~
   lib/maple_tree.c:4243:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(b_node.slot + b_node.b_end + 1, 0, sizeof(void *) * zero-=
-);
           ^~~~~~
   lib/maple_tree.c:4243:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(b_node.slot + b_node.b_end + 1, 0, sizeof(void *) * zero-=
-);
           ^~~~~~
   lib/maple_tree.c:4244:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(b_node.pivot + b_node.b_end + 1, 0,
           ^~~~~~
   lib/maple_tree.c:4244:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(b_node.pivot + b_node.b_end + 1, 0,
           ^~~~~~
>> lib/maple_tree.c:4979:5: warning: Value stored to 'count' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   lib/maple_tree.c:4979:5: note: Value stored to 'count' is never read
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   Suppressed 18 warnings (8 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:572:2: warning: Call to fu=
nction 'memset' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memset_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:572:2: note: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:732:2: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, rctx, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:732:2: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(out, rctx, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:742:2: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rctx, in, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:742:2: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rctx, in, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:768:3: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->key, key, keylen);
                   ^~~~~~
   drivers/crypto/keembay/keembay-ocs-hcu-core.c:768:3: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->key, key, keylen);
                   ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   fs/isofs/util.c:40:14: warning: The result of the left shift is undefine=
d because the left operand is negative [clang-analyzer-core.UndefinedBinary=
OperatorResult]
                           tz |=3D (-1 << 8);
                                  ~~ ^
   fs/isofs/util.c:30:6: note: Assuming 'flag' is equal to 0
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
               ^~~~~~~~~
   fs/isofs/util.c:30:2: note: Taking true branch
           if (flag =3D=3D 0) tz =3D p[6]; /* High sierra has no time zone =
*/
           ^
   fs/isofs/util.c:33:6: note: 'year' is >=3D 0
           if (year < 0) {
               ^~~~
   fs/isofs/util.c:33:2: note: Taking false branch
           if (year < 0) {
           ^
   fs/isofs/util.c:39:7: note: Assuming the condition is true
                   if (tz & 0x80)
                       ^~~~~~~~~
   fs/isofs/util.c:39:3: note: Taking true branch
                   if (tz & 0x80)
                   ^
   fs/isofs/util.c:40:14: note: The result of the left shift is undefined b=
ecause the left operand is negative
                           tz |=3D (-1 << 8);
                                  ~~ ^
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/net/ethernet/hisilicon/hns_mdio.c:454:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(new_bus->id, MII_BUS_ID_SIZE, "%s-%s", "Mii",
           ^~~~~~~~
   drivers/net/ethernet/hisilicon/hns_mdio.c:454:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(new_bus->id, MII_BUS_ID_SIZE, "%s-%s", "Mii",
           ^~~~~~~~
   drivers/net/ethernet/hisilicon/hns_mdio.c:508:3: warning: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(new_bus->irq, PHY_POLL, 4 * PHY_MAX_ADDR);
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns_mdio.c:508:3: note: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11
                   memset(new_bus->irq, PHY_POLL, 4 * PHY_MAX_ADDR);
                   ^~~~~~
   Suppressed 63 warnings (62 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   Suppressed 60 warnings (60 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:898:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(key, ppe_cb->rss_key, HNS_PPEV2_RSS_KEY_SIZE);
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:898:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(key, ppe_cb->rss_key, HNS_PPEV2_RSS_KEY_SIZE);
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:902:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(indir, ppe_cb->rss_indir_table,
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:902:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(indir, ppe_cb->rss_indir_table,
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:915:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ppe_cb->rss_key, key, HNS_PPEV2_RSS_KEY_SIZE);
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:915:3: note: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ppe_cb->rss_key, key, HNS_PPEV2_RSS_KEY_SIZE);
                   ^~~~~~
   drivers/net/ethernet/hisilicon/hns/hns_ae_adapt.c:921:3: warning: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ppe_cb->rss_indir_table, indir,

vim +/node +319 lib/maple_tree.c

51b63e667ad838 Liam R. Howlett 2020-07-24  316  =

51b63e667ad838 Liam R. Howlett 2020-07-24  317  static inline void mte_set_=
full(const struct maple_enode *node)
51b63e667ad838 Liam R. Howlett 2020-07-24  318  {
51b63e667ad838 Liam R. Howlett 2020-07-24 @319  	node =3D (void *)((unsigne=
d long)node & ~MAPLE_ENODE_NULL);
51b63e667ad838 Liam R. Howlett 2020-07-24  320  }
51b63e667ad838 Liam R. Howlett 2020-07-24  321  =

51b63e667ad838 Liam R. Howlett 2020-07-24  322  static inline void mte_clea=
r_full(const struct maple_enode *node)
51b63e667ad838 Liam R. Howlett 2020-07-24  323  {
51b63e667ad838 Liam R. Howlett 2020-07-24  324  	node =3D (void *)((unsigne=
d long)node | MAPLE_ENODE_NULL);
51b63e667ad838 Liam R. Howlett 2020-07-24  325  }
51b63e667ad838 Liam R. Howlett 2020-07-24  326  =

51b63e667ad838 Liam R. Howlett 2020-07-24  327  static inline bool ma_is_ro=
ot(struct maple_node *node)
51b63e667ad838 Liam R. Howlett 2020-07-24  328  {
51b63e667ad838 Liam R. Howlett 2020-07-24  329  	return ((unsigned long)nod=
e->parent & MA_ROOT_PARENT);
51b63e667ad838 Liam R. Howlett 2020-07-24  330  }
51b63e667ad838 Liam R. Howlett 2020-07-24  331  =

51b63e667ad838 Liam R. Howlett 2020-07-24  332  static inline bool mte_is_r=
oot(const struct maple_enode *node)
51b63e667ad838 Liam R. Howlett 2020-07-24  333  {
51b63e667ad838 Liam R. Howlett 2020-07-24  334  	return ma_is_root(mte_to_n=
ode(node));
51b63e667ad838 Liam R. Howlett 2020-07-24  335  }
51b63e667ad838 Liam R. Howlett 2020-07-24  336  =

51b63e667ad838 Liam R. Howlett 2020-07-24  337  static inline bool mas_is_r=
oot_limits(const struct ma_state *mas)
51b63e667ad838 Liam R. Howlett 2020-07-24  338  {
51b63e667ad838 Liam R. Howlett 2020-07-24  339  	return !mas->min && mas->m=
ax =3D=3D ULONG_MAX;
51b63e667ad838 Liam R. Howlett 2020-07-24  340  }
51b63e667ad838 Liam R. Howlett 2020-07-24  341  =

51b63e667ad838 Liam R. Howlett 2020-07-24  342  static inline bool mt_is_al=
loc(struct maple_tree *mt)
51b63e667ad838 Liam R. Howlett 2020-07-24  343  {
51b63e667ad838 Liam R. Howlett 2020-07-24  344  	return (mt->ma_flags & MT_=
FLAGS_ALLOC_RANGE);
51b63e667ad838 Liam R. Howlett 2020-07-24  345  }
51b63e667ad838 Liam R. Howlett 2020-07-24  346  =

51b63e667ad838 Liam R. Howlett 2020-07-24  347  /*
51b63e667ad838 Liam R. Howlett 2020-07-24  348   * The Parent Pointer
51b63e667ad838 Liam R. Howlett 2020-07-24  349   * Excluding root, the pare=
nt pointer is 256B aligned like all other tree nodes.
51b63e667ad838 Liam R. Howlett 2020-07-24  350   * When storing a 32 or 64 =
bit values, the offset can fit into 4 bits.  The 16
51b63e667ad838 Liam R. Howlett 2020-07-24  351   * bit values need an extra=
 bit to store the offset.  This extra bit comes from
51b63e667ad838 Liam R. Howlett 2020-07-24  352   * a reuse of the last bit =
in the node type.  This is possible by using bit 1 to
51b63e667ad838 Liam R. Howlett 2020-07-24  353   * indicate if bit 2 is par=
t of the type or the slot.
51b63e667ad838 Liam R. Howlett 2020-07-24  354   *
51b63e667ad838 Liam R. Howlett 2020-07-24  355   * Note types:
51b63e667ad838 Liam R. Howlett 2020-07-24  356   *  0x??1 =3D Root
51b63e667ad838 Liam R. Howlett 2020-07-24  357   *  0x?00 =3D 16 bit nodes
51b63e667ad838 Liam R. Howlett 2020-07-24  358   *  0x010 =3D 32 bit nodes
51b63e667ad838 Liam R. Howlett 2020-07-24  359   *  0x110 =3D 64 bit nodes
51b63e667ad838 Liam R. Howlett 2020-07-24  360   *
51b63e667ad838 Liam R. Howlett 2020-07-24  361   * Slot size and alignment
51b63e667ad838 Liam R. Howlett 2020-07-24  362   *  0x??1 : Root
51b63e667ad838 Liam R. Howlett 2020-07-24  363   *  0x?00 : 16 bit values, =
type in 0-1, slot in 2-6
51b63e667ad838 Liam R. Howlett 2020-07-24  364   *  0x010 : 32 bit values, =
type in 0-2, slot in 3-6
51b63e667ad838 Liam R. Howlett 2020-07-24  365   *  0x110 : 64 bit values, =
type in 0-2, slot in 3-6
51b63e667ad838 Liam R. Howlett 2020-07-24  366   */
51b63e667ad838 Liam R. Howlett 2020-07-24  367  =

51b63e667ad838 Liam R. Howlett 2020-07-24  368  #define MAPLE_PARENT_ROOT		=
0x01
51b63e667ad838 Liam R. Howlett 2020-07-24  369  =

51b63e667ad838 Liam R. Howlett 2020-07-24  370  #define MAPLE_PARENT_SLOT_S=
HIFT		0x03
51b63e667ad838 Liam R. Howlett 2020-07-24  371  #define MAPLE_PARENT_SLOT_M=
ASK		0x78
51b63e667ad838 Liam R. Howlett 2020-07-24  372  =

51b63e667ad838 Liam R. Howlett 2020-07-24  373  #define MAPLE_PARENT_16B_SL=
OT_SHIFT	0x02
51b63e667ad838 Liam R. Howlett 2020-07-24  374  #define MAPLE_PARENT_16B_SL=
OT_MASK	0x7C
51b63e667ad838 Liam R. Howlett 2020-07-24  375  =

51b63e667ad838 Liam R. Howlett 2020-07-24  376  #define MAPLE_PARENT_RANGE6=
4		0x06
51b63e667ad838 Liam R. Howlett 2020-07-24  377  #define MAPLE_PARENT_RANGE3=
2		0x04
51b63e667ad838 Liam R. Howlett 2020-07-24  378  #define MAPLE_PARENT_NOT_RA=
NGE16	0x02
51b63e667ad838 Liam R. Howlett 2020-07-24  379  =

51b63e667ad838 Liam R. Howlett 2020-07-24  380  /*
51b63e667ad838 Liam R. Howlett 2020-07-24  381   * mte_parent_shift() - Get=
 the parent shift for the slot storage.
51b63e667ad838 Liam R. Howlett 2020-07-24  382   * @parent: The parent poin=
ter cast as an unsigned long
51b63e667ad838 Liam R. Howlett 2020-07-24  383   * Return: The shift into t=
hat pointer to the star to of the slot
51b63e667ad838 Liam R. Howlett 2020-07-24  384   */
51b63e667ad838 Liam R. Howlett 2020-07-24  385  static inline unsigned long=
 mte_parent_shift(unsigned long parent)
51b63e667ad838 Liam R. Howlett 2020-07-24  386  {
51b63e667ad838 Liam R. Howlett 2020-07-24  387  	/* Note bit 1 =3D=3D 0 mea=
ns 16B */
51b63e667ad838 Liam R. Howlett 2020-07-24  388  	if (likely(parent & MAPLE_=
PARENT_NOT_RANGE16))
51b63e667ad838 Liam R. Howlett 2020-07-24  389  		return MAPLE_PARENT_SLOT_=
SHIFT;
51b63e667ad838 Liam R. Howlett 2020-07-24  390  =

51b63e667ad838 Liam R. Howlett 2020-07-24  391  	return MAPLE_PARENT_16B_SL=
OT_SHIFT;
51b63e667ad838 Liam R. Howlett 2020-07-24  392  }
51b63e667ad838 Liam R. Howlett 2020-07-24  393  =

51b63e667ad838 Liam R. Howlett 2020-07-24  394  /*
51b63e667ad838 Liam R. Howlett 2020-07-24  395   * mte_parent_slot_mask() -=
 Get the slot mask for the parent.
51b63e667ad838 Liam R. Howlett 2020-07-24  396   * @parent: The parent poin=
ter cast as an unsigned long.
51b63e667ad838 Liam R. Howlett 2020-07-24  397   * Return: The slot mask fo=
r that parent.
51b63e667ad838 Liam R. Howlett 2020-07-24  398   */
51b63e667ad838 Liam R. Howlett 2020-07-24  399  static inline unsigned long=
 mte_parent_slot_mask(unsigned long parent)
51b63e667ad838 Liam R. Howlett 2020-07-24  400  {
51b63e667ad838 Liam R. Howlett 2020-07-24  401  	/* Note bit 1 =3D=3D 0 mea=
ns 16B */
51b63e667ad838 Liam R. Howlett 2020-07-24  402  	if (likely(parent & MAPLE_=
PARENT_NOT_RANGE16))
51b63e667ad838 Liam R. Howlett 2020-07-24  403  		return MAPLE_PARENT_SLOT_=
MASK;
51b63e667ad838 Liam R. Howlett 2020-07-24  404  =

51b63e667ad838 Liam R. Howlett 2020-07-24  405  	return MAPLE_PARENT_16B_SL=
OT_MASK;
51b63e667ad838 Liam R. Howlett 2020-07-24  406  }
51b63e667ad838 Liam R. Howlett 2020-07-24  407  =

51b63e667ad838 Liam R. Howlett 2020-07-24  408  /*
51b63e667ad838 Liam R. Howlett 2020-07-24  409   * mas_parent_enum() - Retu=
rn the maple_type of the parent from the stored
51b63e667ad838 Liam R. Howlett 2020-07-24  410   * parent type.
51b63e667ad838 Liam R. Howlett 2020-07-24  411   * @mas: The maple state
51b63e667ad838 Liam R. Howlett 2020-07-24  412   * @node: The maple_enode t=
o extract the parent's enum
51b63e667ad838 Liam R. Howlett 2020-07-24  413   * Return: The node->parent=
 maple_type
51b63e667ad838 Liam R. Howlett 2020-07-24  414   */
51b63e667ad838 Liam R. Howlett 2020-07-24  415  static inline
51b63e667ad838 Liam R. Howlett 2020-07-24  416  enum maple_type mte_parent_=
enum(struct maple_enode *p_enode,
51b63e667ad838 Liam R. Howlett 2020-07-24  417  				struct maple_tree *mt)
51b63e667ad838 Liam R. Howlett 2020-07-24  418  {
51b63e667ad838 Liam R. Howlett 2020-07-24  419  	unsigned long p_type;
51b63e667ad838 Liam R. Howlett 2020-07-24  420  =

51b63e667ad838 Liam R. Howlett 2020-07-24  421  	p_type =3D (unsigned long)=
p_enode;
51b63e667ad838 Liam R. Howlett 2020-07-24  422  	if (p_type & MAPLE_PARENT_=
ROOT)
51b63e667ad838 Liam R. Howlett 2020-07-24  423  		return 0; /* Validated in=
 the caller. */
51b63e667ad838 Liam R. Howlett 2020-07-24  424  =

51b63e667ad838 Liam R. Howlett 2020-07-24  425  	p_type &=3D MAPLE_NODE_MAS=
K;
51b63e667ad838 Liam R. Howlett 2020-07-24  426  	p_type =3D p_type & ~(MAPL=
E_PARENT_ROOT | mte_parent_slot_mask(p_type));
51b63e667ad838 Liam R. Howlett 2020-07-24  427  =

51b63e667ad838 Liam R. Howlett 2020-07-24  428  	switch (p_type) {
51b63e667ad838 Liam R. Howlett 2020-07-24  429  	case MAPLE_PARENT_RANGE64:=
 /* or MAPLE_PARENT_ARANGE64 */
51b63e667ad838 Liam R. Howlett 2020-07-24  430  		if (mt_is_alloc(mt))
51b63e667ad838 Liam R. Howlett 2020-07-24  431  			return maple_arange_64;
51b63e667ad838 Liam R. Howlett 2020-07-24  432  		return maple_range_64;
51b63e667ad838 Liam R. Howlett 2020-07-24  433  	}
51b63e667ad838 Liam R. Howlett 2020-07-24  434  =

51b63e667ad838 Liam R. Howlett 2020-07-24  435  	return 0;
51b63e667ad838 Liam R. Howlett 2020-07-24  436  }
51b63e667ad838 Liam R. Howlett 2020-07-24  437  =

51b63e667ad838 Liam R. Howlett 2020-07-24  438  static inline
51b63e667ad838 Liam R. Howlett 2020-07-24  439  enum maple_type mas_parent_=
enum(struct ma_state *mas, struct maple_enode *enode)
51b63e667ad838 Liam R. Howlett 2020-07-24  440  {
51b63e667ad838 Liam R. Howlett 2020-07-24  441  	return mte_parent_enum(ma_=
enode_ptr(mte_to_node(enode)->parent), mas->tree);
51b63e667ad838 Liam R. Howlett 2020-07-24  442  }
51b63e667ad838 Liam R. Howlett 2020-07-24  443  =

51b63e667ad838 Liam R. Howlett 2020-07-24  444  /*
51b63e667ad838 Liam R. Howlett 2020-07-24  445   * mte_set_parent() - Set t=
he parent node and encode the slot
51b63e667ad838 Liam R. Howlett 2020-07-24  446   * @enode: The encoded mapl=
e node.
51b63e667ad838 Liam R. Howlett 2020-07-24  447   * @parent: The encoded map=
le node that is the parent of @enode.
51b63e667ad838 Liam R. Howlett 2020-07-24  448   * @slot: The slot that @en=
ode resides in @parent.
51b63e667ad838 Liam R. Howlett 2020-07-24  449   *
51b63e667ad838 Liam R. Howlett 2020-07-24  450   * Slot number is encoded i=
n the enode->parent bit 3-6 or 2-6, depending on the
51b63e667ad838 Liam R. Howlett 2020-07-24  451   * parent type.
51b63e667ad838 Liam R. Howlett 2020-07-24  452   */
51b63e667ad838 Liam R. Howlett 2020-07-24  453  static inline
51b63e667ad838 Liam R. Howlett 2020-07-24  454  void mte_set_parent(struct =
maple_enode *enode, const struct maple_enode *parent,
51b63e667ad838 Liam R. Howlett 2020-07-24  455  		    unsigned char slot)
51b63e667ad838 Liam R. Howlett 2020-07-24  456  {
51b63e667ad838 Liam R. Howlett 2020-07-24  457  	unsigned long val =3D (uns=
igned long) parent;
51b63e667ad838 Liam R. Howlett 2020-07-24  458  	unsigned long shift;
51b63e667ad838 Liam R. Howlett 2020-07-24  459  	unsigned long type;
51b63e667ad838 Liam R. Howlett 2020-07-24  460  	enum maple_type p_type =3D=
 mte_node_type(parent);
51b63e667ad838 Liam R. Howlett 2020-07-24  461  =

51b63e667ad838 Liam R. Howlett 2020-07-24  462  	switch(p_type) {
51b63e667ad838 Liam R. Howlett 2020-07-24  463  	case maple_range_64:
51b63e667ad838 Liam R. Howlett 2020-07-24  464  	case maple_arange_64:
51b63e667ad838 Liam R. Howlett 2020-07-24  465  		shift =3D MAPLE_PARENT_SL=
OT_SHIFT;
51b63e667ad838 Liam R. Howlett 2020-07-24  466  		type =3D MAPLE_PARENT_RAN=
GE64;
51b63e667ad838 Liam R. Howlett 2020-07-24  467  		break;
51b63e667ad838 Liam R. Howlett 2020-07-24  468  	case maple_dense:
51b63e667ad838 Liam R. Howlett 2020-07-24  469  	case maple_leaf_64:
51b63e667ad838 Liam R. Howlett 2020-07-24 @470  		shift =3D type =3D 0;
51b63e667ad838 Liam R. Howlett 2020-07-24  471  		BUG_ON(1);
51b63e667ad838 Liam R. Howlett 2020-07-24  472  		break;
51b63e667ad838 Liam R. Howlett 2020-07-24  473  	}
51b63e667ad838 Liam R. Howlett 2020-07-24  474  =

51b63e667ad838 Liam R. Howlett 2020-07-24  475  	val &=3D ~MAPLE_NODE_MASK;=
 /* Clear all node metadata in parent */
51b63e667ad838 Liam R. Howlett 2020-07-24  476  	val |=3D (slot << shift) |=
 type;
51b63e667ad838 Liam R. Howlett 2020-07-24  477  	mte_to_node(enode)->parent=
 =3D ma_parent_ptr(val);
51b63e667ad838 Liam R. Howlett 2020-07-24  478  }
51b63e667ad838 Liam R. Howlett 2020-07-24  479  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1228875838500873465==--


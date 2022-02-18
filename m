Content-Type: multipart/mixed; boundary="===============1546867514587211958=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dhowells-fs:netfs-maple 8/51] lib/maple_tree.c:319:2: warning: Value stored to 'node' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 18 Feb 2022 13:40:49 +0800
Message-ID: <202202181304.SQLFm9Xy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1546867514587211958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it netfs-maple
head:   5cb7f190822d09757b30cd9539e57eef72552d1f
commit: 18a91233bf966f9353e07def1416c05afccb3b14 [8/51] Maple Tree: Add new=
 data structure
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-c004-20220217 (https://download.01.org/0day-ci/arch=
ive/20220218/202202181304.SQLFm9Xy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs=
.git/commit/?id=3D18a91233bf966f9353e07def1416c05afccb3b14
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/ker=
nel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs netfs-maple
        git checkout 18a91233bf966f9353e07def1416c05afccb3b14
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->flags'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
lags'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
lags'
           return n;
           ^
   sound/core/seq/seq_clientmgr.c:1055:7: note: Returning from 'copy_from_u=
ser'
                   if (copy_from_user(&event, buf, len)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_clientmgr.c:1055:3: note: Taking false branch
                   if (copy_from_user(&event, buf, len)) {
                   ^
   sound/core/seq/seq_clientmgr.c:1061:7: note: Calling 'check_event_type_a=
nd_length'
                   if (check_event_type_and_length(&event)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_clientmgr.c:992:10: note: The left operand of '&' is =
a garbage value
           switch (snd_seq_ev_length_type(ev)) {
                   ^
   include/sound/asequencer.h:53:49: note: expanded from macro 'snd_seq_ev_=
length_type'
   #define snd_seq_ev_length_type(ev)      ((ev)->flags & SNDRV_SEQ_EVENT_L=
ENGTH_MASK)
                                            ~~~~~~~~~~~ ^
   sound/core/seq/seq_clientmgr.c:1232:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(info->name, cptr->name);
           ^~~~~~
   sound/core/seq/seq_clientmgr.c:1232:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(info->name, cptr->name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   crypto/poly1305_generic.c:49:4: warning: Value stored to 'src' is never =
read [clang-analyzer-deadcode.DeadStores]
                           src +=3D POLY1305_BLOCK_SIZE;
                           ^
   crypto/poly1305_generic.c:49:4: note: Value stored to 'src' is never read
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   27 warnings generated.
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
   lib/maple_tree.c:6191:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6191:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6194:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6194:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6194:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6194:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6197:6: note: Assuming 'min' is <=3D 'max'
           if (min > max)
               ^~~~~~~~~
   lib/maple_tree.c:6197:2: note: Taking false branch
           if (min > max)
           ^
   lib/maple_tree.c:6200:6: note: Assuming 'max' is >=3D 'size'
           if (max < size)
               ^~~~~~~~~~
   lib/maple_tree.c:6200:2: note: Taking false branch
           if (max < size)
           ^
   lib/maple_tree.c:6203:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6203:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6211:8: note: Calling 'mas_alloc'
           ret =3D mas_alloc(&mas, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5309:2: note: Calling 'mas_start'
           mas_start(mas);
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
   lib/maple_tree.c:5312:7: note: Calling 'mas_is_err'
                   if (mas_is_err(mas))
                       ^~~~~~~~~~~~~~~
   lib/maple_tree.c:241:2: note: Returning without writing to 'mas->alloc',=
 which participates in a condition later
           return xa_is_err(mas->node);
           ^
   lib/maple_tree.c:241:2: note: Returning without writing to 'mas->alloc'
   lib/maple_tree.c:5312:7: note: Returning from 'mas_is_err'
                   if (mas_is_err(mas))
                       ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5312:3: note: Taking false branch
                   if (mas_is_err(mas))
                   ^
   lib/maple_tree.c:5315:7: note: Assuming field 'index' is not equal to 0
                   if (!mas->index)
                       ^~~~~~~~~~~
   lib/maple_tree.c:5315:3: note: Taking false branch
                   if (!mas->index)
                   ^
   lib/maple_tree.c:6211:8: note: Returning from 'mas_alloc'
           ret =3D mas_alloc(&mas, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6212:6: note: Calling 'mas_nomem'
           if (mas_nomem(&mas, gfp))
               ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6011:13: note: Assuming the condition is false
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:6011:2: note: Taking false branch
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
           ^
   lib/maple_tree.c:6016:35: note: Left side of '&&' is false
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
   lib/maple_tree.c:3393:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3403:2: note: Loop condition is true.  Entering loop bo=
dy
           while (height++ <=3D mas->depth) {
           ^
   lib/maple_tree.c:3404:7: note: Assuming the condition is false
                   if (mt_slots[b_node->type] > b_node->b_end) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3404:3: note: Taking false branch
                   if (mt_slots[b_node->type] > b_node->b_end) {
                   ^
   lib/maple_tree.c:3420:3: note: Taking false branch
                   if (mas_push_data(mas, height, &mast, true))
                   ^
   lib/maple_tree.c:3424:3: note: Taking false branch
                   if (mas_push_data(mas, height, &mast, false))
                   ^
   lib/maple_tree.c:3403:9: note: Assuming the condition is false
           while (height++ <=3D mas->depth) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3403:2: note: Loop condition is false. Execution contin=
ues on line 3440
           while (height++ <=3D mas->depth) {
           ^
   lib/maple_tree.c:3442:2: note: Calling 'mas_wmb_replace'
           mas_wmb_replace(mas, mast.free, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2629:2: note: Calling 'mas_replace'
           mas_replace(mas, true);
           ^~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1670:2: note: 'slots' initialized to a null pointer val=
ue
           void __rcu **slots =3D NULL;
           ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1672:6: note: Assuming the condition is true
           if (ma_is_root(mn)) {
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:1672:2: note: Taking true branch
           if (ma_is_root(mn)) {
           ^
   lib/maple_tree.c:1681:7: note: 'advanced' is true
           if (!advanced && !mte_is_leaf(mas->node))
                ^~~~~~~~
   lib/maple_tree.c:1681:16: note: Left side of '&&' is false
           if (!advanced && !mte_is_leaf(mas->node))
                         ^
   lib/maple_tree.c:1684:6: note: Assuming the condition is false
           if (mte_is_root(mas->node)) {
               ^~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1684:2: note: Taking false branch
           if (mte_is_root(mas->node)) {
           ^
   lib/maple_tree.c:1690:3: note: Left side of '&&' is false
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:452:30: note: expanded from macro 'rcu_assign_p=
ointer'
           if (__builtin_constant_p(v) && (_r_a_p__v) =3D=3D (uintptr_t)NUL=
L)        \
                                       ^
   lib/maple_tree.c:1690:3: note: Left side of '||' is false
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:188:2: note: expanded from macro 'smp_stor=
e_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:349:21: note: expanded from macro 'compil=
etime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   lib/maple_tree.c:1690:3: note: Left side of '||' is false
                   rcu_assign_pointer(slots[offset], mas->node);
                   ^
   include/linux/rcupdate.h:455:3: note: expanded from macro 'rcu_assign_po=
inter'
                   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p_=
_v)); \
                   ^
   include/asm-generic/barrier.h:188:2: note: expanded from macro 'smp_stor=
e_release'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:349:21: note: expanded from macro 'compil=
etime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
--
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3929:17: note: Calling 'mas_store_b_node'
           b_node.b_end =3D mas_store_b_node(&l_wr_mas, &b_node, l_wr_mas.n=
ode_end);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   lib/maple_tree.c:2075:6: note: Assuming 'slot' is 0
           if (slot) {
               ^~~~
   lib/maple_tree.c:2075:2: note: Taking false branch
           if (slot) {
           ^
   lib/maple_tree.c:2083:6: note: Assuming the condition is false
           if (piv + 1 < mas->index) {
               ^~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2083:2: note: Taking false branch
           if (piv + 1 < mas->index) {
           ^
   lib/maple_tree.c:2097:6: note: Assuming field 'last' is < field 'max'
           if (mas->last >=3D mas->max)
               ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2097:2: note: Taking false branch
           if (mas->last >=3D mas->max)
           ^
   lib/maple_tree.c:2102:6: note: Assuming 'piv' is > field 'last'
           if (piv > mas->last) {
               ^~~~~~~~~~~~~~~
   lib/maple_tree.c:2102:2: note: Taking true branch
           if (piv > mas->last) {
           ^
   lib/maple_tree.c:2103:7: note: Assuming the condition is true
                   if (piv =3D=3D ULONG_MAX)
                       ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:2103:3: note: Taking true branch
                   if (piv =3D=3D ULONG_MAX)
                   ^
   lib/maple_tree.c:2104:4: note: 2nd function call argument is an uninitia=
lized value
                           mas_bulk_rebalance(mas, b_node->b_end, wr_mas->t=
ype);
                           ^                       ~~~~~~~~~~~~~
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
>> lib/maple_tree.c:2801:4: warning: Value stored to 'max' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           max =3D pivots[offset];
                           ^     ~~~~~~~~~~~~~~
   lib/maple_tree.c:2801:4: note: Value stored to 'max' is never read
                           max =3D pivots[offset];
                           ^     ~~~~~~~~~~~~~~
>> lib/maple_tree.c:2985:2: warning: Address of stack memory associated wit=
h local variable 'destroy' is still referred to by the stack variable 'mast=
' upon returning to the caller.  This will be a dangling reference [clang-a=
nalyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6226:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6226:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6229:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6229:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6229:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6229:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6232:6: note: Assuming 'min' is < 'max'
           if (min >=3D max)
               ^~~~~~~~~~
   lib/maple_tree.c:6232:2: note: Taking false branch
           if (min >=3D max)
           ^
   lib/maple_tree.c:6235:6: note: Assuming the condition is false
           if (max < size - 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:6235:2: note: Taking false branch
           if (max < size - 1)
           ^
   lib/maple_tree.c:6238:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6238:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6243:8: note: Calling 'mas_rev_alloc'
           ret =3D mas_rev_alloc(&mas, min, max, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:6: note: Assuming the condition is false
           if (!mas_is_root_limits(mas) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2904:2: note: Loop condition is false. Execution contin=
ues on line 2955
           while (count--) {
           ^
   lib/maple_tree.c:2960:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2960:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2963:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2963:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2967:6: note: Assuming the condition is false
           if (mas_is_root_limits(mast->l))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2967:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2972:2: note: Taking false branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2985:2: note: Address of stack memory associated with l=
ocal variable 'destroy' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2985:2: warning: Address of stack memory associated wit=
h local variable 'free' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference [clang-anal=
yzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6226:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6226:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6229:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6229:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6229:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6229:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6232:6: note: Assuming 'min' is < 'max'
           if (min >=3D max)
               ^~~~~~~~~~
   lib/maple_tree.c:6232:2: note: Taking false branch
           if (min >=3D max)
           ^
   lib/maple_tree.c:6235:6: note: Assuming the condition is false
           if (max < size - 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:6235:2: note: Taking false branch
           if (max < size - 1)
           ^
   lib/maple_tree.c:6238:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6238:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6243:8: note: Calling 'mas_rev_alloc'
           ret =3D mas_rev_alloc(&mas, min, max, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:6: note: Assuming the condition is false
           if (!mas_is_root_limits(mas) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2904:2: note: Loop condition is false. Execution contin=
ues on line 2955
           while (count--) {
           ^
   lib/maple_tree.c:2960:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2960:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2963:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2963:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2967:6: note: Assuming the condition is false
           if (mas_is_root_limits(mast->l))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2967:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2972:2: note: Taking false branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2985:2: note: Address of stack memory associated with l=
ocal variable 'free' is still referred to by the stack variable 'mast' upon=
 returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2985:2: warning: Address of stack memory associated wit=
h local variable 'l_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6226:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6226:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6229:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6229:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6229:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6229:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6232:6: note: Assuming 'min' is < 'max'
           if (min >=3D max)
               ^~~~~~~~~~
   lib/maple_tree.c:6232:2: note: Taking false branch
           if (min >=3D max)
           ^
   lib/maple_tree.c:6235:6: note: Assuming the condition is false
           if (max < size - 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:6235:2: note: Taking false branch
           if (max < size - 1)
           ^
   lib/maple_tree.c:6238:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6238:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6243:8: note: Calling 'mas_rev_alloc'
           ret =3D mas_rev_alloc(&mas, min, max, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:6: note: Assuming the condition is false
           if (!mas_is_root_limits(mas) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2904:2: note: Loop condition is false. Execution contin=
ues on line 2955
           while (count--) {
           ^
   lib/maple_tree.c:2960:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2960:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2963:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2963:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2967:6: note: Assuming the condition is false
           if (mas_is_root_limits(mast->l))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2967:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2972:2: note: Taking false branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2985:2: note: Address of stack memory associated with l=
ocal variable 'l_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2985:2: warning: Address of stack memory associated wit=
h local variable 'm_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6226:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6226:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6229:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6229:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6229:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6229:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6232:6: note: Assuming 'min' is < 'max'
           if (min >=3D max)
               ^~~~~~~~~~
   lib/maple_tree.c:6232:2: note: Taking false branch
           if (min >=3D max)
           ^
   lib/maple_tree.c:6235:6: note: Assuming the condition is false
           if (max < size - 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:6235:2: note: Taking false branch
           if (max < size - 1)
           ^
   lib/maple_tree.c:6238:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6238:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6243:8: note: Calling 'mas_rev_alloc'
           ret =3D mas_rev_alloc(&mas, min, max, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:6: note: Assuming the condition is false
           if (!mas_is_root_limits(mas) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2904:2: note: Loop condition is false. Execution contin=
ues on line 2955
           while (count--) {
           ^
   lib/maple_tree.c:2960:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2960:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2963:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2963:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2967:6: note: Assuming the condition is false
           if (mas_is_root_limits(mast->l))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2967:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2972:2: note: Taking false branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2985:2: note: Address of stack memory associated with l=
ocal variable 'm_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:2985:2: warning: Address of stack memory associated wit=
h local variable 'r_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6226:6: note: Assuming the condition is false
           if (!mt_is_alloc(mt))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:6226:2: note: Taking false branch
           if (!mt_is_alloc(mt))
           ^
   lib/maple_tree.c:6229:6: note: '__ret_do_once' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:6229:6: note: Left side of '&&' is false
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   lib/maple_tree.c:6229:6: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
               ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   lib/maple_tree.c:6229:2: note: Taking false branch
           if (WARN_ON_ONCE(mt_is_reserved(entry)))
           ^
   lib/maple_tree.c:6232:6: note: Assuming 'min' is < 'max'
           if (min >=3D max)
               ^~~~~~~~~~
   lib/maple_tree.c:6232:2: note: Taking false branch
           if (min >=3D max)
           ^
   lib/maple_tree.c:6235:6: note: Assuming the condition is false
           if (max < size - 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:6235:2: note: Taking false branch
           if (max < size - 1)
           ^
   lib/maple_tree.c:6238:6: note: Assuming 'size' is not equal to 0
           if (!size)
               ^~~~~
   lib/maple_tree.c:6238:2: note: Taking false branch
           if (!size)
           ^
   lib/maple_tree.c:6243:8: note: Calling 'mas_rev_alloc'
           ret =3D mas_rev_alloc(&mas, min, max, entry, size, startp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5353:6: note: 'ret' is 0
           if (ret)
               ^~~
   lib/maple_tree.c:5353:2: note: Taking false branch
           if (ret)
           ^
   lib/maple_tree.c:5356:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:5359:11: note: Field 'offset' is not equal to MAPLE_NOD=
E_SLOTS
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
                    ^
   lib/maple_tree.c:5359:2: note: Taking false branch
           if (mas->offset =3D=3D MAPLE_NODE_SLOTS)
           ^
   lib/maple_tree.c:5362:2: note: Calling 'mas_fill_gap'
           mas_fill_gap(mas, entry, mas->offset, size, index);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5155:2: note: Calling 'mas_wr_store_entry'
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
   lib/maple_tree.c:3892:15: note: Assuming field 'index' is not equal to 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:3892:27: note: Left side of '&&' is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                                    ^
   lib/maple_tree.c:3892:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3900:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3910:6: note: Assuming the condition is false
           if (r_mas.last + 1)
               ^~~~~~~~~~~~~~
   lib/maple_tree.c:3910:2: note: Taking false branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3921:15: note: Field 'entry' is non-null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3921:2: note: Taking false branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3940:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:6: note: Assuming the condition is false
           if (!mas_is_root_limits(mas) &&
               ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2882:31: note: Left side of '&&' is false
           if (!mas_is_root_limits(mas) &&
                                        ^
   lib/maple_tree.c:2904:2: note: Loop condition is false. Execution contin=
ues on line 2955
           while (count--) {
           ^
   lib/maple_tree.c:2960:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2960:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2963:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2963:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2967:6: note: Assuming the condition is false
           if (mas_is_root_limits(mast->l))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2967:2: note: Taking false branch
           if (mas_is_root_limits(mast->l))
           ^
   lib/maple_tree.c:2972:2: note: Taking false branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:2985:2: note: Address of stack memory associated with l=
ocal variable 'r_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:4979:5: warning: Value stored to 'count' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   lib/maple_tree.c:4979:5: note: Value stored to 'count' is never read
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   Suppressed 12 warnings (2 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/ioctl.c:212:29: warning: The left operand of '>' is a garbage value [=
clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (fiemap.fm_extent_count > FIEMAP_MAX_EXTENTS)
                                      ^
   fs/ioctl.c:860:1: note: Calling '__do_sys_ioctl'
   SYSCALL_DEFINE3(ioctl, unsigned int, fd, unsigned int, cmd, unsigned lon=
g, arg)
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/ioctl.c:865:6: note: Assuming field 'file' is non-null
           if (!f.file)
               ^~~~~~~
   fs/ioctl.c:865:2: note: Taking false branch
           if (!f.file)
           ^
   fs/ioctl.c:869:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/ioctl.c:869:2: note: Taking false branch
           if (error)
           ^
   fs/ioctl.c:872:10: note: Calling 'do_vfs_ioctl'
           error =3D do_vfs_ioctl(f.file, fd, cmd, arg);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ioctl.c:782:2: note: Control jumps to 'case 3223348747:'  at line 813
           switch (cmd) {
           ^
   fs/ioctl.c:814:10: note: Calling 'ioctl_fiemap'
                   return ioctl_fiemap(filp, argp);
                          ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ioctl.c:206:6: note: Assuming field 'fiemap' is non-null
           if (!inode->i_op->fiemap)
               ^~~~~~~~~~~~~~~~~~~~
   fs/ioctl.c:206:2: note: Taking false branch
           if (!inode->i_op->fiemap)
           ^
   fs/ioctl.c:209:6: note: Calling 'copy_from_user'
           if (copy_from_user(&fiemap, ufiemap, sizeof(fiemap)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:40: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                                 ^
   arch/mips/include/asm/uaccess.h:88:2: note: expanded from macro 'access_=
ok'
           likely(__access_ok((addr), (size)))
           ^
   include/linux/compiler.h:77:38: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                             ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->fm_extent_count'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
m_extent_count'
           return res;
           ^

vim +/node +319 lib/maple_tree.c

18a91233bf966f Liam R. Howlett 2020-07-24  316  =

18a91233bf966f Liam R. Howlett 2020-07-24  317  static inline void mte_set_=
full(const struct maple_enode *node)
18a91233bf966f Liam R. Howlett 2020-07-24  318  {
18a91233bf966f Liam R. Howlett 2020-07-24 @319  	node =3D (void *)((unsigne=
d long)node & ~MAPLE_ENODE_NULL);
18a91233bf966f Liam R. Howlett 2020-07-24  320  }
18a91233bf966f Liam R. Howlett 2020-07-24  321  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1546867514587211958==--


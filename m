Content-Type: multipart/mixed; boundary="===============5188529722029664735=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 280/410] lib/maple_tree.c:326:2: warning: Value stored to 'node' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 02:22:27 +0800
Message-ID: <202205010206.yC8yeSfw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5188529722029664735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   bf4803abaa3e9d2fa207c0675a2d2abf0fd44f66
commit: c11c433e3be4e5bef47f0a62a72064e18708e952 [280/410] Maple Tree: add =
new data structure
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220429 (https://download.01.org/0day-ci/archi=
ve/20220501/202205010206.yC8yeSfw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/hnaz/linux-mm/commit/c11c433e3be4e5bef47f0a62a=
72064e18708e952
        git remote add hnaz-mm https://github.com/hnaz/linux-mm
        git fetch --no-tags hnaz-mm master
        git checkout c11c433e3be4e5bef47f0a62a72064e18708e952
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   49 warnings generated.
   fs/erofs/data.c:269:20: warning: The left operand of '&' is a garbage va=
lue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (!(map.m_flags & EROFS_MAP_MAPPED)) {
                 ~~~~~~~~~~~ ^
   fs/erofs/data.c:248:8: note: Calling 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:126:2: note: Calling 'trace_erofs_map_blocks_enter'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:172:1: note: Returning without writing to '=
map->m_flags'
   DEFINE_EVENT(erofs__map_blocks_enter, erofs_map_blocks_enter,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   fs/erofs/data.c:126:2: note: Returning from 'trace_erofs_map_blocks_ente=
r'
           trace_erofs_map_blocks_enter(inode, map, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:128:6: note: Assuming field 'm_la' is < field 'i_size'
           if (map->m_la >=3D inode->i_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:128:2: note: Taking false branch
           if (map->m_la >=3D inode->i_size) {
           ^
   fs/erofs/data.c:135:6: note: Assuming field 'datalayout' is equal to ERO=
FS_INODE_CHUNK_BASED
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:135:2: note: Taking false branch
           if (vi->datalayout !=3D EROFS_INODE_CHUNK_BASED) {
           ^
   fs/erofs/data.c:140:6: note: Assuming the condition is false
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:140:2: note: Taking false branch
           if (vi->chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
           ^
   fs/erofs/data.c:150:2: note: Taking true branch
           if (IS_ERR(kaddr)) {
           ^
   fs/erofs/data.c:152:3: note: Control jumps to line 186
                   goto out;
                   ^
   fs/erofs/data.c:186:7: note: 'err' is not equal to 0
           if (!err)
                ^~~
   fs/erofs/data.c:186:2: note: Taking false branch
           if (!err)
           ^
   fs/erofs/data.c:188:2: note: Calling 'trace_erofs_map_blocks_exit'
           trace_erofs_map_blocks_exit(inode, map, flags, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/erofs.h:224:1: note: Returning without writing to '=
map->m_flags'
   DEFINE_EVENT(erofs__map_blocks_exit, erofs_map_blocks_exit,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
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
   fs/erofs/data.c:188:2: note: Returning from 'trace_erofs_map_blocks_exit'
           trace_erofs_map_blocks_exit(inode, map, flags, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:189:2: note: Returning without writing to 'map->m_flags'
           return err;
           ^
   fs/erofs/data.c:248:8: note: Returning from 'erofs_map_blocks'
           ret =3D erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/data.c:249:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/erofs/data.c:249:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/erofs/data.c:257:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/erofs/data.c:257:2: note: Taking false branch
           if (ret)
           ^
   fs/erofs/data.c:261:2: note: Taking false branch
           if (flags & IOMAP_DAX)
           ^
   fs/erofs/data.c:269:20: note: The left operand of '&' is a garbage value
           if (!(map.m_flags & EROFS_MAP_MAPPED)) {
                 ~~~~~~~~~~~ ^
   Suppressed 48 warnings (48 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
>> lib/maple_tree.c:326:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:326:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:331:2: warning: Value stored to 'node' is never read [c=
lang-analyzer-deadcode.DeadStores]
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:331:2: note: Value stored to 'node' is never read
           node =3D (void *)((unsigned long)node | MAPLE_ENODE_NULL);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1174:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(reuse, 0, sizeof(*reuse));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1174:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(reuse, 0, sizeof(*reuse));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:1206:23: warning: Value stored to 'nodep' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1206:23: note: Value stored to 'nodep' during its initi=
alization is never read
           struct maple_alloc **nodep =3D &mas->alloc;
                                ^~~~~   ~~~~~~~~~~~
   lib/maple_tree.c:1218:20: warning: Access to field 'node_count' results =
in a dereference of a null pointer (loaded from field 'alloc') [clang-analy=
zer-core.NullDereference]
           if (!allocated || mas->alloc->node_count =3D=3D MAPLE_ALLOC_SLOT=
S - 1) {
                             ^
   lib/maple_tree.c:6222:2: note: Calling 'trace_ma_op'
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
   lib/maple_tree.c:6222:2: note: Returning from 'trace_ma_op'
           trace_ma_op(__func__, &mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Calling 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:477:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_NONE;
           ^
   include/linux/maple_tree.h:477:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5935:6: note: Returning from 'mas_is_none'
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
   lib/maple_tree.c:5935:26: note: Calling 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/maple_tree.h:483:2: note: Returning without writing to 'ma=
s->alloc', which participates in a condition later
           return mas->node =3D=3D MAS_PAUSE;
           ^
   include/linux/maple_tree.h:483:2: note: Returning without writing to 'ma=
s->alloc'
   lib/maple_tree.c:5935:26: note: Returning from 'mas_is_paused'
           if (mas_is_none(mas) || mas_is_paused(mas))
                                   ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5939:10: note: Calling 'mas_state_walk'
           entry =3D mas_state_walk(mas);
                   ^~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3745:10: note: Calling 'mas_start'
           entry =3D mas_start(mas);
                   ^~~~~~~~~~~~~~
   lib/maple_tree.c:1322:13: note: Calling 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:243:2: note: Returning without writing to 'mas->alloc',=
 which participates in a condition later
           return mas->node =3D=3D MAS_START;
           ^
   lib/maple_tree.c:243:2: note: Returning without writing to 'mas->alloc'
   lib/maple_tree.c:1322:13: note: Returning from 'mas_is_start'
           if (likely(mas_is_start(mas))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:1322:2: note: Taking true branch
           if (likely(mas_is_start(mas))) {
           ^
   lib/maple_tree.c:1331:10: note: Calling 'mas_root'
                   root =3D mas_root(mas);
                          ^~~~~~~~~~~~~
   lib/maple_tree.c:844:9: note: Left side of '||' is false
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
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   lib/maple_tree.c:5965:2: note: Taking false branch
           if (likely(mas->node !=3D MA_ERROR(-ENOMEM))) {
           ^
   lib/maple_tree.c:5970:6: note: Left side of '&&' is true
           if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)=
) {
               ^
   lib/maple_tree.c:5970:2: note: Taking false branch
           if (gfpflags_allow_blocking(gfp) && !mt_external_lock(mas->tree)=
) {
           ^
   lib/maple_tree.c:5975:3: note: Calling 'mas_alloc_nodes'
                   mas_alloc_nodes(mas, gfp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1207:28: note: Calling 'mas_allocated'
           unsigned long allocated =3D mas_allocated(mas);
                                     ^~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:564:6: note: Assuming field 'alloc' is non-null, which =
participates in a condition later
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
               ^~~~~~~~~~~
   lib/maple_tree.c:564:6: note: Left side of '||' is false
   lib/maple_tree.c:564:22: note: Assuming the condition is false
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:564:2: note: Taking false branch
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1))
           ^
   lib/maple_tree.c:567:2: note: Returning value, which participates in a c=
ondition later
           return mas->alloc->total;
           ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1207:28: note: Returning from 'mas_allocated'
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
   lib/maple_tree.c:582:12: note: Field 'alloc' is non-null, which particip=
ates in a condition later
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
                     ^
   lib/maple_tree.c:582:6: note: Left side of '||' is false
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
               ^
   lib/maple_tree.c:582:22: note: Assuming the condition is true
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:582:2: note: Taking true branch
           if (!mas->alloc || ((unsigned long)mas->alloc & 0x1)) {
           ^
   lib/maple_tree.c:583:8: note: 'count' is 0
                   if (!count)
                        ^~~~~
   lib/maple_tree.c:583:3: note: Taking true branch
                   if (!count)
                   ^
   lib/maple_tree.c:584:4: note: Null pointer value stored to 'mas.alloc'
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
   lib/maple_tree.c:1263:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(slots, 0, max_req * sizeof(unsigned long));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:1263:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(slots, 0, max_req * sizeof(unsigned long));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:1696:3: warning: Dereference of null pointer [clang-ana=
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
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking false branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4280:15: note: Field 'entry' is null
           if (!wr_mas->entry)
                        ^
   lib/maple_tree.c:4280:2: note: Taking true branch
           if (!wr_mas->entry)
           ^
   lib/maple_tree.c:4284:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                              ^
   lib/maple_tree.c:4284:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                        ^
   lib/maple_tree.c:4284:30: note: Assuming the condition is false
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
                                       ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   lib/maple_tree.c:4284:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX)) {
           ^
   lib/maple_tree.c:4289:2: note: Calling 'mas_wr_modify'
           mas_wr_modify(wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4215:14: note: Field 'r_min' is equal to field 'index'
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
                       ^
   lib/maple_tree.c:4215:6: note: Left side of '&&' is true
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
               ^
   lib/maple_tree.c:4215:37: note: Assuming field 'r_max' is not equal to f=
ield 'last'
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4215:2: note: Taking false branch
           if (wr_mas->r_min =3D=3D mas->index && wr_mas->r_max =3D=3D mas-=
>last) {
           ^
   lib/maple_tree.c:4225:6: note: Assuming the condition is false
           if (mas->max =3D=3D ULONG_MAX)
               ^~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4225:2: note: Taking false branch
           if (mas->max =3D=3D ULONG_MAX)
           ^
   lib/maple_tree.c:4229:2: note: Taking false branch
           if (unlikely(node_size >=3D node_slots))
           ^
   lib/maple_tree.c:4232:14: note: Field 'entry' is null
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                       ^
   lib/maple_tree.c:4232:20: note: Left side of '&&' is false
           if (wr_mas->entry && (wr_mas->node_end < node_slots - 1) &&
                             ^
   lib/maple_tree.c:4239:6: note: Left side of '&&' is true
           if ((wr_mas->offset_end - mas->offset <=3D 1) && mas_wr_slot_sto=
re(wr_mas))
               ^
   lib/maple_tree.c:4239:49: note: Assuming the condition is false
--
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1752:3: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
                   memmove(b_node->gap + shift, b_node->gap, size);
                   ^
   include/linux/fortify-string.h:373:27: note: expanded from macro 'memmov=
e'
   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:46:30: note: expanded from macro '__under=
lying_memmove'
   #define __underlying_memmove    __builtin_memmove
                                   ^~~~~~~~~~~~~~~~~
   lib/maple_tree.c:1920:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(b_node->slot + mab_start, slots + mas_start, sizeof(void =
*) * j);
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
   lib/maple_tree.c:1920:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(b_node->slot + mab_start, slots + mas_start, sizeof(void =
*) * j);
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
   lib/maple_tree.c:1923:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(b_node->gap + mab_start, gaps + mas_start,
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
   lib/maple_tree.c:1923:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(b_node->gap + mab_start, gaps + mas_start,
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
   lib/maple_tree.c:1986:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(slots, b_node->slot + mab_start,
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
   lib/maple_tree.c:1986:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(slots, b_node->slot + mab_start,
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
>> lib/maple_tree.c:2808:2: warning: Value stored to 'last' is never read [=
clang-analyzer-deadcode.DeadStores]
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2808:2: note: Value stored to 'last' is never read
           last =3D next =3D mas->node;
           ^      ~~~~~~~~~~~~~~~~
>> lib/maple_tree.c:2809:2: warning: Value stored to 'prev_min' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2809:2: note: Value stored to 'prev_min' is never read
           prev_min =3D min =3D mas->min;
           ^          ~~~~~~~~~~~~~~
   lib/maple_tree.c:2934:3: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:2934:3: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
                   memset(mast->bn, 0, sizeof(struct maple_big_node));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:3004:2: warning: Address of stack memory associated wit=
h local variable 'destroy' is still referred to by the stack variable 'mast=
' upon returning to the caller.  This will be a dangling reference [clang-a=
nalyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4272:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3896:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3896:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3896:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3904:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3914:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3925:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3925:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3936:12: note: Field 'offset' is > field 'node_end'
           if (r_mas.offset <=3D r_wr_mas.node_end)
                     ^
   lib/maple_tree.c:3936:2: note: Taking false branch
           if (r_mas.offset <=3D r_wr_mas.node_end)
           ^
   lib/maple_tree.c:3946:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:6: note: Left side of '&&' is true
           if (!mas_is_root_limits(mast->orig_l) &&
               ^
   lib/maple_tree.c:2900:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <=3D mt_min_slots[mast->bn->type]))=
 {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:2: note: Taking false branch
           if (!mas_is_root_limits(mast->orig_l) &&
           ^
   lib/maple_tree.c:2921:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2939:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2954:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2957:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2961:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2965:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2966:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2967:5: note:  Execution continues on line 2973
                                   break;
                                   ^
   lib/maple_tree.c:2978:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2978:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2981:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2981:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2984:2: note: Taking false branch
           if (mas_is_root_limits(mast->l)) {
           ^
   lib/maple_tree.c:2991:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:3004:2: note: Address of stack memory associated with l=
ocal variable 'destroy' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:3004:2: warning: Address of stack memory associated wit=
h local variable 'free' is still referred to by the stack variable 'mast' u=
pon returning to the caller.  This will be a dangling reference [clang-anal=
yzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4272:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3896:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3896:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3896:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3904:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3914:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3925:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3925:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3936:12: note: Field 'offset' is > field 'node_end'
           if (r_mas.offset <=3D r_wr_mas.node_end)
                     ^
   lib/maple_tree.c:3936:2: note: Taking false branch
           if (r_mas.offset <=3D r_wr_mas.node_end)
           ^
   lib/maple_tree.c:3946:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:6: note: Left side of '&&' is true
           if (!mas_is_root_limits(mast->orig_l) &&
               ^
   lib/maple_tree.c:2900:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <=3D mt_min_slots[mast->bn->type]))=
 {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:2: note: Taking false branch
           if (!mas_is_root_limits(mast->orig_l) &&
           ^
   lib/maple_tree.c:2921:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2939:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2954:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2957:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2961:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2965:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2966:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2967:5: note:  Execution continues on line 2973
                                   break;
                                   ^
   lib/maple_tree.c:2978:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2978:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2981:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2981:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2984:2: note: Taking false branch
           if (mas_is_root_limits(mast->l)) {
           ^
   lib/maple_tree.c:2991:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:3004:2: note: Address of stack memory associated with l=
ocal variable 'free' is still referred to by the stack variable 'mast' upon=
 returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:3004:2: warning: Address of stack memory associated wit=
h local variable 'l_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4272:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3896:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3896:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3896:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3904:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3914:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3925:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3925:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3936:12: note: Field 'offset' is > field 'node_end'
           if (r_mas.offset <=3D r_wr_mas.node_end)
                     ^
   lib/maple_tree.c:3936:2: note: Taking false branch
           if (r_mas.offset <=3D r_wr_mas.node_end)
           ^
   lib/maple_tree.c:3946:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:6: note: Left side of '&&' is true
           if (!mas_is_root_limits(mast->orig_l) &&
               ^
   lib/maple_tree.c:2900:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <=3D mt_min_slots[mast->bn->type]))=
 {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:2: note: Taking false branch
           if (!mas_is_root_limits(mast->orig_l) &&
           ^
   lib/maple_tree.c:2921:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2939:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2954:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2957:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2961:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2965:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2966:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2967:5: note:  Execution continues on line 2973
                                   break;
                                   ^
   lib/maple_tree.c:2978:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2978:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2981:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2981:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2984:2: note: Taking false branch
           if (mas_is_root_limits(mast->l)) {
           ^
   lib/maple_tree.c:2991:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:3004:2: note: Address of stack memory associated with l=
ocal variable 'l_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:3004:2: warning: Address of stack memory associated wit=
h local variable 'm_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4272:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3896:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3896:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3896:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3904:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3914:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3925:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3925:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3936:12: note: Field 'offset' is > field 'node_end'
           if (r_mas.offset <=3D r_wr_mas.node_end)
                     ^
   lib/maple_tree.c:3936:2: note: Taking false branch
           if (r_mas.offset <=3D r_wr_mas.node_end)
           ^
   lib/maple_tree.c:3946:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:6: note: Left side of '&&' is true
           if (!mas_is_root_limits(mast->orig_l) &&
               ^
   lib/maple_tree.c:2900:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <=3D mt_min_slots[mast->bn->type]))=
 {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:2: note: Taking false branch
           if (!mas_is_root_limits(mast->orig_l) &&
           ^
   lib/maple_tree.c:2921:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2939:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2954:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2957:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2961:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2965:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2966:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2967:5: note:  Execution continues on line 2973
                                   break;
                                   ^
   lib/maple_tree.c:2978:6: note: 'middle' is null
           if (middle)
               ^~~~~~
   lib/maple_tree.c:2978:2: note: Taking false branch
           if (middle)
           ^
   lib/maple_tree.c:2981:6: note: 'right' is null
           if (right)
               ^~~~~
   lib/maple_tree.c:2981:2: note: Taking false branch
           if (right)
           ^
   lib/maple_tree.c:2984:2: note: Taking false branch
           if (mas_is_root_limits(mast->l)) {
           ^
   lib/maple_tree.c:2991:2: note: Taking true branch
           if (!mte_dead_node(mast->orig_l->node))
           ^
   lib/maple_tree.c:3004:2: note: Address of stack memory associated with l=
ocal variable 'm_mas' is still referred to by the stack variable 'mast' upo=
n returning to the caller.  This will be a dangling reference
           return mast->bn->b_end;
           ^
>> lib/maple_tree.c:3004:2: warning: Address of stack memory associated wit=
h local variable 'r_mas' is still referred to by the stack variable 'mast' =
upon returning to the caller.  This will be a dangling reference [clang-ana=
lyzer-core.StackAddressEscape]
           return mast->bn->b_end;
           ^
   lib/maple_tree.c:6225:10: note: Calling 'mas_erase'
           entry =3D mas_erase(&mas);
                   ^~~~~~~~~~~~~~~
   lib/maple_tree.c:5935:6: note: Left side of '||' is false
           if (mas_is_none(mas) || mas_is_paused(mas))
               ^
   lib/maple_tree.c:5935:2: note: Taking false branch
           if (mas_is_none(mas) || mas_is_paused(mas))
           ^
   lib/maple_tree.c:5940:7: note: 'entry' is non-null
           if (!entry)
                ^~~~~
   lib/maple_tree.c:5940:2: note: Taking false branch
           if (!entry)
           ^
   lib/maple_tree.c:5947:2: note: Calling 'mas_wr_store_entry'
           mas_wr_store_entry(&wr_mas);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:7: note: Assuming field 'content' is null
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
                ^~~~~~~~~~~~~~~
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
               ^
   lib/maple_tree.c:4265:6: note: Left side of '||' is false
   lib/maple_tree.c:4265:2: note: Taking false branch
           if ((wr_mas->content =3D mas_start(mas)) || mas_is_none(mas) ||
           ^
   lib/maple_tree.c:4271:2: note: Taking true branch
           if (unlikely(!mas_wr_walk(wr_mas))) {
           ^
   lib/maple_tree.c:4272:3: note: Calling 'mas_wr_spanning_store'
                   mas_wr_spanning_store(wr_mas);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:3896:21: note: Field 'index' is 0
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                              ^
   lib/maple_tree.c:3896:15: note: Left side of '&&' is true
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
                        ^
   lib/maple_tree.c:3896:2: note: Taking false branch
           if (unlikely(!mas->index && mas->last =3D=3D ULONG_MAX))
           ^
   lib/maple_tree.c:3904:2: note: Taking false branch
           if (mas_is_err(mas))
           ^
   lib/maple_tree.c:3914:2: note: Taking true branch
           if (r_mas.last + 1)
           ^
   lib/maple_tree.c:3925:15: note: Field 'entry' is null
           if (!wr_mas->entry) {
                        ^
   lib/maple_tree.c:3925:2: note: Taking true branch
           if (!wr_mas->entry) {
           ^
   lib/maple_tree.c:3936:12: note: Field 'offset' is > field 'node_end'
           if (r_mas.offset <=3D r_wr_mas.node_end)
                     ^
   lib/maple_tree.c:3936:2: note: Taking false branch
           if (r_mas.offset <=3D r_wr_mas.node_end)
           ^
   lib/maple_tree.c:3946:9: note: Calling 'mas_spanning_rebalance'
           return mas_spanning_rebalance(mas, &mast, height + 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:6: note: Left side of '&&' is true
           if (!mas_is_root_limits(mast->orig_l) &&
               ^
   lib/maple_tree.c:2900:6: note: Assuming the condition is false
               unlikely(mast->bn->b_end <=3D mt_min_slots[mast->bn->type]))=
 {
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/maple_tree.c:2899:2: note: Taking false branch
           if (!mas_is_root_limits(mast->orig_l) &&
           ^
   lib/maple_tree.c:2921:2: note: Loop condition is true.  Entering loop bo=
dy
           while (count--) {
           ^
   lib/maple_tree.c:2939:3: note: Taking false branch
                   if (mas_is_root_limits(mast->l))
                   ^
   lib/maple_tree.c:2954:3: note: Taking false branch
                   if (mast_sufficient(mast))
                   ^
   lib/maple_tree.c:2957:3: note: Taking false branch
                   if (mast_overflow(mast))
                   ^
   lib/maple_tree.c:2961:3: note: Taking false branch
                   if (mas_is_root_limits(mast->orig_l))
                   ^
   lib/maple_tree.c:2965:3: note: Taking true branch
                   if (!mast_sibling_rebalance_right(mast, true))
                   ^
   lib/maple_tree.c:2966:4: note: Taking true branch
                           if (!mast_cousin_rebalance_right(mast, true))
                           ^
   lib/maple_tree.c:2967:5: note:  Execution continues on line 2973
--
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
   lib/maple_tree.c:4043:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(dst_slots + dst_offset, wr_mas->slots + wr_mas->offset_en=
d,
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
   lib/maple_tree.c:4048:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
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
   lib/maple_tree.c:4048:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(dst_pivots + dst_offset, wr_mas->pivots + wr_mas-=
>offset_end,
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
   lib/maple_tree.c:4061:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
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
   lib/maple_tree.c:4061:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(wr_mas->node, newnode, sizeof(struct maple_node));
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
   lib/maple_tree.c:4248:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   lib/maple_tree.c:4248:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&b_node, 0, sizeof(struct maple_big_node));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> lib/maple_tree.c:4890:5: warning: Value stored to 'count' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   lib/maple_tree.c:4890:5: note: Value stored to 'count' is never read
                                   count =3D mt_slots[type];
                                   ^       ~~~~~~~~~~~~~~
   Suppressed 17 warnings (15 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   58 warnings generated.
   Suppressed 58 warnings (48 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   mm/util.c:63:3: warning: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, len);
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
   mm/util.c:63:3: note: Call to function 'memcpy' is insecure as it does n=
ot provide security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'memcpy_s' in case of C11
                   memcpy(buf, s, len);
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
   mm/util.c:109:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, len);
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
   mm/util.c:109:3: note: Call to function 'memcpy' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memcpy_s' in case of C11
                   memcpy(buf, s, len);
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
   mm/util.c:131:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(p, src, len);
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
   mm/util.c:131:3: note: Call to function 'memcpy' is insecure as it does =
not provide security checks introduced in the C11 standard. Replace with an=
alogous functions that support length arguments or provides boundary checks=
 such as 'memcpy_s' in case of C11
                   memcpy(p, src, len);
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
   mm/util.c:154:3: warning: Call to function 'memcpy' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.=
DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, s, len);
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

vim +/node +326 lib/maple_tree.c

c11c433e3be4e5 Liam R. Howlett 2022-04-26  323  =

c11c433e3be4e5 Liam R. Howlett 2022-04-26  324  static inline void mte_set_=
full(const struct maple_enode *node)
c11c433e3be4e5 Liam R. Howlett 2022-04-26  325  {
c11c433e3be4e5 Liam R. Howlett 2022-04-26 @326  	node =3D (void *)((unsigne=
d long)node & ~MAPLE_ENODE_NULL);
c11c433e3be4e5 Liam R. Howlett 2022-04-26  327  }
c11c433e3be4e5 Liam R. Howlett 2022-04-26  328  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5188529722029664735==--


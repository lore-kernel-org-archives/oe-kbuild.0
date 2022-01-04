Content-Type: multipart/mixed; boundary="===============4801677072730162521=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [goldwynr:iomap 10/33] include/linux/pagemap.h:691:18: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Wed, 05 Jan 2022 00:46:34 +0800
Message-ID: <202201050045.f5XOCOID-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4801677072730162521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>

tree:   https://github.com/goldwynr/linux iomap
head:   fd871fa60e5495543660657e665f1a6c13d0af97
commit: 9b0be4cce9f84675546603825aa366923670b7bf [10/33] btrfs: Don't proce=
ss pages if locked_page is NULL
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20220102 (https://download.01.org/0day-ci/ar=
chive/20220105/202201050045.f5XOCOID-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/goldwynr/linux/commit/9b0be4cce9f8467554660382=
5aa366923670b7bf
        git remote add goldwynr https://github.com/goldwynr/linux
        git fetch --no-tags goldwynr iomap
        git checkout 9b0be4cce9f84675546603825aa366923670b7bf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:938:6: note: Assuming field 'locked_page' is null
           if (async_chunk->locked_page) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:938:2: note: Taking false branch
           if (async_chunk->locked_page) {
           ^
   fs/btrfs/inode.c:948:6: note: Assuming field 'pages' is non-null
           if (!async_extent->pages)
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:948:2: note: Taking false branch
           if (!async_extent->pages)
           ^
   fs/btrfs/inode.c:955:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/btrfs/inode.c:955:2: note: Taking true branch
           if (ret) {
           ^
   fs/btrfs/inode.c:964:3: note: Control jumps to line 1023
                   goto out_free;
                   ^
   fs/btrfs/inode.c:1030:2: note: Memory is released
           kfree(async_extent);
           ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1057:9: note: Returning; memory was released
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:1047:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1053:3: note: Calling 'list_del'
                   list_del(&async_extent->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/btrfs/inode.c:1368:6: note: Assuming field 'inode' is non-null
           if (async_chunk->inode)
               ^~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1368:2: note: Taking true branch
           if (async_chunk->inode)
           ^
   fs/btrfs/inode.c:1369:3: note: Calling 'submit_compressed_extents'
                   submit_compressed_extents(async_chunk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1047:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1057:9: note: Calling 'submit_one_async_extent'
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:938:6: note: Assuming field 'locked_page' is null
           if (async_chunk->locked_page) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:938:2: note: Taking false branch
           if (async_chunk->locked_page) {
           ^
   fs/btrfs/inode.c:948:6: note: Assuming field 'pages' is non-null
           if (!async_extent->pages)
               ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:948:2: note: Taking false branch
           if (!async_extent->pages)
           ^
   fs/btrfs/inode.c:955:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/btrfs/inode.c:955:2: note: Taking true branch
           if (ret) {
           ^
   fs/btrfs/inode.c:964:3: note: Control jumps to line 1023
                   goto out_free;
                   ^
   fs/btrfs/inode.c:1030:2: note: Memory is released
           kfree(async_extent);
           ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1057:9: note: Returning; memory was released
                   ret =3D submit_one_async_extent(inode, async_chunk, asyn=
c_extent,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   fs/btrfs/inode.c:1047:2: note: Loop condition is true.  Entering loop bo=
dy
           while (!list_empty(&async_chunk->extents)) {
           ^
   fs/btrfs/inode.c:1053:3: note: Calling 'list_del'
                   list_del(&async_extent->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
>> include/linux/pagemap.h:691:18: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           return ((loff_t)page->index) << PAGE_SHIFT;
                           ^
   fs/btrfs/inode.c:2003:6: note: Assuming 'locked_page' is null
           if (locked_page)
               ^~~~~~~~~~~
   fs/btrfs/inode.c:2003:2: note: Taking false branch
           if (locked_page)
           ^
   fs/btrfs/inode.c:2007:6: note: Calling 'should_nocow'
           if (should_nocow(inode, start, end)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1978:6: note: Assuming the condition is true
           if (inode->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC=
)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1978:2: note: Taking true branch
           if (inode->flags & (BTRFS_INODE_NODATACOW | BTRFS_INODE_PREALLOC=
)) {
           ^
   fs/btrfs/inode.c:1979:7: note: Assuming field 'defrag_bytes' is 0
                   if (inode->defrag_bytes &&
                       ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:1979:27: note: Left side of '&&' is false
                   if (inode->defrag_bytes &&
                                           ^
   fs/btrfs/inode.c:1983:3: note: Returning the value 1, which participates=
 in a condition later
                   return true;
                   ^~~~~~~~~~~
   fs/btrfs/inode.c:2007:6: note: Returning from 'should_nocow'
           if (should_nocow(inode, start, end)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:2007:2: note: Taking true branch
           if (should_nocow(inode, start, end)) {
           ^
   fs/btrfs/inode.c:2015:11: note: 'zoned' is false
                   ASSERT(!zoned ||
                           ^
   fs/btrfs/ctree.h:3526:29: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)    (void)(expr)
                                  ^~~~
   fs/btrfs/inode.c:2015:17: note: Left side of '||' is true
                   ASSERT(!zoned ||
                                 ^
   fs/btrfs/inode.c:2032:9: note: Assuming 'ret' is > 0
           ASSERT(ret <=3D 0);
                  ^
   fs/btrfs/ctree.h:3526:29: note: expanded from macro 'ASSERT'
   #define ASSERT(expr)    (void)(expr)
                                  ^~~~
   fs/btrfs/inode.c:2033:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   fs/btrfs/inode.c:2033:2: note: Taking true branch
           if (ret)
           ^
   fs/btrfs/inode.c:2034:40: note: Passing null pointer value via 2nd param=
eter 'locked_page'
                   btrfs_cleanup_ordered_extents(inode, locked_page, start,
                                                        ^~~~~~~~~~~
   fs/btrfs/inode.c:2034:3: note: Calling 'btrfs_cleanup_ordered_extents'
                   btrfs_cleanup_ordered_extents(inode, locked_page, start,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/inode.c:164:31: note: Passing null pointer value via 1st parame=
ter 'page'
           u64 page_start =3D page_offset(locked_page);
                                        ^~~~~~~~~~~
   fs/btrfs/inode.c:164:19: note: Calling 'page_offset'
           u64 page_start =3D page_offset(locked_page);
                            ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pagemap.h:691:18: note: Dereference of null pointer
           return ((loff_t)page->index) << PAGE_SHIFT;
                           ^~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/common/videobuf2/videobuf2-core.c:1929:10: warning: Access=
 to field 'state' results in a dereference of a null pointer (loaded from v=
ariable 'vb') [clang-analyzer-core.NullDereference]
           switch (vb->state) {
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2921:6: note: Assuming f=
ield 'is_output' is 0
           if (q->is_output) {
               ^~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2921:2: note: Taking fal=
se branch
           if (q->is_output) {
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2928:2: note: Loop condi=
tion is true.  Entering loop body
           for (;;) {
           ^
   drivers/media/common/videobuf2/videobuf2-core.c:2934:7: note: 'prequeue'=
 is 0
                   if (prequeue) {
                       ^~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:2934:3: note: Taking fal=
se branch
                   if (prequeue) {
                   ^
   drivers/media/common/videobuf2/videobuf2-core.c:2938:4: note: Assuming '=
debug' is < 2
                           call_void_qop(q, wait_finish, q);
                           ^
   drivers/media/common/videobuf2/videobuf2-core.c:110:2: note: expanded fr=
om macro 'call_void_qop'
           log_qop(q, op);                                                 \
           ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:94:2: note: expanded fro=
m macro 'log_qop'
           dprintk(q, 2, "call_qop(%s)%s\n", #op,                          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-core.c:39:7: note: expanded fro=
m macro 'dprintk'
                   if (debug >=3D level)                                   =
  \

vim +691 include/linux/pagemap.h

5cbc198ae08d84 Kirill A. Shutemov 2016-11-30  685  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  686  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  687   * Return byte-offset in=
to filesystem object for page.
^1da177e4c3f41 Linus Torvalds     2005-04-16  688   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  689  static inline loff_t pag=
e_offset(struct page *page)
^1da177e4c3f41 Linus Torvalds     2005-04-16  690  {
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01 @691  	return ((loff_t)page->i=
ndex) << PAGE_SHIFT;
^1da177e4c3f41 Linus Torvalds     2005-04-16  692  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  693  =


:::::: The code@line 691 was first introduced by commit
:::::: 09cbfeaf1a5a67bfb3201e0c83c810cecb2efa5a mm, fs: get rid of PAGE_CAC=
HE_* and page_cache_{get,release} macros

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4801677072730162521==--


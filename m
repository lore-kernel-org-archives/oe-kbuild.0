Content-Type: multipart/mixed; boundary="===============4599587867267179954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/io_uring.c:1351:7: warning: Dereference of null pointer (loaded from variable 'locked') [clang-analyzer-core.NullDereference]
Date: Sat, 28 May 2022 16:43:23 +0800
Message-ID: <202205281648.h67layl0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4599587867267179954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hao Xu <howeyxu@tencent.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: dbc2564cfe0faff439dc46adb8c009589054ea46 io_uring: let fast poll su=
pport multishot
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220528/202205281648.h67layl0-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f=
9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddbc2564cfe0faff439dc46adb8c009589054ea46
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dbc2564cfe0faff439dc46adb8c009589054ea46
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/readpage.c:357:7: note: 'bio' is null
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                       ^~~
   fs/ext4/readpage.c:357:11: note: Left side of '&&' is false
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                           ^
   fs/ext4/readpage.c:363:7: note: 'bio' is equal to NULL
                   if (bio =3D=3D NULL) {
                       ^~~
   fs/ext4/readpage.c:363:3: note: Taking true branch
                   if (bio =3D=3D NULL) {
                   ^
   fs/ext4/readpage.c:373:39: note: The left operand of '<<' is a garbage v=
alue
                           bio->bi_iter.bi_sector =3D blocks[0] << (blkbits=
 - 9);
                                                    ~~~~~~~~~ ^
   include/asm-generic/bitops/non-atomic.h:118:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   fs/ext4/readpage.c:242:26: note: Assuming 'rac' is non-null
           unsigned int nr_pages =3D rac ? readahead_count(rac) : 1;
                                   ^~~
   fs/ext4/readpage.c:242:26: note: '?' condition is true
   fs/ext4/readpage.c:249:2: note: Loop condition is true.  Entering loop b=
ody
           for (; nr_pages; nr_pages--) {
           ^
   fs/ext4/readpage.c:253:7: note: 'rac' is non-null
                   if (rac) {
                       ^~~
   fs/ext4/readpage.c:253:3: note: Taking true branch
                   if (rac) {
                   ^
   fs/ext4/readpage.c:258:7: note: Calling 'PagePrivate'
                   if (page_has_buffers(page))
                       ^
   include/linux/buffer_head.h:146:32: note: expanded from macro 'page_has_=
buffers'
   #define page_has_buffers(page)  PagePrivate(page)
                                   ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:521:1: note: Passing null pointer value via 2=
nd parameter 'addr'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:438:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:393:31: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:521:1: note: Calling 'arch_test_bit'
   PAGEFLAG(Private, private, PF_ANY)
   ^
   include/linux/page-flags.h:438:2: note: expanded from macro 'PAGEFLAG'
           TESTPAGEFLAG(uname, lname, policy)                              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:393:10: note: expanded from macro 'TESTPAGEFL=
AG'
   { return test_bit(PG_##lname, &policy(page, 0)->flags); }
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   include/asm-generic/bitops/non-atomic.h:118:16: note: Array access (from=
 variable 'addr') results in a null pointer dereference
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^~~~
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   Suppressed 79 warnings (78 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   fs/signalfd.c:81:2: warning: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecureA=
PI.DeprecatedOrUnsafeBufferHandling]
           memset(&new, 0, sizeof(new));
           ^~~~~~
   fs/signalfd.c:81:2: note: Call to function 'memset' is insecure as it do=
es not provide security checks introduced in the C11 standard. Replace with=
 analogous functions that support length arguments or provides boundary che=
cks such as 'memset_s' in case of C11
           memset(&new, 0, sizeof(new));
           ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   fs/eventfd.c:285:8: warning: Value stored to 'res' is never read [clang-=
analyzer-deadcode.DeadStores]
                   for (res =3D 0;;) {
                        ^     ~
   fs/eventfd.c:285:8: note: Value stored to 'res' is never read
                   for (res =3D 0;;) {
                        ^     ~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   fs/aio.c:702:4: warning: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
                           memcpy(table->table, old->table,
                           ^~~~~~
   fs/aio.c:702:4: note: Call to function 'memcpy' is insecure as it does n=
ot provide security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'memcpy_s' in case of C11
                           memcpy(table->table, old->table,
                           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
>> fs/io_uring.c:1351:7: warning: Dereference of null pointer (loaded from =
variable 'locked') [clang-analyzer-core.NullDereference]
           if (!*locked) {
                ^
   fs/io_uring.c:6120:34: note: Passing value via 2nd parameter 'locked'
           ret =3D io_poll_check_events(req, locked);
                                           ^~~~~~
   fs/io_uring.c:6120:8: note: Calling 'io_poll_check_events'
           ret =3D io_poll_check_events(req, locked);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6029:6: note: Assuming the condition is true
           if (unlikely(req->task->flags & PF_EXITING))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/io_uring.c:6029:2: note: Taking false branch
           if (unlikely(req->task->flags & PF_EXITING))
           ^
   fs/io_uring.c:6036:20: note: Assuming the condition is false
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                                    ^
   include/asm-generic/bug.h:146:18: note: expanded from macro 'WARN_ON_ONC=
E'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   fs/io_uring.c:6036:7: note: '__ret_do_once' is false
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
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
   fs/io_uring.c:6036:7: note: Left side of '&&' is false
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   fs/io_uring.c:6036:7: note: Taking false branch
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                       ^
   include/asm-generic/bug.h:146:2: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   fs/io_uring.c:6036:3: note: Taking false branch
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                   ^
   fs/io_uring.c:6038:7: note: Assuming the condition is false
                   if (v & IO_POLL_CANCEL_FLAG)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6038:3: note: Taking false branch
                   if (v & IO_POLL_CANCEL_FLAG)
                   ^
   fs/io_uring.c:6041:7: note: Assuming field 'res' is 0
                   if (!req->cqe.res) {
                       ^~~~~~~~~~~~~
   fs/io_uring.c:6041:3: note: Taking true branch
                   if (!req->cqe.res) {
                   ^
   fs/io_uring.c:6043:21: note: Assuming 'locked' is null
                           unsigned flags =3D locked ? 0 : IO_URING_F_UNLOC=
KED;
                                            ^~~~~~
   fs/io_uring.c:6043:21: note: '?' condition is false
   fs/io_uring.c:6045:4: note: Taking false branch
                           if (unlikely(!io_assign_file(req, flags)))
                           ^
   fs/io_uring.c:6050:17: note: Assuming field 'res' is not equal to 0
                   if ((unlikely(!req->cqe.res)))
                                 ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/io_uring.c:6050:3: note: Taking false branch
                   if ((unlikely(!req->cqe.res)))
                   ^
   fs/io_uring.c:6052:7: note: Assuming the condition is false
                   if (req->apoll_events & EPOLLONESHOT)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6052:3: note: Taking false branch
                   if (req->apoll_events & EPOLLONESHOT)
                   ^
   fs/io_uring.c:6056:7: note: Assuming the condition is false
                   if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:6056:3: note: Taking false branch
                   if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
                   ^
   fs/io_uring.c:6073:24: note: Passing null pointer value via 2nd paramete=
r 'locked'

vim +/locked +1351 fs/io_uring.c

f8929630514505 Pavel Begunkov 2022-03-25  1348  =

f237c30a5610d3 Pavel Begunkov 2021-08-18  1349  static inline void io_tw_lo=
ck(struct io_ring_ctx *ctx, bool *locked)
f237c30a5610d3 Pavel Begunkov 2021-08-18  1350  {
f237c30a5610d3 Pavel Begunkov 2021-08-18 @1351  	if (!*locked) {
f237c30a5610d3 Pavel Begunkov 2021-08-18  1352  		mutex_lock(&ctx->uring_lo=
ck);
f237c30a5610d3 Pavel Begunkov 2021-08-18  1353  		*locked =3D true;
f237c30a5610d3 Pavel Begunkov 2021-08-18  1354  	}
f237c30a5610d3 Pavel Begunkov 2021-08-18  1355  }
f237c30a5610d3 Pavel Begunkov 2021-08-18  1356  =


:::::: The code at line 1351 was first introduced by commit
:::::: f237c30a5610d35a584f3296d397b93d80ce374e io_uring: batch task work l=
ocking

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4599587867267179954==--


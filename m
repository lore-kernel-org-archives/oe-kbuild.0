Content-Type: multipart/mixed; boundary="===============7156656023790769487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/5] io_uring: let fast poll support multishot
Date: Sun, 08 May 2022 17:48:10 +0800
Message-ID: <202205081710.JNZmSYT9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7156656023790769487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220506070102.26032-4-haoxu.linux@gmail.com>
References: <20220506070102.26032-4-haoxu.linux@gmail.com>
TO: Hao Xu <haoxu.linux@gmail.com>

Hi Hao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f2e030dd7aaea5a937a2547dc980fab418fbc5e7]

url:    https://github.com/intel-lab-lkp/linux/commits/Hao-Xu/fast-poll-mul=
tishot-mode/20220506-150750
base:   f2e030dd7aaea5a937a2547dc980fab418fbc5e7
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20508/202205081710.JNZmSYT9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6001c3e95550875d432=
8aa2ca8b342c42b0e644e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hao-Xu/fast-poll-multishot-mode/20=
220506-150750
        git checkout 6001c3e95550875d4328aa2ca8b342c42b0e644e
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/acpi/acpica/nsinit.c:168:4: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                           memset(info.evaluate_info, 0,
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
   drivers/acpi/acpica/nsinit.c:639:3: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(info, 0, sizeof(struct acpi_evaluate_info));
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
   drivers/acpi/acpica/nsinit.c:639:3: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
                   memset(info, 0, sizeof(struct acpi_evaluate_info));
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
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   fs/aio.c:702:4: warning: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAPI.D=
eprecatedOrUnsafeBufferHandling]
                           memcpy(table->table, old->table,
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
   fs/aio.c:702:4: note: Call to function 'memcpy' is insecure as it does n=
ot provide security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'memcpy_s' in case of C11
                           memcpy(table->table, old->table,
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
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   100 warnings generated.
   fs/io_uring.c:362:8: warning: Excessive padding in 'struct io_ring_ctx' =
(220 padding bytes, where 92 is optimal). =

   Optimal fields order: =

   , =

   , =

   , =

   , =

   sq_creds, =

   sq_data, =

   check_cq, =

   locked_free_list, =

   sqd_list, =

   restrictions, =

   sqo_sq_wait, =

   , =

   , =

   locked_free_nr, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct io_ring_ctx {
   ~~~~~~~^~~~~~~~~~~~~
   fs/io_uring.c:362:8: note: Excessive padding in 'struct io_ring_ctx' (22=
0 padding bytes, where 92 is optimal). Optimal fields order: , , , , sq_cre=
ds, sq_data, check_cq, locked_free_list, sqd_list, restrictions, sqo_sq_wai=
t, , , locked_free_nr, consider reordering the fields or adding explicit pa=
dding members
   struct io_ring_ctx {
   ~~~~~~~^~~~~~~~~~~~~
>> fs/io_uring.c:1313:7: warning: Dereference of null pointer (loaded from =
variable 'locked') [clang-analyzer-core.NullDereference]
           if (!*locked) {
                ^
   fs/io_uring.c:6047:34: note: Passing value via 2nd parameter 'locked'
           ret =3D io_poll_check_events(req, locked);
                                           ^~~~~~
   fs/io_uring.c:6047:8: note: Calling 'io_poll_check_events'
           ret =3D io_poll_check_events(req, locked);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:5961:6: note: Assuming the condition is true
           if (unlikely(req->task->flags & PF_EXITING))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/io_uring.c:5961:2: note: Taking false branch
           if (unlikely(req->task->flags & PF_EXITING))
           ^
   fs/io_uring.c:5968:20: note: Assuming the condition is false
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                                    ^
   include/asm-generic/bug.h:104:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   fs/io_uring.c:5968:7: note: Taking false branch
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                       ^
   include/asm-generic/bug.h:105:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   fs/io_uring.c:5968:3: note: Taking false branch
                   if (WARN_ON_ONCE(!(v & IO_POLL_REF_MASK)))
                   ^
   fs/io_uring.c:5970:7: note: Assuming the condition is false
                   if (v & IO_POLL_CANCEL_FLAG)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:5970:3: note: Taking false branch
                   if (v & IO_POLL_CANCEL_FLAG)
                   ^
   fs/io_uring.c:5973:7: note: Assuming field 'res' is 0
                   if (!req->cqe.res) {
                       ^~~~~~~~~~~~~
   fs/io_uring.c:5973:3: note: Taking true branch
                   if (!req->cqe.res) {
                   ^
   fs/io_uring.c:5975:21: note: Assuming 'locked' is null
                           unsigned flags =3D locked ? 0 : IO_URING_F_UNLOC=
KED;
                                            ^~~~~~
   fs/io_uring.c:5975:21: note: '?' condition is false
   fs/io_uring.c:5977:18: note: Calling 'io_assign_file'
                           if (unlikely(!io_assign_file(req, flags)))
                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/io_uring.c:7324:6: note: Assuming field 'file' is non-null
           if (req->file || !io_op_defs[req->opcode].needs_file)
               ^~~~~~~~~
   fs/io_uring.c:7324:16: note: Left side of '||' is true
           if (req->file || !io_op_defs[req->opcode].needs_file)
                         ^
   fs/io_uring.c:7325:3: note: Returning without writing to 'req->cqe.res',=
 which participates in a condition later
                   return true;
                   ^
   fs/io_uring.c:5977:18: note: Returning from 'io_assign_file'
                           if (unlikely(!io_assign_file(req, flags)))
                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   fs/io_uring.c:5977:4: note: Taking false branch
                           if (unlikely(!io_assign_file(req, flags)))
                           ^
   fs/io_uring.c:5983:7: note: Assuming field 'res' is not equal to 0
                   if (req->cqe.res && !(req->apoll_events & EPOLLONESHOT))=
 {
                       ^~~~~~~~~~~~
   fs/io_uring.c:5983:7: note: Left side of '&&' is true
   fs/io_uring.c:5983:23: note: Assuming the condition is true
                   if (req->cqe.res && !(req->apoll_events & EPOLLONESHOT))=
 {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:5983:3: note: Taking true branch
                   if (req->cqe.res && !(req->apoll_events & EPOLLONESHOT))=
 {
                   ^
   fs/io_uring.c:5984:8: note: Assuming the condition is true
                           if (req->flags & REQ_F_APOLL_MULTISHOT) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:5984:4: note: Taking true branch
                           if (req->flags & REQ_F_APOLL_MULTISHOT) {
                           ^
   fs/io_uring.c:5985:26: note: Passing null pointer value via 2nd paramete=
r 'locked'
                                   io_tw_lock(req->ctx, locked);
                                                        ^~~~~~
   fs/io_uring.c:5985:5: note: Calling 'io_tw_lock'
                                   io_tw_lock(req->ctx, locked);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:1313:7: note: Dereference of null pointer (loaded from var=
iable 'locked')
           if (!*locked) {
                ^~~~~~~
   fs/io_uring.c:1353:7: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           if (!wq_list_empty(&ctx->submit_state.compl_reqs))
                ^

vim +/locked +1313 fs/io_uring.c

f8929630514505 Pavel Begunkov 2022-03-25  1310  =

f237c30a5610d3 Pavel Begunkov 2021-08-18  1311  static inline void io_tw_lo=
ck(struct io_ring_ctx *ctx, bool *locked)
f237c30a5610d3 Pavel Begunkov 2021-08-18  1312  {
f237c30a5610d3 Pavel Begunkov 2021-08-18 @1313  	if (!*locked) {
f237c30a5610d3 Pavel Begunkov 2021-08-18  1314  		mutex_lock(&ctx->uring_lo=
ck);
f237c30a5610d3 Pavel Begunkov 2021-08-18  1315  		*locked =3D true;
f237c30a5610d3 Pavel Begunkov 2021-08-18  1316  	}
f237c30a5610d3 Pavel Begunkov 2021-08-18  1317  }
f237c30a5610d3 Pavel Begunkov 2021-08-18  1318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7156656023790769487==--


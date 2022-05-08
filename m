Content-Type: multipart/mixed; boundary="===============6590304655566505606=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: ipc/shm.c:52:8: warning: Excessive padding in 'struct shmid_kernel' (64 padding bytes, where 0 is optimal).
Date: Sun, 08 May 2022 18:59:50 +0800
Message-ID: <202205081839.bI3BOLnX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6590304655566505606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>
CC: Manfred Spraul <manfred@colorfullife.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 85b6d24646e4125c591639841169baa98a2da503 shm: extend forced shm des=
troy to support objects from several IPC nses
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-c006-20220507 (https://download.01.org/0day-ci/arc=
hive/20220508/202205081839.bI3BOLnX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D85b6d24646e4125c591639841169baa98a2da503
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 85b6d24646e4125c591639841169baa98a2da503
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           BUG_ON(n > n2);
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/ext4/indirect.c:1246:7: note: 'n' is not equal to 1
           if ((n =3D=3D 1) && (n =3D=3D n2)) {
                ^
   fs/ext4/indirect.c:1246:15: note: Left side of '&&' is false
           if ((n =3D=3D 1) && (n =3D=3D n2)) {
                        ^
   fs/ext4/indirect.c:1251:13: note: 'n2' is > 'n'
           } else if (n2 > n) {
                      ^~
   fs/ext4/indirect.c:1251:9: note: Taking true branch
           } else if (n2 > n) {
                  ^
   fs/ext4/indirect.c:1259:7: note: 'n' is not equal to 1
                   if (n =3D=3D 1) {
                       ^
   fs/ext4/indirect.c:1259:3: note: Taking false branch
                   if (n =3D=3D 1) {
                   ^
   fs/ext4/indirect.c:1270:17: note: Calling 'ext4_find_shared'
                   partial =3D p =3D ext4_find_shared(inode, n, offsets, ch=
ain, &nr);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/ext4/indirect.c:798:18: note: 'k' is <=3D 1
           for (k =3D depth; k > 1 && !offsets[k-1]; k--)
                           ^
   fs/ext4/indirect.c:798:24: note: Left side of '&&' is false
           for (k =3D depth; k > 1 && !offsets[k-1]; k--)
                                 ^
   fs/ext4/indirect.c:800:12: note: Calling 'ext4_get_branch'
           partial =3D ext4_get_branch(inode, k, offsets, chain, &err);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/indirect.c:155:47: note: The right operand of '+' is a garbage v=
alue
           add_chain(chain, NULL, EXT4_I(inode)->i_data + *offsets);
                                                        ^ ~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/autofs/root.c:562:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(cp, symname);
           ^~~~~~
   fs/autofs/root.c:562:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(cp, symname);
           ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/input/misc/atmel_captouch.c:68:8: warning: Excessive padding in =
'struct atmel_captouch_device' (75 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   xfer_buf, =

   client, =

   input, =

   num_btn, =

   keycodes, =

   prev_btn, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:68:8: note: Excessive padding in 'st=
ruct atmel_captouch_device' (75 padding bytes, where 11 is optimal). Optima=
l fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consi=
der reordering the fields or adding explicit padding members
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> ipc/shm.c:52:8: warning: Excessive padding in 'struct shmid_kernel' (64 =
padding bytes, where 0 is optimal). =

   Optimal fields order: =

   shm_perm, =

   shm_atim, =

   shm_dtim, =

   shm_ctim, =

   shm_file, =

   shm_nattch, =

   shm_segsz, =

   shm_cprid, =

   shm_lprid, =

   mlock_ucounts, =

   shm_creator, =

   ns, =

   shm_clist, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct shmid_kernel /* private to the kernel */
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/shm.c:52:8: note: Excessive padding in 'struct shmid_kernel' (64 pad=
ding bytes, where 0 is optimal). Optimal fields order: shm_perm, shm_atim, =
shm_dtim, shm_ctim, shm_file, shm_nattch, shm_segsz, shm_cprid, shm_lprid, =
mlock_ucounts, shm_creator, ns, shm_clist, consider reordering the fields o=
r adding explicit padding members
   struct shmid_kernel /* private to the kernel */
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   security/keys/keyring.c:317:3: warning: Null pointer passed as 2nd argum=
ent to memory comparison function [clang-analyzer-unix.cstring.NullArg]
                   memcmp(key->index_key.description, index_key->descriptio=
n,
                   ^
   security/keys/keyring.c:678:2: note: Taking false branch
           kenter("{%d},{%s,%s}",
           ^
   security/keys/internal.h:34:2: note: expanded from macro 'kenter'
           no_printk(KERN_DEBUG "=3D=3D> %s("FMT")\n", __func__, ##__VA_ARG=
S__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   security/keys/keyring.c:684:9: note: Assuming the condition is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   security/keys/keyring.c:684:9: note: Left side of '||' is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   security/keys/keyring.c:685:9: note: Assuming the condition is false
                  (ctx->flags & STATE_CHECKS) =3D=3D STATE_CHECKS);
                  ^
   include/asm-generic/bug.h:65:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   security/keys/keyring.c:684:9: note: Left side of '||' is false
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
                  ^
   security/keys/keyring.c:684:2: note: Taking false branch
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   security/keys/keyring.c:684:2: note: Loop condition is false.  Exiting l=
oop
           BUG_ON((ctx->flags & STATE_CHECKS) =3D=3D 0 ||
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   security/keys/keyring.c:687:6: note: Assuming field 'description' is null
           if (ctx->index_key.description)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:687:2: note: Taking false branch
           if (ctx->index_key.description)
           ^
   security/keys/keyring.c:693:6: note: Assuming field 'lookup_type' is not=
 equal to KEYRING_SEARCH_LOOKUP_ITERATE
           if (ctx->match_data.lookup_type =3D=3D KEYRING_SEARCH_LOOKUP_ITE=
RATE ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:693:6: note: Left side of '||' is false
   security/keys/keyring.c:694:6: note: Calling 'keyring_compare_object'
               keyring_compare_object(keyring, &ctx->index_key)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/keyring.c:314:9: note: Assuming 'key->index_key.type' is e=
qual to 'index_key->type'

vim +52 ipc/shm.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  51  =

a2e102cd3cdd8b Eric W. Biederman     2018-03-22 @52  struct shmid_kernel /*=
 private to the kernel */
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  53  {
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  54  	struct kern_ipc_perm	=
shm_perm;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  55  	struct file		*shm_fil=
e;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  56  	unsigned long		shm_na=
ttch;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  57  	unsigned long		shm_se=
gsz;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  58  	time64_t		shm_atim;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  59  	time64_t		shm_dtim;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  60  	time64_t		shm_ctim;
98f929b1bd4d0b Eric W. Biederman     2018-03-23  61  	struct pid		*shm_cpri=
d;
98f929b1bd4d0b Eric W. Biederman     2018-03-23  62  	struct pid		*shm_lpri=
d;
d7c9e99aee48e6 Alexey Gladkov        2021-04-22  63  	struct ucounts		*mloc=
k_ucounts;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  64  =

85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  65  	/*
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  66  	 * The task created t=
he shm object, for
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  67  	 * task_lock(shp->shm=
_creator)
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  68  	 */
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  69  	struct task_struct	*s=
hm_creator;
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  70  =

85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  71  	/*
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  72  	 * List by creator. t=
ask_lock(->shm_creator) required for read/write.
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  73  	 * If list_empty(), t=
hen the creator is dead already.
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  74  	 */
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  75  	struct list_head	shm_=
clist;
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  76  	struct ipc_namespace	=
*ns;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  77  } __randomize_layout;
a2e102cd3cdd8b Eric W. Biederman     2018-03-22  78  =


:::::: The code at line 52 was first introduced by commit
:::::: a2e102cd3cdd8b7a14e08716510707b15802073f shm: Move struct shmid_kern=
el into ipc/shm.c

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6590304655566505606==--


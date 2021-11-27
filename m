Content-Type: multipart/mixed; boundary="===============3253805460743271998=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: ipc/shm.c:52:8: warning: Excessive padding in 'struct shmid_kernel' (64 padding bytes, where 0 is optimal).
Date: Sun, 28 Nov 2021 07:52:04 +0800
Message-ID: <202111280718.YFPIcuuw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3253805460743271998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>
CC: Manfred Spraul <manfred@colorfullife.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4f0dda359c4563cbb1b0f97b0dbbcdc553156541
commit: 85b6d24646e4125c591639841169baa98a2da503 shm: extend forced shm des=
troy to support objects from several IPC nses
date:   7 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20211126 (https://download.01.org/0day-ci/arc=
hive/20211128/202111280718.YFPIcuuw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/readpage.c:339:7: note: 'first_hole' is equal to 'blocks_per_pag=
e'
                   if (first_hole !=3D blocks_per_page) {
                       ^~~~~~~~~~
   fs/ext4/readpage.c:339:3: note: Taking false branch
                   if (first_hole !=3D blocks_per_page) {
                   ^
   fs/ext4/readpage.c:350:14: note: 'fully_mapped' is 1
                   } else if (fully_mapped) {
                              ^~~~~~~~~~~~
   fs/ext4/readpage.c:350:10: note: Taking true branch
                   } else if (fully_mapped) {
                          ^
   fs/ext4/readpage.c:353:7: note: 'fully_mapped' is 1
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                       ^~~~~~~~~~~~
   fs/ext4/readpage.c:353:7: note: Left side of '&&' is true
   fs/ext4/readpage.c:353:23: note: 'blocks_per_page' is not equal to 1
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                                       ^~~~~~~~~~~~~~~
   fs/ext4/readpage.c:353:44: note: Left side of '&&' is false
                   if (fully_mapped && blocks_per_page =3D=3D 1 &&
                                                            ^
   fs/ext4/readpage.c:363:7: note: 'bio' is null
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                       ^~~
   fs/ext4/readpage.c:363:11: note: Left side of '&&' is false
                   if (bio && (last_block_in_bio !=3D blocks[0] - 1 ||
                           ^
   fs/ext4/readpage.c:369:7: note: 'bio' is equal to NULL
                   if (bio =3D=3D NULL) {
                       ^~~
   fs/ext4/readpage.c:369:3: note: Taking true branch
                   if (bio =3D=3D NULL) {
                   ^
   fs/ext4/readpage.c:379:39: note: The left operand of '<<' is a garbage v=
alue
                           bio->bi_iter.bi_sector =3D blocks[0] << (blkbits=
 - 9);
                                                    ~~~~~~~~~ ^
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
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
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/base/bus.c:873:18: warning: Access to field 'drivers_kset' resul=
ts in a dereference of a null pointer (loaded from field 'p') [clang-analyz=
er-core.NullDereference]
           kset_unregister(bus->p->drivers_kset);
                           ^
   drivers/base/bus.c:1139:9: note: Calling 'subsys_register'
           return subsys_register(subsys, groups, &system_kset->kobj);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:1083:8: note: Calling 'bus_register'
           err =3D bus_register(subsys);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:788:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/base/bus.c:788:2: note: Taking false branch
           if (!priv)
           ^
   drivers/base/bus.c:794:2: note: Loop condition is false.  Exiting loop
           BLOCKING_INIT_NOTIFIER_HEAD(&priv->bus_notifier);
           ^
   include/linux/notifier.h:85:3: note: expanded from macro 'BLOCKING_INIT_=
NOTIFIER_HEAD'
                   init_rwsem(&(name)->rwsem);     \
                   ^
   include/linux/rwsem.h:106:30: note: expanded from macro 'init_rwsem'
   #define init_rwsem(sem)                                         \

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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3253805460743271998==--


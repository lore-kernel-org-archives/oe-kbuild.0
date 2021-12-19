Content-Type: multipart/mixed; boundary="===============6371769171903972142=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/raid56.c:2708:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 19 Dec 2021 15:16:27 +0800
Message-ID: <202112191556.Ayz7orhN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6371769171903972142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20211215 (https://download.01.org/0day-ci/archi=
ve/20211219/202112191556.Ayz7orhN-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245b=
ab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   fs/jfs/jfs_dmap.h:117:4: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
             ^~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3404:21: note: '?' condition is true
           bmp->db_maxlevel =3D BMAPSZTOLEV(bmp->db_mapsize);
                              ^
   fs/jfs/jfs_dmap.h:117:3: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
            ^
   fs/jfs/jfs_dmap.c:3407:13: note: Calling 'dbGetL2AGSize'
           l2agsize =3D dbGetL2AGSize(newsize);
                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4001:6: note: Assuming the condition is false
           if (nblocks < BPERDMAP * MAXAG)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/jfs/jfs_dmap.c:4001:2: note: '?' condition is false
           if (nblocks < BPERDMAP * MAXAG)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/jfs/jfs_dmap.c:4001:2: note: '?' condition is false
           if (nblocks < BPERDMAP * MAXAG)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/jfs/jfs_dmap.c:4001:2: note: Taking false branch
           if (nblocks < BPERDMAP * MAXAG)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/jfs/jfs_dmap.c:4006:7: note: The value 64 is assigned to 'l2sz'
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
                ^~~~~~~~~
   fs/jfs/jfs_dmap.c:4006:2: note: Loop condition is true.  Entering loop b=
ody
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
           ^
   fs/jfs/jfs_dmap.c:4007:3: note: Assuming the condition is false
                   if (m & nblocks)
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/jfs/jfs_dmap.c:4007:3: note: '?' condition is false
                   if (m & nblocks)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/jfs/jfs_dmap.c:4007:3: note: '?' condition is true
                   if (m & nblocks)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/jfs/jfs_dmap.c:4007:3: note: Taking true branch
                   if (m & nblocks)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/jfs/jfs_dmap.c:4008:4: note:  Execution continues on line 4011
                           break;
                           ^
   fs/jfs/jfs_dmap.c:4011:15: note: The result of the left shift is undefin=
ed due to shifting by '64', which is greater or equal to the width of type =
's64'
           sz =3D (s64) 1 << l2sz;
                        ^  ~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> fs/btrfs/raid56.c:2708:7: warning: Use of memory after it is freed [clan=
g-analyzer-unix.Malloc]
           if (!lock_stripe_add(rbio))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/btrfs/raid56.c:2708:7: note: Calling 'lock_stripe_add'
           if (!lock_stripe_add(rbio))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/btrfs/raid56.c:674:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&h->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:253:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   fs/btrfs/raid56.c:674:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&h->lock, flags);
           ^
   include/linux/spinlock.h:390:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   fs/btrfs/raid56.c:675:2: note: Loop condition is true.  Entering loop bo=
dy
           list_for_each_entry(cur, &h->hash_list, hash_list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/btrfs/raid56.c:676:7: note: Assuming the condition is false
                   if (cur->bbio->raid_map[0] !=3D rbio->bbio->raid_map[0])
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/btrfs/raid56.c:676:3: note: '?' condition is false
                   if (cur->bbio->raid_map[0] !=3D rbio->bbio->raid_map[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/raid56.c:676:3: note: '?' condition is false
                   if (cur->bbio->raid_map[0] !=3D rbio->bbio->raid_map[0])
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   fs/btrfs/raid56.c:676:3: note: Taking false branch
                   if (cur->bbio->raid_map[0] !=3D rbio->bbio->raid_map[0])
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/btrfs/raid56.c:682:38: note: Left side of '&&' is false
                   if (bio_list_empty(&cur->bio_list) &&
                                                      ^
   fs/btrfs/raid56.c:682:3: note: '?' condition is false
                   if (bio_list_empty(&cur->bio_list) &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/btrfs/raid56.c:682:38: note: Left side of '&&' is false
                   if (bio_list_empty(&cur->bio_list) &&
                                                      ^
   fs/btrfs/raid56.c:682:3: note: '?' condition is false
                   if (bio_list_empty(&cur->bio_list) &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +2708 fs/btrfs/raid56.c

b4ee1782686d5b Omar Sandoval 2015-06-19  2705  =

b4ee1782686d5b Omar Sandoval 2015-06-19  2706  void raid56_submit_missing_r=
bio(struct btrfs_raid_bio *rbio)
b4ee1782686d5b Omar Sandoval 2015-06-19  2707  {
b4ee1782686d5b Omar Sandoval 2015-06-19 @2708  	if (!lock_stripe_add(rbio))

:::::: The code at line 2708 was first introduced by commit
:::::: b4ee1782686d5b7a97826d67fdeaefaedbca23ce Btrfs: add RAID 5/6 BTRFS_R=
BIO_REBUILD_MISSING operation

:::::: TO: Omar Sandoval <osandov@fb.com>
:::::: CC: Chris Mason <clm@fb.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6371769171903972142==--


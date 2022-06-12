Content-Type: multipart/mixed; boundary="===============0715373754686344861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/ctree.h:3525:34: warning: dereference of NULL 'trans' [CWE-476]
Date: Sun, 12 Jun 2022 21:29:48 +0800
Message-ID: <202206122128.AtyCG5YP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0715373754686344861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/btrfs/ctree.h:3525:34: warning: dereference of NULL 'trans' [CWE-476] [=
-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 79bd37120b149532af5b21953643ed74af69654f btrfs: rework chunk alloca=
tion to avoid exhaustion of the system chunk array
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220611 (https://download.01.org/0day-ci/archi=
ve/20220612/202206122128.AtyCG5YP-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D79bd37120b149532af5b21953643ed74af69654f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 79bd37120b149532af5b21953643ed74af69654f
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (67) ...to here
                                   |......
                                   | 2560 |         if (ret) {
                                   |      |            ~           =

                                   |      |            |
                                   |      |            (68) following 'fals=
e' branch (when 'ret =3D=3D 0')...
                                   |
                                 'split_node': event 69
                                   |
                                   |fs/btrfs/ctree.h:1925:46:
                                   | 1925 |                 sizeof(struct b=
trfs_key_ptr) * nr;
                                   |      |                 ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~^~~~
                                   |      |                                =
              |
                                   |      |                                =
              (69) ...to here
                                   |
                                 'split_node': event 70
                                   |
                                   |fs/btrfs/ctree.c:2574:9:
                                   | 2574 |         insert_ptr(trans, path,=
 &disk_key, split->start,
                                   |      |         ^~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (70) calling 'insert_pt=
r' from 'split_node'
                                   | 2575 |                    path->slots[=
level + 1] + 1, level + 1);
                                   |      |                    ~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |
                                   +--> 'insert_ptr': event 71
                                          |
                                          | 2460 | static void insert_ptr(s=
truct btrfs_trans_handle *trans,
                                          |      |             ^~~~~~~~~~
                                          |      |             |
                                          |      |             (71) entry t=
o 'insert_ptr'
                                          |
                                        'insert_ptr': event 72
                                          |
                                          |include/asm-generic/bug.h:183:35:
                                          |  183 | #define BUG_ON(condition=
) do { if (unlikely(condition)) BUG(); } while (0)
                                          |      |                         =
          ^
                                          |      |                         =
          |
                                          |      |                         =
          (72) following 'false' branch...
   fs/btrfs/ctree.c:2469:9: note: in expansion of macro 'BUG_ON'
                                          | 2469 |         BUG_ON(!path->no=
des[level]);
                                          |      |         ^~~~~~
                                          |
                                        'insert_ptr': event 73
                                          |
                                          | 2472 |         nritems =3D btrf=
s_header_nritems(lower);
                                          |      |                   ^~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                                          |      |                   |
                                          |      |                   (73) .=
..to here
                                          |
                                        'insert_ptr': event 74
                                          |
                                          |include/asm-generic/bug.h:183:35:
                                          |  183 | #define BUG_ON(condition=
) do { if (unlikely(condition)) BUG(); } while (0)
                                          |      |                         =
          ^
                                          |      |                         =
          |
                                          |      |                         =
          (74) following 'false' branch...
   fs/btrfs/ctree.c:2473:9: note: in expansion of macro 'BUG_ON'
                                          | 2473 |         BUG_ON(slot > nr=
items);
                                          |      |         ^~~~~~
                                          |
                                        'insert_ptr': event 75
                                          |
                                          | 2474 |         BUG_ON(nritems =
=3D=3D BTRFS_NODEPTRS_PER_BLOCK(trans->fs_info));
                                          |      |                         =
                           ~~~~~^~~~~~~~~
                                          |      |                         =
                                |
                                          |      |                         =
                                (75) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
                                          |   78 | # define unlikely(x)    =
__builtin_expect(!!(x), 0)
                                          |      |                         =
                    ^
   fs/btrfs/ctree.c:2474:9: note: in expansion of macro 'BUG_ON'
                                          | 2474 |         BUG_ON(nritems =
=3D=3D BTRFS_NODEPTRS_PER_BLOCK(trans->fs_info));
                                          |      |         ^~~~~~
                                          |
                                        'insert_ptr': event 76
                                          |
                                          | 2474 |         BUG_ON(nritems =
=3D=3D BTRFS_NODEPTRS_PER_BLOCK(trans->fs_info));
                                          |      |                         =
                           ~~~~~^~~~~~~~~
                                          |      |                         =
                                |
                                          |      |                         =
                                (76) dereference of NULL 'trans'
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
                                          |   78 | # define unlikely(x)    =
__builtin_expect(!!(x), 0)
                                          |      |                         =
                    ^
   fs/btrfs/ctree.c:2474:9: note: in expansion of macro 'BUG_ON'
                                          | 2474 |         BUG_ON(nritems =
=3D=3D BTRFS_NODEPTRS_PER_BLOCK(trans->fs_info));
                                          |      |         ^~~~~~
                                          |
   In file included from include/linux/bitops.h:32,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from fs/btrfs/ctree.c:6:
   fs/btrfs/ctree.c: In function 'split_node':
>> fs/btrfs/ctree.h:3525:34: warning: dereference of NULL 'trans' [CWE-476]=
 [-Wanalyzer-null-dereference]
    3525 |                         &((trans)->fs_info->fs_state))) {       \
         |                           ~~~~~~~^~~~~~~~~
   arch/arm/include/asm/bitops.h:181:59: note: in definition of macro 'ATOM=
IC_BITOP'
     181 |         (__builtin_constant_p(nr) ? ____atomic_##name(nr, p) : _=
##name(nr,p))
         |                                                           ^
   fs/btrfs/ctree.h:3524:14: note: in expansion of macro 'test_and_set_bit'
    3524 |         if (!test_and_set_bit(BTRFS_FS_STATE_TRANS_ABORTED,     \
         |              ^~~~~~~~~~~~~~~~
   fs/btrfs/ctree.c:2561:17: note: in expansion of macro 'btrfs_abort_trans=
action'
    2561 |                 btrfs_abort_transaction(trans, ret);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
     'btrfs_previous_extent_item': events 1-4
       |
       | 4577 | int btrfs_previous_extent_item(struct btrfs_root *root,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'btrfs_previous_extent_item'
       |......
       | 4586 |                 if (path->slots[0] =3D=3D 0) {
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'true' branch...
       | 4587 |                         ret =3D btrfs_prev_leaf(root, path);
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (3) ...to here
       |      |                               (4) calling 'btrfs_prev_leaf'=
 from 'btrfs_previous_extent_item'
       |
       +--> 'btrfs_prev_leaf': events 5-6
              |
              | 4121 | int btrfs_prev_leaf(struct btrfs_root *root, struct =
btrfs_path *path)
              |      |     ^~~~~~~~~~~~~~~
              |      |     |
              |      |     (5) entry to 'btrfs_prev_leaf'
              |......
              | 4142 |         btrfs_release_path(path);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (6) calling 'btrfs_release_path' from 'btrfs=
_prev_leaf'
              |
              +--> 'btrfs_release_path': event 7
                     |
                     |   97 | noinline void btrfs_release_path(struct btrfs=
_path *p)
                     |      |               ^~~~~~~~~~~~~~~~~~
                     |      |               |
                     |      |               (7) entry to 'btrfs_release_pat=
h'
                     |
                   'btrfs_release_path': events 8-9
                     |
                     |  101 |         for (i =3D 0; i < BTRFS_MAX_LEVEL; i+=
+) {
                     |  102 |                 p->slots[i] =3D 0;
                     |      |                 ~~~~~~~~~~~~~~~
                     |      |                             |
                     |      |                             (9) ...to here
                     |
              <------+
              |
            'btrfs_prev_leaf': events 10-11
              |
              | 4142 |         btrfs_release_path(path);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (10) returning to 'btrfs_prev_leaf' from 'bt=
rfs_release_path'
              | 4143 |         ret =3D btrfs_search_slot(NULL, root, &key, =
path, 0, 0);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
              |      |               |
              |      |               (11) calling 'btrfs_search_slot' from =
'btrfs_prev_leaf'
              |
              +--> 'btrfs_search_slot': event 12
                     |
                     | 1682 | int btrfs_search_slot(struct btrfs_trans_hand=
le *trans, struct btrfs_root *root,
                     |      |     ^~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (12) entry to 'btrfs_search_slot'
                     |
                   'btrfs_search_slot': event 13
                     |
                     |include/asm-generic/bug.h:183:35:
                     |  183 | #define BUG_ON(condition) do { if (unlikely(c=
ondition)) BUG(); } while (0)
                     |      |                                   ^
                     |      |                                   |
                     |      |                                   (13) follow=
ing 'true' branch...
   fs/btrfs/ctree.c:1701:9: note: in expansion of macro 'BUG_ON'
                     | 1701 |         BUG_ON(!cow && ins_len);
                     |      |         ^~~~~~
                     |
                   'btrfs_search_slot': event 14
                     |
                     | 1701 |         BUG_ON(!cow && ins_len);
                     |      |                     ^~
                     |      |                     |
                     |      |                     (14) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
                     |   78 | # define unlikely(x)    __builtin_expect(!!(x=
), 0)
                     |      |                                             ^
   fs/btrfs/ctree.c:1701:9: note: in expansion of macro 'BUG_ON'
                     | 1701 |         BUG_ON(!cow && ins_len);
                     |      |         ^~~~~~
                     |
                   'btrfs_search_slot': event 15

vim +/trans +3525 fs/btrfs/ctree.h

533574c6bc30cf Joe Perches  2012-07-30  3511  =

c0d19e2b9a521b David Sterba 2015-04-24  3512  __cold
49b25e0540904b Jeff Mahoney 2012-03-01  3513  void __btrfs_abort_transactio=
n(struct btrfs_trans_handle *trans,
66642832f06a43 Jeff Mahoney 2016-06-10  3514  			       const char *functio=
n,
acce952b026382 liubo        2011-01-06  3515  			       unsigned int line, =
int errno);
acce952b026382 liubo        2011-01-06  3516  =

c5f4ccb2f77355 Anand Jain   2016-03-16  3517  /*
c5f4ccb2f77355 Anand Jain   2016-03-16  3518   * Call btrfs_abort_transacti=
on as early as possible when an error condition is
c5f4ccb2f77355 Anand Jain   2016-03-16  3519   * detected, that way the exa=
ct line number is reported.
c5f4ccb2f77355 Anand Jain   2016-03-16  3520   */
66642832f06a43 Jeff Mahoney 2016-06-10  3521  #define btrfs_abort_transacti=
on(trans, errno)		\
c5f4ccb2f77355 Anand Jain   2016-03-16  3522  do {								\
c5f4ccb2f77355 Anand Jain   2016-03-16  3523  	/* Report first abort since =
mount */			\
c5f4ccb2f77355 Anand Jain   2016-03-16  3524  	if (!test_and_set_bit(BTRFS_=
FS_STATE_TRANS_ABORTED,	\
66642832f06a43 Jeff Mahoney 2016-06-10 @3525  			&((trans)->fs_info->fs_sta=
te))) {	\
f95ebdbed46a4d Josef Bacik  2020-07-21  3526  		if ((errno) !=3D -EIO && (e=
rrno) !=3D -EROFS) {		\
c5f4ccb2f77355 Anand Jain   2016-03-16  3527  			WARN(1, KERN_DEBUG				\
c5f4ccb2f77355 Anand Jain   2016-03-16  3528  			"BTRFS: Transaction aborte=
d (error %d)\n",	\
c5f4ccb2f77355 Anand Jain   2016-03-16  3529  			(errno));					\
e5d6b12fe14e89 Chris Mason  2016-12-09  3530  		} else {						\
71367b3fa7f562 Jeff Mahoney 2017-02-15  3531  			btrfs_debug((trans)->fs_in=
fo,			\
71367b3fa7f562 Jeff Mahoney 2017-02-15  3532  				    "Transaction aborted =
(error %d)", \
e5d6b12fe14e89 Chris Mason  2016-12-09  3533  				  (errno));			\
e5d6b12fe14e89 Chris Mason  2016-12-09  3534  		}						\
c5f4ccb2f77355 Anand Jain   2016-03-16  3535  	}							\
66642832f06a43 Jeff Mahoney 2016-06-10  3536  	__btrfs_abort_transaction((t=
rans), __func__,		\
c5f4ccb2f77355 Anand Jain   2016-03-16  3537  				  __LINE__, (errno));		\
c5f4ccb2f77355 Anand Jain   2016-03-16  3538  } while (0)
c5f4ccb2f77355 Anand Jain   2016-03-16  3539  =


:::::: The code at line 3525 was first introduced by commit
:::::: 66642832f06a4351e23cea6cf254967c227f8224 btrfs: btrfs_abort_transact=
ion, drop root parameter

:::::: TO: Jeff Mahoney <jeffm@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0715373754686344861==--


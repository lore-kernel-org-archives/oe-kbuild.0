Content-Type: multipart/mixed; boundary="===============3212147889979283136=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' [CWE-476]
Date: Wed, 15 Jun 2022 00:57:10 +0800
Message-ID: <202206150030.Rfx3gcFX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3212147889979283136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' [C=
WE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jchao Sun <sunjunchao2870@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 10e14073107dd0b6d97d9516a02845a8e501c2c9 writeback: Fix inode->i_io=
_list not be protected by inode->i_lock error
date:   8 days ago
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-c001-20220613 (https://download.01.org/0day-ci/arch=
ive/20220615/202206150030.Rfx3gcFX-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D10e14073107dd0b6d97d9516a02845a8e501c2c9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 10e14073107dd0b6d97d9516a02845a8e501c2c9
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/bitops.h:33,
                    from include/linux/kernel.h:22,
                    from fs/fs-writeback.c:17:
   In function 'wb_io_lists_depopulated':
>> arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' =
[CWE-476] [-Wanalyzer-null-dereference]
     207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
         |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
     '__mark_inode_dirty': events 1-4
       |
       |fs/fs-writeback.c:2363:6:
       | 2363 | void __mark_inode_dirty(struct inode *inode, int flags)
       |      |      ^~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to '__mark_inode_dirty'
       |......
       | 2402 |         if (((inode->i_state & flags) =3D=3D flags) ||
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                                    |
       |      |            (2) following 'false' branch...      (3) ...to h=
ere
       | 2403 |             (dirtytime && (inode->i_state & I_DIRTY_INODE)))
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |......
       | 2409 |         if ((inode->i_state & flags) !=3D flags) {
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |
     '__mark_inode_dirty': events 5-8
       |
       | 2410 |                 const int was_dirty =3D inode->i_state & I_=
DIRTY;
       |......
       | 2425 |                 if (!was_dirty) {
       |      |                    ~                                  =

       |      |                    |
       |      |                    (6) following 'false' branch (when 'was_=
dirty !=3D 0')...
       |......
       | 2436 |                 if (inode->i_state & I_SYNC_QUEUED)
       |      |                    ~~~~~~~~~~~~~~~                    =

       |      |                    |     |
       |      |                    |     (7) ...to here
       |      |                    (8) following 'false' branch...
       |
     '__mark_inode_dirty': event 9
       |
       | 2443 |                 if (!S_ISBLK(inode->i_mode)) {
   include/uapi/linux/stat.h:25:28: note: in definition of macro 'S_ISBLK'
       |   25 | #define S_ISBLK(m)      (((m) & S_IFMT) =3D=3D S_IFBLK)
       |      |                            ^
       |
     '__mark_inode_dirty': events 10-16
       |
       |fs/fs-writeback.c:2447:20:
       | 2447 |                 if (inode->i_state & I_FREEING)
       |      |                    ^
       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 2454 |                 if (!was_dirty) {
       |      |                    ~
       |      |                    |
       |      |                    (11) ...to here
       |      |                    (12) following 'true' branch (when 'was_=
dirty =3D=3D 0')...
       |......
       | 2458 |                         inode->dirtied_when =3D jiffies;
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                             |
       |      |                                             (13) ...to here
       |......
       | 2462 |                         if (inode->i_state & I_DIRTY)
       |      |                            ~
       |      |                            |
       |      |                            (14) following 'false' branch...
       |......
       | 2465 |                                 dirty_list =3D &wb->b_dirty=
_time;
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |                                            |
       |      |                                            (15) ...to here
       | 2466 | =

       | 2467 |                         wakeup_bdi =3D inode_io_list_move_l=
ocked(inode, wb,
       |      |                                      ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                                      |
       |      |                                      (16) calling 'inode_io=
_list_move_locked' from '__mark_inode_dirty'
       | 2468 |                                                            =
    dirty_list);
       |      |                                                            =
    ~~~~~~~~~~~
       |
       +--> 'inode_io_list_move_locked': event 17
              |
              |  118 | static bool inode_io_list_move_locked(struct inode *=
inode,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (17) entry to 'inode_io_list_move_locked'
              |
            'inode_io_list_move_locked': event 18
              |
              |include/asm-generic/bug.h:71:35:
              |   71 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (18) following 'fa=
lse' branch (when '______r =3D=3D 0')...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
              |   20 | #define assert_raw_spin_locked(x)       BUG_ON(!raw_=
spin_is_locked(x))
              |      |                                         ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
              |  450 | #define assert_spin_locked(lock)        assert_raw_s=
pin_locked(&(lock)->rlock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~
   fs/fs-writeback.c:122:9: note: in expansion of macro 'assert_spin_locked'
              |  122 |         assert_spin_locked(&wb->list_lock);
              |      |         ^~~~~~~~~~~~~~~~~~
              |
            'inode_io_list_move_locked': event 19
              |
              |include/linux/spinlock_up.h:27:45:
              |   27 | #define arch_spin_is_locked(x)          ((x)->slock =
=3D=3D 0)
              |      |                                          ~~~^~~~~~~
              |      |                                             |
              |      |                                             (19) ...=
to here
   include/linux/compiler.h:33:55: note: in definition of macro '__branch_c=
heck__'
              |   33 |                         ______r =3D __builtin_expect=
(!!(x), expect);      \
              |      |                                                     =
  ^
   include/asm-generic/bug.h:71:36: note: in expansion of macro 'unlikely'
              |   71 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                    ^~~~~~~~
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
              |   20 | #define assert_raw_spin_locked(x)       BUG_ON(!raw_=
spin_is_locked(x))
              |      |                                         ^~~~~~
   include/linux/spinlock.h:114:41: note: in expansion of macro 'arch_spin_=
is_locked'
              |  114 | #define raw_spin_is_locked(lock)        arch_spin_is=
_locked(&(lock)->raw_lock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~
   include/linux/spinlock_api_smp.h:20:49: note: in expansion of macro 'raw=
_spin_is_locked'
              |   20 | #define assert_raw_spin_locked(x)       BUG_ON(!raw_=
spin_is_locked(x))
              |      |                                                 ^~~~=
~~~~~~~~~~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
              |  450 | #define assert_spin_locked(lock)        assert_raw_s=
pin_locked(&(lock)->rlock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
              |  123 |         assert_spin_locked(&inode->i_lock);
              |      |         ^~~~~~~~~~~~~~~~~~
              |
            'inode_io_list_move_locked': event 20
              |
              |include/asm-generic/bug.h:71:35:
              |   71 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (20) following 'fa=
lse' branch (when '______r =3D=3D 0')...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
              |   20 | #define assert_raw_spin_locked(x)       BUG_ON(!raw_=
spin_is_locked(x))
              |      |                                         ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
              |  450 | #define assert_spin_locked(lock)        assert_raw_s=
pin_locked(&(lock)->rlock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
              |  123 |         assert_spin_locked(&inode->i_lock);
              |      |         ^~~~~~~~~~~~~~~~~~
              |
            'inode_io_list_move_locked': events 21-24
              |
              |  125 |         list_move(&inode->i_io_list, head);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (21) ...to here
              |......
              |  128 |         if (head !=3D &wb->b_dirty_time)
              |      |            ~
              |      |            |
              |      |            (22) following 'false' branch...
              |......
              |  131 |         wb_io_lists_depopulated(wb);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (23) ...to here
              |      |         (24) calling 'wb_io_lists_depopulated' from =
'inode_io_list_move_locked'
              |
              +--> 'wb_io_lists_depopulated': event 25
                     |
                     |   98 | static void wb_io_lists_depopulated(struct bd=
i_writeback *wb)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (25) entry to 'wb_io_lists_depopu=
lated'
                     |
                   'wb_io_lists_depopulated': event 26
                     |
                     |arch/x86/include/asm/bitops.h:207:22:
                     |  207 |                 (addr[nr >> _BITOPS_LONG_SHIF=
T])) !=3D 0;
                     |      |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~=
~~~
                     |      |                      |
                     |      |                      (26) dereference of NULL=
 'wb'
                     |
   In function 'wb_io_lists_populated':
>> arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' =
[CWE-476] [-Wanalyzer-null-dereference]
     207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
         |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
     '__mark_inode_dirty': events 1-4
       |
       |fs/fs-writeback.c:2363:6:
       | 2363 | void __mark_inode_dirty(struct inode *inode, int flags)
       |      |      ^~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to '__mark_inode_dirty'
       |......
       | 2402 |         if (((inode->i_state & flags) =3D=3D flags) ||
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |                                    |
       |      |            (2) following 'false' branch...      (3) ...to h=
ere
       | 2403 |             (dirtytime && (inode->i_state & I_DIRTY_INODE)))
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |......
       | 2409 |         if ((inode->i_state & flags) !=3D flags) {
       |      |            ~
       |      |            |
       |      |            (4) following 'true' branch...
       |
     '__mark_inode_dirty': events 5-8
       |
       | 2410 |                 const int was_dirty =3D inode->i_state & I_=
DIRTY;
       |......
       | 2425 |                 if (!was_dirty) {
       |      |                    ~                                  =

       |      |                    |
       |      |                    (6) following 'false' branch (when 'was_=
dirty !=3D 0')...
       |......
       | 2436 |                 if (inode->i_state & I_SYNC_QUEUED)
       |      |                    ~~~~~~~~~~~~~~~                    =

       |      |                    |     |
       |      |                    |     (7) ...to here
       |      |                    (8) following 'false' branch...
       |
     '__mark_inode_dirty': event 9
       |
       | 2443 |                 if (!S_ISBLK(inode->i_mode)) {
   include/uapi/linux/stat.h:25:28: note: in definition of macro 'S_ISBLK'
       |   25 | #define S_ISBLK(m)      (((m) & S_IFMT) =3D=3D S_IFBLK)
       |      |                            ^
       |
     '__mark_inode_dirty': events 10-16
       |
       |fs/fs-writeback.c:2447:20:
       | 2447 |                 if (inode->i_state & I_FREEING)
       |      |                    ^
       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 2454 |                 if (!was_dirty) {
       |      |                    ~
       |      |                    |
       |      |                    (11) ...to here
       |      |                    (12) following 'true' branch (when 'was_=
dirty =3D=3D 0')...
       |......
       | 2458 |                         inode->dirtied_when =3D jiffies;
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                             |
       |      |                                             (13) ...to here
       |......
       | 2462 |                         if (inode->i_state & I_DIRTY)
       |      |                            ~
       |      |                            |
       |      |                            (14) following 'true' branch...
       | 2463 |                                 dirty_list =3D &wb->b_dirty;
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                            |
       |      |                                            (15) ...to here
       |......
       | 2467 |                         wakeup_bdi =3D inode_io_list_move_l=
ocked(inode, wb,
       |      |                                      ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                                      |
       |      |                                      (16) calling 'inode_io=
_list_move_locked' from '__mark_inode_dirty'
       | 2468 |                                                            =
    dirty_list);
       |      |                                                            =
    ~~~~~~~~~~~
       |
       +--> 'inode_io_list_move_locked': event 17
              |
              |  118 | static bool inode_io_list_move_locked(struct inode *=
inode,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (17) entry to 'inode_io_list_move_locked'
              |
            'inode_io_list_move_locked': event 18
              |
              |include/asm-generic/bug.h:71:35:
              |   71 | #define BUG_ON(condition) do { if (unlikely(conditio=
n)) BUG(); } while (0)
              |      |                                   ^
              |      |                                   |
              |      |                                   (18) following 'fa=
lse' branch (when '______r =3D=3D 0')...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
              |   20 | #define assert_raw_spin_locked(x)       BUG_ON(!raw_=
spin_is_locked(x))
              |      |                                         ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
              |  450 | #define assert_spin_locked(lock)        assert_raw_s=
pin_locked(&(lock)->rlock)
              |      |                                         ^~~~~~~~~~~~=
~~~~~~~~~~
   fs/fs-writeback.c:122:9: note: in expansion of macro 'assert_spin_locked'

vim +/wb +207 arch/x86/include/asm/bitops.h

1c54d77078056cd include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-3=
0  203  =

e82587336695f14 arch/x86/include/asm/bitops.h Peter Zijlstra      2020-06-0=
2  204  static __always_inline bool constant_test_bit(long nr, const volati=
le unsigned long *addr)
1c54d77078056cd include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-3=
0  205  {
9b710506a03b01a arch/x86/include/asm/bitops.h H. Peter Anvin      2013-07-1=
6  206  	return ((1UL << (nr & (BITS_PER_LONG-1))) &
9b710506a03b01a arch/x86/include/asm/bitops.h H. Peter Anvin      2013-07-1=
6 @207  		(addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
1c54d77078056cd include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-3=
0  208  }
1c54d77078056cd include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-3=
0  209  =


:::::: The code at line 207 was first introduced by commit
:::::: 9b710506a03b01a9fdd83962912bc9d8237b82e8 x86, bitops: Change bitops =
to be native operand size

:::::: TO: H. Peter Anvin <hpa@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3212147889979283136==--


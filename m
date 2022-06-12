Content-Type: multipart/mixed; boundary="===============8142437179190116446=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' [CWE-476]
Date: Sun, 12 Jun 2022 14:19:27 +0800
Message-ID: <202206121441.AI3fVcUy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8142437179190116446==
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
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 10e14073107dd0b6d97d9516a02845a8e501c2c9 writeback: Fix inode->i_io=
_list not be protected by inode->i_lock error
date:   6 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-c001 (https://download.01.org/0day-ci/archive/202=
20612/202206121441.AI3fVcUy-lkp(a)intel.com/config)
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
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/bitops.h:33,
                    from include/linux/kernel.h:22,
                    from fs/fs-writeback.c:17:
   fs/fs-writeback.c: In function 'wb_io_lists_populated':
>> arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' =
[CWE-476] [-Wanalyzer-null-dereference]
     207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
         |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
     'wb_workfn': events 1-2
       |
       |fs/fs-writeback.c:2205:6:
       | 2205 | void wb_workfn(struct work_struct *work)
       |      |      ^~~~~~~~~
       |      |      |
       |      |      (1) entry to 'wb_workfn'
       |......
       | 2222 |                         pages_written =3D wb_do_writeback(w=
b);
       |      |                                         ~~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (2) calling 'wb_do_=
writeback' from 'wb_workfn'
       |
       +--> 'wb_do_writeback': events 3-4
              |
              | 2174 | static long wb_do_writeback(struct bdi_writeback *wb)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'wb_do_writeback'
              |......
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (4) calling 'get_next_work_it=
em' from 'wb_do_writeback'
              |
              +--> 'get_next_work_item': events 5-6
                     |
                     | 2081 | static struct wb_writeback_work *get_next_wor=
k_item(struct bdi_writeback *wb)
                     |      |                                  ^~~~~~~~~~~~=
~~~~~~
                     |      |                                  |
                     |      |                                  (5) entry to=
 'get_next_work_item'
                     |......
                     | 2086 |         if (!list_empty(&wb->work_list)) {
                     |      |            ~                      =

                     |      |            |
                     |      |            (6) following 'true' branch...
                     |
                   'get_next_work_item': event 7
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (7) ...to here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
                     |  520 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   fs/fs-writeback.c:2087:24: note: in expansion of macro 'list_entry'
                     | 2087 |                 work =3D list_entry(wb->work_=
list.next,
                     |      |                        ^~~~~~~~~~
                     |
              <------+
              |
            'wb_do_writeback': event 8
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (8) returning to 'wb_do_write=
back' from 'get_next_work_item'
              |
            'wb_do_writeback': events 9-11
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              | 2181 |                 trace_writeback_exec(wb, work);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  =

              |      |                 |
              |      |                 (10) ...to here
              | 2182 |                 wrote +=3D wb_writeback(wb, work);
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~ =

              |      |                          |
              |      |                          (11) calling 'wb_writeback'=
 from 'wb_do_writeback'
              |
              +--> 'wb_writeback': events 12-16
                     |
                     | 1988 | static long wb_writeback(struct bdi_writeback=
 *wb,
                     |      |             ^~~~~~~~~~~~
                     |      |             |
                     |      |             (12) entry to 'wb_writeback'
                     |......
                     | 2003 |                 if (work->nr_pages <=3D 0)
                     |      |                    ~
                     |      |                    |
                     |      |                    (13) following 'false' bra=
nch...
                     |......
                     | 2012 |                 if ((work->for_background || =
work->for_kupdate) &&
                     |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
                     |      |                                           |
                     |      |                                           (14=
) ...to here
                     |......
                     | 2029 |                 if (work->for_kupdate) {
                     |      |                    ~
                     |      |                    |
                     |      |                    (15) following 'true' bran=
ch...
                     | 2030 |                         dirtied_before =3D ji=
ffies -
                     |      |                                          ~~~~=
~~~~~
                     |      |                                              =
    |
                     |      |                                              =
    (16) ...to here
                     | 2031 |                                 msecs_to_jiff=
ies(dirty_expire_interval * 10);
--
                                                 +--> 'inode_io_list_move_l=
ocked': event 66
                                                        |
                                                        |  118 | static boo=
l inode_io_list_move_locked(struct inode *inode,
                                                        |      |           =
  ^~~~~~~~~~~~~~~~~~~~~~~~~
                                                        |      |           =
  |
                                                        |      |           =
  (66) entry to 'inode_io_list_move_locked'
                                                        |
                                                      'inode_io_list_move_l=
ocked': event 67
                                                        |
                                                        |include/asm-generi=
c/bug.h:71:35:
                                                        |   71 | #define BU=
G_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                        |      |           =
                        ^
                                                        |      |           =
                        |
                                                        |      |           =
                        (67) following 'false' branch...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                              ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
                                                        |  450 | #define as=
sert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:122:9: note: in expansion of macro 'assert_spin_locked'
                                                        |  122 |         as=
sert_spin_locked(&wb->list_lock);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~
                                                        |
                                                      'inode_io_list_move_l=
ocked': event 68
                                                        |
                                                        |include/linux/spin=
lock_up.h:27:45:
                                                        |   27 | #define ar=
ch_spin_is_locked(x)          ((x)->slock =3D=3D 0)
                                                        |      |           =
                               ~~~^~~~~~~
                                                        |      |           =
                                  |
                                                        |      |           =
                                  (68) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
                                                        |   78 | # define u=
nlikely(x)    __builtin_expect(!!(x), 0)
                                                        |      |           =
                                  ^
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                              ^~~~~~
   include/linux/spinlock.h:114:41: note: in expansion of macro 'arch_spin_=
is_locked'
                                                        |  114 | #define ra=
w_spin_is_locked(lock)        arch_spin_is_locked(&(lock)->raw_lock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_smp.h:20:49: note: in expansion of macro 'raw=
_spin_is_locked'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                                      ^~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
                                                        |  450 | #define as=
sert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
                                                        |  123 |         as=
sert_spin_locked(&inode->i_lock);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~
                                                        |
                                                      'inode_io_list_move_l=
ocked': event 69
                                                        |
                                                        |include/asm-generi=
c/bug.h:71:35:
                                                        |   71 | #define BU=
G_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                        |      |           =
                        ^
                                                        |      |           =
                        |
                                                        |      |           =
                        (69) following 'false' branch...
   include/linux/spinlock_api_smp.h:20:41: note: in expansion of macro 'BUG=
_ON'
                                                        |   20 | #define as=
sert_raw_spin_locked(x)       BUG_ON(!raw_spin_is_locked(x))
                                                        |      |           =
                              ^~~~~~
   include/linux/spinlock.h:450:41: note: in expansion of macro 'assert_raw=
_spin_locked'
                                                        |  450 | #define as=
sert_spin_locked(lock)        assert_raw_spin_locked(&(lock)->rlock)
                                                        |      |           =
                              ^~~~~~~~~~~~~~~~~~~~~~
   fs/fs-writeback.c:123:9: note: in expansion of macro 'assert_spin_locked'
                                                        |  123 |         as=
sert_spin_locked(&inode->i_lock);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~
                                                        |
                                                      'inode_io_list_move_l=
ocked': events 70-73
                                                        |
                                                        |  125 |         li=
st_move(&inode->i_io_list, head);
                                                        |      |         ^~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                        |      |         |
                                                        |      |         (7=
0) ...to here
                                                        |......
                                                        |  128 |         if=
 (head !=3D &wb->b_dirty_time)
                                                        |      |           =
 ~
                                                        |      |           =
 |
                                                        |      |           =
 (71) following 'true' branch...
                                                        |  129 |           =
      return wb_io_lists_populated(wb);
                                                        |      |           =
             ~~~~~~~~~~~~~~~~~~~~~~~~~
                                                        |      |           =
             |
                                                        |      |           =
             (72) ...to here
                                                        |      |           =
             (73) calling 'wb_io_lists_populated' from 'inode_io_list_move_=
locked'
                                                        |
                                                        +--> 'wb_io_lists_p=
opulated': event 74
                                                               |
                                                               |   85 | sta=
tic bool wb_io_lists_populated(struct bdi_writeback *wb)
                                                               |      |    =
         ^~~~~~~~~~~~~~~~~~~~~
                                                               |      |    =
         |
                                                               |      |    =
         (74) entry to 'wb_io_lists_populated'
                                                               |
                                                             'wb_io_lists_p=
opulated': event 75
                                                               |
                                                               |arch/x86/in=
clude/asm/bitops.h:207:22:
                                                               |  207 |    =
             (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
                                                               |      |    =
             ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                               |      |    =
                  |
                                                               |      |    =
                  (75) dereference of NULL 'wb'
                                                               |
   fs/fs-writeback.c: In function 'wb_io_lists_depopulated':
>> arch/x86/include/asm/bitops.h:207:22: warning: dereference of NULL 'wb' =
[CWE-476] [-Wanalyzer-null-dereference]
     207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
         |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
     'wb_workfn': events 1-2
       |
       |fs/fs-writeback.c:2205:6:
       | 2205 | void wb_workfn(struct work_struct *work)
       |      |      ^~~~~~~~~
       |      |      |
       |      |      (1) entry to 'wb_workfn'
       |......
       | 2222 |                         pages_written =3D wb_do_writeback(w=
b);
       |      |                                         ~~~~~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (2) calling 'wb_do_=
writeback' from 'wb_workfn'
       |
       +--> 'wb_do_writeback': events 3-4
              |
              | 2174 | static long wb_do_writeback(struct bdi_writeback *wb)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'wb_do_writeback'
              |......
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (4) calling 'get_next_work_it=
em' from 'wb_do_writeback'
              |
              +--> 'get_next_work_item': events 5-6
                     |
                     | 2081 | static struct wb_writeback_work *get_next_wor=
k_item(struct bdi_writeback *wb)
                     |      |                                  ^~~~~~~~~~~~=
~~~~~~
                     |      |                                  |
                     |      |                                  (5) entry to=
 'get_next_work_item'
                     |......
                     | 2086 |         if (!list_empty(&wb->work_list)) {
                     |      |            ~                      =

                     |      |            |
                     |      |            (6) following 'true' branch...
                     |
                   'get_next_work_item': event 7
                     |
                     |include/linux/container_of.h:18:15:
                     |   18 |         void *__mptr =3D (void *)(ptr);      =
                             \
                     |      |               ^~~~~~
                     |      |               |
                     |      |               (7) ...to here
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
                     |  520 |         container_of(ptr, type, member)
                     |      |         ^~~~~~~~~~~~
   fs/fs-writeback.c:2087:24: note: in expansion of macro 'list_entry'
                     | 2087 |                 work =3D list_entry(wb->work_=
list.next,
                     |      |                        ^~~~~~~~~~
                     |
              <------+
              |
            'wb_do_writeback': event 8
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              |      |                        ^~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (8) returning to 'wb_do_write=
back' from 'get_next_work_item'
              |
            'wb_do_writeback': events 9-11
              |
              | 2180 |         while ((work =3D get_next_work_item(wb)) !=
=3D NULL) {
              | 2181 |                 trace_writeback_exec(wb, work);
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  =

              |      |                 |
              |      |                 (10) ...to here
              | 2182 |                 wrote +=3D wb_writeback(wb, work);
              |      |                          ~~~~~~~~~~~~~~~~~~~~~~ =

              |      |                          |
              |      |                          (11) calling 'wb_writeback'=
 from 'wb_do_writeback'
              |
              +--> 'wb_writeback': events 12-16
                     |
                     | 1988 | static long wb_writeback(struct bdi_writeback=
 *wb,
                     |      |             ^~~~~~~~~~~~
                     |      |             |
                     |      |             (12) entry to 'wb_writeback'
                     |......
                     | 2003 |                 if (work->nr_pages <=3D 0)
                     |      |                    ~
                     |      |                    |
                     |      |                    (13) following 'false' bra=
nch...
                     |......
                     | 2012 |                 if ((work->for_background || =
work->for_kupdate) &&
                     |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
                     |      |                                           |
                     |      |                                           (14=
) ...to here
                     |......
                     | 2029 |                 if (work->for_kupdate) {
                     |      |                    ~
                     |      |                    |
                     |      |                    (15) following 'true' bran=
ch...
                     | 2030 |                         dirtied_before =3D ji=
ffies -
                     |      |                                          ~~~~=
~~~~~
                     |      |                                              =
    |
                     |      |                                              =
    (16) ...to here
                     | 2031 |                                 msecs_to_jiff=
ies(dirty_expire_interval * 10);

vim +/wb +207 arch/x86/include/asm/bitops.h

1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  203  =

e82587336695f1 arch/x86/include/asm/bitops.h Peter Zijlstra      2020-06-02=
  204  static __always_inline bool constant_test_bit(long nr, const volatil=
e unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  205  {
9b710506a03b01 arch/x86/include/asm/bitops.h H. Peter Anvin      2013-07-16=
  206  	return ((1UL << (nr & (BITS_PER_LONG-1))) &
9b710506a03b01 arch/x86/include/asm/bitops.h H. Peter Anvin      2013-07-16=
 @207  		(addr[nr >> _BITOPS_LONG_SHIFT])) !=3D 0;
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  208  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  209  =


:::::: The code at line 207 was first introduced by commit
:::::: 9b710506a03b01a9fdd83962912bc9d8237b82e8 x86, bitops: Change bitops =
to be native operand size

:::::: TO: H. Peter Anvin <hpa@linux.intel.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8142437179190116446==--


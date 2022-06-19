Content-Type: multipart/mixed; boundary="===============6346036456622640381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'wb' [CWE-476]
Date: Mon, 20 Jun 2022 02:20:59 +0800
Message-ID: <202206200149.rz075cwC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6346036456622640381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'wb' [CWE=
-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jchao Sun <sunjunchao2870@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 10e14073107dd0b6d97d9516a02845a8e501c2c9 writeback: Fix inode->i_io=
_list not be protected by inode->i_lock error
date:   13 days ago
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220620/202206200149.rz075cwC-lkp(a)intel.com/config)
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
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/export.h:33,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from fs/fs-writeback.c:17:
   fs/fs-writeback.c: In function 'inode_io_list_move_locked':
>> include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'wb' [C=
WE-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   arch/x86/include/asm/atomic.h:29:16: note: in expansion of macro '__READ=
_ONCE'
      29 |         return __READ_ONCE((v)->counter);
         |                ^~~~~~~~~~~
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
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (18) dereference of NULL 'w=
b'
   arch/x86/include/asm/atomic.h:29:16: note: in expansion of macro '__READ=
_ONCE'
              |   29 |         return __READ_ONCE((v)->counter);
              |      |                ^~~~~~~~~~~
              |

vim +/wb +44 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  28  =

e506ea451254ab Will Deacon 2019-10-15  29  /*
e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit acce=
sses on 32-bit architectures. These will
e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some ca=
ses (namely Armv7 + LPAE), but for others we
e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being spli=
t into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) and =
a strong prevailing wind.
e506ea451254ab Will Deacon 2019-10-15  34   */
e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwonc=
e_type(t)					\
e506ea451254ab Will Deacon 2019-10-15  36  	compiletime_assert(__native_wor=
d(t) || sizeof(t) =3D=3D sizeof(long long),	\
e506ea451254ab Will Deacon 2019-10-15  37  		"Unsupported access size for {=
READ,WRITE}_ONCE().")
e506ea451254ab Will Deacon 2019-10-15  38  =

e506ea451254ab Will Deacon 2019-10-15  39  /*
e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of =
READ_ONCE() if you do not require any
3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this may=
 result in tears!
e506ea451254ab Will Deacon 2019-10-15  42   */
b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const =
volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
e506ea451254ab Will Deacon 2019-10-15  46  =


:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRI=
TE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6346036456622640381==--


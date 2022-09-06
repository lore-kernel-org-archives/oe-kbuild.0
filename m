Content-Type: multipart/mixed; boundary="===============6027222101836887447=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_log.h:91:26: warning: use of uninitialized value 'target' [CWE-457]
Date: Tue, 06 Sep 2022 08:08:56 +0800
Message-ID: <202209060855.Tzp0w3LQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6027222101836887447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/xfs/xfs_log.h:91:26: warning: use of uninitialized value 'target' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Chandan Babu R <chandan.babu@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53e99dcff61e1523ec1c3628b2d564ba15d32eb7
commit: 941fbdfd6dd0f1d7961c28123b5460912f678cb5 xfs: xfs_ail_push_all_sync=
() stalls when racing with updates
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220905 (https://download.01.org/0day-ci/archi=
ve/20220906/202209060855.Tzp0w3LQ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D941fbdfd6dd0f1d7961c28123b5460912f678cb5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 941fbdfd6dd0f1d7961c28123b5460912f678cb5
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from fs/xfs/xfs_trans_ail.c:19:
   fs/xfs/xfs_trans_ail.c: In function 'xfsaild_push':
>> fs/xfs/xfs_log.h:91:26: warning: use of uninitialized value 'target' [CW=
E-457] [-Wanalyzer-use-of-uninitialized-value]
      91 | #define XFS_LSN_CMP(x,y) _lsn_cmp(x,y)
         |                          ^~~~~~~~~~~~~
   fs/xfs/xfs_trans_ail.c:476:17: note: in expansion of macro 'XFS_LSN_CMP'
     476 |         while ((XFS_LSN_CMP(lip->li_lsn, target) <=3D 0)) {
         |                 ^~~~~~~~~~~
     'xfsaild': events 1-2
       |
       |  593 | xfsaild(
       |      | ^~~~~~~
       |      | |
       |      | (1) entry to 'xfsaild'
       |......
       |  604 |                 if (tout && tout <=3D 20)
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'false' branch (when 'tout=
 =3D=3D 0')...
       |
     'xfsaild': event 3
       |
       |arch/arm/include/asm/thread_info.h:104:40:
       |  104 |                 (current_stack_pointer & ~(THREAD_SIZE - 1)=
);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (3) ...to here
       |
     'xfsaild': event 4
       |
       |fs/xfs/xfs_trans_ail.c:617:20:
       |  617 |                 if (kthread_should_stop()) {
       |      |                    ^
       |      |                    |
       |      |                    (4) following 'false' branch...
       |
     'xfsaild': event 5
       |
       |arch/arm/include/asm/thread_info.h:104:40:
       |  104 |                 (current_stack_pointer & ~(THREAD_SIZE - 1)=
);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (5) ...to here
       |
     'xfsaild': event 6
       |
       |fs/xfs/xfs_trans_ail.c:662:20:
       |  662 |                 if (tout)
       |      |                    ^
       |      |                    |
       |      |                    (6) following 'false' branch (when 'tout=
 =3D=3D 0')...
       |
     'xfsaild': event 7
       |
       |arch/arm/include/asm/thread_info.h:104:40:
       |  104 |                 (current_stack_pointer & ~(THREAD_SIZE - 1)=
);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (7) ...to here
       |
     'xfsaild': event 8
       |
       |fs/xfs/xfs_trans_ail.c:669:24:
       |  669 |                 tout =3D xfsaild_push(ailp);
       |      |                        ^~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (8) calling 'xfsaild_push' from 'xfs=
aild'
       |
       +--> 'xfsaild_push': events 9-13
              |
              |   84 |         if (list_empty(&ailp->ail_head))
              |      |                        ~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (12) ...to here
              |......
              |  418 | xfsaild_push(
              |      | ^~~~~~~~~~~~
              |      | |
              |      | (9) entry to 'xfsaild_push'
              |......
              |  425 |         xfs_lsn_t               target;
              |      |                                 ~~~~~~
              |      |                                 |
              |      |                                 (10) region created =
on stack here
              |......
              |  457 |         if (waitqueue_active(&ailp->ail_empty)) {
              |      |            ~
              |      |            |
              |      |            (11) following 'true' branch...
              |......
              |  469 |         lip =3D xfs_trans_ail_cursor_first(ailp, &cu=
r, ailp->ail_last_pushed_lsn);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (13) calling 'xfs_trans_ail_cursor_fir=
st' from 'xfsaild_push'
              |
              +--> 'xfs_trans_ail_cursor_first': event 14
                     |
                     |  231 | xfs_trans_ail_cursor_first(
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (14) entry to 'xfs_trans_ail_cursor_first'
                     |
                   'xfs_trans_ail_cursor_first': event 15

vim +/target +91 fs/xfs/xfs_log.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  90  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @91  #define	XFS_LSN_CMP(x,y) _lsn=
_cmp(x,y)
^1da177e4c3f41 Linus Torvalds 2005-04-16  92  =


:::::: The code at line 91 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6027222101836887447==--


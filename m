Content-Type: multipart/mixed; boundary="===============7257757020829946561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_mount.h:306 xfs_clear_blockgc_enabled() warn: signedness bug returning '(-128)'
Date: Sun, 13 Feb 2022 13:03:57 +0800
Message-ID: <202202131309.HFz0YRvT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7257757020829946561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: 6f6490914d9b712004ddad648e47b1bf22647978 xfs: don't run speculative=
 preallocation gc when fs is frozen
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-m031-20220213 (https://download.01.org/0day-ci/arch=
ive/20220213/202202131309.HFz0YRvT-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_mount.h:306 xfs_clear_blockgc_enabled() warn: signedness bug ret=
urning '(-128)'
fs/xfs/xfs_mount.h:306 xfs_set_blockgc_enabled() warn: signedness bug retur=
ning '(-128)'

Old smatch warnings:
fs/xfs/xfs_icache.c:52 xfs_icwalk_tag() warn: unsigned 'goal' is never less=
 than zero.
fs/xfs/xfs_icache.c:1781 xfs_icwalk() warn: ignoring unreachable code.
fs/xfs/xfs_mount.h:305 xfs_clear_inodegc_enabled() warn: signedness bug ret=
urning '(-128)'
fs/xfs/xfs_mount.h:305 xfs_set_inodegc_enabled() warn: signedness bug retur=
ning '(-128)'

vim +306 fs/xfs/xfs_mount.h

ab23a7768739a2 Dave Chinner    2021-08-06  304  =

ab23a7768739a2 Dave Chinner    2021-08-06  305  __XFS_IS_OPSTATE(inodegc_en=
abled, INODEGC_ENABLED)
6f6490914d9b71 Darrick J. Wong 2021-08-06 @306  __XFS_IS_OPSTATE(blockgc_en=
abled, BLOCKGC_ENABLED)
ab23a7768739a2 Dave Chinner    2021-08-06  307  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7257757020829946561==--


Content-Type: multipart/mixed; boundary="===============3433129898764382975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_mount.h:298 xfs_clear_inodegc_enabled() warn: signedness bug returning '(-128)'
Date: Sun, 13 Feb 2022 10:41:49 +0800
Message-ID: <202202131042.1QvsnkqC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3433129898764382975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: ab23a7768739a23d21d8a16ca37dff96b1ca957a xfs: per-cpu deferred inod=
e inactivation queues
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-m031-20220213 (https://download.01.org/0day-ci/arch=
ive/20220213/202202131042.1QvsnkqC-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/xfs/xfs_mount.h:298 xfs_clear_inodegc_enabled() warn: signedness bug ret=
urning '(-128)'
fs/xfs/xfs_mount.h:298 xfs_set_inodegc_enabled() warn: signedness bug retur=
ning '(-128)'

Old smatch warnings:
fs/xfs/xfs_icache.c:52 xfs_icwalk_tag() warn: unsigned 'goal' is never less=
 than zero.
fs/xfs/xfs_icache.c:1761 xfs_icwalk() warn: ignoring unreachable code.

vim +298 fs/xfs/xfs_mount.h

ab23a7768739a2 Dave Chinner 2021-08-06  297  =

ab23a7768739a2 Dave Chinner 2021-08-06 @298  __XFS_IS_OPSTATE(inodegc_enabl=
ed, INODEGC_ENABLED)
ab23a7768739a2 Dave Chinner 2021-08-06  299  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3433129898764382975==--


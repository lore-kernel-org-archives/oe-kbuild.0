Content-Type: multipart/mixed; boundary="===============7928136726590594272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_mount.h:298 xfs_clear_inodegc_enabled() warn: signedness bug returning '(-128)'
Date: Mon, 14 Feb 2022 07:03:32 +0800
Message-ID: <202202140644.2MUeYVa0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7928136726590594272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: ab23a7768739a23d21d8a16ca37dff96b1ca957a xfs: per-cpu deferred inod=
e inactivation queues
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: m68k-randconfig-m031-20220213 (https://download.01.org/0day-ci/arch=
ive/20220214/202202140644.2MUeYVa0-lkp(a)intel.com/config)
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
--===============7928136726590594272==--


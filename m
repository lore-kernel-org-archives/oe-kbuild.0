Content-Type: multipart/mixed; boundary="===============5181080587478633051=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/xfs_mount.h:306 xfs_clear_blockgc_enabled() warn: signedness bug returning '(-128)'
Date: Sun, 07 Aug 2022 04:39:48 +0800
Message-ID: <202208070445.JvqIRXeU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5181080587478633051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 6f6490914d9b712004ddad648e47b1bf22647978 xfs: don't run speculative=
 preallocation gc when fs is frozen
date:   12 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 12 months ago
config: m68k-randconfig-m041-20220804 (https://download.01.org/0day-ci/arch=
ive/20220807/202208070445.JvqIRXeU-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
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

ab23a7768739a23 Dave Chinner    2021-08-06  304  =

ab23a7768739a23 Dave Chinner    2021-08-06  305  __XFS_IS_OPSTATE(inodegc_e=
nabled, INODEGC_ENABLED)
6f6490914d9b712 Darrick J. Wong 2021-08-06 @306  __XFS_IS_OPSTATE(blockgc_e=
nabled, BLOCKGC_ENABLED)
ab23a7768739a23 Dave Chinner    2021-08-06  307  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5181080587478633051==--


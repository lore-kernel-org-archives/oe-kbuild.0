Content-Type: multipart/mixed; boundary="===============7039196894105902574=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 161/315] fs/xfs/libxfs/xfs_dir2.c: xfs_shared.h is included more than once.
Date: Mon, 14 Jun 2021 14:33:45 +0800
Message-ID: <202106141436.jSzcZGfT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7039196894105902574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: linux-xfs(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   e907b5eb3852612685b26c1aa94707544d45ced0
commit: 17feb8543d13d5040e45afd4afd91754062b94b8 [161/315] xfs: create libx=
fs helper to link a new inode into a directory
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_dir2.c: xfs_shared.h is included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7039196894105902574==--


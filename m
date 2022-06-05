Content-Type: multipart/mixed; boundary="===============2262411758083674564=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 400/401] fs/xfs/scrub/common.c: xfs_error.h is included more than once.
Date: Sun, 05 Jun 2022 10:31:56 +0800
Message-ID: <202206051006.4cBusqK0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2262411758083674564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: 60a7b8293025b5632f4851f892710630c79f6174 [400/401] xfs: whine to dm=
esg when we encounter errors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/common.c: xfs_error.h is included more than once.
--
>> fs/xfs/scrub/btree.c: xfs_inode.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2262411758083674564==--


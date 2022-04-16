Content-Type: multipart/mixed; boundary="===============2261685938034317490=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 395/396] fs/xfs/scrub/common.c: xfs_error.h is included more than once.
Date: Sat, 16 Apr 2022 16:34:22 +0800
Message-ID: <202204161611.8UohXrrB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2261685938034317490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   bd756ef7af68274b79308166ee64949d288be861
commit: 6e69be9b297b14bea1ec717711977990d7ab705f [395/396] xfs: whine to dm=
esg when we encounter errors
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/common.c: xfs_error.h is included more than once.
--
>> fs/xfs/scrub/btree.c: xfs_inode.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2261685938034317490==--


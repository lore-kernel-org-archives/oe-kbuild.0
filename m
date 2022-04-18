Content-Type: multipart/mixed; boundary="===============2070546995005744611=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 213/396] fs/xfs/scrub/tempfile.c: xfs_swapext.h is included more than once.
Date: Mon, 18 Apr 2022 12:10:48 +0800
Message-ID: <202204181219.06eeZ4QW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2070546995005744611==
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
commit: 6afd53176c5009c110bef144253a84294ab77272 [213/396] xfs: repair exte=
nded attributes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/tempfile.c: xfs_swapext.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2070546995005744611==--


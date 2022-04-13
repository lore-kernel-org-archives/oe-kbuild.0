Content-Type: multipart/mixed; boundary="===============5349751462493894619=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 194/396] fs/xfs/xfs_xchgrange.c:188:11-12: WARNING opportunity for max()
Date: Wed, 13 Apr 2022 16:47:53 +0800
Message-ID: <202204131616.aL0AP4y5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5349751462493894619==
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
commit: 891c7be4c3972763fb1566587858223ff2019f81 [194/396] xfs: add a ->xch=
g_file_range handler
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
413/202204131616.aL0AP4y5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:188:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:189:11-12: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5349751462493894619==--


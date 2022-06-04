Content-Type: multipart/mixed; boundary="===============5693398281995049732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 199/401] fs/xfs/xfs_xchgrange.c:188:11-12: WARNING opportunity for max()
Date: Sun, 05 Jun 2022 00:58:15 +0800
Message-ID: <202206050035.XMtuknxW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5693398281995049732==
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
head:   1fcd9cea011a657d62ee332d161966c1ec92ffd5
commit: dc98c6fbde756f897c44e3dd35ec541b09b86458 [199/401] xfs: add a ->xch=
g_file_range handler
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
605/202206050035.XMtuknxW-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:188:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:189:11-12: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5693398281995049732==--


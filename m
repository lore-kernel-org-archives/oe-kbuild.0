Content-Type: multipart/mixed; boundary="===============7832626259537461641=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 230/436] fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
Date: Wed, 10 Aug 2022 00:24:35 +0800
Message-ID: <202208100026.Q3Wtijta-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7832626259537461641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   86a823e6ac8710f71c368b395e2909bc1edcb1f0
commit: 0a5688dfd50539235dd4c09ad79574e2f8f6a7e1 [230/436] xfs: add a ->xch=
g_file_range handler
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c034-20220808 (https://download.01.org/0day-ci/arch=
ive/20220810/202208100026.Q3Wtijta-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:187:11-12: WARNING opportunity for max()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7832626259537461641==--


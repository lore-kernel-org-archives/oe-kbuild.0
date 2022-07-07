Content-Type: multipart/mixed; boundary="===============8697497646596268227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 165/368] fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
Date: Thu, 07 Jul 2022 16:16:54 +0800
Message-ID: <202207071643.wmGLFr6B-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8697497646596268227==
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
head:   569bd1ce4bb5c53a1b892fbe6d99693bf637063b
commit: c9ee497ae3e4060a32f3bee5622ead4223638ba4 [165/368] xfs: add a ->xch=
g_file_range handler
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: nios2-randconfig-c023-20220706 (https://download.01.org/0day-ci/arc=
hive/20220707/202207071643.wmGLFr6B-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:187:11-12: WARNING opportunity for max()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8697497646596268227==--


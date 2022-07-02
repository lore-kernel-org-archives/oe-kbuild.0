Content-Type: multipart/mixed; boundary="===============8879715647982182101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 367/368] fs/xfs/scrub/btree.c: xfs_inode.h is included more than once.
Date: Sat, 02 Jul 2022 10:54:22 +0800
Message-ID: <202207021025.BquRBDkn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8879715647982182101==
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
head:   569bd1ce4bb5c53a1b892fbe6d99693bf637063b
commit: 04521e98b7760df934b9b688de3e4bbd93a2f6a9 [367/368] xfs: whine to dm=
esg when we encounter errors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/btree.c: xfs_inode.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8879715647982182101==--


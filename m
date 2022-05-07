Content-Type: multipart/mixed; boundary="===============5890043322508602781=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:xfs-5.19-compose_pptrs 32/32] fs/xfs/xfs_parent_utils.c: xfs_da_btree.h is included more than once.
Date: Sun, 08 May 2022 06:06:25 +0800
Message-ID: <202205080555.qIhiigog-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5890043322508602781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>

tree:   https://github.com/allisonhenderson/xfs_work.git xfs-5.19-compose_p=
ptrs
head:   74ecccf0e89a132c2490f3a63661c535974c6a08
commit: 74ecccf0e89a132c2490f3a63661c535974c6a08 [32/32] xfs: Add parent po=
inter ioctl
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_parent_utils.c: xfs_da_btree.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5890043322508602781==--


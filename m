Content-Type: multipart/mixed; boundary="===============2506583873414045992=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [allisonhenderson-xfs-work:xfs-5.19-compose_pptrs 25/32] fs/xfs/libxfs/xfs_parent.c: xfs_da_btree.h is included more than once.
Date: Sat, 07 May 2022 14:03:44 +0800
Message-ID: <202205071459.Yb3gGFZU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2506583873414045992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allison Henderson <allison.henderson@oracle.com>
CC: Dave Chinner <dchinner@redhat.com>

tree:   https://github.com/allisonhenderson/xfs_work.git xfs-5.19-compose_p=
ptrs
head:   74ecccf0e89a132c2490f3a63661c535974c6a08
commit: 7a5d447970de2d3b003b9015e2bce3bf0d15e3db [25/32] xfs: parent pointe=
r attribute creation
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_parent.c: xfs_da_btree.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2506583873414045992==--


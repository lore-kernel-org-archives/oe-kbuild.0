Content-Type: multipart/mixed; boundary="===============3107579969251273331=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dgc-xfs:xfs-5.19-compose 48/86] fs/xfs/libxfs/xfs_attr.c: xfs_attr.h is included more than once.
Date: Sun, 17 Apr 2022 01:41:42 +0800
Message-ID: <202204170156.zfVwLhJD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3107579969251273331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Dave Chinner <david@fromorbit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git x=
fs-5.19-compose
head:   94f0889f7a0ffa0376c59381537cb14fdd0cc3c5
commit: 2168987159e7c067600258a743e21bc2eb772611 [48/86] xfs: Add xfs_attr_=
set_deferred and xfs_attr_remove_deferred
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_attr.c: xfs_attr.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3107579969251273331==--


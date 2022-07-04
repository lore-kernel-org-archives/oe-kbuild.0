Content-Type: multipart/mixed; boundary="===============5966393707093362768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: htmldocs: Documentation/filesystems/ext4/blockmap.rst:3: WARNING: Malformed table.
Date: Tue, 05 Jul 2022 06:01:49 +0800
Message-ID: <202207050619.COGgejv5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5966393707093362768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wang Jianjian <wangjianjian3@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: linux-doc(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c1084b6c5620a743f86947caca66d90f24060f56
commit: 3103084afcf2341e12b0ee2c7b2ed570164f44a2 ext4, doc: remove unnecess=
ary escaping
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/ext4/blockmap.rst:3: WARNING: Malformed table.
>> Documentation/filesystems/ext4/dynamic.rst:5: WARNING: Malformed table.
>> Documentation/filesystems/ext4/ifork.rst:5: WARNING: Malformed table.

vim +3 Documentation/filesystems/ext4/blockmap.rst

b4becd48b7b548f Documentation/filesystems/ext4/ondisk/blockmap.rst Darrick =
J. Wong 2018-07-29  2  =

b4becd48b7b548f Documentation/filesystems/ext4/ondisk/blockmap.rst Darrick =
J. Wong 2018-07-29 @3  +---------------------+-----------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------------------------------+

:::::: The code at line 3 was first introduced by commit
:::::: b4becd48b7b548f564533a41e1cdeb8ae3bd1c70 ext4: import inode data for=
k chapter from wiki page

:::::: TO: Darrick J. Wong <darrick.wong@oracle.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5966393707093362768==--


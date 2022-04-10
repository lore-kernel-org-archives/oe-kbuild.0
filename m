Content-Type: multipart/mixed; boundary="===============3802747917649363157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-4.19 50/303] block/blk-merge.c: linux/blkdev.h is included more than once.
Date: Sun, 10 Apr 2022 13:06:35 +0800
Message-ID: <202204101345.Mp1l4XB2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3802747917649363157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-4.19
head:   a5603c7a34e01797b8b11850e7bd77693b0a1abf
commit: 84aa9627dfaf682108d14298804b505d6bd93ed8 [50/303] block: don't merg=
e across cgroup boundaries if blkcg is enabled
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> block/blk-merge.c: linux/blkdev.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3802747917649363157==--


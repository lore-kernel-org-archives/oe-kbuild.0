Content-Type: multipart/mixed; boundary="===============2360414210002172999=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.4 65/424] include/linux/blk-cgroup.h: linux/blkdev.h is included more than once.
Date: Sun, 10 Apr 2022 16:09:13 +0800
Message-ID: <202204101525.DvKPI2hU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2360414210002172999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.4
head:   c865d6ef8346c0ae1ada0e9444202ffd6aae51a1
commit: 31a5e86ab6cc2115d93b89217e9709de03b079e8 [65/424] block: don't merg=
e across cgroup boundaries if blkcg is enabled
:::::: branch date: 8 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/blkdev.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2360414210002172999==--


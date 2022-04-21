Content-Type: multipart/mixed; boundary="===============8106103221308245702=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [colyli-bcache:journal-deadlock 3/3] drivers/md/bcache/journal.c:1021:1-10: second lock on line 1060
Date: Thu, 21 Apr 2022 20:31:04 +0800
Message-ID: <202204212055.x14m39Id-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8106103221308245702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Coly Li <colyli@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache=
.git journal-deadlock
head:   3b8b66931ac5737b91909363154ba00381252783
commit: 3b8b66931ac5737b91909363154ba00381252783 [3/3] bcache: avoid journa=
l deadlock by non-space of journal buckets
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: xtensa-randconfig-c023-20220420 (https://download.01.org/0day-ci/ar=
chive/20220421/202204212055.x14m39Id-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/md/bcache/journal.c:1021:1-10: second lock on line 1060
   drivers/md/bcache/journal.c:1060:2-11: second lock on line 1060
--
>> drivers/md/bcache/journal.c:1159:21-22: WARNING opportunity for min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8106103221308245702==--


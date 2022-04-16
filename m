Content-Type: multipart/mixed; boundary="===============1693743276837275196=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 161/257] mm/vmscan.c:3357:14-15: WARNING opportunity for max()
Date: Sat, 16 Apr 2022 11:09:15 +0800
Message-ID: <202204161153.lvSHCqIq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1693743276837275196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   e95841addbcb7f18df08f24940d4dadbff8a7ee6
commit: 49abaa5fc0a037958c119253b7e1ae32f05cadae [161/257] mm: multi-gen LR=
U: minimal implementation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
416/202204161153.lvSHCqIq-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/vmscan.c:3357:14-15: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1693743276837275196==--


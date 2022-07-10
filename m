Content-Type: multipart/mixed; boundary="===============8169464651014570932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6631/8914] mm/shrinker_debug.c:122:17-18: WARNING opportunity for min()
Date: Sun, 10 Jul 2022 09:43:18 +0800
Message-ID: <202207100936.AsEBHjqp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8169464651014570932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f2528c29385819a84480cacef4886b049761e2c5
commit: bbf535fd6f06b94b9d07ed6f09397a936d4a58d8 [6631/8914] mm: shrinkers:=
 add scan interface for shrinker debugfs
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
710/202207100936.AsEBHjqp-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/shrinker_debug.c:122:17-18: WARNING opportunity for min()
--
>> mm/shrinker_debug.c:105:8-24: WARNING: shrinker_debugfs_scan_fops: .writ=
e() has stream semantic; safe to change nonseekable_open -> stream_open.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8169464651014570932==--


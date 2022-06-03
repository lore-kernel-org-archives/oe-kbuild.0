Content-Type: multipart/mixed; boundary="===============2184878039891133479=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rgushchin:shrinker.5 7/9] mm/shrinker_debug.c:120:21-22: WARNING opportunity for min()
Date: Fri, 03 Jun 2022 21:11:34 +0800
Message-ID: <202206032155.W0MZ4A1a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2184878039891133479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git shrinker.5
head:   be0b94668aac83e3bc04f73b06ad0b309bd51477
commit: 44d87615ffe3c376b23b6087b0b1fa02a3f86b62 [7/9] mm: shrinkers: add s=
can interface for shrinker debugfs
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20603/202206032155.W0MZ4A1a-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/shrinker_debug.c:120:21-22: WARNING opportunity for min()
--
>> mm/shrinker_debug.c:105:8-24: WARNING: shrinker_debugfs_scan_fops: .writ=
e() has stream semantic; safe to change nonseekable_open -> stream_open.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2184878039891133479==--


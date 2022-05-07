Content-Type: multipart/mixed; boundary="===============5764766125500516729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rgushchin:shrinker.3 7/7] mm/shrinker_debug.c:122:21-22: WARNING opportunity for min()
Date: Sat, 07 May 2022 16:46:17 +0800
Message-ID: <202205071632.qT7zlJoE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5764766125500516729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Roman Gushchin <guro@fb.com>

tree:   https://github.com/rgushchin/linux.git shrinker.3
head:   12f77aac7ef21be765e90bb8e0b611e6b9085256
commit: 12f77aac7ef21be765e90bb8e0b611e6b9085256 [7/7] mm: shrinkers: add s=
can interface for shrinker debugfs
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20507/202205071632.qT7zlJoE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/shrinker_debug.c:122:21-22: WARNING opportunity for min()
--
>> mm/shrinker_debug.c:107:8-24: WARNING: shrinker_debugfs_scan_fops: .writ=
e() has stream semantic; safe to change nonseekable_open -> stream_open.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5764766125500516729==--


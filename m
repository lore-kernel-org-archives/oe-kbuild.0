Content-Type: multipart/mixed; boundary="===============2748495908821982691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 6/19] mm/vmscan.c:3268:14-15: WARNING opportunity for max()
Date: Thu, 23 Jun 2022 07:33:26 +0800
Message-ID: <202206230702.VM9WZtOQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2748495908821982691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   96f47dce39cbeca32c76a3ef784ab4b72100215e
commit: a1537a68c5010553002f62fad91c7c0c886c73d8 [6/19] FROMLIST: mm: multi=
-gen LRU: minimal implementation
:::::: branch date: 4 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20623/202206230702.VM9WZtOQ-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/vmscan.c:3268:14-15: WARNING opportunity for max()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2748495908821982691==--


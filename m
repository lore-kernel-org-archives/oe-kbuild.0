Content-Type: multipart/mixed; boundary="===============1219342695071764308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 6/19] mm/vmscan.c:3268:14-15: WARNING opportunity for max()
Date: Fri, 03 Jun 2022 12:44:10 +0800
Message-ID: <202206031204.MSQ7CcYS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1219342695071764308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   78d6de78638b6cf7771a98628648f8b29f6d8cab
commit: a1537a68c5010553002f62fad91c7c0c886c73d8 [6/19] FROMLIST: mm: multi=
-gen LRU: minimal implementation
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20603/202206031204.MSQ7CcYS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> mm/vmscan.c:3268:14-15: WARNING opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1219342695071764308==--


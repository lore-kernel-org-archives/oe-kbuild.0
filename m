Content-Type: multipart/mixed; boundary="===============6075533169287114681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15 6/19] mm/vmscan.c:3268:14-15: WARNING opportunity for max()
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207242355.yRiS7QFl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6075533169287114681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   9c6d1cf9ffb9ef5112bc3bf943bb31b1023155af
commit: a1537a68c5010553002f62fad91c7c0c886c73d8 [6/19] FROMLIST: mm: multi=
-gen LRU: minimal implementation
:::::: branch date: 3 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c034-20220718 (https://download.01.org/0day-ci/archi=
ve/20220724/202207242355.yRiS7QFl-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> mm/vmscan.c:3268:14-15: WARNING opportunity for max()

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6075533169287114681==--


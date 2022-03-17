Content-Type: multipart/mixed; boundary="===============0869533492796949838=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9448/13392] drivers/net/ethernet/intel/ice/ice_gnss.c:79:26-27: WARNING opportunity for min()
Date: Thu, 17 Mar 2022 20:58:02 +0800
Message-ID: <202203172024.e1x75mdU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0869533492796949838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Karol Kolacinski <karol.kolacinski@intel.com>
CC: Sudhansu Sekhar Mishra <sudhansu.mishra@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: 43113ff73453c231af2c8e700cb4ff8bca97cff6 [9448/13392] ice: add TTY =
for GNSS module for E810T device
:::::: branch date: 26 hours ago
:::::: commit date: 2 weeks ago
config: s390-randconfig-c004-20220316 (https://download.01.org/0day-ci/arch=
ive/20220317/202203172024.e1x75mdU-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_gnss.c:79:26-27: WARNING opportunity =
for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0869533492796949838==--


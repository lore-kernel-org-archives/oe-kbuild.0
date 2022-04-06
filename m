Content-Type: multipart/mixed; boundary="===============0100209488199669479=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath9k/ar9003_phy.c:1829:19-21: WARNING opportunity for min()
Date: Wed, 06 Apr 2022 17:00:41 +0800
Message-ID: <202204061643.FyGA9V7U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0100209488199669479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-c003-20220405 (https://download.01.org/0day-ci/arch=
ive/20220406/202204061643.FyGA9V7U-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath9k/ar9003_phy.c:1829:19-21: WARNING opportun=
ity for min()
--
>> drivers/net/wireless/ath/ath11k/wmi.c:584:22-23: WARNING opportunity for=
 min()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0100209488199669479==--


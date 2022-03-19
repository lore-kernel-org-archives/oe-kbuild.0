Content-Type: multipart/mixed; boundary="===============8406822950255990938=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/think-lmi.c:284:32-33: WARNING opportunity for min()
Date: Sat, 19 Mar 2022 10:06:00 +0800
Message-ID: <202203191041.Dl4T8N0m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8406822950255990938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Pearson <markpearson@lenovo.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: 640a5fa50a42b99bfa2a0ec51b4ea9591d9bd055 platform/x86: think-lmi: O=
pcode support
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20319/202203191041.Dl4T8N0m-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/think-lmi.c:284:32-33: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8406822950255990938==--


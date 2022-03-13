Content-Type: multipart/mixed; boundary="===============2562820364566499741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/hda_codec.c:337:19-20: WARNING opportunity for min()
Date: Sun, 13 Mar 2022 08:39:00 +0800
Message-ID: <202203130825.G71b7lNN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2562820364566499741==
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
head:   aad611a868d16cdc16a7d4a764cef955293e47e3
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/2022031=
3/202203130825.G71b7lNN-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/pci/hda/hda_codec.c:337:19-20: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2562820364566499741==--


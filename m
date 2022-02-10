Content-Type: multipart/mixed; boundary="===============2688860948804006282=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/hda_codec.c:337:19-20: WARNING opportunity for min()
Date: Thu, 10 Feb 2022 09:21:41 +0800
Message-ID: <202202100903.nC4ASJ41-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2688860948804006282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f4bc5bbb5fef3cf421ba3485d6d383c27ec473ed
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: s390-randconfig-c023-20220209 (https://download.01.org/0day-ci/arch=
ive/20220210/202202100903.nC4ASJ41-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> sound/pci/hda/hda_codec.c:337:19-20: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2688860948804006282==--


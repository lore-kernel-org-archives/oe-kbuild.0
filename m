Content-Type: multipart/mixed; boundary="===============2285170423954822207=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/irq/affinity.c:399:12-13: WARNING opportunity for min()
Date: Thu, 24 Feb 2022 13:56:09 +0800
Message-ID: <202202241330.RWDVbpDh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2285170423954822207==
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
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c002-20220221 (https://download.01.org/0day-ci/ar=
chive/20220224/202202241330.RWDVbpDh-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/irq/affinity.c:399:12-13: WARNING opportunity for min()
--
>> kernel/audit.c:1512:12-13: WARNING opportunity for min()
--
>> kernel/time/clockevents.c:75:12-13: WARNING opportunity for max()
--
>> kernel/time/tick-sched.c:772:23-24: WARNING opportunity for min()
--
>> kernel/trace/trace.c:8100:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2285170423954822207==--


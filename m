Content-Type: multipart/mixed; boundary="===============0541209865397700912=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-raid.c:3218:44-45: WARNING opportunity for min()
Date: Thu, 10 Feb 2022 08:10:19 +0800
Message-ID: <202202100816.5Jt28svt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0541209865397700912==
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
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220210/202202100816.5Jt28svt-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-raid.c:3218:44-45: WARNING opportunity for min()
--
>> drivers/gpu/drm/i915/gem/i915_gem_throttle.c:99:12-13: WARNING opportuni=
ty for min()
--
>> drivers/gpu/drm/i915/gem/i915_gem_wait.c:199:16-17: WARNING opportunity =
for min()
--
>> virt/kvm/kvm_main.c:4589:10-11: WARNING opportunity for min()
   virt/kvm/kvm_main.c:4518:10-11: WARNING opportunity for min()
--
>> drivers/gpu/drm/i915/display/vlv_dsi_pll.c:393:16-17: WARNING opportunit=
y for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0541209865397700912==--


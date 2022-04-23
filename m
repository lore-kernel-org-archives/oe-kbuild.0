Content-Type: multipart/mixed; boundary="===============1298371421782581837=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-raid.c:3218:44-45: WARNING opportunity for min()
Date: Sun, 24 Apr 2022 06:58:03 +0800
Message-ID: <202204240603.mungoSE5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1298371421782581837==
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
head:   c00c5e1d157bec0ef0b0b59aa5482eb8dc7e8e49
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 12 months ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220424/202204240603.mungoSE5-lkp(a)intel.com/config)
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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1298371421782581837==--


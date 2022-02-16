Content-Type: multipart/mixed; boundary="===============0178041845894655555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/acpi/device_pm.c:661:15-16: WARNING opportunity for max()
Date: Wed, 16 Feb 2022 21:26:54 +0800
Message-ID: <202202162112.MZ4DRKk2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0178041845894655555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5d9ae265b105d9a67575fb67bd4650a6fc08e25
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c022-20220214 (https://download.01.org/0day-ci/ar=
chive/20220216/202202162112.MZ4DRKk2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/device_pm.c:661:15-16: WARNING opportunity for max()
--
>> drivers/gpu/drm/drm_atomic_helper.c:1988:12-13: WARNING opportunity for =
min()
--
>> drivers/gpu/drm/drm_auth.c:81:12-13: WARNING opportunity for min()
--
>> drivers/gpu/drm/drm_bufs.c:740:33-34: WARNING opportunity for max()
   drivers/gpu/drm/drm_bufs.c:917:33-34: WARNING opportunity for max()
   drivers/gpu/drm/drm_bufs.c:1115:33-34: WARNING opportunity for max()
--
>> drivers/gpu/drm/drm_mode_object.c:64:12-13: WARNING opportunity for min()
--
>> drivers/acpi/acpica/exserial.c:328:30-31: WARNING opportunity for min()
--
>> fs/fuse/file.c:2862:28-29: WARNING opportunity for min()
   fs/fuse/file.c:1425:12-13: WARNING opportunity for min()
   fs/fuse/file.c:948:12-13: WARNING opportunity for min()
--
>> arch/x86/kernel/apic/ipi.c:329:14-16: WARNING opportunity for max()
--
>> drivers/gpu/drm/i2c/tda9950.c:95:12-13: WARNING opportunity for min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0178041845894655555==--


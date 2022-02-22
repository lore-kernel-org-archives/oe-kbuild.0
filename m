Content-Type: multipart/mixed; boundary="===============7044191116366034234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_bufs.c:740:33-34: WARNING opportunity for max()
Date: Wed, 23 Feb 2022 03:56:19 +0800
Message-ID: <202202230332.kEB4LBR9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7044191116366034234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   917bbdb107f8767cb78f24e7d6725a2f93b9effe
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   10 months ago
:::::: branch date: 80 minutes ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c004-20220221 (https://download.01.org/0day-ci/ar=
chive/20220223/202202230332.kEB4LBR9-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_bufs.c:740:33-34: WARNING opportunity for max()
   drivers/gpu/drm/drm_bufs.c:917:33-34: WARNING opportunity for max()
   drivers/gpu/drm/drm_bufs.c:1115:33-34: WARNING opportunity for max()
--
>> drivers/hid/hid-sony.c:1011:24-26: WARNING opportunity for min()
--
>> drivers/gpu/drm/r128/r128_state.c:53:19-20: WARNING opportunity for min()
--
>> drivers/gpu/drm/savage/savage_state.c:267:26-27: WARNING opportunity for=
 min()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7044191116366034234==--


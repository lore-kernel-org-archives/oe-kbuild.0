Content-Type: multipart/mixed; boundary="===============3691782739345323589=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:348:85-86: WARNING opportunity for max()
Date: Sat, 16 Apr 2022 00:02:18 +0800
Message-ID: <202204152331.CNYw6vJn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3691782739345323589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

Hi Denis,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minm=
ax script
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: parisc-randconfig-c024-20220414 (https://download.01.org/0day-ci/ar=
chive/20220415/202204152331.CNYw6vJn-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:348:85-86: WARNING=
 opportunity for max()
   drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c:351:52-53: WARNING=
 opportunity for max()

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3691782739345323589==--


Content-Type: multipart/mixed; boundary="===============2792179198778508240=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:141:14-16: WARNING opportunity for min()
Date: Sat, 09 Apr 2022 03:18:12 +0800
Message-ID: <202204090334.JC5H5iNS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2792179198778508240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1831fed559732b132aef0ea8261ac77e73f7eadf
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-c004-20220408 (https://download.01.org/0day-ci/archi=
ve/20220409/202204090334.JC5H5iNS-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c:141:14-16: WARNING opportunity =
for min()
--
>> drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c:24:5-8: Unneeded variable: "ret=
". Return "0" on line 75

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2792179198778508240==--


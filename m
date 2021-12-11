Content-Type: multipart/mixed; boundary="===============7647527494858073130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 56/90] drivers/gpu/drm/mediatek/mtk_dp.c:2939:2-9: line 2939 is redundant because platform_get_irq() already prints an error
Date: Sat, 11 Dec 2021 08:21:07 +0800
Message-ID: <202112110846.YaHSfBov-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7647527494858073130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   3246f4ed0d71058d829b29bccc2454d305bec8ea
commit: 9fc1f39630d4af841f63428a2cc6cdf6834c1865 [56/90] BACKPORT: FROMLIST=
: drm/mediatek: Add mt8195 DisplayPort driver
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-c004-20211210 (https://download.01.org/0day-ci/arc=
hive/20211211/202112110846.YaHSfBov-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_dp.c:2939:2-9: line 2939 is redundant becau=
se platform_get_irq() already prints an error
--
>> drivers/gpu/drm/mediatek/mtk_dp.c:2165:5-8: Unneeded variable: "ret". Re=
turn "0" on line 2204
--
>> drivers/gpu/drm/mediatek/mtk_dp.c:1980:2-3: Unneeded semicolon
   drivers/gpu/drm/mediatek/mtk_dp.c:2014:4-5: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7647527494858073130==--


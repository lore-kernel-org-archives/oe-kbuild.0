Content-Type: multipart/mixed; boundary="===============8398487914960061831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jsarha:topic/chromeos-4.19-s0ix 9299/9999] drivers/gpu/drm/vgem/vgem_drv.c:306:5-11: inconsistent IS_ERR and PTR_ERR on line 308.
Date: Sat, 14 May 2022 11:19:21 +0800
Message-ID: <202205141135.Pgfrz4Ks-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8398487914960061831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rob Clark <robdclark@chromium.org>
CC: "St=C3=A9phane Marchesin" <marcheu@chromium.org>

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: f445c72f5d8277569bf2d5e20df38153c9141b7d [9299/9999] CHROMIUM: drm/=
vgem: fix cache synchronization on arm/arm64 (take two)
:::::: branch date: 2 years, 7 months ago
:::::: commit date: 2 years, 8 months ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20514/202205141135.Pgfrz4Ks-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vgem/vgem_drv.c:306:5-11: inconsistent IS_ERR and PTR_ER=
R on line 308.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8398487914960061831==--


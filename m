Content-Type: multipart/mixed; boundary="===============2011160157414881601=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 28714/30000] drivers/gpu/drm/i915/selftests/mock_region.c: drm/ttm/ttm_placement.h is included more than once.
Date: Mon, 04 Jul 2022 08:29:22 +0800
Message-ID: <202207040824.Wdifqq40-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2011160157414881601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   a4277e45db75b9219f1ebcf42b5973d7f959b0ad
commit: 1b78cedfe52020dc40325bec62cd7c7ea0278326 [28714/30000] BACKPORT: dr=
m/i915/ttm: switch over to ttm_buddy_man
:::::: branch date: 26 hours ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/selftests/mock_region.c: drm/ttm/ttm_placement.h is=
 included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2011160157414881601==--


Content-Type: multipart/mixed; boundary="===============7983255846507223548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 97/103] drivers/gpu/drm/i915/i915_driver.c: pxp/intel_pxp.h is included more than once.
Date: Tue, 12 Jul 2022 12:18:21 +0800
Message-ID: <202207121200.bAXza9gA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7983255846507223548==
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
omeos-5.15
head:   0349aafcfee20753a4a850854951b65b34c5506f
commit: 5b19507a9ff0792d38479fa868694849849d5378 [97/103] CHROMIUM: drm/i91=
5/pxp: Terminate the session upon app crash
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/i915_driver.c: pxp/intel_pxp.h is included more tha=
n once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7983255846507223548==--


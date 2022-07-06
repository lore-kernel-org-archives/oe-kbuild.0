Content-Type: multipart/mixed; boundary="===============1793562831174270837=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7600/8197] drivers/gpu/drm/amd/display/dc/os_types.h: drm/drm_print.h is included more than once.
Date: Thu, 07 Jul 2022 03:12:49 +0800
Message-ID: <202207070341.YLD8BfwB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1793562831174270837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Harry Wentland <harry.wentland@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   088b9c375534d905a4d337c78db3b3bfbb52c4a0
commit: 09de5cd2c170b19e04e37439a712da52a0535015 [7600/8197] drm/amd/displa=
y: Move all linux includes into OS types
:::::: branch date: 11 hours ago
:::::: commit date: 23 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/os_types.h: drm/drm_print.h is included m=
ore than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1793562831174270837==--


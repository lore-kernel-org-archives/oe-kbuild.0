Content-Type: multipart/mixed; boundary="===============1838456783320573730=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 2/2] drivers/gpu/drm/i915/gt/gen8_engine_cs.c: intel_gpu_commands.h is included more than once.
Date: Sat, 18 Jun 2022 22:49:13 +0800
Message-ID: <202206182221.t00CYHb1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1838456783320573730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Fei Yang <fei.yang@intel.com>
CC: renjiaox <jiaojiaox.ren@intel.com>
CC: Chris Wilson <chris.p.wilson@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   f2775fdfb43cc161cb8ca17d19c0ef33d5c73c0a
commit: f2775fdfb43cc161cb8ca17d19c0ef33d5c73c0a [2/2] drm/i915: avoid conc=
urrent writes to aux_inv
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/gen8_engine_cs.c: intel_gpu_commands.h is includ=
ed more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1838456783320573730==--


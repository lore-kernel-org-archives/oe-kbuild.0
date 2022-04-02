Content-Type: multipart/mixed; boundary="===============5087426888129782357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 14515/15002] drivers/gpu/drm/drm_of.c:297:2-13: ERROR: probable double put.
Date: Sun, 03 Apr 2022 02:43:54 +0800
Message-ID: <202204030210.J2kMG0rF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5087426888129782357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
commit: 67bae5f28c895f8737a1974c3f31cf12b9170b14 [14515/15002] drm: of: Pro=
perly try all possible cases for bridge/panel detection
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-c023-20220403 (https://download.01.org/0day-ci/arc=
hive/20220403/202204030210.J2kMG0rF-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_of.c:297:2-13: ERROR: probable double put.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5087426888129782357==--


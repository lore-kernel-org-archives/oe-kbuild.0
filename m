Content-Type: multipart/mixed; boundary="===============2137864705555350329=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2027/2566] drivers/gpu/drm/logicvc/logicvc_layer.c:616:2-13: ERROR: probable double put.
Date: Sat, 11 Jun 2022 06:03:21 +0800
Message-ID: <202206110640.YLZgSGmf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2137864705555350329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
CC: Maxime Ripard <mripard@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d0c806803170f120f8cb97b321de7bd89d3a791
commit: efeeaefe9be56e8ae5e5b4e9ff6d2275ec977ec5 [2027/2566] drm: Add suppo=
rt for the LogiCVC display controller
:::::: branch date: 17 hours ago
:::::: commit date: 31 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20220611=
/202206110640.YLZgSGmf-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/logicvc/logicvc_layer.c:616:2-13: ERROR: probable double=
 put.
--
>> drivers/gpu/drm/logicvc/logicvc_drm.c:352:2-9: line 352 is redundant bec=
ause platform_get_irq() already prints an error

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2137864705555350329==--


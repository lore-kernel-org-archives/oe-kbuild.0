Content-Type: multipart/mixed; boundary="===============0444140217047023374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:drm-misc-next 1/3] drivers/of/platform.c:558:2-23: WARNING: Function "for_each_node_by_type" should have of_node_put() before return around line 564.
Date: Thu, 21 Apr 2022 14:45:22 +0800
Message-ID: <202204211444.I1BZwETk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0444140217047023374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Rob Herring <robh@kernel.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   40d8d4bd06720aed6c1125bab7296c57de4f1157
commit: 52b1b46c39ae4321459a1a28dd4e596497b375b8 [1/3] of: Create platform =
devices for OF framebuffers
:::::: branch date: 6 hours ago
:::::: commit date: 22 hours ago
config: riscv-randconfig-c024-20220420 (https://download.01.org/0day-ci/arc=
hive/20220421/202204211444.I1BZwETk-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/of/platform.c:558:2-23: WARNING: Function "for_each_node_by_type=
" should have of_node_put() before return around line 564.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0444140217047023374==--


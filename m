Content-Type: multipart/mixed; boundary="===============8738849117013419597=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_word_length_map' can be declared with const [constVariable]
Date: Mon, 02 May 2022 18:04:52 +0800
Message-ID: <202205021856.VJSfqIrA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8738849117013419597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allen Chen <allen.chen@ite.com.tw>
CC: Robert Foss <robert.foss@linaro.org>
CC: Hermes Wu <hermes.wu@ite.com.tw>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   672c0c5173427e6b3e2a9bbb7be51ceeec78093a
commit: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 drm/bridge: add it6505 dri=
ver
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b5c84a9edcd418cd055becad6a22439e7c5e3bf8
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:373:9: warning: Local variable 're=
t' shadows outer variable [shadowVariable]
     void *ret;
           ^
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:370:6: note: Shadowed declaration
    int ret;
        ^
   drivers/gpu/drm/etnaviv/etnaviv_gem.c:373:9: note: Shadow variable
     void *ret;
           ^
>> drivers/gpu/drm/radeon/radeon_cs.c:105:31: warning: Local variable 'r' s=
hadows outer variable [shadowVariable]
     struct drm_radeon_cs_reloc *r;
                                 ^
   drivers/gpu/drm/radeon/radeon_cs.c:87:6: note: Shadowed declaration
    int r;
        ^
   drivers/gpu/drm/radeon/radeon_cs.c:105:31: note: Shadow variable
     struct drm_radeon_cs_reloc *r;
                                 ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:216:39: warning: Parameter 'contex=
t' can be declared with const [constParameter]
           struct etnaviv_iommu_context *context)
                                         ^
>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:221:16: warning: Uninitialized var=
iable: mapping->context [uninitvar]
     if (mapping->context =3D=3D context)
                  ^
>> drivers/gpu/drm/etnaviv/etnaviv_gem.c:502:37: warning: Uninitialized var=
iables: mapping.obj_node, mapping.scan_node, mapping.mmu_node, mapping.obje=
ct, mapping.context, mapping.vram_node, mapping.iova [uninitvar]
      etnaviv_iommu_unmap_gem(context, mapping);
                                       ^
--
>> drivers/gpu/drm/radeon/atombios_dp.c:351:19: warning: Assigning an integ=
er to a pointer is not portable. [AssignmentIntegerToAddress]
    args.ucLinkClock =3D dp_clock / 10;
                     ^
--
>> drivers/gpu/drm/radeon/radeon_cs.c:259:17: warning: Uninitialized variab=
le: reloc->robj [uninitvar]
     resv =3D reloc->robj->tbo.base.resv;
                   ^
--
>> drivers/gpu/drm/radeon/radeon_connectors.c:1865:25: warning: Parameter '=
hpd' can be declared with const [constParameter]
        struct radeon_hpd *hpd,
                           ^
   drivers/gpu/drm/radeon/radeon_connectors.c:2390:27: warning: Parameter '=
hpd' can be declared with const [constParameter]
          struct radeon_hpd *hpd)
                             ^
>> drivers/gpu/drm/radeon/radeon_connectors.c:418:33: warning: Parameter 'e=
ncoder' can be declared with const [constParameter]
               struct drm_encoder *encoder,
                                   ^
>> drivers/gpu/drm/radeon/radeon_connectors.c:547:96: warning: Parameter 'p=
roperty' can be declared with const [constParameter]
   static int radeon_connector_set_property(struct drm_connector *connector=
, struct drm_property *property,
                                                                           =
                       ^
   drivers/gpu/drm/radeon/radeon_connectors.c:940:30: warning: Parameter 'p=
roperty' can be declared with const [constParameter]
           struct drm_property *property,
                                ^
>> drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_wor=
d_length_map' can be declared with const [constVariable]
    u8 audio_word_length_map[] =3D { 0x02, 0x04, 0x03, 0x0B };
       ^
>> drivers/gpu/drm/bridge/ite-it6505.c:1620:56: warning: Parameter 'lane_vo=
ltage_swing' can be declared with const [constParameter]
   static bool it6505_check_max_voltage_swing_reached(u8 *lane_voltage_swin=
g,
                                                          ^

vim +/audio_word_length_map +1330 drivers/gpu/drm/bridge/ite-it6505.c

b5c84a9edcd418 Allen Chen 2022-01-14  1326  =

b5c84a9edcd418 Allen Chen 2022-01-14  1327  static void it6505_setup_audio_=
channel_status(struct it6505 *it6505)
b5c84a9edcd418 Allen Chen 2022-01-14  1328  {
b5c84a9edcd418 Allen Chen 2022-01-14  1329  	enum it6505_audio_sample_rate =
sample_rate =3D it6505->audio.sample_rate;
b5c84a9edcd418 Allen Chen 2022-01-14 @1330  	u8 audio_word_length_map[] =3D=
 { 0x02, 0x04, 0x03, 0x0B };
b5c84a9edcd418 Allen Chen 2022-01-14  1331  =

b5c84a9edcd418 Allen Chen 2022-01-14  1332  	/* Channel Status */
b5c84a9edcd418 Allen Chen 2022-01-14  1333  	it6505_write(it6505, REG_IEC95=
8_STS0, it6505->audio.type << 1);
b5c84a9edcd418 Allen Chen 2022-01-14  1334  	it6505_write(it6505, REG_IEC95=
8_STS1, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1335  	it6505_write(it6505, REG_IEC95=
8_STS2, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1336  	it6505_write(it6505, REG_IEC95=
8_STS3, sample_rate);
b5c84a9edcd418 Allen Chen 2022-01-14  1337  	it6505_write(it6505, REG_IEC95=
8_STS4, (~sample_rate << 4) |
b5c84a9edcd418 Allen Chen 2022-01-14  1338  		     audio_word_length_map[it=
6505->audio.word_length]);
b5c84a9edcd418 Allen Chen 2022-01-14  1339  }
b5c84a9edcd418 Allen Chen 2022-01-14  1340  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8738849117013419597==--


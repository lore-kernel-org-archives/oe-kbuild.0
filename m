Content-Type: multipart/mixed; boundary="===============7041411569802218914=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/nouveau/include/nvkm/core/layout.h:48 nvkm_device_ctor() warn: Function too hairy. No more merges.
Date: Fri, 14 Jan 2022 18:55:06 +0800
Message-ID: <202201141855.vgscRGI5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7041411569802218914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fb3b0673b7d5b477ed104949450cd511337ba3c6
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexin=
g support to dev_printk
date:   6 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-m031-20220113 (https://download.01.org/0day-ci/arch=
ive/20220114/202201141855.vgscRGI5-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/nouveau/include/nvkm/core/layout.h:48 nvkm_device_ctor() wa=
rn: Function too hairy.  No more merges.

vim +48 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h

fcc08a7c0ded8c7 Ben Skeggs 2021-02-04  29  =

fcc08a7c0ded8c7 Ben Skeggs 2021-02-04  30  NVKM_LAYOUT_ONCE(NVKM_ENGINE_BSP=
     , struct nvkm_engine  ,      bsp)
f6df392dddbb9e6 Ben Skeggs 2021-02-08  31  NVKM_LAYOUT_INST(NVKM_ENGINE_CE =
     , struct nvkm_engine  ,       ce, 10)
0b26ca68c97d167 Ben Skeggs 2021-02-04  32  NVKM_LAYOUT_ONCE(NVKM_ENGINE_CIP=
HER  , struct nvkm_engine  ,   cipher)
a7f000ec565022e Ben Skeggs 2021-02-04  33  NVKM_LAYOUT_ONCE(NVKM_ENGINE_DIS=
P    , struct nvkm_disp    ,     disp)
09f409d74d66799 Ben Skeggs 2020-12-04  34  NVKM_LAYOUT_ONCE(NVKM_ENGINE_DMA=
OBJ  , struct nvkm_dma     ,      dma)
ab0db2bd853d4a6 Ben Skeggs 2020-12-04  35  NVKM_LAYOUT_ONCE(NVKM_ENGINE_FIF=
O    , struct nvkm_fifo    ,     fifo)
864d37c3d8d4ee9 Ben Skeggs 2020-12-04  36  NVKM_LAYOUT_ONCE(NVKM_ENGINE_GR =
     , struct nvkm_gr      ,       gr)
ee307030e9e2a9d Ben Skeggs 2020-12-04  37  NVKM_LAYOUT_ONCE(NVKM_ENGINE_IFB=
     , struct nvkm_engine  ,      ifb)
aba5e97b890a7e0 Ben Skeggs 2020-12-04  38  NVKM_LAYOUT_ONCE(NVKM_ENGINE_ME =
     , struct nvkm_engine  ,       me)
e5e95a7639ed5f7 Ben Skeggs 2021-02-04  39  NVKM_LAYOUT_ONCE(NVKM_ENGINE_MPE=
G    , struct nvkm_engine  ,     mpeg)
e9e9a219e4cd01e Ben Skeggs 2021-02-04  40  NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSE=
NC   , struct nvkm_engine  ,    msenc)
963216061c00865 Ben Skeggs 2021-02-04  41  NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSP=
DEC  , struct nvkm_engine  ,   mspdec)
07a356bbe7723c4 Ben Skeggs 2021-02-04  42  NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSP=
PP   , struct nvkm_engine  ,    msppp)
b15147bd7170b59 Ben Skeggs 2021-02-04  43  NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSV=
LD   , struct nvkm_engine  ,    msvld)
f6df392dddbb9e6 Ben Skeggs 2021-02-08  44  NVKM_LAYOUT_INST(NVKM_ENGINE_NVD=
EC   , struct nvkm_nvdec   ,    nvdec, 5)
ee532a8d0e644b6 Ben Skeggs 2020-12-04  45  NVKM_LAYOUT_INST(NVKM_ENGINE_NVE=
NC   , struct nvkm_nvenc   ,    nvenc, 3)
18618fc6d1e3591 Ben Skeggs 2021-02-08  46  NVKM_LAYOUT_ONCE(NVKM_ENGINE_NVJ=
PG   , struct nvkm_engine  ,    nvjpg)
f6df392dddbb9e6 Ben Skeggs 2021-02-08  47  NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA=
     , struct nvkm_engine  ,      ofa)
e73d371a73c1e88 Ben Skeggs 2020-12-04 @48  NVKM_LAYOUT_ONCE(NVKM_ENGINE_PM =
     , struct nvkm_pm      ,       pm)

:::::: The code at line 48 was first introduced by commit
:::::: e73d371a73c1e883395a0f8cec80f501d678d8bb drm/nouveau/pm: switch to i=
nstanced constructor

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7041411569802218914==--


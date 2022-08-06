Content-Type: multipart/mixed; boundary="===============5791588430005607575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Sun, 07 Aug 2022 07:43:47 +0800
Message-ID: <202208070722.zNLpAbl1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5791588430005607575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d1044fcb996e8de9b9ab392f4a767890e45202d
commit: 3f4a80cbf968466c5ba0c78ef41cae8292965bd8 drm/msm: move msm_readl/_w=
ritel to msm_drv.h
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-s031-20220807 (https://download.01.org/0day-ci/arch=
ive/20220807/202208070722.zNLpAbl1-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3f4a80cbf968466c5ba0c78ef41cae8292965bd8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3f4a80cbf968466c5ba0c78ef41cae8292965bd8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c: note: in included file:
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:108:15: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
--
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1424:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void=
 const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void=
 const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1466:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse:     expected void=
 *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:19: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] rscc @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse:     expected void=
 *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1580:27: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1611:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1613:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: too many w=
arnings
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void [nodere=
f] __iomem *llc_mmio @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse:     expected void=
 [noderef] __iomem *llc_mmio
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1515:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void volatile=
 [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     expected void =
volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:21: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:23: sparse: sparse: dereferenc=
e of noderef expression
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: note: in included file (thr=
ough drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:16: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:16: sparse: sparse: dereference=
 of noderef expression

vim +101 drivers/gpu/drm/msm/adreno/a6xx_gmu.h

4b565ca5a2cbbbb Jordan Crouse 2018-08-06   93  =

4b565ca5a2cbbbb Jordan Crouse 2018-08-06   94  static inline u32 gmu_read(s=
truct a6xx_gmu *gmu, u32 offset)
4b565ca5a2cbbbb Jordan Crouse 2018-08-06   95  {
4b565ca5a2cbbbb Jordan Crouse 2018-08-06  @96  	return msm_readl(gmu->mmio =
+ (offset << 2));
4b565ca5a2cbbbb Jordan Crouse 2018-08-06   97  }
4b565ca5a2cbbbb Jordan Crouse 2018-08-06   98  =

4b565ca5a2cbbbb Jordan Crouse 2018-08-06   99  static inline void gmu_write=
(struct a6xx_gmu *gmu, u32 offset, u32 value)
4b565ca5a2cbbbb Jordan Crouse 2018-08-06  100  {
4b565ca5a2cbbbb Jordan Crouse 2018-08-06 @101  	return msm_writel(value, gm=
u->mmio + (offset << 2));
4b565ca5a2cbbbb Jordan Crouse 2018-08-06  102  }
4b565ca5a2cbbbb Jordan Crouse 2018-08-06  103  =


:::::: The code@line 101 was first introduced by commit
:::::: 4b565ca5a2cbbbb6345e8789da89c193b6b00e5a drm/msm: Add A6XX device su=
pport

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5791588430005607575==--


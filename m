Content-Type: multipart/mixed; boundary="===============6280338909881380918=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 484/2399] drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Tue, 19 Jul 2022 08:38:12 +0800
Message-ID: <202207190843.jv4UxH5m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6280338909881380918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Junxiao Chang <junxiao.chang@intel.com>

Hi Christian,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2af91fc60f82c6f620d2b5d5e76c54f42116c808
commit: 2e4c0f14c46f4dcdeec66f40779cd8e9708e8dda [484/2399] drm/msm: allow =
compile_test on !ARM
:::::: branch date: 3 weeks ago
:::::: commit date: 5 months ago
config: parisc-randconfig-s032-20220718 (https://download.01.org/0day-ci/ar=
chive/20220719/202207190843.jv4UxH5m-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/linux-intel-lts/commit/2e4c0f14c46f4dcde=
ec66f40779cd8e9708e8dda
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 2e4c0f14c46f4dcdeec66f40779cd8e9708e8dda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:391:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:464:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:471:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:497:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1416:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1416:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1416:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1422:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1422:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1422:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:862:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:864:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:866:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:868:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1070:23: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse:     got void *[no=
deref] mmio
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1566:19: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1566:19: sparse:     expected void=
 *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1566:19: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:27: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] rscc @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:27: sparse:     expected void=
 *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1573:27: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1604:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1604:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1604:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:322:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@

vim +1462 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1446  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1447  void a6xx_gmu_remove(struct=
 a6xx_gpu *a6xx_gpu)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1448  {
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1449  	struct a6xx_gmu *gmu =3D &=
a6xx_gpu->gmu;
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1450  	struct platform_device *pd=
ev =3D to_platform_device(gmu->dev);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1451  =

606ec90fc22662 Sean Paul      2019-05-23  1452  	if (!gmu->initialized)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1453  		return;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1454  =

03b7af1ef4992b Jordan Crouse  2019-05-07  1455  	pm_runtime_force_suspend(g=
mu->dev);
9325d4266afd4e Jordan Crouse  2019-02-04  1456  =

2b117451277140 Sean Paul      2019-05-15  1457  	if (!IS_ERR_OR_NULL(gmu->g=
xpd)) {
9325d4266afd4e Jordan Crouse  2019-02-04  1458  		pm_runtime_disable(gmu->g=
xpd);
9325d4266afd4e Jordan Crouse  2019-02-04  1459  		dev_pm_domain_detach(gmu-=
>gxpd, false);
9325d4266afd4e Jordan Crouse  2019-02-04  1460  	}
9325d4266afd4e Jordan Crouse  2019-02-04  1461  =

a62fb211ad0c9e Sean Paul      2019-05-23 @1462  	iounmap(gmu->mmio);
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1463  	if (platform_get_resource_=
byname(pdev, IORESOURCE_MEM, "rscc"))
02ef80c54e7cd7 Jonathan Marek 2020-04-23 @1464  		iounmap(gmu->rscc);
a62fb211ad0c9e Sean Paul      2019-05-23  1465  	gmu->mmio =3D NULL;
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1466  	gmu->rscc =3D NULL;
a62fb211ad0c9e Sean Paul      2019-05-23  1467  =

29ac8979cdf720 Jonathan Marek 2020-04-23  1468  	a6xx_gmu_memory_free(gmu);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1469  =

a62fb211ad0c9e Sean Paul      2019-05-23  1470  	free_irq(gmu->gmu_irq, gmu=
);
a62fb211ad0c9e Sean Paul      2019-05-23  1471  	free_irq(gmu->hfi_irq, gmu=
);
a62fb211ad0c9e Sean Paul      2019-05-23  1472  =

998efc74672c2d Sean Paul      2019-05-23  1473  	/* Drop reference taken in=
 of_find_device_by_node */
998efc74672c2d Sean Paul      2019-05-23  1474  	put_device(gmu->dev);
998efc74672c2d Sean Paul      2019-05-23  1475  =

606ec90fc22662 Sean Paul      2019-05-23  1476  	gmu->initialized =3D false;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1477  }
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1478  =


:::::: The code at line 1462 was first introduced by commit
:::::: a62fb211ad0c9e13e79d350905a704f46447b8cf drm/msm/a6xx: Remove devm c=
alls from gmu driver

:::::: TO: Sean Paul <seanpaul@chromium.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6280338909881380918==--


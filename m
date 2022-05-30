Content-Type: multipart/mixed; boundary="===============5830160092351176131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 484/2399] drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Mon, 30 May 2022 22:04:23 +0800
Message-ID: <202205302145.xlezMwIb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5830160092351176131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   7a4ee5c026dd579ff2efe74b7090ac51512cf0ef
commit: 2e4c0f14c46f4dcdeec66f40779cd8e9708e8dda [484/2399] drm/msm: allow =
compile_test on !ARM
:::::: branch date: 3 days ago
:::::: commit date: 3 months ago
config: s390-randconfig-s031-20220530 (https://download.01.org/0day-ci/arch=
ive/20220530/202205302145.xlezMwIb-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-14-g5a0004b5-dirty
        # https://github.com/intel/linux-intel-lts/commit/2e4c0f14c46f4dcde=
ec66f40779cd8e9708e8dda
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 2e4c0f14c46f4dcdeec66f40779cd8e9708e8dda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c: note: in included file:
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
--
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1462:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1464:28: sparse:     expected void=
 volatile [noderef] __iomem *addr
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
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1604:20: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1604:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse:     expected void=
 volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1606:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
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
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
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
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
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
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:366:15: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: too many w=
arnings
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1512:36: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void [nodere=
f] __iomem *llc_mmio @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1512:36: sparse:     expected void=
 [noderef] __iomem *llc_mmio
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1512:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1645:6: sparse: sparse: symbol 'a6=
xx_gpu_set_freq' was not declared. Should it be static?
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse: sparse: incorrect =
type in argument 2 (different address spaces) @@     expected void [noderef=
] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     expected void =
[noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:101:34: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:41: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const [n=
oderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:41: sparse:     expected void =
const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:41: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:43: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const [n=
oderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:43: sparse:     expected void =
const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:43: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:124:31: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:125:33: sparse: sparse: dereferenc=
e of noderef expression
--
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9: sparse: sparse: incor=
rect type in argument 2 (different address spaces) @@     expected void [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9: sparse:     expected =
void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: sparse: sparse: incor=
rect type in argument 2 (different address spaces) @@     expected void [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: sparse:     expected =
void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: sparse: sparse: incor=
rect type in argument 2 (different address spaces) @@     expected void [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: sparse:     expected =
void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: sparse: sparse: incor=
rect type in argument 2 (different address spaces) @@     expected void [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: sparse:     expected =
void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: sparse: sparse: inco=
rrect type in argument 1 (different address spaces) @@     expected void co=
nst [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: sparse:     expected=
 void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: sparse:     got void=
 *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: sparse: sparse: inco=
rrect type in argument 1 (different address spaces) @@     expected void co=
nst [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: sparse:     expected=
 void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: sparse:     got void=
 *
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41: sparse: sparse: inco=
rrect type in argument 1 (different address spaces) @@     expected void *[=
noderef] __iomem cxdbg @@     got void [noderef] __iomem *cxdbg @@
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41: sparse:     expected=
 void *[noderef] __iomem cxdbg
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:315:41: sparse:     got void=
 [noderef] __iomem *cxdbg
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:189:9: sparse: sparse: deref=
erence of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:190:9: sparse: sparse: deref=
erence of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:191:9: sparse: sparse: deref=
erence of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:192:9: sparse: sparse: deref=
erence of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:197:19: sparse: sparse: dere=
ference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:198:19: sparse: sparse: dere=
ference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c: note: in included file (thr=
ough drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:36: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const [n=
oderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:36: sparse:     expected void =
const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:136:26: sparse: sparse: dereferenc=
e of noderef expression
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:26: sparse: sparse: dereference=
 of noderef expression
--
>> drivers/gpu/drm/msm/msm_drv.c:141:31: sparse: sparse: incorrect type in =
return expression (different address spaces) @@     expected void [noderef]=
 __iomem * @@     got void * @@
   drivers/gpu/drm/msm/msm_drv.c:141:31: sparse:     expected void [noderef=
] __iomem *
   drivers/gpu/drm/msm/msm_drv.c:141:31: sparse:     got void *
   drivers/gpu/drm/msm/msm_drv.c:150:31: sparse: sparse: incorrect type in =
return expression (different address spaces) @@     expected void [noderef]=
 __iomem * @@     got void * @@
   drivers/gpu/drm/msm/msm_drv.c:150:31: sparse:     expected void [noderef=
] __iomem *
   drivers/gpu/drm/msm/msm_drv.c:150:31: sparse:     got void *

vim +101 drivers/gpu/drm/msm/adreno/a6xx_gmu.h

4b565ca5a2cbbb Jordan Crouse 2018-08-06   93  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06   94  static inline u32 gmu_read(st=
ruct a6xx_gmu *gmu, u32 offset)
4b565ca5a2cbbb Jordan Crouse 2018-08-06   95  {
4b565ca5a2cbbb Jordan Crouse 2018-08-06  @96  	return msm_readl(gmu->mmio +=
 (offset << 2));
4b565ca5a2cbbb Jordan Crouse 2018-08-06   97  }
4b565ca5a2cbbb Jordan Crouse 2018-08-06   98  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06   99  static inline void gmu_write(=
struct a6xx_gmu *gmu, u32 offset, u32 value)
4b565ca5a2cbbb Jordan Crouse 2018-08-06  100  {
4b565ca5a2cbbb Jordan Crouse 2018-08-06 @101  	return msm_writel(value, gmu=
->mmio + (offset << 2));
4b565ca5a2cbbb Jordan Crouse 2018-08-06  102  }
4b565ca5a2cbbb Jordan Crouse 2018-08-06  103  =


:::::: The code@line 101 was first introduced by commit
:::::: 4b565ca5a2cbbbb6345e8789da89c193b6b00e5a drm/msm: Add A6XX device su=
pport

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5830160092351176131==--


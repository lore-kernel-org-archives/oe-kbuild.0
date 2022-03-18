Content-Type: multipart/mixed; boundary="===============7055841988055503321=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Sat, 19 Mar 2022 07:23:02 +0800
Message-ID: <202203190729.6Cqkvjab-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7055841988055503321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

Hi Christian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34e047aa16c0123bbae8e2f6df33e5ecc1f56601
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-s031-20220318 (https://download.01.org/0day-ci/archi=
ve/20220319/202203190729.6Cqkvjab-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rc SHELL=3D/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     expected void =
const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1412:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1412:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1412:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     expected void=
 [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1418:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     expected void c=
onst volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     got void *
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const [=
noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse:     expected void=
 const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse:     got void *[no=
deref] mmio
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1460:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const [=
noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1460:28: sparse:     expected void=
 const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1460:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1560:19: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1560:19: sparse:     expected void=
 *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1560:19: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1567:27: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] rscc @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1567:27: sparse:     expected void=
 *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1567:27: sparse:     got void [nod=
eref] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1598:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const [=
noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1598:20: sparse:     expected void=
 const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1598:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1600:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const [=
noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1600:28: sparse:     expected void=
 const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1600:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     expected void c=
onst [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:240:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:93:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] __iomem *addr @@     got void * @@

vim +1458 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1442  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1443  void a6xx_gmu_remove(struc=
t a6xx_gpu *a6xx_gpu)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1444  {
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1445  	struct a6xx_gmu *gmu =3D =
&a6xx_gpu->gmu;
02ef80c54e7cd70 Jonathan Marek 2020-04-23  1446  	struct platform_device *p=
dev =3D to_platform_device(gmu->dev);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1447  =

606ec90fc226628 Sean Paul      2019-05-23  1448  	if (!gmu->initialized)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1449  		return;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1450  =

03b7af1ef4992bd Jordan Crouse  2019-05-07  1451  	pm_runtime_force_suspend(=
gmu->dev);
9325d4266afd4e5 Jordan Crouse  2019-02-04  1452  =

2b117451277140b Sean Paul      2019-05-15  1453  	if (!IS_ERR_OR_NULL(gmu->=
gxpd)) {
9325d4266afd4e5 Jordan Crouse  2019-02-04  1454  		pm_runtime_disable(gmu->=
gxpd);
9325d4266afd4e5 Jordan Crouse  2019-02-04  1455  		dev_pm_domain_detach(gmu=
->gxpd, false);
9325d4266afd4e5 Jordan Crouse  2019-02-04  1456  	}
9325d4266afd4e5 Jordan Crouse  2019-02-04  1457  =

a62fb211ad0c9e1 Sean Paul      2019-05-23 @1458  	iounmap(gmu->mmio);
02ef80c54e7cd70 Jonathan Marek 2020-04-23  1459  	if (platform_get_resource=
_byname(pdev, IORESOURCE_MEM, "rscc"))
02ef80c54e7cd70 Jonathan Marek 2020-04-23 @1460  		iounmap(gmu->rscc);
a62fb211ad0c9e1 Sean Paul      2019-05-23  1461  	gmu->mmio =3D NULL;
02ef80c54e7cd70 Jonathan Marek 2020-04-23  1462  	gmu->rscc =3D NULL;
a62fb211ad0c9e1 Sean Paul      2019-05-23  1463  =

29ac8979cdf7205 Jonathan Marek 2020-04-23  1464  	a6xx_gmu_memory_free(gmu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1465  =

a62fb211ad0c9e1 Sean Paul      2019-05-23  1466  	free_irq(gmu->gmu_irq, gm=
u);
a62fb211ad0c9e1 Sean Paul      2019-05-23  1467  	free_irq(gmu->hfi_irq, gm=
u);
a62fb211ad0c9e1 Sean Paul      2019-05-23  1468  =

998efc74672c2d9 Sean Paul      2019-05-23  1469  	/* Drop reference taken i=
n of_find_device_by_node */
998efc74672c2d9 Sean Paul      2019-05-23  1470  	put_device(gmu->dev);
998efc74672c2d9 Sean Paul      2019-05-23  1471  =

606ec90fc226628 Sean Paul      2019-05-23  1472  	gmu->initialized =3D fals=
e;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1473  }
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1474  =


:::::: The code at line 1458 was first introduced by commit
:::::: a62fb211ad0c9e13e79d350905a704f46447b8cf drm/msm/a6xx: Remove devm c=
alls from gmu driver

:::::: TO: Sean Paul <seanpaul@chromium.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7055841988055503321==--


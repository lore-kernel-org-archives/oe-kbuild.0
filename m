Content-Type: multipart/mixed; boundary="===============9038524207981347126=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3576/7806] drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Wed, 13 Oct 2021 21:38:52 +0800
Message-ID: <202110132141.W3umQc0j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9038524207981347126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8006b911c90a4ec09958447d24c8a4c3538f5723
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 [3576/7806] drm/msm: allow=
 compile_test on !ARM
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-s031-20211013 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:224:15: sparse: sparse: incorrect =
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:320:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:362:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:387:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:460:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:467:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:493:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
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
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:858:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     expected void c=
onst volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:860:9: sparse:     got void *
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     expected void=
 const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     expected void=
 const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1066:23: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1458:20: sparse:     got void *[no=
deref] mmio
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1460:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1460:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
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
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1598:20: sparse:     expected void=
 const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1598:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1600:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void const v=
olatile [noderef] __iomem *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1600:28: sparse:     expected void=
 const volatile [noderef] __iomem *addr
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
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     got void *
>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] __iomem *mem @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     expected void =
const volatile [noderef] __iomem *mem
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c: note: in included file:
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:104:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     expected void [=
noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:98:34: sparse: sparse: dereference=
 of noderef expression

vim +224 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbb Jordan Crouse    2018-08-06  199  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06  200  static int a6xx_gmu_start(=
struct a6xx_gmu *gmu)
4b565ca5a2cbbb Jordan Crouse    2018-08-06  201  {
4b565ca5a2cbbb Jordan Crouse    2018-08-06  202  	int ret;
4b565ca5a2cbbb Jordan Crouse    2018-08-06  203  	u32 val;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  204  	u32 mask, reset_val;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  205  =

f5749d6181fa7d Dmitry Baryshkov 2020-08-20  206  	val =3D gmu_read(gmu, REG=
_A6XX_GMU_CM3_DTCM_START + 0xff8);
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  207  	if (val <=3D 0x20010004) {
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  208  		mask =3D 0xffffffff;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  209  		reset_val =3D 0xbabeface;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  210  	} else {
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  211  		mask =3D 0x1ff;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  212  		reset_val =3D 0x100;
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  213  	}
4b565ca5a2cbbb Jordan Crouse    2018-08-06  214  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06  215  	gmu_write(gmu, REG_A6XX_G=
MU_CM3_SYSRESET, 1);
ad4968d51dd3a2 Jonathan Marek   2020-04-23  216  =

ad4968d51dd3a2 Jonathan Marek   2020-04-23  217  	/* Set the log wptr index
ad4968d51dd3a2 Jonathan Marek   2020-04-23  218  	 * note: downstream saves=
 the value in poweroff and restores it here
ad4968d51dd3a2 Jonathan Marek   2020-04-23  219  	 */
ad4968d51dd3a2 Jonathan Marek   2020-04-23  220  	gmu_write(gmu, REG_A6XX_G=
PU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
ad4968d51dd3a2 Jonathan Marek   2020-04-23  221  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06  222  	gmu_write(gmu, REG_A6XX_G=
MU_CM3_SYSRESET, 0);
4b565ca5a2cbbb Jordan Crouse    2018-08-06  223  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06 @224  	ret =3D gmu_poll_timeout(=
gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
f5749d6181fa7d Dmitry Baryshkov 2020-08-20  225  		(val & mask) =3D=3D rese=
t_val, 100, 10000);
4b565ca5a2cbbb Jordan Crouse    2018-08-06  226  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06  227  	if (ret)
6a41da17e87dee Mamta Shukla     2018-10-20  228  		DRM_DEV_ERROR(gmu->dev, =
"GMU firmware initialization timed out\n");
4b565ca5a2cbbb Jordan Crouse    2018-08-06  229  =

4b565ca5a2cbbb Jordan Crouse    2018-08-06  230  	return ret;
4b565ca5a2cbbb Jordan Crouse    2018-08-06  231  }
4b565ca5a2cbbb Jordan Crouse    2018-08-06  232  =


:::::: The code at line 224 was first introduced by commit
:::::: 4b565ca5a2cbbbb6345e8789da89c193b6b00e5a drm/msm: Add A6XX device su=
pport

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9038524207981347126==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
a33QXOqTumZqMo/b/w+8wywYV08CAA==
--===============9038524207981347126==--


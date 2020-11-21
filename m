Content-Type: multipart/mixed; boundary="===============1399762812797355194=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1472:27: sparse: expected void Documentation Kbuild Makefile crypto include sound usr rscc
Date: Sun, 22 Nov 2020 02:08:36 +0800
Message-ID: <202011220233.nuefHWXN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1399762812797355194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Marek <jonathan@marek.ca>
CC: Rob Clark <robdclark@chromium.org>
CC: Jordan Crouse <jcrouse@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   27bba9c532a8d21050b94224ffd310ad0058c353
commit: 02ef80c54e7cd70fe1f422b0315fd1534033e382 drm/msm/a6xx: update pdc/r=
scc GMU registers for A640/A650
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-s032-20201122 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-134-gb59dbdaf-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D02ef80c54e7cd70fe1f422b0315fd1534033e382
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 02ef80c54e7cd70fe1f422b0315fd1534033e382
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:327:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:352:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:425:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:432:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:458:15: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1338:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] <asn:2> * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1338:31: sparse:     expected void=
 [noderef] <asn:2> *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1338:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1344:31: sparse: sparse: incorrect=
 type in return expression (different address spaces) @@     expected void =
[noderef] <asn:2> * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1344:31: sparse:     expected void=
 [noderef] <asn:2> *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1344:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:807:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:809:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:811:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const vol=
atile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse:     expected void c=
onst volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:813:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse: sparse: incorrect =
type in argument 1 (different address spaces) @@     expected void const vo=
latile [noderef] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse:     expected void =
const volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:988:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1384:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1384:20: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1384:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1386:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1386:28: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1386:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1465:19: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] mmio @@     got void [noderef] <asn:2> * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1465:19: sparse:     expected void=
 *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1465:19: sparse:     got void [nod=
eref] <asn:2> *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1472:27: sparse: sparse: incorrect=
 type in assignment (different address spaces) @@     expected void *[noder=
ef] rscc @@     got void [noderef] <asn:2> * @@
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1472:27: sparse:     expected void=
 *[noderef] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1472:27: sparse:     got void [nod=
eref] <asn:2> *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1503:20: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void *[noderef] mmio @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1503:20: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1503:20: sparse:     got void *[no=
deref] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1505:28: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void volatil=
e [noderef] <asn:2> *addr @@     got void *[noderef] rscc @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1505:28: sparse:     expected void=
 volatile [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1505:28: sparse:     got void *[no=
deref] rscc
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through d=
rivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:214:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:230:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:275:15: sparse: sparse: dereferenc=
e of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse: sparse: incorrect t=
ype in argument 1 (different address spaces) @@     expected void const [no=
deref] <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     expected void c=
onst [noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:91:26: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     expected void [=
noderef] <asn:2> *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse:     got void *

vim +1472 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1400  =

981f2aabeae6f23 Sean Paul      2019-05-23  1401  int a6xx_gmu_init(struct a=
6xx_gpu *a6xx_gpu, struct device_node *node)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1402  {
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1403  	struct adreno_gpu *adreno=
_gpu =3D &a6xx_gpu->base;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1404  	struct a6xx_gmu *gmu =3D =
&a6xx_gpu->gmu;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1405  	struct platform_device *p=
dev =3D of_find_device_by_node(node);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1406  	int ret;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1407  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1408  	if (!pdev)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1409  		return -ENODEV;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1410  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1411  	gmu->dev =3D &pdev->dev;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1412  =

29ac8979cdf7205 Jonathan Marek 2020-04-23  1413  	of_dma_configure(gmu->dev=
, node, true);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1414  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1415  	/* Fow now, don't do anyt=
hing fancy until we get our feet under us */
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1416  	gmu->idle_level =3D GMU_I=
DLE_STATE_ACTIVE;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1417  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1418  	pm_runtime_enable(gmu->de=
v);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1419  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1420  	/* Get the list of clocks=
 */
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1421  	ret =3D a6xx_gmu_clocks_p=
robe(gmu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1422  	if (ret)
998efc74672c2d9 Sean Paul      2019-05-23  1423  		goto err_put_device;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1424  =

29ac8979cdf7205 Jonathan Marek 2020-04-23  1425  	ret =3D a6xx_gmu_memory_p=
robe(gmu);
29ac8979cdf7205 Jonathan Marek 2020-04-23  1426  	if (ret)
29ac8979cdf7205 Jonathan Marek 2020-04-23  1427  		goto err_put_device;
29ac8979cdf7205 Jonathan Marek 2020-04-23  1428  =

c6ed04f856a4ebb Jonathan Marek 2020-04-23  1429  	/* Allocate memory for th=
e GMU dummy page */
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1430  	ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1431  	if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1432  		goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1433  =

c6ed04f856a4ebb Jonathan Marek 2020-04-23  1434  	if (adreno_is_a650(adreno=
_gpu)) {
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1435  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->icache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1436  			SZ_16M - SZ_16K, 0x0400=
0);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1437  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1438  			goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1439  	} else if (adreno_is_a640=
(adreno_gpu)) {
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1440  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->icache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1441  			SZ_256K - SZ_16K, 0x040=
00);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1442  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1443  			goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1444  =

c6ed04f856a4ebb Jonathan Marek 2020-04-23  1445  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->dcache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1446  			SZ_256K - SZ_16K, 0x440=
00);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1447  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1448  			goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1449  	} else {
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1450  		/* HFI v1, has sptprac */
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1451  		gmu->legacy =3D true;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1452  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1453  		/* Allocate memory for t=
he GMU debug region */
29ac8979cdf7205 Jonathan Marek 2020-04-23  1454  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->debug, SZ_16K, 0);
29ac8979cdf7205 Jonathan Marek 2020-04-23  1455  		if (ret)
a62fb211ad0c9e1 Sean Paul      2019-05-23  1456  			goto err_memory;
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1457  	}
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1458  =

8167e6fa76c8f71 Jonathan Marek 2020-04-23  1459  	/* Allocate memory for fo=
r the HFI queues */
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1460  	ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->hfi, SZ_16K, 0);
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1461  	if (ret)
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1462  		goto err_memory;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1463  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1464  	/* Map the GMU registers =
*/
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1465  	gmu->mmio =3D a6xx_gmu_ge=
t_mmio(pdev, "gmu");
29ac8979cdf7205 Jonathan Marek 2020-04-23  1466  	if (IS_ERR(gmu->mmio)) {
29ac8979cdf7205 Jonathan Marek 2020-04-23  1467  		ret =3D PTR_ERR(gmu->mmi=
o);
a62fb211ad0c9e1 Sean Paul      2019-05-23  1468  		goto err_memory;
29ac8979cdf7205 Jonathan Marek 2020-04-23  1469  	}
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1470  =

02ef80c54e7cd70 Jonathan Marek 2020-04-23  1471  	if (adreno_is_a650(adreno=
_gpu)) {
02ef80c54e7cd70 Jonathan Marek 2020-04-23 @1472  		gmu->rscc =3D a6xx_gmu_g=
et_mmio(pdev, "rscc");

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1399762812797355194==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICIFRuV8AAy5jb25maWcAnDzZcuO2su/5ClXycs7DzNHmZe4tP0AkKCEiCQ4ASrJfWIqtmbji
ZY5sZ/n72w1wAUBQdt1UMhmhG0Cj0egNDf7y0y8j8vb6/Lh/vb/dPzz8M/p+eDoc96+Hu9G3+4fD
/45iPsq5GtGYqc+AnN4/vf39n/3x8Xw+Ovt88Xn86Xh7Nlofjk+Hh1H0/PTt/vsbdL9/fvrpl5/g
31+g8fEHjHT8n9F+f7z9/Xz+6QHH+PT99nb0r2UU/Xv05fPs8xhwI54nbFlFUcVkBZCrf5om+FFt
qJCM51dfxrPxuAGkcds+nc3H+p92nJTkyxY8toZfEVkRmVVLrng3iQVgecpyaoF4LpUoI8WF7FqZ
+FptuVh3LYuSpbFiGa0UWaS0klyoDqpWgpIYBk84/AEoErtqJi011x9GL4fXtx8dK1jOVEXzTUUE
rJVlTF3Nph1RWcFgEkWlNUnKI5I2i/75Z4eySpJUWY0xTUiZqmrFpcpJRq9+/tfT89Ph3z/jthkU
eS03rIhG9y+jp+dXpK+DRYJLWWU04+K6IkqRaGXj1VilpClbdASuyIbCeqJVRUoQKpgACE4bRgBP
Ry9vv7388/J6eOwYsaQ5FSzSLC8EX1h7Y4Pkim+HIVVKNzQNw2mS0EgxJC1JqsxsTUuxiAFHVnJb
CSppHofHiFascKUj5hlhudsmWRZCqlaMCmTLtQtNiFSUsw4M5ORxSm1BbIjIJMM+g4AgPRrGs6y0
F4wzNIQ5I2qSuIhoXIszy5cdVBZESFr3aOXE5lFMF+Uyka48HZ7uRs/fvL0PcTgDaWUNA/rL1Cdv
00mUB47gbKxBBHJl8U5LIp57xaJ1tRCcxBGxD1Sgt4OmxVbdPx6OLyHJ1cPynIIAWoPmvFrd4AnO
eG6zChoLmI3HLHzkTD8Gyw+cNANMSnvt8D9Fd6pSgkRrs1fd+fVgZmOH5w1MuWLLFZ4JzXotku1u
9ljSjVYISrNCwah5aB0NeMPTMldEXNtE18AT3SIOvZqNiYryP2r/8sfoFcgZ7YG0l9f968tof3v7
/Pb0ev/0vduqDRPQuygrEukxHNEOAFE0bNJQQrUIdihBZspopY8PFRlJkWwpSxHm+0LGqO8iQMFR
VRCpkCx4nj6w9lZMYGFM8pQopgVS805E5UgGJBr4XAHMXjr8rOgORDe0MdIg293dJuwtFZzZ7kRY
kJwCtyRdRouU2QdTw3i0QOJtwXPJbhXX2vzF2bB1Kzo8ChDO1ivQcEFVa/ZQ64SGXfL298PdG3g6
o2+H/evb8fCim2uqAlBHBcmyKMBbkFVeZqRaEHBeIkcAa/eE5WoyvfT0V9u5hXYn1xkusMhoKXhZ
WEssyJKaQ2TrWDDzkas9dD/DiMFhq4LFMtBLxBkZ7pSAiNzYk9ftq3JJVWr5ErDzktraHDcS56wh
gZljumEDSq7GgK7+UfPWREUSHBlMW0gtg2cFhhHOsN2pxK2WQTqAcuHBmuXBynKXnysarQsO+45q
GPzT8NKMuJJScU1r6JBey0TCGkAdRURRy8XxIdVm6hx9mpLrwICLdI3M1j6ssIbTv0kGQ0pegr2x
/FERV8sb24eChgU0TJ2W9CYjDgFxtQvZJo3Kva5zy1nnHI1FrRS6U8YLUOLshqI51HvNQU/nEXXY
7qFJ+EuYqZFKHVbCb9CUES1Q02rTa/myRoVahw79HRQHawg4AuieVp2bYzvryFYDCJCTGM/JMadc
sl1tvcPGRYBsrUP7WzrqYEHA8UPfIzhKUoKnEYTQggdplWyZkzSxBEcTaTdoZ8xukCvQUpZqZNzR
9rwqRVgHknjDgPyac9LRegsiBLN3YI0o15nst1SO29m2atbgMcH4wuFZkZzYLa3ZtwROdhOnIf6v
zJIPFA0NsrnQerQd8TBLDh4saAfn4Ej6Nbwn2YLGcVCt6+gND0XlO9K6EQiqNuDVgF20INFkPG+s
ZJ0qKA7Hb8/Hx/3T7WFE/zw8gVtCwFBG6JiA29h5G8G5tKoNzdia2w9O0615k5lZGssXUr8YcRPY
Bh3yd6cuJYuw0k3LRUiyU26ZMOwNOyXA5tbbbMtzmSQQiGmLrJdIQMM76kTRrIqJIpjnYAmLGgeu
s4cJSxu/v+aNm2zoxCY7t7Tj+XxhS5oTH2pUQ5VcsURdTc5dEEYWNejMEcssI2D8c1DrEPlXGcSi
k/kpBLK7ml6EEZrNaAb6CBoM15EKHme01gq48Z8sI5WmdInOOVpWOD8bkpb0avz33WF/N7b+sbIu
a7CQ/YHM+BAZJClZyj688SeNNu03tnqjISXgi662FMKwUMgqyyzQSlK2EGDJQeDAdNuifAMBWRV2
zRrQbOppGprrVFedBoIot0jttYRxBPxtYxk+mVlWf01FTtMq4zEF598W5wRsFSUivYbflaPri6XJ
uOkUj7yaOtO37nGpc0d+9K+dxjVqxwrj4UZTFQ/7V1QewIWHw22d0rT7kQgPmz8aWbKU7noOer5j
NqcNalqwPOywafgiyqaXs7OTCBXzgxcPhQo4/0PmBY5FnRHyeokokyqs1syO7q5zHvYYNHw9G5oS
RA6kOCIF7c2aLichT8MYNCaZx9SMxgzEeN0bB/xtPrjkbAPGo99lFwoANegrqBBvZkFJaiZ2W3Mq
iS8PsDvrOjPoTiln06EpJSVKpX0GSVAniu0m42HGg6X/CvELFUNjK7oUxBfPQvgOhFqVeWy7PXbr
tEdZmbMCU5RDs27AtcVEhzfeDpWS13az641+A4vKCnfRtTELnFLbz0i6UFw3g30aHY7H/et+9Nfz
8Y/9ETyBu5fRn/f70evvh9H+AdyCp/3r/Z+Hl9G34/7xgFj2uUfzhkl/AnEUmpeUkhxUKsRXLtWI
RwVsV5lVl9Pz2eTLwJ65iBce4gDafHz+5cR8ky/zi+lH5ptNxxdn7883n80nJ+abjKfzi8nl4DgW
v2RBo7K2aGCWN6fYNpmcn51Nw4fEwTubjb9MZ75/0oKnl+eX4wsfPExUbqgKDwb7MzvvDdaC5+ez
6fRsEHw2nxpONh4l2TBob+DT6ezibBg6m8znThTag5/NQ26rh3YxPzs/McxsPJmEbU6NqHbTbrCg
uKLKrBKSriE07oRk3Nsiaw8ELUDpVSpdOHZyYKTwYdLIX+MEjse4xR6Pz8OrkTwC840J8FZnYjIW
HMVgoluCH41uR0vF+eR8PL4cT98jl0L0MxmIiiGak2VHKqxsPAmquf+f3vJP1nytvfYhu40ok/MA
joNx3ozi7+aGGDd7Pu2f6RZ2eWLuBuls+MzXKFfzqdtetOP35y7eH7Zohr20pL0ooRGi4RzcjJA7
gQgpQ0Nd41j+rM63ZZHfIjP7EkjoNOXV9OzcugEyDjRCQrnEMrNsdw4esqzjrJYfGBBDZIzE6dwv
IlXMMu86hJdUmUymudMAh8YaFhPuDUjnAsDxFhJCY7D+9r0oTymmnHVsYDXf4Am1twFapmdhnwVA
s/EgCM9D6DDeXE262MtwdiXwpm0oL14nDEBqvdxE7f7gtSXEE3WgMgjuRei1t5bSSDXRDYYtqcdt
E2YkOcaRzE2tdjTW2e0kdDmpHYwKixJ0qtEagUYY4TopPSII3laF03k18NRFVRuG7WgEO+/6oaZV
suBVgiByVcWlS8+Ohg6PvmvEiFxLDxfoa04mrRDnGL/XgSCYBZqObZYCdg4xCsl19AZhQOTkRWoE
mk7B7/SKNsx5l3IRO6kwrpMomL9ss21GFkJJsHqMbaXUQoyBp7k/viLLJSbc41hUxLVoJiFhj9o4
pn9efp6MsEbm/hU82TdM0Vg3Sc74q21FkniR+fMaUjz9hxohleja8IxFw4q9ccY6k3OKIovq6Qep
LgnvEexmbHUbSBHEl6rH1Cgv+vQNzm3RNxumzzcVSuAtSaiOpb5/a6WOK+B2BH6LpQ5qHMxdI6AU
uRYBN+6RGgf69tqihIHyXWJqRhDMT6nAhgwuxlrw/MMLJlmpeT3kdJwazJrw7IMSQMeFH2gCP2Md
YHvTDg7pncJNz1cvJC1jXuUZ8yG1GRCMC6audZmPVxNhqMFrHczaD4kBGlDMHqIUaAWDmlxQuxLG
BaM1reu9/BR14rBz8QzTPf/AONZiXpTFuiDtZ6syiybhW39nhFAWDu2Mzt1mbCmcC//i+a/DcfS4
f9p/PzwenmxCOq+5hGgpD2nFInOsUDZ4IQqgKLVMNfxucpOm5Mi54dx+rQq+Bf7RJGERo919SHho
b6iKJ91MCFr2THTtKuh14YWYZIvUOXiDfGlKTGqMrMVoix8Bxu4eDjYHda2FV8Fj12yYDm335Hj4
79vh6faf0cvt/sEpWMGREkGt8qympVryDZbkiUo6+skG+7UWLRAVj2OxGkBjGbG3dTE64Br3u+A2
SuLegQUx8V5LX5mHw9BQF57HFKiJP94DYDDNRof9H++lvc1SsdCNncNe9+Y4iHGSH4N8CCE2qx8c
6eOLHVxkK5HffIkc3R0h8LRv7QDNcM4VvrqtKlKiYrpx1DP+R2JSzS52uwbX82UalMt1gxD2ZYD+
glljWJA6sV2RjQwjNEnlIRJ0hN8sJd+A+zJAg4O42vrjgJNTLCDwv+4oHYqMYTnZ+0g6rzsdfwxv
Mp2/w0KDdnke4sNXMJ9fwxNZaiyguGxwT2Vq+Uruj49/7Y+HUeyLVMsItKo84qm7bwakDYVf5dpK
xFDPotfTZT8G0Hj3loRPIgTH2RZCaIwAIWyxrqu24NLVZRnh1tayW+UxCkKeNtFf4all0QkEIa2b
WS10wIpeTgraYHXbPOUkNjdrASPadgHPVTAJeLtKbFVIwuuwFgbOoihyGVrIiMEqu8ZFlM3xVOcb
QRzSGoCEnQnNoij4YflOOaMtOV+CG9NwvQfAizxd26PcWL4GYyEbKEMeACVAHvgsSYK5j3qUE/2H
cTa2lwuOWntpaS+eZbsqlkVwAxAmo7KnftXh+3E/+tYcEqN3rdJMPLQV21gbYpoWRebETgPjNODe
KbTqJJhQJUnZjfYcTyTzIlBtivdW0BQfWM794dPd4QfM7HqcTk6hLl1xchBu269lVlQpWdiOHToy
4AmuKaZZaJq4LyW0CHdOZZnDqpY5Ru1R5ERsGnHtXx2bVojygoCkzPXtMOZ2wf9n+a80ckszNJoT
o3SpIl01sOJ87QHjjOjaCrYseRmqSgUeoGtZ1+b3ETQQK65MAjCQaQKfRbHkuinO6yOsKS38mr4W
CKPWebABYMyEzpXZatJat3khY97aVNsVA1XHenuGL3RAhdWPXHzOQxgmK4K3OhiC1ZtZkcJnNFY/
DW0aPrcZ7OjELrpltQW/ghJTh+nBdJES0hRq15Wehs46a9ZjSUiuQ1C7wKxGyyC2XxKsM6+fI2Fd
bRCMpdQhlHrrjKBWkiSw+qzYRaulzxPTal4fDcBiXjr6uFtFncTEXKNTc2xhII9SYLGfxnbC7H4i
xo3CcydP3evbxbhebK8ED2ZIzfL6Lyxs8PC7ARsr8HRgQC/kmI1GfdWE8SE8hGFVnCVRcGBKTNdj
MhBUoRaXwBnVoCYHEhraKdDyBnBhXmWXU8moeIHeiOmRkmte+ucm4sV1ow+UXZIZpViJtABmg/X3
istNrddsCvNrdg47LliSgHPrrbbH6FoHK1G0YIE2VU2CWmx3tlgNgvzuZk9cnI6++n2fqFYhaAEb
OJviNnJT9OdvBm40qGJBcUEozPYqsV7NrneUfTsd8c2n3/Yvh7vRHyZR9eP4/O3eTUAgUr3SwCo1
1FQgUrc0VkN0dKyqeXVheyan5nW4gG9C8aaM2St/pxFETeGa4T8B8mVzxEJC+TcmKBjbfNCDaWaH
459h9bPtIuiKYIlVq1eTjoT6iAbkrjm8+u1MCn5B6dywLHA7Q+Iq84m3L+ZlKzjc+ABVXNfvV97B
qBarE0jvjPGxAdxXhoModbZkCK3M3yHGIJwmp8Y5TVCHVD+7CONq9TVMUwsepKjDGKTHQRlmkEY7
xSAL4TQ57zHIQzrJoK0AH+8Ehzr4IE0WyiBJLs4wkwzeKS7ZGO+Q9B6ffKweo8r8XeFub4/N5V4F
MbFl81HvmM7g1IK9tZ0rsZU0GwJqkgZgrXX5WtISaxoADfEt/TYM8TuLbbhrr72znebBBHCPFIVN
V/dqTBsw+vfh9u11/9vDQX/JYKTfAbxakeWC5UmGV8v2BUGa+K8kajQZCRZ8dlrDMyYj1xcRFH36
oAkZok0Tnh0en4//WJmxflB8suKgK1fISF6SEKRr0rUe+plRAUZaF5R43kY9SaFfvqvQNOD9gpdB
Q6CNSYl1dRWdj+3jDPlq+IpFi6MuZOkHjvhAvlr2YlkMU9u+1nqxJKaB4ZcYrNNiFmo/g3Uhvdp2
t71e0iC48X1583GJzvB7dfGhRyNFCj5toTQndNVQ611rr7dJLliFHkvUxKgcwuUd9u1fOxKmFir/
+c7qWppKBhV4FQLbolhiHkh1RSIylM1rGKAlApivB72aj7+cOzvXqrSaLQlhaSn6fO21r7YQgEtQ
WCbbYhMUCpzC1yBYz6urbUJXLu7DQ/jZv+PsQ5PgUyKAYtUVhElfmrabgtu56ZtFaaVYbmYJT537
nRtpnj0FRm/SPTrtWDGugwC7L2wFFYK2qRYtLZjVCb2CjpsnSP0Qt9XKhX5O4oacqwxUEMP8l62k
CX6jwQvX63o1zNc5AR0c62pB82iVEXEyHsPpsYqXkdQOJoZVaTdHTkOLNsnB7sGd1szx4c/724Gr
CZItrHjaZF3Jyv/uSRFZ2ST/h3X73W9s9tQFBh6BQrM+9Ysy+IIYoEQWmTOMbrGK25yxNKy9qgwX
lTloeIA/hBy+QXYQYWNDmgSXnkmPe72PnNgjgV/BxHqAI+acuqMJUynYFE3g02mP9apc+JPge04V
fPSHUKK8rV0IFsOxomB/XQDjG7ehEKw3F5EsfNvdGBzA6oX12Hb7/PR6fH7AbxH0Lm41nUTEG+I+
ctSbscOnhLsq34Yuv7FnouBPU/xptTYvTtzBRETE0L7rLxI1Ej8gxTU1Plv0i5IB8jYz8JwyT2ww
jQx20M5M6uHxhY/9UMZqrGWvT3H9PAZEOzu9tAaRRmQQk7ZPh3SfYbTmynoYI/Ccq1ZoL/ffn7Z4
04OCET3DX+Tbjx/Px1dHJEC3bz1OxFtNlc+GWBC80DtNMPTFCoAeljWOeV/mj86y3fmQOID6J2Iy
2/UkAq9/FOYMT0wXfpSmt4u5X1exp3RfhhkBaSoUevJOhAIDdf4Oa8zt7nI7NOWaiZ5uo5rIyttg
WzPieziPUHO//2U+0BzaXBp85eWt0nv/XxviU4Jmgp7n30AT3T8g+OALoifufME2lKVahoYp6bYU
Fck8SNaJWc20+7sDPh3X4E5t4leNQockIjF1yn3s1oajIRCu5ASo24ymfuJdutrStbC+b20Bfbr7
8Xz/5HMZHzTo26zwmzu7YzvUy1/3r7e/h62LM7bcwr9MRStFo8Hxh0fr2AQWJLbZloH/5/+udMVD
xNyLAujo+Uf1Mj7d7o93o9+O93ff7erVawgcHBOmGyoefmRngGC6+OoEXIX0Sg3icsUWrs2Mzy+m
obdW7HI6/jK1l42rw7suc/1tDyJIwWI2cCl/f1t7tiPeL/sszWXBiqbFwPEH719lRTDYAULymKTc
jXoLYcZsy2f0Nwp7tLW1CA/PIPVWsUOy1XvrpICaJh2vxDCindvZQfzSlY10n53peun7WLPG0KAW
GB95pQvv7qjDxJgcy76D4u2vqJmoviHbtLkjK84CX3Q7ABtqxVLnWICqdELzup1uRPCmwYCxUKLu
W/lP9dvPCOCdJnjFA59jRPCmTOEHWYCjpv6PsydZkhvX8VfqNPHeweOUcj/0Qaklk05tFpmZyroo
6tl+045XbTtc1THdfz8AqYULqHLMwa4qAOJOEAABkOmGJV5hcgMN0KRHQ3VUf3dRvN86QBbGDozn
rCAKRAukA7sFDqgoWOXWo9tth/IwVvHGdKsD+mTwU9So5ZZZow3ITPJx6dIxo6qr+92qrvLqeNd5
vWdvKm/xP18ePkul1NJGY121HHwej4wfAGtoLUXVCloBHgMe89rgIdKdLD0wKpiOswLNiKDcqcnQ
vMbL9QL1rLCz+K5O0oLaxemkA71CDX+VKZmbSxEcdel+iDmfkjxNO5XnXRF721KcmIsb/Ou1MR8n
sdT9hQqRDBaD+unn61ecsIcfTz9fDE0LqGAythiRJcyP0S1uA4Isher9BSlUlVFQaZNsQHIGhiii
o4mMMj7zjWhaE47LvIaRIz6B5S997mZQyvUHLXfKJvsu8BYgnbHkxXZqmLxcQrxrqsr8TssRzujL
Sbm8oOPpd8zGp9IBiZ9P316eZdbih/zpb0tkkWNb1Z6VooZLMLSkoikd07U2ziHWRMX7pireZ89P
LyDU/P71h6t6y+nNmDl4H9IkjS0Wi3BgG2MiXKMxGEMUJVeZnqwik8ghFfKyQ1SeuxtLxKkLzMIt
bDiLXVkLFOpnAQELqZZKdQcOZk8zZWeKhIvELRCEisiFotO6tfyiwgJUhd2U6IB3G+Qampk5pbg8
/fihucDjVY6ievoEHMKe3gr5Y4tDWLPyaG+7052bPjsTsPdtoXEwFI34bfHXzkxKpJPkqZYCW0fg
TMqJnCKIdXSV2WM1YEa7iX9f9JRHvGmhhF2DqGaVuhAwWU68DhdxYg1KmQqJMKGCr9cLC6ZsrGaz
pF7gaY7Sv6/oK2a1BBWxwX15UB/fmHuVFvTL87/foRrz9PXbl88PUFR/fNAcoC7i9draPwqG6aAy
1pIoy4CJGAxozfKIn+z+j4j+AlpmDrt7Z3EirwR1SSdZQnyqw+U5lHkl9NnjIlxb+5HnlhO4WgVN
RBl6ZeEisfcw/A2ykohyFQ2tXyH1WBA7eR8rHYS73tr19eU/76pv72KcIseWb3a6io9Lkh+8PZ3G
Qo1kCrLGYdNwWJQRGUY3fpbGMarKpwikUzNI0UOCvvieApvoJr+wtpFWxiE+DUJL8/S/7+HAfAKt
+/lBtvLfivlNhgZzzcpykhQdqIkKFILaiTo68Z0BkigqMIY/FxFRfgXsI/TA+275UErlJAhAYT1W
BLyXgMiOxFHm54WqF6JIKdP5SFBEzTXNc6riPEZBfBma9s3pywk/3wZUBt5aeX1YRjmwD2f42jLi
BPxYF2xYZm7NKHOzzLdCJck12wSLrsxiuo9kji5tbrosV+lWiVUWXVkZ+w4hNedtuy+TTE/aobWd
BA9p3Ww4Kk/rxYrAmCbjqWvi7Okyef8xtdlM5jU1TBTLsIO+UBtjMAe71eEhPL988BTEW7u5Rk1m
UCUhfX35ZPILXjjBp+PH+J/xRMKIkfY0enIZP1cl3pR4msXrcV3KJuU1CBoP/6V+hg8gETz8oa6K
CZMlFqA+oM6Dt4syS5JNqag8aYi9HKzlBIDulktHaH5CBwDrrJMEh/TQvw4SLszaEIsOMrR/zUBx
zC+pXfHpXqeNpcWfDqAzR8WGzDKVCG2H6EHXoJdeSibM4BsAohNXIg7cAALLEcKIQQCgcmMgUefq
8MEAJPcyKlhs1mTnYACYYd2pMvmwBzDfxEwrqRBVfjVrrUBmUqkzJ1ifmkdzwGnwGt5RBTFm1Ljb
6BeSAR83jmveAU2FVw2HCefL/LoI9TCcZB2u2y6pTWdvDYzGMzpmS6OBJUrN76Uo7vbTHvUpKgUZ
uqcE6YIByxDa0hIsK6zILQmC40YTelnM98uQrxa6+zIeniBRalMLXCav8O2EIUpS912rO5ZrR7gK
x63gEDAO2D5hFxdNrUcx1gnf7xZhlBvrn/E83C8WVGpLhQqNtEfDTAnArddUIqOB4nAKtltNcxng
sh37hR4eUMSb5Vrj6gkPNjtDt64xOuBEeiHgDoJhApmvXhJWMU4L4aMdDb1NMstPYrgoGp4hGgvr
nQV4kqXkEcZ43DWCa32rr3VU6ls3DvtkucqhM5VRoi/utaDCwAoJKcY0YbXUej0Qs/zGdwdcRO1m
t3XJ98u4NVLnjfC2XW3IjdVTgIbd7fanOuWeNOiKLE2DxYK+q7S6P47RYQsik61iKKgvAYeG7SLO
L0U9BJD0QaZ/Pb08sG8vrz///EPmzH75/eknKDuvaCfD2h+eQfl5+Az86esP/FXnY/+PrynW1pvu
nc0kcV4uptwzuIhqN3UB+/YK+gycDXBa//zyLN84IxbTtaq9tt+5IoZOHNPy9tG8EIG/R8GpDwht
0hgPkftv2oGdxieP9IV7JcpjTCRDy7DDZjJ9yibwhRueaIeojLpIo8QXL4yUJ8bZo+wYMWeDqutc
fyMS/ZD1IqgPpiagMxym3BrGRZ/r7MKt2GI1gWmaPgTL/erhH9nXn19u8O+fblMy1qT9Dc1UYA/r
qhM5fiO+rLhx+TJbZb+qfvz56h0XVtYXgytKALCdhLLMKiS+P5YWuSGwKAwG7hppMxRY+R2fDdOh
whSRaFjbY0bb9zM+BfQVE+D/+8kQLfqPqgtPVTVWswdMV/Po0no7MJLxGMS1smt/wwSx8zT337ab
nUnyoboTnU2vJFCZv7QZ8flqqg/O6f1QGd4DAwQkoXptmBZNzG7nxRgZciecOB8obXsk+CiCxZqq
DxFbGhEGGwoR5zXfBkFLoPDa6Ix3MJvdmkDn5/OBGo203iuXKhuBqqIHLNdpSpUm4mizCjY0ZrcK
duQIqlU8N4R5sVvqCYANxJJCwAm/Xa73FCbmdCvqJgiDuVbw8sq7+tYAgCi3TG9C13inrps6/Aiv
apBv4Vynm8Ojgl88D4xNswEaY8b4qX9AY7bxorpFN/M5AA0pvehiMg3qRHUpz2ZaxQl1UgXMt6Co
U2IcoNgV6/ImSmICyz7yTUgtULTxrciVtoStSn0hirAT1SU+qQl0eyFu+WqxpAT5kaQVviHA1zI7
2+HJIYpq2L60iDgSHWLaZ1TjrDN4YKscU6XOkMhUAGQogELjGCm+rWlxExAvJvEdI2YuXZ0iSvh2
t6J8OU2q7W679ZcBWMojyiBq4OwJep8RuhipVxbkHaRBdwHGxtqYNXSnD5cwWATLGWS497UBTVfo
ocricrcM6BTJBv19F4viGATUWjQJheC1ox4QJJZI7Se05HKXYiWre7MPSbRfkBmZDaJ7GcFqogf1
FBU1PzF/19JUsDfbge+8RPSOc8nQ0MBsH1eKuo2XdO5inarP/+1r/rGqEvZ2y04sAd3wjapAGYcV
2Pqq8j8iolPxDb9vN9QZaDT7UuqpI4xhOYssDELvlk5z8oQxSTyr4RahKee2W0ijEVm8IvEpjzol
iAdBsLNzsVOEMV+/PdFFwYNg5WsW8J8Mn+ti9ert+uQfb0120W4ueSd0W5mBL9PWfBvNqOK8Dd7a
lyCaFP0zq/REJqDHiHW7oI0iOqmeCC+j/N6NtrFj5eG/8vfGfAjJwd+Y58i6xIdgpTsPGL2dYfu3
ROww4sHwSjQIiv229W48xC6oFzhsoiCcKyKgbJJG//hBupBUnAnP5ixa3UBmLvJgud15jjYsWTFH
P76OSuPdOhu/LHydQywjY8CcNohLc/AuaqSQjOkXSkqKGPdOsJhtVOPsRD9tot4L+iVi6RAa5d2v
F4/P2NNp5GzKD+id9jb3k8OZV78y6KFXGED04x1TJ7FfrFGAaBmv1hdOma5t6lkWJouL+P1XmKX8
nYFG7Vnfgq92PsYAq0RKBJ4jCdDhYtHa9x0OxWoOufZ1UqG3b3QPU3l6xXDO8jSijBMmEfdzNy6C
UH8SzsQVme4MauFqz5hIfc/b4ovMwrm0L6lo4nZH31Uaw1jzzXqx9XCvx1RswtCzNB7lIwY0rqlO
RS/2e74GzXWtm1Z69c3KI6Ggu11d7GAlVSVogTOaG+hEwcpvmYsa9liVEUjONaiAjn1RqUKgg8pm
uq04FFFA3mP1Vrhlu4AuC2HluVT94kV3le8OVnT8yGCxbLdbmA+3pwTZftn3xLV7trt9uFaFOEh1
mqGlZmysSVBEu9V64fbhWIeU3+CAZFV3AElcjx3RUEkaV4kHJwfGrS8STIZfiJSSx0ZLJofjtaez
Sz+34sPeBsoo7SJyqe9wTDH9hRcFjotg4RTSpEd8MqtqPFMgt1UY7IxhtvvX1iEs6jqlYvv7YpTJ
xT9ZA4FnCC/yh7f4OsqLiM+1sY6z3XpLMZEefys8s44YT6vkpDeViJo7XmLjuvBWoPRkeilLnGeZ
I26zHHEOo2jz5QynYAWMSnxxP4yLyKPZ9tU213ADk+phMRK9WWtoq3xFsB0IvPXIkFe5ksn+wdmI
Urkc/xl2w0VdsDjwcpumYCv33WQE0vYSiTKDjiSkOFiQTH8MbYDYsoSEh0l/92nTB4EDCW3IcuFA
Vk5XMvKM7FEofshrldPTz88yao29rx7wlsvwSTHaLf/E//vre+0SFxGYKuNcUPdwCl/HrOahXVzO
DgpqldZElNLY16Tug4nSAFSYby2rD5qYoo5quu4qr2NAcsr60g+CNF4TRaqLEh1+GUZxrOQYFant
QzReTVLzMd1TE5eS6pL796efT59eMZzWdiwSQuMhV/MFiD7htUyjo7Ij0eEwVzHQEiNyug1IvR4N
jLm0EiO/zKVk7R7OEHE3WIVy25Bgshl5Im/ML6LCeEznIpl/+fn16dn1v1fGPT1Zt4nYheuFvQh6
MBzvdZPKgCUq9Ib8BJ+3XETdFaSyiL6d0akz9Kg6k23ShpVuW0HzQJ2GdiwwKuG+8gtpIyDfOteo
yqa7yOiwFYVtMOttkY4kZEVpK9KSfpheJ4t4jWnNrlgWPWDJDdgJjcpM927zqzeHsRHhbkcdqzoR
cI1gZ9qEjOEUm/WW0ut0oiEVA90J2ESp4UplVs/9U8neGlzrurJHYfDh5MmhHB2/f3uHX0BBcrtJ
1x/Xc0R9j2cClLAIFk7RE8plHzZJMIOa2SXjm+LyRYO0YN4kHUOpHk/+Hu3ew1uImbbMXez2JCrW
VZjvA9hEoAMtA1JQMwioVciKmRWMmyo3jIgWwjtLI8HICQKLgp9AcGPOhwqsfbajCXwV92gvX+/x
SeGu6xOnwi4c5MypN8y8YQPSgN5Wf+CFAytomLcM6d6KrIBo/Yh7u/GcZUZmeQPsH/Y4LtvaA57b
AXGwYXzbzixCOCoOaZNERK198LQP7uchSlb8IKJjf244m96keHvY+g/IY0jD4U6UGQ+dk1EnOkSX
pEGlPQjWofb6qUvp6yHL2k27oSQYdBnGT2eYRctBnqLHZcS9PSK9U3DNO09ZJgFVoFM7CNFO452p
ayhtrUc2deiMFcAmfrMMnQIxmCmv58csxtelZU4PdmQxiKLuYe2S+HcTKO3cPdEV2PsVimaPwXLt
flc3CbX3avRCeXvUZYDRzHK5poeLb44V8s21Ut0oQQygv9I+4A0zrWP5IY3QOsRttdXGdsPGdDph
UJEtGiNGDW3Dri0WTW550/UolcKnTAw/RcwJl4pese5h8T3Oo8T0tonvjxiDQQYaVW2k4jNyvVYJ
5gUmM9Dbci9jNArquWUGWHfUGsH0fIxld0pybbGOjmiGkqlD+yAfZx2X1WOlJ/Uo8YleoxSZWQXG
5WK8HaKg3DBnnq7xlBFHh8UxsdLQO5VOoonNrRsYQa3sCQba6TXNfxujtBhGRZ5gHnPDRohQmdwL
A6wNA5bEYCSEctujzVdIBC3EaI65t8kknZmtUIHg7PaR3yIRn5LqaDcWjW1Vllngc8y7Q2EMYK9/
IUaSHMi45LKOC7TR6WRT2X0ZB0HgAHJwOq9N6W16VNYGyWdBGlYZUV4TtjIT2I5wfI+rKY8xhTsx
c3wnjJOLkqDxMdKJwgnXnFBxdGUX8nm26Wt9kU7gMb+ig8FpoeBDGkVtiuoaMwSNCl+fWOETYWKa
9tbAOmLaPoK5y4qo7Fa0jXlCr3RFMW7ClRLQxwxynqZMNWG2Yk+aTkC5Zrdhn8fwr6bGHESX/G4k
oRogMqMfAe6TawxJ/dzGDjy/X7rNhcu3hAwLro7DxDgqA5lj80J7tRueoF/rwh+ddDA106IjeEw+
MjERhMp31q80fwJ8QccIAKbPoWYm1UUEN7N4ISjKj5WRdHwA1nE0rDzs3GgPxQRNU0/7lfkAJQP8
9+8vr29kKFTFs2C9pNxyRuxmaQ+HBLdkcCBii2Srp8foYbsgCOyCTqxdnxLyyg+wbKdHRUoIty5r
AVYz1pKXVoAr5bV1aBZSXlnCIhBELnZRnPH1eu8bDMBulgvim/3GN/tXPUtjD1BOntNK/fvl9csf
D//CXFt9cpV//AFz9/z3w5c//vXl8+cvnx/e91Tvvn97h1lX/mmsayd/r4TJQ8WZOLGnfBolqm3t
xoIeGe6Wa7sQALtelBb+XJWR852bmtfcZCqY3lNqjGykFx6Nz4h8ByY+xUfqZdpFKqTfSztX5KDC
eNqaZsXSWnTpMVw4bCUt0qtv8atja22WYgrPA6RTjw2otwDM993UJjue8qj03LziriqO9je0XazH
gDrosFNW1VZCYoR+eFxtdwvvOJ7Tos4pKywi8zoOz2YlVnZfCRIb07VEwrab0OE1xXWzaj0BBxLf
0ue0ZBkgLSXME0gA+EpGr3g6UlkvEkgYmVhcsrPYiBTUMQXsH6ekuvTNVN1a+7lGrSc3XgRCsG45
08H6QyMIaBizJr05L50p58s4XJHe+hJ7kkmNTWOYYqOFIKOnFbLJzJptnV7CPPqDRMGGzHynhMJu
rRrEZak7w0nYpdyAdhDemFP3vfx4AdHct8WcxPAjUD5Y6204lYaaQHeZXfZ8zjKkuBWkswi2S6Vs
t3aVm4ReQnOPj5PE1fuZDWenxe/fMgKx8NvTM56N75Uk8/T56cerX4JJWAXcrbuQXgqSIC8tZtxU
h0pkl8fHrgLl0MSJCIOXrtbeE6y896HFsv7q9Xdo0dRG7fi221fkbezncn2sVCcupXpa0BxBVKtk
ylc4b70D+diG+83WRA/X4z5x0VjWPU8wV3Qu3wVJPe9Vq9MSw+pNc/8ER8HVOaslxhtzrgnuY3lL
PUtCUnKE9Lkn9dKTm4ag7GFWjH3NvDkDEDdWoMPSUf9Dl8zi6QVXZTyJ2E4ELn41CmdG3VGzp32S
JFKctnuz7j7Z/nKrsyRFW5gvYjEp5MFatS2SiGmZ/JmWR0Y+HYFIQurTwHQ0dE9g3UZMwO7EDVeh
HtV9dKFMHCLdLwKBTrZ5CXRvHuWkDhKcM903r0zXozE3sqdzJg+RY2iFCyNMmcqdPiEYTofEQajH
DDLg1pbsJFMntXWX5WlL56hBClsaRhjIcvAz8/fTkuwM3Ac7nE3D5fVutwq6Rs99NPbZ8DDogeQw
uGMgZTr8LY49iMxGWCKfgvUinwE7m7kt5ajWsOwydiGg7sTBuSLYxz4TjzFSlToSPGMl8/St3CkV
TK74ma+6YLE4m42oGuu9MwTCcNGXEgOu4x8dhlfni9D7URuF9qAqmJ3OEDHDcy3eldT4uynFTXfj
G+LmSGeKpQgG+XJDDC2Pgx3o5wtf/1Dw5ExP1qWg9t/AqeyWjVfCZoXyfCxE6Lm9RZJav84YIB1o
EhZUKHXRLF/mtbOXi0WCS5OOpJN49Mibw258czSKs9aOapm1F9UjKsGKgIYLYG1mWkUD1/tfmxuk
lzw9zRJVHecsy/AW1yq1ba0Tk/AaAmiL2fgs0CDX6rC8tpuG/lg8gh9ZffT4mAHVIwzc/KQhRVF3
R5tokiv+fH79+uP5y18gURBJe+Q8mIfw+Gn98/vr90/fn3vZxJJE4J+V60SOXJ5uwpZ0nhlWubVa
5cLHywUKzu8gOEkvDdFUhmBSWFykYNKfA72SMVU/ZdrX79ngD8Nmqzx1ObNytU7g56+YkmkaAiwA
7bhTkXXNjT/G3MLKklrzoRDiERyghqWIj3qc5T2L3jcNKd0zia5pJP0pPtb5P/LR7dfvP13brqih
Rd8//cdGpN/kA6v16Q4n8QPmvClTcauaM+acllPFRVRgHu6H1+/QjC8PoL6AXvVZpowHZUuW+vLf
enIrt7Kx7azEm9xp6IaHHXpEd2yqizG0rIQVS9IDvMsuZWw9644lwW90FQZCaRRTk6ZJ6BsT8eWW
PPVGAgzN2Jt1/x9nX9YcOY6k+Vf0tDtjNr3D+xizfkCQjAiWeIlghKh8oakzVV2yyZTSlFndPfvr
Fw7wwOFgpO1DVSr8c+I+HA6HO6fXuUk81G6SOFg+OUnAtvTSYSe9jSl1Ig/7fDaU3Pm2zjrPp05i
FmrZjbF0+08E0/hKMFqc/lOz9xllQ0nV4azI6IYOLmGuLEN93KuoeKliVnOz9DSSbLOiai0RshYW
PJTfOkpmdTlKn04BPrQEiF0Y6DwRMpbgROVqUdxkTL2WMXi4Dt5wZKsxZU+n5kInZf4tWEOxrBva
3Uq0oZ4txQ4HDkVfyQ/S5dmJTifxwXQ4BWgMlHVSgIENkqw4LpMucZCGn9Gsc2UbXA31Y7xn5rv8
vfEr610lohciDQP0GKEL80dzyHUPrEqYIlPhSNDxWnYPgeNifmQkDkgemXsAxDgQOao3K6kKSRTh
2n+ZJ73Fk9dp5O5NMkhlxErHk3eRIcCBOLIVO01xqVrlwT0+qDzJTrEfMho4aE/xsw8XkUA82k0C
GOlBMKILcha7liuYlSWvtX4yGZIgRFOvE/yd7MogbLyxb8UN137J4DJhd7Jtx0EdOE+drDlQ6dpN
mgSCNGJB4Tt+ZYdDfUJinyCjcAHjAF3qNhi7UTe50BGzwXsTZePCV90N35UaNraDu1fdbD+TGHf/
ZPLtLVkrV4qs5Ru4V84UFYE2+Je6Jd3r+DTcb4k0xP3vmIy781Ri261vFO6h8W5DJrvofiek6BoC
OD3HHuptWmfCNqcVQ6T4GfOJtQMYyvK+nTU7Rewm8Quljz176WN/BwvjvayTW1OeM6GbnUBRU551
TVS0WDKV7S1pEiE9vii0MPIx8JBumqEoxQo538+iTvQ0np0EzvvrK+epOzeMkdKpwS8kclBOxEWH
FsQBRMMpb3jEPvZdy8cCnLC7LIkrYVyeb0kCQH+3zoIn8Qe0cjM29Tvpe/4vFPG8U8LzryRw9ZHz
IINSKKGt+QU4WUI4S93kMMZoX+Db2H4tvfP+0W3h2h3RC8/Um3XXniYqZBdbZYTaFTvvIOGxZWQa
xbW3UYehnMo2LyqC3YIsTJIW1khgNV6o8r0DzcrGjruo6LMy0CrfE7flhNCNaGMY6Z7GSCp4dDCb
TYJddHZLDLsbj1wef1ER1i9fXp+Hl/+++/769vnnB/K2u4AYBYox9HoksRCnulUu8WWoI32JTD64
+HAQIYNfxPkWOro410PiogaoMoOHboBQCNSB38YQxZiwA/TUkiQrJx7rWi5PvLesAkOCtkESoofR
IfLn0iw+6W2drH/6CTn5CHMQF1EUVm12bsiJoNOxeLiUVXnocTN7OBEp17wzgUcU6chwnsPyhO4a
XLE9aueo5ZOyf5jVlTMglLj6dTY3baRPFA20zcFZK6zmIBxe89e+84ThMYq+PX///vLljmu2EEsd
/mXMTpI2KwARtdEw5hBkruSzfiRUgBStH7f1sH0pO4wsxs74eLG0tX0P+HiiQlOotdJsjWukabfC
FbBhdSFcPj2SThscbB3KNOFRkGsjz+MA/zio1aDc0YhhpIB7c6BN5+pRz7psO41Stacyu2ZGiezq
+AX2letyMfAOSURjg1o0n7T1S9C7LLHZowoGbtNgK4Km+RS00ZgLI9UoXeVErlEYfgu3dJh1OGby
7Zkg5USjUFKTMPfYstIa5TNv0mdya21p2sBNWV+c9KTMgcXWoWl8lGNVLStIJlsNc6ImP200N4l0
suYVURANE0lONi+dhdOzMQlDjcZN+zDaRPWJZFpeCnKFOePh0Ce9YKTOp+P8dmLdY6zr4vo4gVNf
/vX9+e0Ltl7OYSLsQ5jkjbWMp0c2FvU+FGu3Y04WoHs7k6XLSBr61mEkfJvprTJ0ZeYlrtG5NEjn
MkiWiVpbiL3lmJttZLSQp2cwOyfUV+Q8dkIvMerO6G7iYZLtDKdh7NaPVy054U3NSE04UrM3JFi6
2bL6jTSfpmGotJyEGb++snZJHEb6qF+cHuqL0nLlpy0M4DrTVhgjuoGgIu4S5r4G55eqFmQDEvQJ
z4anssMxQX6oRyw1a+AEsUDozpc59bFO/FAZcMjAmp93lTcG3PrQShkjg+aER3RGNR6OO/sPwLgo
PONsQ8V8zs4z7qx3csZOjDn7w9WXWHg0KCAvMErZ52yvdbWpvz5+NJpjNYa5sXYxWc9FL9KWceq7
qYu0GV+g7Lty5vtJYgzvkra0Nxdwtt0EjiX4slkDEdWIHrCazV8hqFq8NruX7ewe3UVKdv/yz9fZ
RNwwHnp0Z3toHp+mHeXvFySnXiArf1VEDdsnpTfiDpPlr91H/L3WxqPfViMs9FSizYxUW24O+vX5
Hy9qS8zmT+dClkJXOlVeW69kaAMntAGJFZj6guQHkt1bOFxfa1fpY/x2UuHx/Js8CeqyXUnFdyyl
810bYC+27zNpzzooJD5c6pB5bHYoMo/2Og3lsNQiKWRv1iriKqd5dTBJJ29wMzCRK3a+FRiEapV1
sxtxtmtSDvISCqc7/WRoZbQ9ypT5TkVdNptnhNv8tjmpM8Gfg82njcwMxvI3mWqKLxYyjzAWEj/2
W37ib4tldxBogtWQeWloURpJfEhNEa4lBqktN7urBZlr8WFwI7P1cIQmIlC007HqrS/7EFA+kfQF
vN6HIIqqVbXITUJv1lL4vkXKBSGGay0j5Xt66brqCaeudqAYdn6stQbLieBAirF45+a4suZxic/6
HUSYNT8C69UTrBjsUOGgwWkOZGC73dNEsiFJg1A6YSwIrGiqYywZQVdDhcHFk0w8k76GA9Ho9ECx
WjEy2t/LZ4cH6Guss9eCLCcek+6GaJ0h+E3sBLh5jMaEnYoUFk/Wii21KmkHH2MV5oNDF/80HjhF
efEui3Wl3fJpyKnAr63WfAY/CrERJRXWDcI4NmuYFwN/di5YojCy1JWf+/Zz4I7uzRyEkVN9OGAp
s2ERuCE2LBQOWTaVAS9EqgRALHsSkwB25kSSYqXzAySl2Td8bA7KE7mcCrF1BMikWhxGmUg/hI4q
QC2Z9QOb85i4tpaSLZeyULbQLxl1HcdD6ruqJGZgWf3kn9O1zHXS/DRUaPmFj9Tnn6//eME8Ec8B
wHNWNGWeSEjgWl65yCyYhmRjqCE63lZMFQhtQIQXCKD0RokYj4/NKJnDlSeUBKSeaiq2QQNrJXy5
knmCX+LBbY4UngiXahSeeC/eu+AI0cqA7e9+8jSzqMBXjrGcjqRB3pssDODmNqtLG9JhiGYMvtKH
sUOGUE4jWcO3kV3NC8WKiDgHJMc9NUpMyLgsw3vw9IulewRLzxAT02SOxJMD229I6MchNYElhoiI
SWrmObDz9WUgA+r+YuE6VaGbqA5dV8BzUIBJKQQlewiVXyKRBivguTxHLqqQW1v0UJMCKQKjd8WI
pVkOCe60WsC/ZYGHfcYEut71vP0xX5VNwbbrfZ7lHnenEGJnQQaQAGKsgDNkifigc1Fs7nAwRaYD
A9g+jUwfADwXL2jgeUh3cyBA1xQOoTaSKgdSDh4I0bUAkROh+XEMNalXOKIETzZFu4ErH/FHSyqL
j7QzQ6II2+k44KcWIEDamQN6HAAJSnHBVC1jutcZddb5Dr5IDhke0GrbWDLV9fHcvXXkY9QYrQaj
Y4YcEoyPsjrerzpjwPVTGwN61JJgtBaJpTi7y1FVo/OxTrGpVadoxmnoyfapChBgk5oDyKTusiT2
I6Q8AAQeIg41QybUrSUdVL/CM54NbH4hpQYgjpEyMICddJHaA5A6SD3nRz8IQInvoUOrzbKpS6wh
WLdqH5MQdcrWqQ4C1w9wMkiTHlbZQwFWvgVWRLbBTdnx2Nnid8xcDe0u7CDb0VuMvR96u9Ia41Cf
F21AR8PAQReCklZRwmSQ3RHuhU6Eyup8P4r3jgaMw09c++qOP7eSWDzHthAzJETrJJZG1G5bZgmC
AE84iRJkR+nGgm1GyBfsFBo4AbaVMiT0oxjZFS5ZnjoOOrQB8izxFgTHmHeFi+X3qWIFRBOFGGJH
NSaywSPbQ/Fz5k4R6HnAO5UBu4OU4f6/zJIzcob2pd1p5CrK1wXbq9GtvmDitXEFaPJ47m2e6NFD
7yXXctY0C+IaWawXBNsQBHbwcUmFZucwsuinFB4fs3ReOYaBxphoSOs6itCzeeZ6SZ6o7w43lMaa
vQTOE++eLFmLJpgcVTZEeS8u0/XYGSvi7y+MQxYjq+JwrjNc/BrqzsVdncgMyJ7I6cjSweiBg1QW
6Bb5rO5CNBbzwiDdY+hISaIkIliq18H13L2Wug6J5yMFfUz8OPaRgy0AiZtjmQGUuvnuQOE8Hh4p
SOLwrenvLQyMoWK7gBq1VgWjBnVRtvGw6Xc+otVmSIFCm7WJvmxbr5a4AEawF/SmC/WFYkQTXIGm
fSRP7QW/81u5hCN57ul5KhpyqFAT25W97SDEbVkXLOG/OgbMDYkXZeTj88/Pf3x5//td9/Hy8/Xb
y/ufP+9O7/94+Xh7Vwwflo/ZQJ5Tnk7tFamqysAatLrN1LSyOaqNqyOazwOMMS+EC9gl2b12sny2
5KO2Ty4C65me7drjIHf9NpRkQMoLv2ER6uWVH2WatWUYj8wRIiNxDgyKlVN44thLVVhmIZ8qAMRb
ObMVvhwyUlVoBeqiOXruoc726wl2wk6U7hVpIM2pHdFCzReKOx/P8Wawjz+VZQ+2Cztfc21plzhY
M3PsQAkOLc4UMJSyQ2jkoGUCL4Z9DXLmfrMBHyV1Ou6VXhglB0gRZnN3BDkOj/kAodhMaPZxi424
R4QoXAWiteQ+33br1zVj4Dj4HFnHMveAjeR870/9UKI59004RO5uuvzZI5LqEs4CS3YJUryXLBMd
WHuM4EsQSV3YW6NA7KHDCJRRtgYWt4rejUFU1iNbC3KLA+F6jC9VZ8Uhmkw/6PBS2bI/0harJx3g
GQHeiPzh3U4T8htRlqHUBtxb4mk8HLAG4iBGz0syFPfYQF6jNGEFnJ9H7C4YQ0VojA89JmVQQi0t
tqD9J6LUcH5GYxZVvHdCW1iEPDaR9WUdWrwhd90b6wm8fkbWs6qsY9dx567ZNsUshBGIVreMfMcp
6EH/RhhV29pI2MSqQ+CQ1QGflmpCsyshS0rLEyIjqZW6WsPIKcaOn9gqVJ+6PNNGZwct4OhF4y7Z
I1vLQEAv4rlqSpe6kht+MYr+y9+ef7x82eSW7PnjiySuQJzlDN0280FzCrtY2d5IkXEoKS49zTqy
ayktD1q8P4o5uGMNSWR2iaz+miBKJzegxhJXOHBBa+WgaNgGjot4UbO7TwSoS9mpmyi75uCRE5uF
qGY/p3KqSTZlNaa6UdiUB10Ckb3zcS+Jv//59hk82C3xnw3jgvqYa/6pgSJZR21DEejUj9HD5wLK
Gi3ht3B93qEmRAYviZ3J4k6Xs8hOmhV6XVTc728mR3XaoHOV5ZkKsNYJU0dWT3Oq+S6EpwLu7kaM
NsfIUWqyuCe3Bb8Bnhqi8FgsTaGRQNRGX+asqPpMBdKchX7ci6zEoMShWOmhSZOvjVeab9Bc+WkK
pymOn4Ei3BaxLZDIug3eEJkLco1el5m8U5mFA+kAiDhZ9bipgMC9kElGRB8T5zIK2No5e4VSgTAc
NeDMJDFWnzLzVRorkPKyBwSWUn7YAQQqEyCL8oFGnjbE+NOhrG5zJQ4fA/THQ0BLkq5OHGNaCTL+
dmnFIwcbamKcriZs2vgVIqL9s+XJEvJZgik2NzjVhhinJoFJTVInRoheiGSbpJab1w3HtZ8c54/N
7fByWEU5ik/gDprgfp/5erGLXsuu6LkTVytLXwx4rGcAu+wYslmLaR3nh1WGzol/VusPbSWQi9J9
V+sfod7X1KKaD5Nk1DDT49QsHMIE1+Vz/D5xsMsqjokTmzpKaJGhdaZlEEfj3g5E61C9cFuJNveP
nOH+KWGzyFiw4Z7A9gk30tZWHHIYw627ViLE8TbqM5PbAdNr8RzgneAiGbAfr58/3l++vnz++fH+
9vr5x514R1i+/Xz5+P1ZUWdtAhqw2G9rOWq4dV7eav16jkqpRTSZPtP2edMmH6jsGE9q32dL90Az
bT9QGKvOTwP7CAOLYsuT3Tmbqr5Y2plrK5jky0VJtdC601YwfHUd2eOleIApX08KSqztFNhDzY2O
mpOssOcaq/vAQxfEqAAi4WFkrLRzirbpuLwbRT9LUV8GEmxMoIVuMb5SWLRgJjPGdkzU4HRRyZiC
8IKQS666pmBA5AS7Auxj5XqxjyRa1X7oaxsc9iqX0/U3vJy4vKyVdw71BT3PR3JmIsuy+ttqiYgJ
WAtkl84yGsSV7FOJV78OXcczaa6j02C3RmiJXhBGDRzcNnCGfXe0rlASi70m682PQcNa5tHuB1Us
uo9BYt/+2nMtXq7r55IFUQ3L1W90RARDqLrF1boBcYDqCFf/GOxHY8o+ZrklHA8fe/NFJizMwhHF
9kx77xS6KbROl4ootksrSX9qtAHHcixY3m01kFOBMVzLfriIwOr0ojTLxnOhrFU6CA+9x8Xk5pO2
kCkgyOLoMNi44EidRNhdp8qjPkqSsDz00wRFGvZPh5dNCAb7mc7Tu8pbF01+xtlIgQdeKIt28peQ
5SyNlG05lO+WDnH5oIC63wcbl8WNjMw1KwN2i6M/oNKQEC+nOF7fTFg+bSuI4pVOQ9A+O5Im9EN5
P9gw3cnShogT8W4xBcs19NECiZMznnhJq9RHn0orPJEXu+j4Rz1zSTCT6VBrFY0F7Tv+hmy0IXgz
IiKRBIpte784jCeKIyxt8ymZioWJ7TPNdYiCJVGQWiH1xaMKsoP3bk2Qc7gGhvuDX9IEYCmI9xU3
5i9wsVLs55N1LmsfdAzUXRi4eLN2SRKmlrIxDHWMIrM8xKmHd8oQ+aoDRBVDLaA3FtMnjIQdSoK9
N5E4jpdPhWZqKKHXJHHQZwIaT7KXQHprV+wsris2jkX78Its51/ho3X+q0mCkmO3EQydgwQZCo4N
o17dEdQaUeWhtvFBwzqJ9ZiWJhd/z7ify6avMLHqxIR42xgRguWhbS0RJXXOa18cD5cjmhFn6B5R
6WsTU9FCcCF7utY1diqUGFk1nQjdWxiUeAG6AYD5rxupwccUlJ/hdzMGJk+x6FcxtiChG795+Ncx
fBvgmLtXZNAC3CxyaG+R5VSPY4onKAkTR2lUCEd84EpiPDjfvDHOlxPIbq2uD2yMLDE+sHLop79s
Ux1KlKYdyqPiwq7X2XqIsyqJylXZK4fHHu6LsjZnZw+8Yvw+qczQJ4PcJoE7W2j53dh22/cNnKLe
fX7/eMHioonvMsLOOOvn1uTZoaJqT9NwlTLSUgIDiIEdrzYei9UWMPcEnFfdypXmvZSfWu4i24P6
zKC2/MFrJXfUtcyLdhIx3hTSNag8lvyBQRORX+1tMPqJphQQCMmvZuhcjUccXuuygX2CNKcCHwg8
E35bPFWMP2N/YUNCsD02wo3H5gUZ8+MqWgd0lLd7De7T97ig5RePo/O9tOUFDOvYPUahlxZj9uXL
HZun/0nZgFkiWysVyJ6EsuFY9jWEscXaA9qYbTWeNi83OtKjnF4XdStf4ktf1KSq2kxt3+e3z69f
vz5//M/S0nf/9vPPN/bvf7DivP14hz9evc/s1/fX/7j7/eP97efL25cf/252CAy+ng2+y9DSoioy
vMHF4Cl7Xcu1+qMs3j6/f+H5f3lZ/ppLwsPevfOw3H+8fP3O/vn8x+v3NSQg+fPL67v01feP988v
P9YPv73+S+sHUZbhynWjtk6YhpzEgboZrUCaWByLrBxumsbY7jozFCQK3DDTpyanyyK3INe08xXX
goKcUd+XLf4XaujLz/M2auV7BKlOdfU9h5SZ5+O+ogTbhdXJD3CfAYKDbUJxjJ2TN9hPzfyvnRfT
urM3Fm2bp+kwHNmBZPX83Od07XGzaykhkea8lDNdX7+8vO98x9Y/a0QlmQO7pdzwIBn11gdyJL8+
VMiwGmFQEhhr90yev9AKdxgS9L3yioaRnh4jqo/rBPmeOq6HSVrzeKySiJU8ivXkWMPHrho0QwZ2
JgSoHWL58lylY000XLvQDUZkRAMQ7k7Qaxc7zt5gHh69xMFeBy5wmjo+kjXQcfd8G4PFg8cyHUZf
cyQgjV1Y0J6V9W6ziJJaOjZGYDZ6YcKfHEqpvbztzKB4bwRwPDFWGT49YmOhEuQQFThiH43dIuEp
0s4AhKhB14KnfpIejILcJ4lrtM1wponnrG2TPX97+XieN59Z879uNhWjSsIJpx2/Pv/4Q2cULfz6
je1G/3j59vL2c9201GW1yyN2upBVhzKQrMEh+C73nyLVz+8sWbbFwc3EkiqyBMahd0aElby/41u9
XiAQdeBlq+gpISu8/vj8wsSEt5f3P3/om6/ehrHvGPO3Dj0letcsBszCp+SC+f9j+1/dwe6V60Td
aA7LKrlfNdMRUhFgRJbc5KANKqrK7MOl4eK66Ig/f/x8//b6f1/uhqtoatluceOfaFl3qr2njIIU
kXiWdUxjTDz89lznUm7kjbxi14qmSRJbC1qQMEad1plcMZ5DTUtHM1mR0cFzLPcgOhuq+TOYfEsp
Bs9Tt0MNdVGVlMz0MLiKIYSMjZnnqDdCKho6tktihS1w0IsxpahjxRILqbUqHI/t59mZLQsCmji2
1oK1Qn7Daw4o11rbY8b6+1ZjciZvNwls70DK4eGlLALHsXTWMWMbpgWrk6SnEfvUONHPmV5I6jiW
yURLT4lEJmPlkLr+aKtwz3apm102Vr7j9kc8/YfazV3WbIG1UTnHgVVNsw6YF0JsaZPXvB8vd/n1
cHdczovLbji8v3/9ARHK2S758vX9+93byz+3U6W81NoS4jynj+fvf4ARFqIlup6IJdi8eHMDhk3y
3i9T4UhePLJjstwsZT1OZXe5+jZbmVz2E81+gBl9OeWHEqNSxa4H6HnHDs0jd8hns8HmbNzfXo0r
/TcGdvY+gm9RvJzTfU2nc1F1slJpoR8PG4SkzMpZ02Ea2q6t2tPT1BdHXFcCnxy5JqqoQTFZtrjP
B+CrWpJPbNzlqDZEbycm/VvqNQxaHzDClMP7BXIqpq6VHccBfO1JjTYEfIfRT0U98ScWlsazYfAd
PYOrWgyl2Zm7oVvVH7Mofvdu6DikrxgjGy7s5BLpPQUILSvXEutuYWnGjm/maYIdxQwuNXDBXjGF
iNrXkhQsJXrOqyxXG4CTWAO1jxMPt9JfGm3WkIrNmpJ2lRz2hbd6yxYsIpdMzljm7AkTARu9rQSV
G9B0A3b9A0ykzk/dRf9UUCeLt2qJIyvvdxNecrdkcIJXh3z2HU0BnmTd3b8JpVf23i3Krn9nP95+
f/37nx/PYLGkdgDEiGGfKW32S6nwDPPXH9+/Pv8Pk9H//vr2cisf+bnCRmMdnhlhwe6LvimqKVdO
A7u5Ld+fKYGE1Zya9nItiNJpM2mqihPJnqZsGHdU+Quzpu/dMlkYhGVXiJKXl/d/9XG4ro1RtTBA
NICqPJ1xDSpfvdiqYgfZcmQFzYjc8oxos/vZoet2kzPT5guVcmTrMH7lszBmeXOTJ39kA6HGp4/M
tOyZ2LXYwlY2TctTk66vFqy65hQh96cDWsf+3neiyF40aKRLjvnI4COcDnqX1idy8izSPOBZyVY8
Oj0UqEE275OM9FNujBVOznakAfGd2cw6i9pCK/mxL4diDkuhpMsj4loSfBi1XfbQZmct9ZrqwhJl
myQspuBh1IT64lTy+B5s8J3K5mT5+JK3RtvTmteeLzmWEgMPIpLNZLYC2Pp64fCSpp6685MtBc8R
+K8kk6SRM6eFsLjBfk7ufk5LODTlWyH7Gld9EkdHGu7oRNkAuue3l6+Ksmll5Z4i4HKMiX2VRVie
OQ9tMZ1LMK/y4jTXi7bxDFd2lH68sPWxwl5ibczmUBZ0U72yYUVV5mS6z/1wcH3cRGtjPhblWDbT
Pbz/LmvvQCyqY+WLJ9KcpuOTEztekJdeRHwHc3KzfVNWJTzYL6vUl21SEYYyTRI3Q1nYmlixQ0Xn
xOmnjGAsv+XlVA2sWHXhhMrxd+O5ZxNulr1YGzlpnMuXF1LLFySHIlXDPUvqnLOjdor2BKnZ+nGa
qjx1AjTHioEHxw8fHLTqAJ+CMPbx3mzAuqFKnCA5V6hWQWJtr9wvQjP4YeiiZZFYUsc1ZG3B1FZl
XYwTSLHsz+bCBgh2lyh90JcU/Omfp3YAs+sU7Z2W5vAfG2mDFybxFPoDOrbZ/wltmzKbrtfRdY6O
HzR4X8qe9Yb2whbmrC+KBmd9yks24fo6it3UvcEy68yRtoF9ldf0t7MTxqxcKaqxkj9oDu3UH9io
zH20FssIolHuRrkl342p8M8EM6lEeSP/N2eUtVwWrvpGyYokIQ4TS2kQesXRQdtP5iYET7Ao79sp
8B+vR/dkqeiZ9EzIeWDDpHfpiJrjGdzU8eNrnD+qelaELfAHtypuJVoOrNeYWEiHOLbUVWZJ0ivK
A5e7JBsDLyD3naVgM08YheQei2C8sQ4d3L47XjKw8YcWauYI/HooiJ2jO7n44jD0l+pJrB5pPD0+
jCdjdxWMbEHoCtbTY9c5YZh5sbZnaMedeW9VpKi+zE8FVogVUbbn7U3i4eP1y99fjJ2aSejUIlVz
Rcu84jNSw+N+6BWDjXYC6y+bNqaGYxYTqMHxY96N8PD9VEyHJHSu/nR81I5rYzd1Q+MHkdHQcESf
OppE5ka4Qvo+QksYcWUSecbqwMip49lUHoAKF8jaRyA9zE1tE67OZQMR47LIZ23jOp62Sw4tPZcH
Ml9jR/tovIsmGsoW82MXuEZdGUCbKGS9nOD30MvXXe561HHxN/f8WLMc/EgzRn6AWXbobLHyJExB
804FQNE03+JaAfP1os6gKQaNWWVOCSWr5lQ0pSZIXX1DJr1mmCUAP1YPDbmWV/2DmYz5VlSbuM+6
k+0ECFHR2P8OdaYnz5H7si/t+tXF/5Ml7U/GkWvUz2sjPR40EviaMo4h3AHV3rkeuE6161181BHD
UDZPvFJj4oexpNJZAJB3PTmOiwz4gbKbyVCAOnBYOOqS7RL+w2Am2xcdURS2C8C2MeUBi0SP/dBY
LTsmitr20OFaeLq4xgRKbCs59q1Vqz87zjqp7x559bLcumiVuRqCjmfOFWS3BNiiGbhaf3q4lP39
6nPz+PH87eXub3/+/vvLx+xXUtIAHw9TVucQ/GKrL6Nxa+QnmSSXabkV4HcESLFYArmsaYRM2H/H
sqp6tncZQNZ2Tyw5YgCs0U/FgZ2sDKQvrlNXjkUFbn6nw9Oglp8+UTw7ANDsAJCz2yrLCt72RXlq
pqJh8xbzoLTkqBh5QisURybcs0Ege18B5uuJVOVBoa0KRoUKMfTmSwo1aTjJQ1EHoX4xu/qP548v
/3z+QLwzQRNyFZdWza7GpHIGkL7OlEsCSKHqKFiNKcSyVn9nT+xw42lPPWQ6jBN0XeK5YpIMAEya
YP2g91JZ0wHXzjLwdMBmHFT62ntaQuDRFm4VMY0sdJ6bL/6GpDKBkyh1Cl1LNloQkuo8aSMb/t42
CFU+b1x9eSXah0CyPlpfcJuOacHxIVnGsnQHY1SLTryS2DpeVWwTv9Ra6Rb4iQ7lw8XSMzPTCUtY
s5CXkiTXwjJD1wsnnYSkNgO32l1waW/J+Wh4clVjkpV4K03GZX43ZXbu6aSPxCel4+SkKK5MA4Rc
bdGPAC3xywsGXUuCF60pWraclnrL3j/1eNhEhvn5ETckgnzaNm9bPHQawAM7W1hrN7BzAtsebavb
vdKAXe3ryxVbAEs0pisDH2t2ggqVFB5rCNw79fp20I3Elc8KwOoaiyM9TyKiK+ivrBN4qC3hJ3k3
W1bOxfeQTKHZ5aiOoEte6UvrgUmJ4xCEllsTWGDnwIkWcYAk2oI5u1FQJ3cBOom2Vvfy+sC6Vvt6
pvGnJCdN1Fgwc1Yf+pbk9Fyg8Yf5MJ910hKJssVedhHG2yyWbZZgx6hJZ+wiQFvsP6zXmitjcwH7
DLrdTG5JUModXZs5TjmlOBXdTDT0aNnfJDbV342CsWXWMsg2Hn7Rk7V1rS27wBGsHAYUyhCeO83x
44xafFSZorCwaT0ds/up4w447zf/9WpuVVF0EznCjRfUe1rig3OpC/iOB6Ej4uaws7ms6b19TRTk
i5wl1nbEj/CBs7AIRcJ+ZVdeTG2gM2eLAmnKr3gDbxyWe0qEc33Zh4xHcULJO7OnV4wdmWV3XBqs
6hjRMi83Ed2ZyYYdXe8r9hvu1gXFqrK42cdLyeu646q6rS4LBX06uIJKUD+grurO8/VEVGg+jM1F
Q893fGAenj//99fXv//x8+5/3bGtZPGTs5nnzWnCNQl/Azg/D91yA6QKjo7jBd4gK+E5UFN2SD8d
HeXtAEeGqx86D7jZHDAIrQGm81tQX35oBcQhb72g1nO6nk5e4HsEUwEBvliLqGmRmvpRejypplpz
ndgOeX+0hP0BFqEKseTXwotzTw0APotiehOviW4cwtOsvusbbBAtpJc1YxukOwHbkO6xxsimG9gN
mz1woC2xcQmf6FqQEKxywmfvbs0YT5LoYdIVEA16q9Q/8h2CJ8BB7A2WxNIloew8T2o/0uRtb0l5
8XZwowl2XslLvat6YN6KdmWtF1cdhh3yyHViDGGH6DFrGjTBIpfXkRurxfI9W400oxD+lgPXU8x7
uLjqeH/78f715e7LrP0VaglzNcovdc2vOWgry2IKmf1bXeqG/jVxcLxvH+lfvdUI7NiTmok8xyPb
JI2UEXAOrj51fVmT/mmft2+F3k3Zl9A0Z2XQQO6L9qpHhl9MrPebaV1s2pOie4ffE7/qZocH9LJb
4mB9qN6cS1hWXQbPww3MDQvvJW3aXho5cDP8nFpKtYfSKh2i1LA1sZRDACupNPmkOZ4DUpfVBmEq
qtwklkWWholKz2tSNCe4GDLSOT/mRaeSaPFg7IlA78ljXealSmTroHhC3h6PYEGtor8Jsy2NwgT7
jgcEuqoYayMw01aJdTmCzKiE9pqraiOyDfDCaqsGupph3rbIQOFt0SMtnz81BFyHc/8CWn5sr4Bj
cs4OMJ6a1Xz2mdj5EJwgWDLs+jabjkY5r+C3mBYcthi2q2xlM2DXKrz4qppmJS1fa705VNOVgCHS
PLfl7GoC1m/GWLlASBuTLNYmvWorP/STtWbw+dwZi/GqpXrACYNyKtgRZTALYQ7Y7QtzqHWXwHGn
i+Innw/MrvInRXUtUyFJFSFZGotbab3+iL8GZYBqhSW5mySpRhvKcuz0hAWVa84xewTOckkSJWDn
TNNCys5UPIo5gI+emsZhSORHfCtpguU+q1p9CciI4zqRRqtLo/Lt+MSEPqTdOV37ngZe4ur1YNTI
8kpPwGHoh4bPBZVnGI+26ZuTviKe1qInHrJRL0lFnoB1N6EASUijiWQCPXW2+WH6SLF8EjWJIju3
/klPoWzy8oRtoBsoC2gbNf8NT6ps7e2+fIkdhXgRG+r6sdGGgozGa2TosU6UmJKwnuf8SCosUt7f
/vfPu9/fP/7+8hNefT1/+cKOj69ff/7l9e3u99ePb3Br9AMY7uCzWQJRnHbPKeKGzrxeWeHGHnYq
E7UeiioZHb0VBVXblu/b/uR66ktDPgDaytbT1RgFUVDoW1Q5GstZU3uhNv+6bDxra3hfdkOZF3oJ
+rrw0WCgAku1hDkpNOpxLUniof5KJVSsZuan/XBpqX3KXkcPD2fPsKf6KNYZ3rPn/C/8vYn04px3
MtHzZCTRUzbJgeGGWfMCcBFr50MmEHICnilISoeiwF8xLGwdxAbiL9jswk1OxJbE8iPVUNzrc2WB
hVLLhtLyVLODUGXDr/p6s0Gq2lPF1qtZHG2bYtTuPjUOtqegXtBNNt+zZsPRKaedlYMbsdjbxnfC
wEQN1cXabe0jPL+FaIjLGx1nO3iso9PMrS/MxFix5xFgYkykOzXgJKvWV3GRXt2xFtblJ4CKcbBk
18EwYps7q/Wn4q9RoKwmI0QnnnduVbLToxpI2AUNW8XXdngLW+qlWKhYPjlbiy2JtaNs9sfXYKpe
966Jt8KiRBZsikN7sBQDnLg5zmhBB0IzYixmK1y3llAkC9eRZPhN5XyyydArSd7mrTb0IEQgF1EP
+pQDZB6te4dGYFsOfkjShsgtiBMZy6n08C84SLu8PBpDBhjEa0GbRMo1iEY1V/LU5VYor4kNotQQ
3xUQkr1VIs6X18a+wCNycZzU6Qni9YEvKvyiV00QHOWjboCMZMdwTtVeC66dtcSk1lrQFpxG5WPd
ax+FTBi571t+rh1avVB1du6WJNgPW8suAQZnTmRcPp0afVizj3jMTkj68VzSoVJflnPpUsRNxUPW
8SWlYMtEwy3ARMbqgrOhbLrISQinMO/Z7BUOJMzjx8vLj8/PX1/usu6yeiTI3r99e3+TWN+/wwvT
H8gn/6ULppQrEqqJUNR+SGahpMSmGED1w17v8fQvbCCMZqvzhCky7zkwT2sEKkRpsLKU2bGsTAx8
IIAix5i4CwhFvGhFBDrdHA5uTTzr9LQmfv0/9Xj3t3cIwvhfqmy4ZFLQxFdtXWSUnoZKd52Csdnb
hfChTPrcXsdSWFguPoT2Bph2TGGz4FxGnuvo01Vh++1TEAfOjVl9X/b3j22LbDIyMkdmZme6KTdF
Al4n3MHnioPszQYY9/lQFVerIM5XmdnQGMuoHrwYfUayMUSxHEJFpXNX4qGLwYkb+zY6KApTcOGN
F4mz9EMYWTwroZzwT+jaNgKUXXGRL3Mlvq1giS+qnEwD9YnnxYWoix/GO+LG8mlOYs9Nty/wXO6n
w5Bd1W1IuBWAQS3PUPLt6/vfXz/fff/6/JP9/vZDXwaF6TcpMQN2CR/BmveoScIS1ud5bwOHdg/M
a7CbZSckQ1OqMsGA7kGk22Eqmx2wvQw2VFw4mIuHxAELz14KgNuzZ8IABkGO02UoK10FIVB+RDpV
F7TKp/FGsU+ux47YLVm0qjYGOGQOyAYlmIbUcUN52fyFIaZkNVJcnObAvOprmhVxFkK/elDCri5U
HuxzyrivDxQy7/dVvOweEidCGkHABGAXWQrogCY680/0gFRBctRgQTBpScHZcNpZSlY2y2654tIa
a2OBNTAI0cLcs+08EbZbQgGyuxIzdj9Np1N/EcN2l3l+YLkjE8oDsH95e/nx/ANQY3njqZ0DJiHY
T9G8eGwWoXeZv5AlkmPZH/cr2B5/ZV+GOObIoIPo5nWWG8odMSLNcNl4AETfuwPR/VmunCm6idgI
FglYgHsikZQEDMZ+xBv51wsotrmvX//5+gbuL43u0WoADi8mZAVkQHILQPV6DA8dg0G7yYRMd851
HMcmJ8+b5FxXBM4zhBv/bendqbbeb4tuFSOzwzMoM+xoTpBj4gKiZ8gFtCw5HIZIhufLwY7aUxbr
ELJQCRQO7SEqka146mBeBnW2VLHYVdGhL2taaUZZKgupsjCy6vo3PvvCu9U2tvWPvGtKvtPl5Wl4
+RdbnMq3Hz8//gS3tevaqKdXTgX3s4apq+AR6h542UDhHtDINCelXCzkYJiTa9lkJbyBM/NYwDrb
ha8ZNuJ4LNS81nXIK1RnB2pcCUuotsVaGlqceO/++frzj19udMjAlwKS4CUwX2Iui8Cv9raerxTn
xIKwY0C7g1a5i5zjVrgbKTJ3VphtdQS/4Qe2sazKZryhDJuZ+PWzcmiwJcdXo70Eh2N3Iuq688nQ
MnwaDY5Bl+fFmR92hHy20Z0lEXhnb7ysW+XEqhJNgop7O/HS1wT0aKoL8FhPbKlFllMGEOO6hicF
L/wddEtclN82LGcnV0Q4ZvTUR2RqQVdNmTVMefomYwmyZpI89n1saJKcXLDj1YK5foxuGhzbV3oI
ltGSqRtHO4itdjNqaRdAE2uqyW6qyV6qKbbTLMj+d/Y8wTO/BXHdxI5M58cd0JbdNdEvkTYAb7Kr
4hF5A6gr/O6bY+I+cK2XCAsDWrP7INCtC2d66Ic4PTTsVWYkQn0lywwBVl+gY93B6LFx1yGQ0Edf
3ksMYYhqc7kM5O0WU0hJZnkOuQev8xBgmGiGbE3Zg+Ok/hXdUbK+pRO/Cc91/xI6J/XDyseNslWe
vVoJDrTjBIS9tlE5kDUUrLQqrO84gOlVZwCfKwK0JmcrAL5MAoTGFJYZYmTB5nRL0WNXf5CnoXj4
bJlpHJHpNgM7ifuuv69MBp7AfuG4smBPBySGuHKRaW9EMVcAbKHgQGIDsMOFANDeh8BC2Bej5wSB
YYu0QDH6NmfhmK9DrDIf4F54+IUZCpyxY/Va9P8ou7bmxm1k/VdU+5R9SEUkRUo8p/YBoiiJMW9D
kJI8LypnRklc69hTtqc28+8PusELLg16z8t49H1NEAQajXv3IJYTpgMX1IkvQ9wlT+iPXJgn8cAn
Oh87IvPIGPvCBt1fhnSUWcrXXjDXDQkBn+oDYPuNWsEct+VInLYiPcdrclHo0BbR7NjpuGPU0SaF
ovYpsWlRvQa6kAXnr5T9zDjbpnme2kxerOJVSGjAGOv5yqllazguRORPTuk3REm6J/s9QzRhdf+H
pCjziUy4JGwIMhG1RwdE7LtyEPsRVcM9R91PMnJJ7e/JXDrTjT7Y0ePFJvai6xnu51nLzjPCfcBI
O0N1UngRNbIGYm2eJVcIunEgGRMWoSdmn6KH20BuqN2JnnAnCaQryWC5JLQViYhQ1p5wvgtJ57tE
CRO6PDDuRJF1pRp6S5/cIUXO/9vp2MSUmx9TwNYFZSKbXAxWCb0ReLCimm7T+muidQp4Q5guAcfU
WyE4DfVWwImGLPBg6cLp9AV+5TtiIiY30Ek88khTAQwZb0cVoBZ2x40nAqeGvYgTbRVwSp0RJ8wT
4o73RmRxhRE1xnUt4UqcVmngNuRgSzJQKbNFuTa3Uke4r08iYTGx/jhdWrEETOsJva+LTLZaU5YM
D0mT61IDo+6HWCLo5ZGJfzE28tyOWtbs+wVEx2qWYweD88In2xEQITViBCJaktXZUx/YnUGKNI6C
XIVUl85bRg5IAQ+pGmlZ6BMNR+BJvI7ITe/syskdIsb9kJpdIhGRRQHUmrytrUj0wcaph8M1GZFS
k7AvF/VUtHLePUEJiB7rxeTDexZv1nMzPSUkK1EgE0lXrypA2opJgKihkQy8C6EKE+1fyAULTcDs
RWdl5/NKrQZLUoz7A3c57ZKLR+7+9SesKEZO+B2MeecACfeOjKCipSNa8CCDsXVnp2Yy+i6RJSSo
lW0xbo2DgJxFIrWaU/1z7vnUAPxcLJfUjPhceH64vKYnonc9Fz5pzgXu03joOXHCQABO52kT0HMF
waxmj4uCvy1HkqFPrmchM1eBIEBWU7FZU0MywH3CRCNO9Bjj2XMKd6SzItdvcUP8g9JZU5NfjP/s
KvD1mvZGrIps5na/hcCGmp9K3LU217PznSVu8dN1E1NL/fJSAI1TpgbwkOj+AafGl4jTdRlHZAvY
xNSkHnHSSCOz+aBI6HOqyMyt3KIAraExtZKBuCP3saP0Y0fpU+shiBMdHeJ0y4ipydO5iJfUVB9w
+rviNTXoc50UQZwucs4gbPFMmX/Gne04qn0i4bxYbULHAs6amvcgQU1YcJGFmpkUiResN9SKTe5H
HrU07T7aDeefSZyci5Ws24Qr0uqU8gr+rNlBGX9+/0bKzBl3KUH2tW3NIjEpZrTzf32PX0tWzktc
p3wV2nyrnKEcGlYfkSfyrVxHkzdzs519Bk6AatLi53WLhybuxSi+SctDSzliFGINU6Z1nUxGSWS6
nykPGH67fXl8eMI8TIcdtNeyFQQTIesI6aTpqMaBXG1EAEKQd9RREaQ6uGipZ3ib5nfq8WzAkiNE
VDETTo6Z+EV50Ua2ajjLGiOhqjswAytYwvL8Xgfrptpld+k9N54f7sjqGbnH24KOjIgaOlQlhKNR
n5vQ6546+AJPphAtdK/nIM1TebBay0H6WeTVkcohLbZZY2nXYd9QR5ORyqsmq3Rv0oCLd2BIG6du
3N1TF1OBObO8rWr9U05ZesagOobG3jeW9yXAs4Tt6FuiyLauV//Ktuo2AEDtOSuPzFCyu7TkmWhn
lYHnCV5lNsDUKtA8LasT5WYCyeqQQbMyUulR+FErpTPiau0D2HTFNk9rtvMt6iAGQxZ4PqbgUH2/
NzOLjnwLUcfuEi1ElTUV5XpZsvf7nPGjmXCTSs12PZbBbn+1b60MVXBrxKnERZe3GSqf+WDZUoNN
YKrGuCiFDZuVECZCaDhlqlEibVl+X14MgyBsjeYxXQENZ/oqM+cbWpWTSZNJCFWjT22rQklGraWh
RM5KDAyUcNPEQVQ4HRMWU/OeIDE84m+AEAkhz0qrfHmbMtqLSM8KfRQdEumKHSW6ss47I6uNugOJ
NgJiajGuuisYIctk8oI17a/VvZ6uilqPtNmpMpCq5mlq1D8EpDlYxrg9Nh1vpUcpx1d20G1fax6Y
z56zrKhad6O8ZGXhsjGf06bSv3FArO/7fL8T/bhp6biwgOAjVj35reCJ+Kqq6H9ZvXxec3LQRY04
cMgBLhH0odCYoKAg0Rmtty/UDcltXwRav768v3x5ebIPdELSd1ulHgFAQ/gv5fz+B4mZYtqVB1iE
c3wXnDu1vkuJ92yn9fx+e1qAE25y0Civjgp6HD4OidHPjd431Pco5VAdk+wKISjEYFeGxtDLqff8
poOjO2it+nJwi9hk1J4v0F1eZ7qLBplUWRruMgFmDXSRjF+PiV5x5kvrhL47hImUZdWVSXot03Pv
AtAO9lw8vn25PT09PN9evr9h9fb31HUF6h2agJNpnnGjPFxO9bCA24OZZwHBvX1RkRmng10MUtsc
OxPeQgt1lCvI7XlB1AbH6jikDQAO3+VYTl1biRF7LepffCeEA/f1plIOcwnU/pe3d/Bw+f768vRE
ecjGao3Wl+XSqr3rBdTtqPd8I77bHhJGecUYJeyrglOiopS2BF60dxR6SrcdgcNVMzJveLvDWVdp
/1muKrp0vrc81nZ5ZLz2vOhCE0Hk28Re1DfcdbcI0bMHK9+ziWoqcwKFfl2dH+lcm7mYIPFX6hKu
xuY17DhcHCy49XBQeP/Cai8D298qcTcZECTDF4ysDNNtviEpOUSDQZG5p4+6O2otjQ6cLRk6oAnw
fON5M1rSbFgUQcxDq67gtdtEd7sy4G0qrAN4FnO+t0nLlAtTKv5/tO0fNGnpcXyRPD28vdH9J0uM
NodeOlNDb847Q6otxmWIUoxx/meB5dBWDcQp+Xr7JjqntwU4CUl4tvjt+/tim9+Bpb7y3eKvhx+D
K5GHp7eXxW+3xfPt9vX29X9F5m9aSsfb0ze8bfPXy+tt8fj8+8vwJHxd9tfDH4/Pf/TOkN/MUUex
SzbkZgUqxq7klj4ieD2w3YEMQjGJHCuzp5C42aokqgVewpy1nfVuwDBdx4uRl1kjH911DKLB5m51
kWKOqEIogKq3axIjtwhX3H4v/GOXli1D5g2rq+6vry8OT99vi/zhB/oyNJ9vxT/R0jRKMmlecwLu
LuGSEld8bshBAraSggkF+3pTFQilxejlWpU5NZEdX2J6TUIbX4KXV4gTXlDeJzDf5yTQ8wcIjqUI
mCp9JD4ofZT5b0tf9vcLTo/hMSmw4jMfNBlhk4Dlt7ZS49iN1OQWgSCrPRGLfGSdjQXZT8biWk9Q
W2XYVo+ZmIukRi4GVOTEQXQ7o71AD7+OliRIjweQEFWMtWQpUy8gq3q+iQ+y7ioHfcc7jMSKMVpe
MaHXw26Oj+kDarI3SYtM3WbrIfWwBPY5u67tDJPI0xNPrQF1nh6qFlbsHHWWm6XZL9+Kv+skCkwO
g4oaxb8bJozqUKwFv8u5OWXCJfE+1O/EIHot9tl1z3ibHFlzMJIT8wrxR4sUosEwV7K+3D3cEIZF
zH1O2bZhopt0lExWnVnTZJU16IVhheOZ9MiFguG4Y59d2q5JTVWF1S/VKyGg90LOqMz0M5bixVAF
MdWBv37oXYwB/ZGLSZb4TxAuA5pZReq+MZZQVt6Bo2EIrZNa3fGRVVwYHXV+U//54+3xy8OT7GZo
Ba6PSs0ORstmyqqWM4gkzRTn8KwIgvAyxJLpZ7U6J5KhZrswUb6etuTuyjhrWBqDa3kxXcsYdktW
H4IzdFii12f8/QUPmYC2EOIoKjXNcShiYXZ4K4Xr3bk7lVtNAoKEkouLtiAnMwIFesVdNZ9g+0Em
BveS0SD4vxT3+F1vC4cQEaRNrG+vj9/+vL2KoppmzrpKkVOmYbInOw+9BBpAP5hKmA8pUwE6OA6q
8IX5a2q/D0dGJ7snAywwLCwva8PT6oCKx3EOZaQB+fXN/G53ycxXlmnr+2vroR42R1WU/sir6K5P
xQn10v5e2aAuFt4HCz7J1VR9QIGRTazZodqWSBXRLdkWXdvyrDU7Int+JgZEEEDLaOC9rproEAVc
f54Q3V+rrWnF91az2l87lvgmpscukBg5i5T/NRMd0Clf+pxsoFlC70VoQvAVrvHdILMXxXflrlzs
jUAXBikKgL6MSMi5Q0PbwpayKzQU8H/zTtcyu/m2k6vdKUJTBY627vDwFZzSf3u9fXn569vL2+3r
4svL8++Pf3x/fSAWVmHDQi9jQK7Hsu67a31J1xndYGrVZExE1LeuTGCb2dLXEbd9W2OyZFvAqBv0
TPswlIs7p2YtaNxue6jtNAF1R0dRZOgWcrie023i2KnDzoGdyYmiYqQ+rtshO+19rR7gx5/XNqkL
Aku0q4oSblpv7XnUUp7k99CFqadVJdwlqtdW+HVNkoOd/HEXcB74Pn14qc8ZRPqKNxeyR29/fLv9
nCyK70/vj9+ebn/fXn/Z3ZRfC/6fx/cvf9obODLtohNjvCzAjwgD3xxY/X9TN7PFnt5vr88P77dF
8fKViB4uM7GrryxvYe3QLMY+ZPXEUrlzvEQbh0DMLH7OWvUYRFFog5n63EAQm1TAZGX0vJzfU2fE
4DSWHuRGJDUM9uXyTZH8wne/gOTH2xfwsBFmCCDWFOKPpqkA9/7TdkbuVYndUQ0FM0Ji7iU6q0RM
Q7U9o4mv7bcJ01Qdrx+8S4yu2n1hZRSpSgwVGsYZdVhDl8KxDJUtIOUCPp1+Cv/7KPndOSn4MaET
gVM/JenwfpKxwlMon39hJ3p0q8tQKzyTxB7+qtfuJ6rI8m3KupZ+fQZxrhxJy0Us8JWsDbiAko6l
SEUouFWbbbYvrpzqQYAd4jgbidWWGkp9Ssi36v4N8aUF3sxqUuLDqW0ToGzHVoAm27VnFO1J2Bts
RoYkO2Vi4tUeu3KXNhedVK+3yd+j7uvoNu/SfaYFmOsZcymyh49ZsI43yUm7QNFzd4H9VrOFC0xx
JaoVlqA+U4NPLEhs3HrQACycTvQTdF+FhcydLa6DuomEHTa+o4+aYud8ILRVCcxbV14M2eSTZdqO
/JOlqxU/ZltmbtUrEr0XfD0lbeN2UstLWurLYIpdMZadCRFWROHKKVOdKYefRVrwNlPDfg3I2E/I
Xub218vrD/7++OXf1LLp+FBXcrZPIf50V9jLBWoqH/dVQ5poDwpOZPFXPH9XXoON5jpp5Bsx7Z75
aIeimKymLXDcAo4fTAgeRsDoDBR2tY4VIrdtYB2xhHXa4xmW6spDah8CgqC1RGljCoy1nh9Te3uS
LsUIMoyZkSfGg2gVmigGXVAvBk1oaKJJs1x6K0+9jY14mnuhvwzkbS09qxj0l27hE09V1MQGVKLR
au6hKFZvo47o0jPROmFxqDr4UFHj/A5SPWTkpw7iFRnmeWBD8xV5HYaXC3HiaGR96gb7xAZEgpH9
lk2oLpsO4Ebdn5k+OSSLJ7xQBQFUFJgPjHfnVNCO49zDieev+JK8FCTfocaFRqRJD10O6/6mvu78
zdL6+jYIY1t7iGDPukB/KcWVqzZhUahGNJZonoSxvPlqpMYu63VEXoxT+NiqT6H64d9WalXrOzpM
pO/anR+Rhg/pjAfePg+82Ky3ntAWapHgib8WerrN2/HEw2SZpDvSp8fnf//k/ROnUM1hu+jDbX9/
hhj0xJnJxU/TgdN/KpHesR5hW6Owvprf84Q8iC1LML806cHIeMdTU0k4HNS7VxcZZc1lorC7qSla
tsSqajGB9pbYWMYCaV8f//hD68PUg2pm9zCcXxsC2epfO7CV6COOFb29rQkWLTVi1kSOqZhJitF9
68jJeLrbwWt+7jWGJW12ytp7B00azIEcTh/qdYuF+vjt/eG3p9vb4l2W7KRS5e3990eYo/drNIuf
oALeHyBmpKlPY0E3rOSZFjtN/zxWpPq8S6NrVmbUSNQQgktOpgaNxdSvRY8vkHPkbJvlovCItFNw
S2UdUwVUTQWl5EIrtBJHHGKUss6+GInAXiJPWE1NUFHCnqwgfIHFRStPcPzAlRAxbZE5LJJQDdTa
tIkeVxYAY7gF0DERY/F7GhxiZP/j9f3L8h9TJkGEwwbnkV6eAd51Wgi48lSkoxtqASwen4VK/v5g
nMQC0axs93blmAIwvVZLcSTEBzie2zUnbT0IDl5DVqx1sUEYvfsuL+ZrgGLbbfg55VSvN4mk1edY
L2WJXzRfqAO+bZJCO7w6PsCDtXrhdMB33AvUjlXHr4lov50a8V7l9fvKOnM976hNf0Uo0rfbBuZ4
X2zCaK5MRO8dxfq4V6E28XLt1q5BxqcGQIqEGB6ovpoGpuFhEqyJYsx47vnLDZUnSTnurRpClCvW
QeQiBEL7zXWyNx0daNRytixRJFDPrWiMk9iQLyxWXruhh0qjgu7WYmC6mZf5FPjUvsTY/mwPHmPm
WF4wV5vHZ2ElXjpZsx5ukrCNvHg2b1zMjuIldcZukNgX4GGU0B3RYj0y04IJN9TUQ33UJ+o+LcSs
c00meRIM5TRgEthorpHH7wsLAtwJW7AZTB44aJg1eaAGMZE24iuHrXHZptBlY1Zzeo0CDrMWu0xH
FHtzDbCJ1+rEbqqcVbgh8UjzdaLZkNWGKB60a0Q5iBbne3QTL5J6HbtsGeGoHuru4fnrx93Wjgd+
QNYJ4Nfj2ZhD63mlXEZqqhknRNqSGdPWD4x+kFvPp+y1wEOPqBvAQ7JAoWPahNc9KzLyFK4it16R
5eOvlpSODxNyCieaNuCU9eXtnbduGaU+q01LlQHgAfEGwENiaFHwIvKpT9t+Wm0o9WzqMKEaBtQm
of/mesX4ZTjtJXD9Usk0Ago8ehDw+b78VNCrt4NI7zTcmgG9PP8sZl2GrtnjNl7EfkStLky1h7dL
iGrNDnDntiI+CIJb7tviynLWEDYY93sc8PXUtNZAFljH6empM0vsFGW4Vyo18jrMWNvNyqOqr85d
XbUg6IMtYzm3sdeIonasvqhiENV3Vqg/jTErc2ohNMZ899+VEX0yRpG4zEu0l1UczOe2mJt+9CFD
N2QduTc8Rz1rxf+WVM+UVMd46QUB0ZZ5W9SE8iUe3HWyCekSnMpfXif+6kJtWikS+qLYqDDFhnyZ
EQJrzHJ54lQOiurCyPuLo0Dra05/JjwKYnK0VbTryKdWAMexez9fNy3nWp6wtZUIo6LNaUjT7jwv
nivHcdt9dBvDb89vENRu3roNO75E0jvwio13X6dvmTD7FK7CnayJPb4bDlbuxstU/WOM35eJaCbX
tGRb8JxzZGUJUW6N0x8QmEoGYtexU9a0cB2hf07PrLxWMS0J5W0Kkbr4wXXGkxWw4ZgvN1RhQ2x2
8aBmfPtm5NGTHMgCNA/HPAlozjzvMkObNmjgzmp2erAP3q3FhMbw0sYlIsA+0ZeHjhnP9ASy4gB3
3QxQXicXWLSy0Kq+Mk36LjCvMRXJHnNF7SD2pyTAm7z6cSN+MeugKDB6Jl2jQLZOUrTWij5tJ6kr
fdrjwvXiKLf1vq+OCazOuQ7UydEshzoPgqXzxHGdXxx3vOTxISOxESy6C5meFCgcSUIESj2ceIDm
29L5Md5gvXVkT0p4S0MP2qzYWhfahlhikC26yx5FLqZIL4AW10y4DxfmKtueluNHx2d8NtoSBGk+
clOVBZiYrWlkYZn2umWF4w1IH6EdXYtDoaxDT4Ri0M5YFcb5+B7VTHEvSJ+cgNMrxjf0EDxA353g
e6uFDT1JfzXA1EVU9VR8OifHJwlrDOOl3DGwNS6zrIVmJc2h79jdJE+PEDyP6G70ki2Yfsln6m2u
DcvGjlXA225ve3rAROE6idJ4zohqqt4/Tva1ghCjlVN6Las2299rWQGOp/ke8qgNc3rumDKHSxUj
w2MpdJfpotmY2nG3cnZV0AswnmQZXIqj+o3Wi+5Ub79wUw3dGuWiE9Z6YZUpyZcpEnjEY06IyEun
XUqAs2eq828A6n6WkDWfdGJXpAVJMD10C0A8bZKKXNDHVySZcipce7BMW9o+43NNR/qHA67YR762
DH/aZ5SLHxgTieFddpI7o5O4wCGZtKQiw592tdIk4BccnlV6931yUsrxhFdKs6pVb4tIsMlUJ1AS
29XaEpIEzZz0nlW+vL68vfz+vjj++HZ7/fm0+OP77e1d85LTq/dHotP7Dk16b9x/U7pFJlo6tRGl
HIicUuqxa53VtLEs9jtq0WHU26Yq0tEdhDJg7Z+xAN2b+AD+X2VP2tw4juv39ytS82lf1eysjxzO
q+oPtCTbnOiKKDlOvqgyaU+3azpJV47anv31D+Ah8QCd3tqaTRuAwJsEARBoapBjCVqxaesQ7Dhx
GmDdVK1jMy2yPGdltRtqR7avglsbCEfTC0oXmeRXGIghr6qrzo7ix2BrAxyUmdXMPr+UXwDizC6b
PD8+Pj/B3v388NfJ6uX+cf/v55e/xt12/ALf+wnWcvdZMyJE7UUYtXDbbKee8VYi8b+D4/2K3m7G
Qo3JiGLvUF2e2qm8LNyGnytnIIq9SArq2HYonNG0EPxsbieK8lBnUZTtcuZiTk9j1eRnF/RZYREt
i+liQY7DSJOkSXYxOY8Ug1jagmcTCQxl3id1hAleeASjNTUW2TorePkhlbprfzBCs6IW02mkOnhV
gL9wPERm6HXVcOsAQlAuppPZAi+necrX5GgFjgIWbkiA9VHrQqMaSXVDOR9YBNWuZCJSl23ywXAu
04vpwtb+2EPJd1kKtzrX2UP2qnyMRZ2dkufgK+x8BOD+fL6jz2OboF8zMm6ooblyUvZaFeba8cCj
T27XpRs31WA2Da0NMvhS0PruEU/dWQ1WNG5dGpjOS4yZG9lSNhy2jfNkO3f17z4FlTXDpVFRoiMM
zj/eSizX+o/KOp85togM4w6gYsOSzttu6RJb0sCAwjp/uMNV+Ig/EGL405f90+FBZu0OTVkgbYCM
CTe5degXZ+NC1aqPnZ0tyRr6dGQ2Fp/IzoNg43ZTJ1GEQbVJp49tK5og0Wyy30z0A0p7wLVDoiMU
SGnA8oss9p8P9+3+LyyLlA2sYDwEsp05Bt4ABVuMcnkiJQBFApcioPlADFCkW0wIbrtQhSQbvvqA
Ims3H9ZpmdY/WyfWpR+yW8/Tn2I3nR3hM50R1TpCHPbrEeLf67Xq25+pJMjm62RFH5+G4oNxB5Jt
WOAx6qz8meqdX1xcRuqFqKFeUQLVa9GaK5o6+6mKS+KEFT9P/NN9oqh/vk+OD5mkGCYyTeHacQKk
6tmfqTjQ/tySl6THl7wiUd0QrV7E0uTTxOYNosZNI0pxdONZTD2hyUVeUPoPj8bOPxGglOPusU6Q
VOFcjJIO6yBOUXdSiRoTSDwyyluLpmZp/nG5ZXmMZpjtRyoWTNgo5TgHj7D7ycW4OJvGLmkKqdch
qYg8fnxHbknrMG6DJlNm8Z7VcOfrN1le248RNHKODyuUBOF/tZicaxEjQCb1dDoJkFIdv07t5MFW
Tf1QcJKanc3hrhbT+csG1okw6WyDz6VsXtMKmIFAFOnHREBA2XdZfd2vk6RfTBbW5R+hRRGAuSY+
ndj5sg30fGLnSuQDY9fzEuG5hlPC6PCZ62oMHaTgMWF8IKA9+ka0/SgLofkIHZmlivryfHpGl5aq
D+MEwFn14CXpNjTWJ2yn/u6Ceus2fme7VVrQ8wi3y+O9crkIervuNCbyoWG8sBeI0BPEzimU9Ghm
ADDc5ycOfD0Cx5tXootGBK2pxfTPIsCP2C1PsyosD8YMDhCstJN+Vo+1k78IG9J2qMF224Lw63MB
d5baa6TmErJW3eiDTRUDhO6qAJ7XTIgAoQudOuk/NXDmAOuC9zWGGUfVrB1PTtkYV7BL2aNwVUMP
7xJSdY27iTLT+YqLrMi2cbVFc8do7y+JvBCXs0g6KIlfsIs5o5aEwV7Yyd1G4NyvpALTy3bEx1QR
AwEjBYIBvZxSlUmoKl4sKOAlWW/yPfKIndIfHRkTiacftY/4DzqL3uIsNNUXl+eBGk7BP+r5y8i2
MBJ80El2GjoJvWST8/VkPvPrIzYw5aK80Hi9zsoZCAtrj6FGzSMojE8Jv6rkCg26HoE2gMOXuMv5
ejoH65h4LCysb8sr2FZI+6lZVAALlHrOT10bjEcAMp2QLBLXCVxHcre+pbdsSTaLkNlEp3O3Hu6A
8BXfkmF80G2Fqr9EiORycT7xGY6oOYvUSJbpRq4YQGoABYWpG1Sxos/WMeziKPbSCd+jS0woiy1+
q4IKLmvbZVPBEJuu3M3dmhEtx5faroTqdLlxu6HledpGZ2qwuRE1L7GbxlqNMOmvYVfLQkXeNVoU
mO478jEO7AcfowuUVSeRFX23UNG8LT2jeH5/eaACYOGDYidYs4LUTbXMnEEVTRJYKbQNQn1D1NPY
EYZ3yxquPcwDsPEvD985o3tgvYwWtGrbopnA4vU48l2NDl8e1ESkCYuRDunn0WLQA87nlbKQDczx
Ux5ysfFnHMYqVo6a715JysE7LKysk+LCNJKe/Mqtum/bJNo0/SwgZK+HPl3K6O24prvICqvFxXR6
rB6szZm4OEKAfohxrMzaNYu2oIQ10WR+rw1Bif2ZUcpObmGysdpH6jbXHPPLb2zvG42BvWY+8/d0
uUJqQUsorNF9T6kl4NBSmX68erjwPtu2mBCTOXdz6Q/bQEs6oJ1MFmcLWsRBe1GOWSMH6un5dCL/
F6kwHqSGFthezmhCnMwTPlB25VVZ3ZSUSInNUS0RtUqxbJe2vSjkA2ueUOcXa4sshxGxfNoUyPZy
04OgT/oiaYkR0oKDb/F1+hNfssTnoTQF901NzFXTJbfCvMQX6DmY2J6Q6F8Z7hh4gv8su7boiIb9
jqo97CF6lMwkgrocJyjaLuK9r2WyCs4cqpaGgaqekbqGIW85UenB34WWBuQq3LlZRxdz3AWLhrrM
D8ipJTVqYE11Gi8wWA31oELVGvHY/Ukbbg+ixece9nxMoPen1B49WBgjI2zwXt4KGbJKnlTA+PzU
s4w6mkjvgB8mG+P5stp5S60vNpT4hY0tFLXZcrXbFH5gQ+eziaG0+Q5ayuYGVhAS0BPJnL9RCvOw
IYZXpuwAP2DRBu41RfdE70fTVbpN1FzymtIRqLN4I2qPn/LRFjkvQFbycCj31GlCQFd5tmsKv2ro
cV2k10GXSsEbn3fQ7eQg/Hbw/1v7IYOEMdv5QYHGyCBSLFzvn/Yvh4cTiTyp77/sZfgUK52JV0hf
r1t80OLzHTGo2PkIPbj9OqvDp5SnAa13/6jePlf5cicS5cRQ6Ix2TIh201TdmtIuVytF7rfPfSGB
sSsN2XheDNB4gBCzIrwy9EkWsLThR+K08Brx20JQju64DwiPr4GZCDFp2y95mcL2FBNbJHXKhRy3
5S12IvwxneqKMpJ2aydvn1/CXTa5CRsoMabbaFkRFk2Atde04akCruwfn9/231+eH8jXYxlmHvXj
lQ5zjvhYMf3++PqFeNftOrLKn9rgIpNwlHDgbbMjBI0dHTrAChVHZqz8SCAKOqK5IlHe0nQLnZYM
w1N1ZXrDpXOreoD//P70+ebwsg+fvQ20xnikPoAe/Yf4+/Vt/3hSwe366+H7/568YoivP2ENp+FI
4A2rLvoU1gx3Xd8kFXv89vxFueOE/a5eEyes3LrqXA2XHjRMdA0ZUFdlVYLDvkp4uarC7wFHV8yh
yjKLytrhh3i3Fnvd91SbVGOho/af6bYCnyA0sU67gM7MIK44ahILJcqqov3tNFE9Y/J7cqIQdRrF
n8uprBd3sloOYLFqgvFcvjzff354fvQaGSgY6khSI+Q7Rg0aakmyVdn3dvW/Vi/7/evDPRwa188v
/DpWNl4E0ppFnkF1PEn0ixqSAL+cUblQhkp+VBUV1ey3YheroJJdk+3s+MSUQ1LsFoXdQwFf5eS3
q09//KBnnFalXBdrV7JV4NJ/OmD850KOOrrraC0nVrIWiFwRCRZOwxzPGYRKS9BN4+rfECGS0EPL
PLOgSpf1un6//wYTJzohlbRYwSHnRWmw8aiUxNAlqfWQRG3gIOT3wnFpVnCxpDzkJS7Pk8RjU8Cx
nFcstVUFElEl3tkgoU3RrgSGqo0VgQZ1jxOC6jRkVRc1pZDUp09WeGy0PT+Awq1QtMyOrKgR9awO
YCL4PtyjJfwmKYWI713k2NqrZDQFDkJLshlNIK6ghBjCekZRLGllyIBPJjTryzPaPGRTfFQ4bdCy
8dNI4ee0HsmiiJi3LIqIfcuiIA1cNt4xraEbizGG0lqMkYDyybfQF7ZJeQSzKQle0uCEZGL7PY7Q
S5L2kmTsZoCy4LR50yKgB80iIOeDjZ9Gio7MB4uC9Mm28Au6ByIdY9s2G3yEl9iRdBQhASqqpfNu
dbharV0rywCnD8+xfdWgM6RaJ61ZomGFt2sotQGmQhb2awkLh8/JhRvC0f5ycY7Y2OLQRJenLnus
rEKtnCyNFjyvbrR0GODqgmQlhS98LWKsck7fmMfz2ypvMT1cUnV1HrN7GPr5f0EfyeUkzRFK3AzE
yt3h2+EpIsfod/LbpLPlIeILtxp3LS3g/NwNZ9CcFRidc9Vk1+aGpH+erJ+B8OnZrqlG9etqq7O+
9FWZZihaWDYzi6jOGlTWYbpLx3Zmk+BYCkZanm06jIYsapZkkZLgmq/usE4jgrj8eOvXugqZW3Bo
u4WXsmmfpmhkovBqEsZRMPdIZHM1n19eYozYED+OQ59tnSi/DtjUvayS+gOSurb1Ni7JsNWkK0st
l+3aZAwVl/14e3h+MhnIg45UxNAufqfeZVmqIIlZCXZ5SnqRaQI3JLsGFmw3PT27uCAYYta/+Rl1
iI4EJg458e3FxSJyRGuaaLBLg2/LM+UM5n+pZED0Aiu4oHZITde0i8uLOdVZojg7m9BGDk1hkozG
uQNFEr5wBsm2am4/eSq1Op9ezPqijmR2Uk+V+jKL4I3JKoJWCySC5GQbSjvKLvzoC+FYZxDEU9pQ
hDgVzKgl34Mjvubluq7Ktc+zrSrKg1h+krnns65VLAGv5IZBurVSe/huW2Q9nRjWyQ4AP1SIZRcU
RIFCoDQ00gy1EXKTJ5jN0y8ANf7cj9NsEOgYEWFKvO2U4KyBsyv2jaUGscDGLB/5KpjACByC6Fkw
bRZ1gRu+3LYuiBdB98EGT12ANGp24TPY9W3tFZTXCT6ghTt9GyDceGsINNEGnVqgSgA9UmnXAvmV
el4XJ9hFZpXS8KeFZ71HjMx6YT+al8AdcwFajnVKM9bWtqb135JGHyyRagU+chIoHc88mI5S6TD3
fY9cZEspLBTGcUgaQDBUAbT264F+My7Ii48nQTxLXHWPhm6amFFfEpBJjTQGY++7pSh3Gxd2N6Rw
4M31yQPIemFeQ8DobFfWAbDmSQDo6yKEwcnZl82nqQ/fzghi25QywnreihjczV7EYEnbFRtdRKAR
fbHk68xZRr9LDwPGqV3fTFdeYuze5hpOAOsOZpDQN84dTMPRnVoi6fNNgGAzQTx9wlmvd2M0pqDN
QtWQ0t9vYevHrrKGTsF40vmgKi24D6vtrlQgkVlUuUDRwQnEk2O+lNVan75morGm5fjyH4/ExPVa
wHEZoocxnvopSjWZlJBqMl80bq/ARbSZ4w2F0LItOsf8bKyMUCgwXPIy4jsZLAbbAsmSq8h5LC+y
Gxx++aAdoJgGPne86z7AsHbjepdr8E5MJ2R4SYlW52j4mT5CIzPIosBfCaM9TfXrfC/sioOE3r4I
S1fBBtc3R7jmrGz5dZSvPiVD1vJAjH6mjFPyZRqMyTL8HD0Mo18TTnIKMajKQ4ZH5qciwJAxPj91
BQ6geLYU9fSM6FG4m6/qNR3kTeJdf2gFHB7r+4gwg6ML79d5F1QPw/GNMO2tbAI4zJ2HOh6Sivng
+EarCOOb2xPx/serVECMh5AO1NUDeuRhAeHmVPM+ddAINnIWXn+qdu0ig3AsCFSurpjKiTx3FQU6
sZgCqTNYUV1yN32eBqNzIeYH9kuW03axlE8QIkyN5TaXRCQDg6We/VpE0xkzPKLIuQw3SJeCbz/9
YIQkkewnpOxZyfJq7bNTYVaO8VJBUXRX2pZU5YotX2x44+CUoEKuBN3q0JRipuIaxkRE5CPd/1kb
CQVqKI5NHd2UaBRH2SHGublq4JSnroo2VTjlDUZw9GB1cXjpkeqpa7871RrawYb90cTWzmjBzNYu
bARfEMPapTxxjw2TDGzLy7I6tgDUgdFvm90MnbfV9AzxDYhO7uzWYbovzqSeI+9AXmj6oO/UQSoH
mUQEjVZiEfCdyHc2iqHbqRZF15KBw2yyxe4oH/X4WVFEOMFlrJ8tSrjMCluAc1DhykcUNSWKen50
Rkvn32PDigQdmfjJYHeCai6r6w26uRdpAdOK0gMiWZVkedVipMfUDoONKClKUW3SDpLXi8n5abCe
fTou6XbElFBnPszAYB+WGNqcPqKpDVxi4p2l0LBLbQT9pUTxSLZ1l0rOg4/KEUE5DZMuW96MsAnM
0zu3s8Znd+GaHXHhtHRwwYk56qFjfT1QZH5yehspd51NWtCWmZD0yAblEqaCp8TkHk118VNvfNNz
W2fxqsdHQl920lo9aHb71bwowL3eoJ0CjBUgXkGjxA0HTZzVWzQGhhjFVe7BaZP6ZQ6C55H+tWnm
LvMBRUktolVKoekcKgbNjsttA+GpJvQa1/LN6eSC2liUWggQ8IO6CiCNknh3wUEi4Wj+rGedi0mZ
FmA9cLGYnhNwmQib3BB/v5hNs/6G341gqefTt1H3NIRbA4ZPDZZcCwVOY4/BkUDd+nC5kVdrV763
PkU7XkLmRykSO2F5svQyVgNAvVpQ94f9CyYoun962J88Pj8d3p5fQpUW6pCSBB/dB87CAD5FyYJ0
w9UEZz9+9I51TMFLn1ecSSo6v3Dlfh//BCbl8InpyyNtHe5ZtvsPjN2p6Sj29Pnl+fDZ9gVjZdpU
PCXHzZAbVimzdNQmFaT90zdGKKDUy3DHpWtEVEnV0upsbVDK0AmAsp1IFuaul6Hjc1Adg63aOiwd
3+kFpZsJBiJK5nofqBN8RRUjzXgitd0nxjPI5TLAK/uxuGKDFwVZobCuapfBEMW0alhTKT8OfzTN
RDBbZdCjHpvt6hz2y2jXGC9gr2W6CuUWc22va9ulRWVT9ujlYzEDUwlSbk7eXu4fDk9fwtUrbKsN
/FBRkjGQvS3vjgh87uRY1BCVdkVBHQGIE1XXJJnxdXVZahyRTVhtfO0mhLgb1gBdt07Y6gEuWuq9
xoCGU5cqoqWKGK1/ehkT/Wo+Qs3SyAJ/9cW6MTqnOKZnbh5F/dSpbkB2ltG5yOk1cDHkMjs10W6f
MNnWRF1QLRVrgXaQUQG2wwrwJIOT/oPCC5ZsdtXMjdItscuGp2trkuhqrposu8sCrK5LjZmftaOQ
x6/J1tzW1VUrGi6B6SoP2gSwflVQ2+SAZqsuZOTOUqdni9r07ViUoPqrzYYVDP+k/I2rGhHUCWN/
MGwwXd5y6KSd7CblaP3+7e3w/dv+x/6F4l90u56l64vLGZm6RmHF9HRiBXZBqOtNgpAhNoDxsSYK
HsQr2K1ra14K7r17g9/SYSjigoGv7paddVoiQPteO75tuLIb+HeZuW+BbXgQoSFO1VcYZYuOENgh
sbP5zWfmyW3pFI7JP64z+uTGl8fXHUtT0rWiMO9DTTYM11tIDuzq8G1/ouRF25csgRUJ0mwFJ4dK
JG7XaAvX1BQd/FYCzU+CjrEAuEpwmBGJ1cPZDh0wbMnFQPqlCo1RO0VhUhEM3n3lJSiwVkqflUlz
W6MJjK7GNmtU/nj7IwWMvrAbKZYdh1VSwiRbl6ztGlvuX4kgW4kP4AogPeScKjCFoA1yXUXqTVjX
Vitx2tv9p2AKNHKH4vrIM8YKGpazWw+tVvn9w9e996pFzgRyS9HU6mLwun///HzyJ8ymYDKhR4tT
ZQm40ml8xjsKQreFf6bZWLS0tLnHqEa30KIqeVs1AT+QAPO0IQPNX2VNadfKk6jbonb7VALGOU3b
niXNjrUttSQ23Tpr86VdigbJRlgbZKZyaGTOm4fBALrma1TEJt5X6s84F8w9JhyaoRwuVN4eDKSQ
2bk4qoaV68zwMktVrjMahNKqkHlERuTvq5WYOeQGokWniXUHMZgbWHWAXK0iTr6KUICAyRpKxBwY
yVGwB3DAHB/DgUxkSYdbQLQQVBRjIg00vldyAxJheXc5p3RICpnfVeEXDR4D0U+abukao3VdiirF
5EmR92U2Ud3w6ni7JJngd1msnBXbgqQOtSd4QP28eWMgIBxs0ds4VT1HEKj+8KHYhXZNRoRoIzcw
ScGwI81L9iM1DafKgDkyB8ZWde0mw/XIWkeGTBpW2N2gfsON13Idgoum11kKsmTJFfTT8pYix1th
6+r3REtvm6WdERJ+DC+tfzm8Pi8WZ5f/nP5ioxMYXbmhns4v3A8HzMXcsZ27ODInjkOysIMzephZ
FHMWxcSquTiPluO+WfFwlGrUI5kf+ZyK0+iRnB35/Jyczh4RnU/XIbqcU1FPXZLoQFy6AQFd3CmV
6sKtoBvYFXFcVDjZeioIi/PtdOb6cPtIyjMUaWRutlipsY8M3pt2BhwMs0HExtjgz2h+5zT4ggZf
0uBptFbTj6o1DSbeVcUXPRkcyyA7/xPMqwi7EKMkKoNPMpCYE+rLBPbJrGtIH3ND0lSwj7LSbb7E
3DY8z20tlMGsWUbDm8zOf2HAHCrovIoZEGVnR4xy2ktWCe4DV15+NER17Yqa6V3JcS47B40CwcHd
FHCrupNHyBD1hBS7nRubCpuwf3h/Obz9HSZmxHBmY63xV99k1x2w7qVc75whWSM4iIFli4SNH8Rj
dA3RnIgG6psYHFxBwX26ARkpa1ggJpkjFpMPCum61DY8iUSdIo7jAElaeFcgAuA9TGkY7Ys3Q0ka
r2co2fix1Ek0yN3t5tMv/3r94/D0r/fX/cvj8+f9P7/uv33fvwynqYkTMzbPzvaZi+LTLxiJ6fPz
v59+/fv+8f7Xb8/3n78fnn59vf9zDxU/fP718PS2/4ID++sf3//8RY311f7laf/t5Ov9y+f9Eyoa
gzHHEMh13q3xzto2HVyYMjakkSn2j88vf58cng5vh/tvh//c48dOlAC4R2Gr4SoeFSbJEmQf/Rfk
y9smo3KBHqHumRvN0yGFGiMlqduFJqG/VJ5XyTAursu/oUHFokVCLsBIHxp0fISGR4D+eh0lRFg9
lRmr5OXv72/PJw/PL/uT55cTNb+sVD+SGFq1Zm5yQws8C+EZS0lgSCquEl5vnECHLiL8BG6nGxIY
kjblmoKRhGF8IFPxaE1YrPJXdR1SX9nqRcMBLykhKRwFIIuEfDU8+sEQ9chksXWp1qvpbFF0eYAo
u5wGukGbFbyWfymFo8LLP8T4yxvMaOV9/+Pb4eGff+3/PnmQc/DLy/33r38HU68RLGCVhuOfJQlR
1SxJKUPMgG1SwYjPYDPdZrMzL+Oasrm+v33dP70dHu7f9p9PsidZd1hfJ/8+vH09Ya+vzw8HiUrv
3+6DxiRJEQ5KUlBV2MDRyWaTuspvp/NJJES4WVlrLmBk4y0V2bUdlH5o/4bBnrQ1Q7KUUfvwnHkN
a75Mgu+T1TKEteGsTYipmCVLotV5cxNvRLWiPqmhZsc6Z9eSSVf0ksxudZgWb+pvTL+H0zgFIa3t
wnFEHc3QlZv7169DTwZjS2dYNzuZk7HbtEL1v89p63FSL58PX/avb+EINsl8RjGRiHh9djtyw13m
7CqbhRNAwcMBh1La6SS1s0SbBUDyjw5AkZ4SMIKOw/SWzrBhdzZFCuuFBDvu7wN4dnZO9Bwg5jMy
gr1edhs7dMcIpLkB4mx6ZCAAPw+5FQSsBQFjWYVHX7tuppfh4XFTn8nUcmqqHr5/dZ55D5tMOKYA
670QqhpRdkseSfelKZqEzDZhJlF1o3NC04ggo6OZZQzTK/PwyEgYXkdiH4k2nD8IPQ+gyiXLb80q
OBJ9iqsNu2NkQls9ZiwXbBbOPXMOUPMlkiHXYJs6c418w5SJJKTQkySjveMN+qbCAQjNOs+P31/2
r69K1Pc7bZU7Vgaz3duaWA1bnIYTNL8LlzzANuHCRmWtmcnN/dPn58eT8v3xj/2LCtJpbiL+bBW8
T2pKWEyb5VpmUKcxeq/2+0jhmNtLJFFC2nAsiqDc33nbZviqoKnq2wCLhfY6EJUt3387/PFyD/eJ
l+f3t8MTcb7nfEkucYTrLd081jlGQ+LUHD76uSKhUYMwdpzDQEai00jbzDEDciaaIi6PkRwr3jqu
AqFmaB8tzoXU0SNiQ4lHTNwWRYb6DKkDQWfjsYoWsu6WuaYR3dIl251NLvskQ/UFmhgybXIfCeqr
RCzQqrNFLPKgKC60hc76flT9SDxeTPBzyoOCr0uM9ZgpgzyaxlejvUPN5v3LGwaxAQn7VWa4ez18
ebp/e4fL68PX/cNfcBO2nMykvbGH+73Q2qLGsRyGePHpl188bLZr0WNp7Jng+4BCGbVOJ5fnjtqo
KlPW3PrVofpB8YUVlVzlXLTRmo8Uctnjv7ABo+38J3pLdmse3R3wqaxT9JKDcIER0q2O2LBtpgzH
FNY88QOppEzq237VyKcJ9tSxSfKsDPwYkqpJOfkyU84Oloes6oRjtF1btsfH/RgFhye+vRsdGZKi
3iWbtfQDabKVR4EW8RWKENqdibt5G1LeoD+O44AEAi96GreOQiGZnrsUoUyc9Lztever+cz7aces
duGwxLPl7cLdPCxM7OyXJKy5YX5QKYdiGQnlD1jSKgVw5+hOLEME7HTDnWQksKRy/+aBz4FbNR6o
NmGttSMPNWlYmVaF1UNErUDGGOzqI3uEokufD0fLMJ6prghzp04VDwoSDcEZoRRnkGFIapBsaDhd
P5B5CHIJduhHR/W7nnbmGsn79R134ksNiCUgZiQmv7MDjzuIKgK3JodZuVKDypSfjRlTjAEsqrwq
3CfQIxStAvbScnBQoo1bJp6Db7NleY93JvvYxICeMig2TLiGWZIWbgW8crzlFQgdAHpnx0G4E4y9
lNVaI7CHjW5tuxpLHCLwQYcXiVTOecSxNG36tj8/Xdo2JMRAI3PWoMvzRoqHxAYmsrarJbFygPPx
IPk3aXVTHiERt2Ui0auqoffSgEqFi/BJEAuToCbqK2541eZLt3llVRrKvnA6GbFNFoD0lkxgEjki
SlWy//P+/dvbycPz09vhy/vz++vJo1K837/s7+G8/M/+/yxRGT7Gs10GwYCKoGPU1HIvGvAC1Q7L
W9h9qC3RprI4/R1jxEt6y3WIGBVaAklYDmJVgR28sDuB4QthP7CUg4B5Sgkn61ytUGvh5tXS/UWd
Tvld3zJHgYcxPEAepiLgFDVX7jjjUbFKLW4VT6U3NQgMzsqE1Wq2kW0qrE3HQNdZi/461Sq1l/Sq
KlsrGcXomAhw2s4H9IsfC4/D4oe9zQh8FJFzaiHW+LbCMagMqE55wvarvBMbYz4dBBiQxtKsruyA
U/gq2vY1X/7O1s6goqWzXB839wYCoGsGNIK1hH5/OTy9/XUCl+uTz4/7V8I4mKhXFyBKrXOQBvPB
snIRpbjueNZ+Oh3GX98iAg6nVrtui2WFF5qsaUpGOrOpeQz/gUi6rHSQa93kaDMGbcbh2/6fb4dH
LSy/StIHBX8JG52V0vBSdKhn2mR2Ur5VA9Xrb1hTfppNThf/Yw1MjUnOsCm2c1bGUpVyxI4yvckw
uDaGCoJpYFtr9GKFzQ6t+gUXBWvtE87HyIr0VZnfetPvhsEcVnWtK3kuCr8NGu4XDtt8Ag1EGypa
rk2AoDGN4c/1pZMERk++dP/H+5cvaOHkT69vL++P+6c3Oyo7w0BScB+yQxhZwMHMqobn0+THlKKC
+wa3bxEhDk0oHQZlsK6IuvHC24FkZ16t7Ujr+tcwd/G3YZxQ8fhtOmnLi6OvUsr1c9xQloJhOISS
t3hYOFNH4ux6KWK4z1JPxRRyiUk1hMdDOvmGjIazh9x0fmqk3b5Gd+rMMc8ruB9003ZDGPjat1rY
W+DenpXCcaZUzBBrjjivnAFllrueXpQvOZYBwpSjIpGakYqLqnQu1S4cZB01Xu6jc5fmLiMdnFQ1
myplLevdE3i4GbdpZycyVb/7wFNegY/lKlKFwYkDOwx1TMrVoAcOTjztIuJ9bjBHSlCeIh2eCLRP
Duy3qabKylRtv9HO2Rb+gG8LaUjzfZUGZEPHzhjw9RpugZFsREbcVbS8aTtGzF+NiNZZhXCVDiTW
JqWA8omHfAjaNCBu8/J372GRnrpqY8bbRXSs1M7FhC1QeAiQzkGOW9vK1ES2UGEDFan+CMfm0zRw
bxnXpneabVRMOi2kA9FJ9fz99deT/Pnhr/fv6vzY3D99cVRVMlsdHG3O1cUB46uiLhtDGSqklAi7
1n4pIKpVi5ogvC9lLXRoRenpFarfYAyFlokre2KpY2dADYVMZ5PhIlpVLchvrLDIZI2su2qMZGjJ
UOWbazjB4XxPK/oRk9S8qjaR2/HxblY+gHB6f37HI9veVL11GE/9JfF4s6UzoFDc/VmMvXiVZbWn
OVVaTPReGE+Rf7x+PzyhRwO05/H9bf9jD//Yvz389ttv/zvOGvkeTPJeSyk5vATUTbU9/jxMJz1m
1DGgN2RUHLbZzjZC6JkepHDWK54mv7lRmF7k1Y30EAwWenMjsoJa4gotK+vd4BAG9wq/sAiYtRXm
txF5Rn+C/Yi3SHPjEG5BGBULn7gFWQ/Hth29qvwXo+xcnECqsZUVUgqGfui7Eg2pMHGV5tBv0ZU6
37wNkbhZWHvVX0qi+Xz/dn+CoswD6tydKPqyr7ig9mkEHzsMqVu5QpmTwNH1ySO67KVAAGd80wWP
GL0dIFJ5vx5JA51WtiDBhk/8mqSjxK7YwGOoLwy1HcTVdijsrylTQNLJ803ejobddja18d4UQFB2
bd6JWTcWt/5+y2GjVReeRp6o9JbAQLhMbtuKEqTlDFp1pbqXyUo13vwasGuQxTc0TXoL115YiCuv
WQSyv+HtBjUm/l1Fowv5VhgI0NLikeB7SNmlSCkvgD6TRH+ouIxIxTtxtzcERnZaVRlK6cQwzKb9
jFICrLU5njEKs+Fpw+iwpZqi5umKftelCbaki7cl0amgJ0JupjfZ4HZw//J4fkreOngK0pmM1YNB
d1PHxKVSW6stCO9pSNJXq5XI4qfKjRW/BcV3wdeblgD1GPBLYGyYXuC/PrmmNYtooOnbgnRRG6gV
Uc07qjyJzNrldjoh0SoAR9YWpzu6LnQ25xGPC92s2hBpx9FwwEOGdS6Dmq6dJ6z+uNkqsHb/+oan
DcpDCWZFuf+ytyWfq67kZEYASjZ3rpx1ERXgNUW1kssrzs9ZQlLqHMo5NoGvksp2CVVSPAjrANYr
104k7VLjL3MFlqa4Bu+lwiNAVVXT4f3fVTs0sEvgo0ncyXErcP1r8qu0dTxileCKZm5BP7GUBAUs
rU3mxmCXiMhHSyMSSHHDuys3SzQH+UDbphTkC7btSLEzSklOGLKQyDgsK7vJdnjtjjVS63LVCxER
NrVtRFJTvhXK7QLwrZ3kWUJrYNmuAl5L3haMDghh8DATc8oDTeK7jqdeSTvPkiaBGCkAE0AFFWjQ
+CtzL8cr4ftY2TieMr+lnq58xWG3g3b0SzirNwVrrrwPVrwpQE7Mwo6WMQLi9erSLGf0AyI1WbMi
YVChWN1DLb4eX+mOQW41hq/WEQwfAigqSx/d3YKnJsZhZJDXUYIuuBA4JdMqkSvdOTP/H0zVNgKc
nAIA
--===============1399762812797355194==--


Content-Type: multipart/mixed; boundary="===============0895121230316382858=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1386:28: sparse: got void Documentation Kbuild Makefile crypto include sound usr rscc
Date: Sun, 21 Jun 2020 13:04:56 +0800
Message-ID: <202006211353.Z7qZxRS6%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0895121230316382858==
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
head:   8b6ddd10d678bebec32381f71b6b420bafc43ad0
commit: 02ef80c54e7cd70fe1f422b0315fd1534033e382 drm/msm/a6xx: update pdc/r=
scc GMU registers for A640/A650
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-s032-20200621 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-rc1-18-g27caae40-dirty
        git checkout 02ef80c54e7cd70fe1f422b0315fd1534033e382
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm64 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

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
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1386:28: sparse:     got void *[no=
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
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:34: sparse: sparse: dereference=
 of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:96:44: sparse: sparse: incorrect t=
ype in argument 2 (different address spaces) @@     expected void [noderef]=
 <asn:2> *addr @@     got void * @@

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D02ef80c54e7cd70fe1f422b0315fd1534033e382
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 02ef80c54e7cd70fe1f422b0315fd1534033e382
vim +1386 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1368  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1369  void a6xx_gmu_remove(struct=
 a6xx_gpu *a6xx_gpu)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1370  {
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1371  	struct a6xx_gmu *gmu =3D &=
a6xx_gpu->gmu;
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1372  	struct platform_device *pd=
ev =3D to_platform_device(gmu->dev);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1373  =

606ec90fc22662 Sean Paul      2019-05-23  1374  	if (!gmu->initialized)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1375  		return;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1376  =

03b7af1ef4992b Jordan Crouse  2019-05-07  1377  	pm_runtime_force_suspend(g=
mu->dev);
9325d4266afd4e Jordan Crouse  2019-02-04  1378  =

2b117451277140 Sean Paul      2019-05-15  1379  	if (!IS_ERR_OR_NULL(gmu->g=
xpd)) {
9325d4266afd4e Jordan Crouse  2019-02-04  1380  		pm_runtime_disable(gmu->g=
xpd);
9325d4266afd4e Jordan Crouse  2019-02-04  1381  		dev_pm_domain_detach(gmu-=
>gxpd, false);
9325d4266afd4e Jordan Crouse  2019-02-04  1382  	}
9325d4266afd4e Jordan Crouse  2019-02-04  1383  =

a62fb211ad0c9e Sean Paul      2019-05-23  1384  	iounmap(gmu->mmio);
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1385  	if (platform_get_resource_=
byname(pdev, IORESOURCE_MEM, "rscc"))
02ef80c54e7cd7 Jonathan Marek 2020-04-23 @1386  		iounmap(gmu->rscc);
a62fb211ad0c9e Sean Paul      2019-05-23  1387  	gmu->mmio =3D NULL;
02ef80c54e7cd7 Jonathan Marek 2020-04-23  1388  	gmu->rscc =3D NULL;
a62fb211ad0c9e Sean Paul      2019-05-23  1389  =

29ac8979cdf720 Jonathan Marek 2020-04-23  1390  	a6xx_gmu_memory_free(gmu);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1391  =

a62fb211ad0c9e Sean Paul      2019-05-23  1392  	free_irq(gmu->gmu_irq, gmu=
);
a62fb211ad0c9e Sean Paul      2019-05-23  1393  	free_irq(gmu->hfi_irq, gmu=
);
a62fb211ad0c9e Sean Paul      2019-05-23  1394  =

998efc74672c2d Sean Paul      2019-05-23  1395  	/* Drop reference taken in=
 of_find_device_by_node */
998efc74672c2d Sean Paul      2019-05-23  1396  	put_device(gmu->dev);
998efc74672c2d Sean Paul      2019-05-23  1397  =

606ec90fc22662 Sean Paul      2019-05-23  1398  	gmu->initialized =3D false;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1399  }
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1400  =

981f2aabeae6f2 Sean Paul      2019-05-23  1401  int a6xx_gmu_init(struct a6=
xx_gpu *a6xx_gpu, struct device_node *node)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1402  {
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1403  	struct adreno_gpu *adreno_=
gpu =3D &a6xx_gpu->base;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1404  	struct a6xx_gmu *gmu =3D &=
a6xx_gpu->gmu;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1405  	struct platform_device *pd=
ev =3D of_find_device_by_node(node);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1406  	int ret;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1407  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1408  	if (!pdev)
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1409  		return -ENODEV;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1410  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1411  	gmu->dev =3D &pdev->dev;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1412  =

29ac8979cdf720 Jonathan Marek 2020-04-23  1413  	of_dma_configure(gmu->dev,=
 node, true);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1414  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1415  	/* Fow now, don't do anyth=
ing fancy until we get our feet under us */
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1416  	gmu->idle_level =3D GMU_ID=
LE_STATE_ACTIVE;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1417  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1418  	pm_runtime_enable(gmu->dev=
);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1419  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1420  	/* Get the list of clocks =
*/
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1421  	ret =3D a6xx_gmu_clocks_pr=
obe(gmu);
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1422  	if (ret)
998efc74672c2d Sean Paul      2019-05-23  1423  		goto err_put_device;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1424  =

29ac8979cdf720 Jonathan Marek 2020-04-23  1425  	ret =3D a6xx_gmu_memory_pr=
obe(gmu);
29ac8979cdf720 Jonathan Marek 2020-04-23  1426  	if (ret)
29ac8979cdf720 Jonathan Marek 2020-04-23  1427  		goto err_put_device;
29ac8979cdf720 Jonathan Marek 2020-04-23  1428  =

c6ed04f856a4eb Jonathan Marek 2020-04-23  1429  	/* Allocate memory for the=
 GMU dummy page */
c6ed04f856a4eb Jonathan Marek 2020-04-23  1430  	ret =3D a6xx_gmu_memory_al=
loc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
c6ed04f856a4eb Jonathan Marek 2020-04-23  1431  	if (ret)
c6ed04f856a4eb Jonathan Marek 2020-04-23  1432  		goto err_memory;
c6ed04f856a4eb Jonathan Marek 2020-04-23  1433  =

c6ed04f856a4eb Jonathan Marek 2020-04-23  1434  	if (adreno_is_a650(adreno_=
gpu)) {
c6ed04f856a4eb Jonathan Marek 2020-04-23  1435  		ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->icache,
c6ed04f856a4eb Jonathan Marek 2020-04-23  1436  			SZ_16M - SZ_16K, 0x04000=
);
c6ed04f856a4eb Jonathan Marek 2020-04-23  1437  		if (ret)
c6ed04f856a4eb Jonathan Marek 2020-04-23  1438  			goto err_memory;
c6ed04f856a4eb Jonathan Marek 2020-04-23  1439  	} else if (adreno_is_a640(=
adreno_gpu)) {
c6ed04f856a4eb Jonathan Marek 2020-04-23  1440  		ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->icache,
c6ed04f856a4eb Jonathan Marek 2020-04-23  1441  			SZ_256K - SZ_16K, 0x0400=
0);
c6ed04f856a4eb Jonathan Marek 2020-04-23  1442  		if (ret)
c6ed04f856a4eb Jonathan Marek 2020-04-23  1443  			goto err_memory;
c6ed04f856a4eb Jonathan Marek 2020-04-23  1444  =

c6ed04f856a4eb Jonathan Marek 2020-04-23  1445  		ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->dcache,
c6ed04f856a4eb Jonathan Marek 2020-04-23  1446  			SZ_256K - SZ_16K, 0x4400=
0);
c6ed04f856a4eb Jonathan Marek 2020-04-23  1447  		if (ret)
c6ed04f856a4eb Jonathan Marek 2020-04-23  1448  			goto err_memory;
c6ed04f856a4eb Jonathan Marek 2020-04-23  1449  	} else {
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1450  		/* HFI v1, has sptprac */
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1451  		gmu->legacy =3D true;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1452  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1453  		/* Allocate memory for th=
e GMU debug region */
29ac8979cdf720 Jonathan Marek 2020-04-23  1454  		ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->debug, SZ_16K, 0);
29ac8979cdf720 Jonathan Marek 2020-04-23  1455  		if (ret)
a62fb211ad0c9e Sean Paul      2019-05-23  1456  			goto err_memory;
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1457  	}
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1458  =

8167e6fa76c8f7 Jonathan Marek 2020-04-23  1459  	/* Allocate memory for for=
 the HFI queues */
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1460  	ret =3D a6xx_gmu_memory_al=
loc(gmu, &gmu->hfi, SZ_16K, 0);
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1461  	if (ret)
8167e6fa76c8f7 Jonathan Marek 2020-04-23  1462  		goto err_memory;
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1463  =

4b565ca5a2cbbb Jordan Crouse  2018-08-06  1464  	/* Map the GMU registers */
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1465  	gmu->mmio =3D a6xx_gmu_get=
_mmio(pdev, "gmu");
29ac8979cdf720 Jonathan Marek 2020-04-23  1466  	if (IS_ERR(gmu->mmio)) {
29ac8979cdf720 Jonathan Marek 2020-04-23  1467  		ret =3D PTR_ERR(gmu->mmio=
);
a62fb211ad0c9e Sean Paul      2019-05-23  1468  		goto err_memory;
29ac8979cdf720 Jonathan Marek 2020-04-23  1469  	}
4b565ca5a2cbbb Jordan Crouse  2018-08-06  1470  =

02ef80c54e7cd7 Jonathan Marek 2020-04-23  1471  	if (adreno_is_a650(adreno_=
gpu)) {
02ef80c54e7cd7 Jonathan Marek 2020-04-23 @1472  		gmu->rscc =3D a6xx_gmu_ge=
t_mmio(pdev, "rscc");

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0895121230316382858==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICGbf7l4AAy5jb25maWcAnDzZchu3su/5Cpbzcs5DfLiJtu8tPYAYDIlwNgMYLnqZYmTaUUWW
cigpif/+dgOzABgMpbquLB50owE0Gr2hwZ9/+nlEXp4fvx+f726P9/c/Rt9OD6fz8fn0ZfT17v70
v6MoH2W5GrGIq/eAnNw9vPzzn+P5+2I+unr/4f34l/Pt1WhzOj+c7kf08eHr3bcX6H73+PDTzz/B
Pz9D4/c/gdL5f0bH4/n298X8l3uk8cu329vRv1aU/nv06f3s/RhwaZ7FfFVRWnFZAeT6R9MEH9WW
Ccnz7PrTeDYeN4Akatuns/lY/2npJCRbteCxRX5NZEVkWq1ylXeDWACeJTxjFijPpBIlVbmQXSsX
n6tdLjZdy7LkSaR4yipFlgmrZC5UB1VrwUgExOMc/gMoErtqJq001+9HT6fnlz87VvCMq4pl24oI
WCtPubqeTZGnzbTSgsMwikk1unsaPTw+I4WWOTklSbP+d+9CzRUpbRbo+VeSJMrCj1hMykRV61yq
jKTs+t2/Hh4fTv9uEeRBbnlhbVfdgP+nKunai1zyfZV+LlnJwq29LlTkUlYpS3NxqIhShK4B2HKg
lCzhS3vtLYiUILIBrqzJlgE/6dpg4IAkSZqNgD0dPb389vTj6fn0vduIFcuY4FRveSHypTV9GyTX
+W4YUiVsy5IwnMUxo4rj1OK4So1oBPBSvhJE4Yb+6BYkIgDJSu4qwSTLonBXuuaFK7xRnhKeuW2S
pyGkas2ZQK4d+sRTyRFzEBAcR8PyNC3thWQRSHM9oEMRe8S5oCyqTxHPVpa8FURIVvdoBcBee8SW
5SqWrqCcHr6MHr96Wx5kOog/r6cn+svUB37bCZIHpnDgNrDzmbJ0hxZAVDeK0021FDmJKJHqYm8H
TUuruvt+Oj+FBFaTzTMGcmcRzfJqfYNqI9UC1LIKGgsYLY84DZ4l04/D8gMHygDj0l47/E+xvaqU
IHTj7JUPMdtqT0bTCx1cvlqjgGt+az3cbmGPD61uEYylhQKamTNG077NkzJTRByCy66xAnNp+tMc
uje7QYvyP+r49MfoGaYzOsLUnp6Pz0+j4+3t48vD893Dt25/tlxA76KsCNU0HB4FgCgP9gJQLLXc
dSiBaUq61ieGiZQkOGkpS+EwYikjVGgUIEhKBfmAlkoqomSIE5JbqhwOdWMuIi7RBkb2Pr2BQ62c
wPK5zJNG2WkOC1qOZEDYYTcqgNkLg8+K7UGqQ9snDbLd3W3C3rDiJOkOiwXJGHBVshVdJtw+sxqW
0yVO3l62O+1Wp23MXywtt2nFK6fObm/WoPNA6INWHu12DBaGx+p6OrbbkYkp2VvwybQTYZ6pDRj7
mHk0JjNfCRk50qqo2Qp5+/vpywv4daOvp+Pzy/n0pJvrFQegjuaTZVGAbySrrExJtSTgqlFXTRhn
DKY4mX701GbbuYV2usMhF+AWXYm8LKTdB5wLugrKvUE2q7+EUPBIXoKLKCWX4DEI4A0TYZQCfBx1
kXzEtpyySxhAZPBwN2tgIr4EXxYXwdrAhm0HuIxgoEHDhPuvGd0UOWwl6nZwsMMLMRKI3qoeL4xz
kLGEmYCeo0S5W9acUJYQy4NZJhvknvazheU26W+SAjWZl2ieOm9YRNXqxnakoGEJDVOnJblJidOw
v/Hgufc9d7RynqNtwb+HZJhWeQHKn98wtJ5663LQ8JlrR300CX8J6ULP4zbfoDspK1D3aktt+bsg
CN2H0bDdt/aUQGCFPRG5Ygo92qp2kcKTQGb7LlRsfC4/VmgdAEeV+d9VllqmCcTT+iDgLroeS1yC
W+J9wsG2vdMtq5tpWuzp2qLHitymJfkqI0lsCZSecRzZXNE+XRwSUrkGlWSjEp4HBZ7nVSk8Pdd1
irZcsoan4cMH4yyJENzVPTVwg90OqcXnpqVyNqlt1VzFE4ZxjCMw/Z3VinxH4NQ3/gKi/cotWUIx
0iCbka3f3E0diGfgJ+euYwMBwefAoqAXiyIWefuKR6jyfXTdCLOotuA9Ja5FLuhkPLfpa+tX50GK
0/nr4/n78eH2NGJ/nR7AwyFgFyn6OOCndo5LcFitSsOD19b1jcN0s92mZhTjr4b9CJmUSzO27ayn
BYGt0TmO7jwnZDlAwEXLw2hkCbsnVqzZep+2tofoWVUCjn+eDhFp0TACBk/F2lS5LuMYYsmCwDCa
fwRMiwXHxaJ3BJGj4sTOUYg85onxRVqGu+mZThbTxbzruZgvbfF1QluNambj+2EGhGFRDZo7sp6m
BByIDIwMB48nhTB68vESAtlfTwcoNLvZEpq8AQ/oTRYt2xQEbdoeNE6YZTOThK0wykBbDqdyS5KS
XY//+XI6fhlbf6w01AZsdZ+QoQ8BTpyQlezDG6fUkVSrsVVBzVRkH229YxBNhsJtWaaBVpLwpQCf
AkTWOBCtwN5AZFkN+XcNcDYNyLBmOst0orBOcEGwXiT2ssI4Av5ma1iZWv7IhomMJVWaRwwCFTt0
icF0MiKSA3xXxsQ0Qr8y+UqdoJLXM2f41t0udebLT2JgrFJtUP1WGNjbdkGSDGSaRPmuyuMY3FgU
h6/4p5MIoziL++Mz6jLgz/3ptk4f26MQir6IPzZZ8URb7c7qmRlnez7EcZIU3E0G6OYlTacfZ1dD
vQBccT8sMxAmQF0M9uPKzX2ZVkFTqZY9Wmx/yPKQctbQzazXAYQR5JuSIuw1G5zVZDMMXXM5yKqU
RRyEftMbFjz6fHDJ6RaMSL/Lng51+AwKp4cvGElg6KE+Ak6mJL48wP5s3DSnkYfZtC8jjCgVzGcZ
sMI0634y7nc8ZJ8hmgq6TBpBsZUg/gwKEfUoqXWZRRfoGPDUI1VmvMBkrNe8BVcc8zu9UfaoxIbG
uNl7ZG5gdVqbtLYvcDRtXyfuon/dDOZsdDqfj8/H0d+P5z+OZ/BGvjyN/ro7jp5/P42O9+CaPByf
7/46PY2+no/fT4hlH3a0hnirQiDOQ2OUMNAilED85y4N8ZiAXSrT6uN0MZt8Ci7SRfsAaJfIzMeL
TwNnxUGcfJp/COt0B202HX+4ujDefDZ/w7Qn4+n8w8TJgnhMkgWjZW30wHJvL/FqMllcXU1fn/zk
ajb+NJ1dIDT9uPg4/vAGdk2A67PFmzDni9l0GtbC7uTm07m7lZRsOUAajOl09iFEx0ebTeaWD9eH
Xs0vDfJhfrUIpzVcxNl4Mrm6hKj2047qJCyDqCermCQbCOY72RjPBrllSYhgBSi8SiVLK6QdIOiw
VeN8jmI4GuMWaTxehFcjcwpmGvP7rZrEtDMPpo7R9CQcnZF28MVkMR5/HE97M/BmySD6mgRIxiWE
kLLsJgrLGU9sdfb/008uX+cb7crL/tmYLGrQBVlfzAM4DsaWGOd7FtBVDWz+8bXu17NPfvjRdO0H
JqbH/KOTeIRGiJgzcAJCxh4REo5GtMaxHFKdrUup3yJT+zJK6OTm9fSqjS9q/7fOnzd4pZ1Ly8Cv
lU2y20oVYMCMM9IZYESquB/kgwNqEp3mbgU8DIsspvQbkE4SgLssILakYIWt1NI6TxgmnrVrb+/O
+gaPTnDbATS9GgTN3F4OubE18M31xIqeDD/XAu/5htLjdSIBRK3JILguCV6aQhhQxxeD4C5Kd/2n
hFHVBCUYbSQeu010EGcYCTp7sQvnPeRBdnNflysGyir2PTydMkJgVaQRBhfCnzgmh7S7UGENh856
huMpWYD0ajKFqm82Oj3GKEbBofsuIgjezznJoLrt0o1ci7xhe0ZBuIK+JxVErquotAO6PcvwTnzs
tFhRHd6f6lseFMlcgMuIkX1XIpFhXF9HhWACWBKUN51CgcCEZDqmA8+fmoxJJ6sGhSVTcDZ1KcwF
JSflMph/zyOiiE69tok/sx1RX9XJXaXUUoyBv+FgA5EUWa3wZiCKREW0cXPKY4hz6dF4qH99fD8Z
YTXS3TO4tC+Y2nFusZwRQF5JHC1DaahGe2a+Qk0kOmJ5yqn0QairLoAb360zV5cmay1o+uYFlSSc
Tq5XA0f6AhgEFMJUNbwhNCv6CxicnLWA2fAC3AkqgRdBa8trM5eFrfDmcKwJBZ9H9XAwNY+AUmRa
ZkzE1NCXGgf69tpozMFGrDAFJAjmwVRgmwZXYK1y/uZtImnZ47Q34CAxa8CrNw/IxkXozJrIWmdi
+0sepO7umdwGIhIwGiXmaJOB6816uyUroxwvc4JIZmJ4x4XXD+HbMmP9MXeJsqF1F1obwZwkrx/Q
agYtH4Ha458Y9lqCSNNIFwi+e2fd58Q8uFMOBZPsevz7dB59Pz4cv52+nx5s+p0BKiGmy0LbUdh5
u9TP2EMLibZ4FRgFQDTZON9NftOUXFknYfe5KvIduEMsjjnlrLunudS/yq2rQZ1dT33jzJdgiHRN
B97lSR5wPMzKbXCXixjiXFN/U2OkLUZbhQow/uX+ZO0hFpg4l4tNi7nFLLAUTfCtkz9uUVb5tkpA
gdh5GAeYssxJgjlAxfLAzkbKYGjtgoO2CZVm9qPoDIHJ2VWJSLpeiH104OBQ3sCGdEiAslWrYzjW
8i8+n/77cnq4/TF6uj3em3ImZ32xcO/cHFqB3ja4t3GaeHx3/v738Wwv3FmjpCnXCj+neehe2eAU
HY5jbmuQFnS/RlGDMYrAG4SYuFfrEBqkO3A90f0F7yqomOIdGI36ZjswM6SbdGlG8DgFVnFY9yke
gpBWTKRjYlh8vwUWssuSnETmBqB3ahWvUC76/ACTKLiEXvtK7JRFuXbmgXpKKXU5pGUs3tm8UQxU
cbZX0BzkyyrPVyDkDQtDd7Rga5t7iuYUqNO383H0tRGHL1ocbGnQWdeKb2lQAMPddf+bHw//HaWF
fKQhaaupm7RoO2nnAsgFhSph6klcHKlB6kGsW1wIMUqIpW60/hx2wMSh0EXd3dnULRgtQaxtsIKx
R4N1NZn6l5sdcNIMwwaGaOFvG2OQ0OzVmaaziyTS+RumslpjxGWRccFUUDUZRzweRiFMDnCrhVzs
BkBwUtLAChyUZRK6DOlh4pUf4gbI0TWExWQ61jjhZKRBLPLkMJmNr15FzNaDqEPzW7aGrblUtxzI
0y9fTn/CQXCdIic29us8NuZSMjD0rxBFg41e6sRE51iBcQWPZcMw28CSeODthFZ6nfNTZnDuVhkG
mpQ6MYNG3Pg3o6YV4owgIC4zfZ2JaUpwRXn2K6N+TT+gOfVLXUpF34+v83zjAaOU6DICvirzMnDn
LYEd2r8wFfR9BA3ESiaTKQvkVeJcKB4fmqq4PsKGscIvpmuBQLXOFw0AIy50TokUwXWb5zPmIU61
W3PF3PJbgypTtHz1+xaf8+DygyDijQlGA/VmVqRX54XVQ0Obhm9xBjs6HrZuWe8gMGXE1Dh6MJ0H
wzmF2rH+qZ6nmxDqWOKI+AVooCorhegSwtk1jGHu/rGaJgjGquYQSr11RlBNHXGvMM5Mpj469c5h
QtLnmulnniYNwKK8dIKFbp11sg5zasr2xy0M5GICm+BnhJ2YsJ8scENG/xGBCx5SInTwKYQGD9f6
21iBcv8B1ZBh4pbVSdIAq82uYQJ165wzE4xLnZ4CtaglJnBMNagJuUOknXIkj4AL8+qYnGJAlRfo
x5oeCTnkpX90aF4cGpWgEjtES7DoZgnMBncssgGmrGk2hdE1M0PTR6aYjQ3pKAVqUjW5VLGzLs8v
gPzuddoj1D0E6uZWP/cT1ToELWDHZlPcNyx2CxTL4M6C+hUMl4hia8syJsDtGkHHoBpzTfPtL78d
n05fRn+YTMmf58evd34ciGg1G4ZyScgLjWZq7VhdTtpV210YyVk3PgvF+yIndeE2WvNqmit6oJqX
CdtzdQjM0sIFtYk8gX8FCFxoFH0cjGobGK9DsEu1gyHCG32iNp0OIoMVybaHoatwJRaNdm9e68Nt
z68WNXN7gPFiuEDYYJWZj9HB+5a2b4J9elLQ9gGqWw/ew+ThW5QajNuIOdxLOHj5tatSLiXq1vY5
QsVTfdUU7FpmcFrAYh3SZT5QOw0nNm3wNlj/HGaPVqr6hVECLltZ2NxY4qkLnRKZTbzDa14kV7LA
h8PiUN9XvYJRLdcXkF6h8TYC7jPNQRRJtr7nYKOhfF2cjEG4PJ0a5/KEOqT6tUkYV5uV4Tm14MEZ
dRiD83FQhhmk0S4xyEK4PJ3XGOQhXWTQToD7fYFDHXxwThbK4JRcnGEmGbxLXLIxXpnSa3zysXqM
KrNXhbu96DbXgJVIrYfjWqebzqAhwQ+yvVqxkywdAuopDcBaJ0C/tI80GuJbmnsY4ncWu3DXXnvn
/ZgnIMA9UhR6XtptYP+cbl+ej7/dn/QPToz0i4ZnK+xf8ixO8drafnaUxNTheI0kqeCF6jWD7nfq
drEvhlRBEzw0IT3b9PT98fzDSlP30xQXCyO6qgrwAUoSgnRNuialvYvQhS+e41cPUuhn/yo0DEQe
4PCxEGhrktdd+UcX2Pg4Q7ENPsLRIqcLbvpxe0ykqla9VAJmCdq+jnvglMGH3n2Ymg1dr2Gqh9q3
DnXfJZp7O5VSNxj330uzhNr0Iw3B8HQ6UVbglxeK9UGaygPlv/7YSGsjm6hGszvl5ub5ej7+tAjr
hHopMeGJ91zbhQQYNBABWl5LHw4e0o4cQv5LEDs1L8vsiIuBQ+tX6NKhNxFFnoddvptlGfIxb2Tg
+VX9YAEYWgwV2jT9dMov5OXXaS991VDxXAdG9iCwbUwIN3Ghn4aGH+NFzXujJtK/FP8U+i2JG4LH
guAPSXi5iLquTb+/t+IPfJLLMrpOifs4SxvxPEswOC70u8/g9ZMzESwfNo+gWi04rOg67WTX8jEF
nFm55RTYyLw2uVmiTmJZExpotZqdnrHMEgK80F04HNENC+0g2FkrUMav+k7M8uOhLeIktBcma9Cd
jEReekmNYJWHjtw+FtZZxy987YIBk9dKklXuNflPZXVje+U4MBgoiiXmaTk9eOSMjmI9ijrpLRWn
IVEwYxaoC9292zDnpVPd1AwS0s6pc0jhc4j3+6jAWmHYVks2rEbdr4NwR9h4Yaxi/Uso3QksutoH
kYMPFcrJAZKG4c9DQUQYOWSLrPC/q2hNC28UbMYn2uGL3xpBEBGym/qkFNxjNS9W+uowLfc+oFJl
ltk+RIvvb44h0v5ITHjxab363m/AtLDQxh7QfuYbzqQ/j63iblMZWVN25hfnZZBhNaxbazjgRiGo
yHoYBnF98KJdz9MVb92oBd/nroYEG/siWSlahJqRBYFmQXahZmyCrQcjkzvnDYnDX1etUId0WIND
yyW37ubbPGoNv353+/Lb3e07u18aXUnn10eK7cIViO2iPkfoYYZ//kEjmZ8ZQP1SRQOJJFzpwts9
BwSb5/JFN/U1qQG1++lOJOXFYnCEwe1e9FuRmCPZukVy1RsS2qqFCO2NBmcRxB7aPVaHgnn0gsOu
hI/WhgDa55H+pMolppf8ZnOW+xwyx98jOby1BU8lhAHTYQzJVosq2Zm1vIIG3kroFaCRtCJpyTgu
bwHCGlak+L4Fb39qH8hSJ4UqagUfHxyI7gJ+u74AALOYFs1T7w7H3CMFhlwW/hUTqKyIUl+xYFNz
0rUjgw0jSnn01PuNRJdQhUhTv3LPBs7cLbUA/coTD0vFglYJX9p+3uDMunnXdZHr4+0fzk9YNWSb
ybo0vV5WJ0mVc3Lxu4qWqypf/kqz4M81aYxapRk7pEUJVVifUgAPy1bC75WGeuBd39BMXpvBpZFt
MTGDGzHp/PcoGIg5v6+IX+ZxLpoax2YgxNRcDFDxLBBR7tNbhUWiPHTeEJQQ7+U0tKVFTgbQl+L/
OHuW5UZyHH9FMYeNmUNH62nLhz5Q+ZBYypeSKSnVlwx12TXtWLddYbtmdv5+AZKZSTJBZe0eutoC
QCafIAAC4PxuvbQ+pmGwDrqt1N9BzSvqw6Iy9tem5KF5p6l+N3ybwsLK8rwY3ozKHSmYK40AiFwS
J+hks57OZ1T6kDAKLFFU/danpGGGSyxBGH6S8ZYVM70FMBERqLNJpMHGLg9DamDq+cr4JCs2pmUi
t9p5l+RnK0xBA9rEiObnWlS2I3l1FEU4OnZcZA9tskT/IXMDAZfNoD83K9JCv8HvelTf8P5AYIFC
eqRrGRrVct7Dj6cfT8CAftUZySwOpqmbYHNwVweCdxWVv6TDxsLYki2UVekQWJQ8H0LlGXwYwksz
kUkLFPGGAhLFq+gwkLwlfBPf6E2wEcOq4Cgk6me6O4MvgORCyUEtOhSuraLFwP8jKrymK1mWxPAd
6GEV+42vgcEu39PafUtxiKld35W3jbktOD74MAHbD7Q0VeLWwtoRo17wiPwwCSctMbIWK7lIP80E
6cBxuD8lQ1tAaxHtMJAD3BKJ+HATD8dCnEu7Mcl9FZFu429/+/7t+dtb8+368fk37ab+cv34eP72
/NURr7BEYNt7NAjvyznF6Fp8FfAsjBy1HBGS6S+pKm3PZwd5XBgZHTRA+gUModR+kV8WJ59poUXf
DdsLitSZqi0YZNRzR6iI6dqicghPWRXsWocOAxdJxI2vsMCxJzI0uaKVa7CFELNlnnyGLUHKy9KT
trElEQydQDxtQoKMUW3CXOhUkwQnI0Y79H6jSzoInXNo2IMioWTBFo2CClXMydQ4bEWah8NG8Jgc
ZqWPod3PZ8uKI1nnQAXTCIoXa5TeWd4pqoLWXHyDWyK/sLhRQB3aYSYwvWSOec8N4RFOa4a3MSez
hh7a/nmidEGDyvSUM+Ahqzz1ZnSaZYMi9VjwzOo70c2DIzEyHqXH5EWUncSZV8GOBDaOnfGkDbS+
SUt4tvcZfXE922sEIc1WWBMoYchb6RsULJYJKwn8TlDKulwgsg8gWNufTRaYYR3tWhbqUFal/asR
aehAYEO4yzkLyBRKZWH0toxlfmVTSKjtNLQ6kaq0XpSehI8GjTZfezpeYs5fcWnsvJQbWzLUGRc9
VSCD128O2Lc0k8+nj8+BHF3sqzZFtTYDDMgdhHnbY0wmS0sW+vpPBoJvzBt/zFYYhaUFKWM0d1td
b4FNVdG5v7GiLKL4OWB23Fa7EURvCcC40XcmhlT2AdNGJljd6De8Ck19+fH0+fb2+efk8elfz1/b
qCbTdaJqDgFzGxrwTSV8I6wIjqykD1eFDquENqe01S88/E2hk2MUMNJkqghO8J/V8bQ8JQNAg32w
odWegmFnLBiGyqmN3Qfp+say09Vj2FNlYad/0zBpvyQ73FPIEI8myQV5GduSOWy7rPcsdL64D8h8
mFUZsbSRfhvG2o/5pimPls34zMsocfKEBfEWNWprTpU43SJen54ePyafb5M/nmDI0DnmER1jJloX
n/VrroXgnWMjY6swNYXMwjHt24BpJf9j/dTZStQTGeuebe65ycHUbxjOwnQI19Bt4eqDD4X7W/rb
D8nslBoa5iZDZTy2fxmmTxMKxeFcoYKhEHsUhiYfRMWuM8k6MLx0Ae7kz6zdEaJflinhUBw9No0V
MZoBt7wyHZAQmAVWAg0NarzsAAlgsw7WTfZ0fZ/Ez08vmI32r79+vGqFbPJ3KPEPvcesO36sCeRn
71di0gKGmCJbLRZuqyWw4XNSsdP4eaM5g92ISnbZXzSrCz1OQyAWG1S4iM9ltnJrNE7DnxqrzrKn
lJaBrG1YAs/uvVILsTW5ELMbaa8dDQLxAlZV4oppKPM1qTD2Ajog5ZYsHVW7Ks+TVgbsESqSrs/u
rC4WFJclw9lZujHkaRXXy3Ybp8bCnAL3xzChgQFsHX9sZJ+huvc7Cbh0AwNJilgLiGXCysagIVRe
4w4no83RkZVc6jYZeoT9FLEvqsAgbIqKOjiw66lwRs/3bg/iDkde7oXTtRvp/+XYVkf6jSZE8vzk
xYEg7McxR/ztRUidRawgOBPCvr69fr6/veDrFI/DtAJYNwPx5AQarX80a8wRXTfZmTZ3YSVxBf/6
coIhgVza/k+UICR5y+JjXO1CHmultxJfalBZts12O4A1RcIqXG8kUi0muxmYydXfU9UXne0U1jJ9
CAwIQYb0UkZdJlhZxk/WZrgdrJPw6eP5n69nDMTHJRO8wR/ix/fvb++fzmKBo/csh+Tmp2TAcYWR
aTep3Gy89odQcPVjgXeykDXrG6t2z0tOB3TLbe9m9bULt4lnb7TA2QztffCNsVRe1W9/wDZ8fkH0
0+2xTvMNP0U8kSPub0mfFxk3yZJs1o2vqs9eH58wtb5E9zwDn5mi2xawMAIW7FsMbbKT0Wq7bDc0
r+r4WPT6+P3t+dVtCGZjlMHG5Oetgl1VH/9+/vz6509wRnHWRpUqosWZ27X1DAM1QJOBpAFn7m8Z
l9YE3AzihGKbY6cDF8EvX6/vj5M/3p8f/2lLlBe8eKRXSHh3P6dTrPL1fPpAO7uUrOCO1tynMXj+
qmWZSe7GAxxVVOUuSgpTXrLAcJhVO+vJxVOVFva1bAuDLXB057bTAlkWssRxXej7XapvdqlK5HOP
gw51GUhe3mCpvvc9ic9yQiwFswVJz+cQH5EyRMK6AtGty5nSd68vJWPc3aEh0ZgBNtlYcbk9XRsG
aKr0bjc6bVPFGZ+6KBBLwZaxgibWc1uFuqrKDnWLIDqVHucqRYAmHl1No5L60xOXNodcNPsjPgfq
JqzofT+wMiYfQ9FVyuQTxPmuKmqJ1PuhhhLQPnqAQenHKve8d4no0zGBH2wDYkZl+YaCxtBszCQU
ZbS1fN3Vb60v2TCQaPkAeJ4NQGlq6vFthWbQVlthEGyGhAvTXTJlKpeoXMGx7ZaCyFgydpl5gxjP
dkhUDH5e5Em+vZhr0cMjlBnvx4ehEBt6UGAqNRqASZjdF+n0YwLNlosN0BldlTmhog03Lhzxjgrj
FFJ7erSWBb+yyLyHU/CtOSGtGIAaUxU59bRZ6PXjVT0i3XFN2dvcjI537F01wIp/QKnSzRW7zYTz
CxNoWQ+5SGCKL9y1iG5GFT0vY40jt5MkOm5qgqbtU2UZ5+Cn3EnD0Pni+v75LHX679f3D+dUxWKs
vJcv0ZAxxIDX+QYVjfvNPL5ZlsWCLgerXb4zNijcn+WDdsuGHz8wU9sbvu+nXhyq3q+vHy/KapFc
/0N0MM8LT4w2IOUbPBhZheFu8l5mMIIlS38t8/TX+OX6AYLFn8/fKQFFDlVM3cUg5ksURoHDzBAO
u7d709etSl6Z5fIdNN/4IjPZsGzfnHlY7ZqZXbmDnd/ELm0sfp/PCNicgGG2OOv5la4HaSiGCxUx
IC5Qnnst+ljxxK4OZsEB5A6AbXQgYv/2pX/mlOx//f4db4I0UFqVJdX1KzCG4fSqvA1t4NeNRbW7
CF9qPsSr9HonzOpC2UtlFSDHqy73OsNIa9XTmE8v335B4ff6/Pr0OIGqhjc0dlvTYLWi3EQRKZK2
DVbvSo/2K5dVFTpopdM+f/z3L/nrLwE2eGCBs2oI82C7IHnCeOfMxmdMvidVOlsOtjpiSCC+2I45
pmSU9YDXaZpblg+TLic9Sk2KeY2bfztY2hIZBQFqPDsGsoYVC0oT6AAoa8ecG91Tq31m4Y3tFqP4
3fXfvwLPvYLy9DJB4sk3tX96fdG4cmkrBPWTJZz8lkK5JjEPVViRdQQspqSfDp+y8hQlCTFMKKJ4
h8G1agyqNZ927KE1D8jq/Fa1jgQvim5TtCauW+3S6n6riqbPH1/dbSTp8B/f1UZHBIs5p0Ob+snh
Yp9naNQaLJekCMNy8l/q/3PQitPJXyqAc3AnjNVJMntMDzyLc+MY1Lt9vGK7occNbb5C3O4Cahxt
Sw8rY9/IJMJdSZBuUFvxpOkDbAxTVVmJyQCoYnpJ1D7ffLEA4SVjKbcaMEwNDjBLtchjOwAWfqfW
3XOOKbQwqSsKNWZUv0LgPZ0Fw9sU621a/IL18gWISfohvF4xVKCG1ev1/QN9B93SzObr4YOV2SmN
LFtbeyllwrvlPdRT4LQXeSmahItFcprOzbR/4Wq+qpuwsBNNGWDPJRto3elFj3bfix2o7R7rZ8Xj
VB4yRGU8EA+LuVhODTkKdm2S40PobdJdSzTegW6Y0OxBv0QjqrKgjx5WhOJhPZ0z0nGPi2T+MJ0u
+pYoyNx42qEd0AowqxWB2Oxm9/cEXH76YWomDkuDu8XKkBVDMbtbW0/rCEdMcLU4vBSLrQtu0744
MEVoGn03IsI4Mi8QTgXLzG0WzPVyVnlAImA+qWFbbSdLwhtWzS1XWw3GJycD2oFHU6SsvluTL0Fp
godFUBveshoK8nizftgVkagHuCiaTadLk006je8bEWzuZ9PB2tQZjf/n+jHhrx+f7z/+ko+3fvx5
fQeR6hO1Kaxn8gIi1uQRNt7zd/zTSneM4jspoP0/6qV2s22aUTc4qDEUSTtj/PUThBPgnHA+vD+B
+gffGEzfKS8cC0FuPQ9xqxJDF4+y84G2jUXBznOWY+AlSwJ8IDvwnEpIAspv7aXYMVDPWMMoqQmf
VLcOS4tFKk0APQO1eDwYGkQ2yhe3l66JAt1+ltfe+HyKcQHXtTQ+CicptJqkKIoms8XDcvL3+Pn9
6Qz//YO6wIh5GaFrEDkKLRJ0JXEhF93Nz7QdUH4xmt/2sEFK302ehb6kHvJwIDHYwO3R8Svrl8lB
Zs72mGt5TN9PSy/kyKdpsQBdsOkKCy/qVPswqNR4LMAbVkbHkNZmt548BNA+4V7S9P2Cv0AI8eS6
ONINBHhzkjNW5nA6eEqfooqWZJXrFX6cblSSeq4fWRlkZAIQDCjs32jo6RHsXSiIdUKKLRxMD6O5
AWKjzI+D4w04JL3EEA+Hyv39fEXfL0kCWnFBFOz3aD6det55BYKdHwUTndOWEuXFpkaQshd8vj//
8QN5slBXeszIS2lZM9qr3p8s0p2omGE4czPJnEDCALa9cN6F1ZeCi2B1vyR70xOs6eu9EwgcnoCD
6lLscjKFudEiFrKiimwnUAXCo7GMOSmDmhVsI5vXRdVsMatHCiUsQGNIYHm9C3w6kXQntYpWkZ3m
gwWwgj3SqzrkK/IZHbPSlP1uVxrBGdlO5VhZ26E1Ddez2azxsYwCN/6C3jB6trM08DFUqL2pt+QV
mNkkOBqyilt+0uzgeWLBLFdaCyHCcO/W7WSkJA5V7rCsxMcWPL7WiPBt+WTmm+GxpXYs89IeCQlp
ss16TT5UaBRWmWfsPbtZ0lt1E6R43Hm8zLOaHozAt3Qrvs2zhbcyqtebbWq+8yV/kpKVuudCXcVX
/8iah3FBW5E1LBlleTfK9MYl8zz3xSN3hfAtWbNM6ywF49YUdAYXk+Q0TrLZevinQVN6aBJ+OLo+
FAOk0wiil7soEXZQmQY1Fb1VOjS9Qjo0vVR79GjLQJ/Ibb7IfaGlbRGZZtDacdso5Rkn+WkvBo8y
2tA+pqQke6QzO5iltO9u/6FkTvuTCZhu1+F0WF+UHhMZO9uv/Gg+2vbod/2Iez+QEtJkBQaYZnCK
pior91hN+j1gQoqI09OX2XqEHaq3iqzJOY30uHvU2LIp8Xq1C+fN1sl/YxCALhhHfnQxXXoPyV1G
C3cAxywX9J5GpJcBA5J6Vdrs5pGdI273cXSx8/V8VdekrCev46wZn5HHTaRfxbXoPFIx39JaHcA9
jI7XviKuGGFjfNUtfS0DhK+Mx4c7TmdTeifyLb1ovqQjS7W/r+nPmFPq488pan6ei5VTUdAHtthv
6e6I/YUukQcoseJz6J6F2xN4DjSzh4R7L0WVgASZW2wqTWrYcLRYCbjVwKZnYsX5JtqbHqBtDw9K
ezPsxXq9mkFZ2lVlL35fr5cDKxZdc+7yVuj7/XIxwgllSRGl9u2iCAKYjyjJ21DbkUoupV0efs+m
nhUSRyzJRlqVscptkwbRK0OsF+v5iBSLyUhKbvNvMfdsilO9Hdlk8GeZZ3lqR9fHI+dwZvdJuur/
306+9eJhShx7rPaaX6L53msH1aULjx3GbPkJhDhLnpFPTITO4TUsmO+tPgN9PnKcqLywMBZbnjl3
OKCiwjInu3KJ0Mcz5iPaXRFlAt+5MauFVTF2xB2SfGtfTB8StqhrWiA+JF6NBurEh7996IM31U7b
kCPavu2o50PA7uG09MfzKYdBnxRSpqOzX4ZW38u76XJku5URmh0smXM9Wzx47HOIqnJ6L5br2d3D
2MdgoTBrqYidV64q2WlE4UJ133YWVZDbpQRLQXq2rtUEShFuQ4iSUXQgxSeRJ6yM4T87j3tMT6TA
gEpcHiN7ACRZO8WICB7m0wXlqWSVsgeYiwdPEBSgZg8j60Okwk0q/DDzhTRJJiUpAo8Xf1TwwBeT
hZ96mHkql8jl2OEh8gD9GGvrylsA/2ZjeoOo5BFrlatStEmMrwo7JcWOFcUljTxurbjyPCFWAWaU
8Ji3M34cacQlywtxsUMWzkFTJ67SMyxbRbtjZXF/BRkpZZfgTchOHINwvSJshe8hg3CG+T+FJ1FV
lZA5JozvnuzjDX42JSg/nssQwJ7wSS76pSmj2jP/XRnCu7IK0pxXvgXbESzGTHPqSt6sXF/Ss5r7
Gb6mSRKYj9FJrHlJ2+sRMfe4/8Zh6Ll45UVBuqqhhUjdIhoOTAi0bpkVJEi7KMZe5mwxx4z7+q1o
eLVhZAqa9nONla3bhN76tKbw+6CZVBjjUEaeJ7AsQp3Qt/bccEriESuDpOHFYT29oy1hkkAK/Sn3
ObQhiVLR/HhtK/QT1AWZqR72rcqV0PKyM0A6/zvOJ/DzhqstC3mGdZDfxbsCL07fEPgJlP/VxksA
6+EehMBb+PX9bXwTXLYZzLaXRFvfb35juV7PvAQBDzCA1ItWpkovHtnvre+HBWpf85v4KljP/A2U
NSzXt/F39yP4Bxff8iJeR3INWCJ/UCQ3Bl15kddndvGSJAJtubPpbBb4aerKi9NWmlE8KNJ+GmlR
uImWZoGfoKj809PZCLwUmXxAh/lbgnk0qi8MhDD/XmDVerrwow83W6DVjRt4qSH48W1cuY8A5UQ/
sopm05pWbfDuFY5THvg/fuJVJETkxevzeguscF7iv7SY7NwC9IiChouEcDnevX18/vLx/Pg0OYpN
6+ojqZ6eHnV2IMS0WcDY4/X759P70A3q7OgYbYKi5kwmx0Ly/jo+Vaojhaus23L4eSNJBWBXA+MH
WWlq5lUxUcblJ4Ftb4YIVGv59qBKwS1TIMaVe8JaipKLlEyLbFY68NK3kNpgSmNLZqd2sXCdHk8h
zQwjJsKMOzXhlYf+90vIBI2SZ3SU2XdpWgQt2SUY+recn1NWT9BX7eXp42OyeX+7Pv5xfX003JyV
a6pMeGWt8883qOZJ14AIwhdmtHpjzZM6h5EGu3dyarc62oakP10Tlzl23PKrMNAYMw1YmqGkaA6k
b0VVcW9OJswQqJMA0SejCAlvxNfvPz69DpFtVi/jdAWAL0ueQsYxetcnlq++wmDqQyu9owKrt+32
VjCywqSsKnmtMV2g4wvO2PMrsK5vV8v1XRfK8QHY4WdaOOZrMrUEByvgXIapqn+bTefL2zSX3+7v
1jbJl/xCfDo6kUCVqcyYBl8OJlVgH102ucrR0M1HCwPGS2sQBkGxWq3XP0NEmex6kmq/oZtwAJFq
RavFFs39KM18djdCE+qspuXdenWbMtlDe2+TeBU/i0IuX0/64o6wCtjdckaHfZhE6+VsZCrU2h/p
W7pezGleYdEsRmiAK94vVrSDXk8U0AaDnqAoZ3Pa3aOjyaJz5dFD++Hxhot1JJgOF+/zRlqkzboj
RFV+ZqAujFAds9F1xA/ibj4yZTkwM1qVN5bHAvbgSD1VOm+q/BjsnDzQQ8q6Gm04KgmNxzG5J2IF
KgG3iTYBfTj1i6QCqQ6DC3zHh2Sylo0GAcC0qfc6FG6YTkDB1dMdOEi0ciSJoMWrh3tKRFP44MIK
I+RLASOUcpzMgjbGE0nlEInUtpFJ7EnUdc0G37RzaeqeXzJWSAWFbEyPRoGI1pb1qYVPhVGX8opA
vkllCQIKgvWi/2rgeWPMpOKFc+1PUe1YdmaeHWuQ7TfwY4yoiLZMkMGNmkitGxD1QElYDqUcuXLU
UX9j7DBihfhEmfKlE2YtQc48SRisAl8NsRmb1kJkw3MHPg91sJBLP5sNIHMXspgOGhUvqD2hUKul
W8Fq1Uoyu+v7o0zyw3/NJyhNWrGJVrvlT/zXDaJUCBALHc5loTEp5d72NNDlAk5zC4VO+AbQw2Il
O5PTrL+mPLFvVQy41HqfQ5csg0Z90AYXdDOUqEF+5uiM35alkTt0LazJBEhyRCUdQbIky0XpcTbd
08d4RxSn66lDolUsavr7yDJC11Dm4D+v79evaIwYxLNW/8vZlzVHbiPr/hXFeThhxz0T5lLcHs4D
i2RVscVNBGtRv1TI3bKtGLXUoZZn7PvrbybABUuCmrgP3ZLyS6wEEgkgkTkop38nW9TZJL52w70k
TMVDRCsRJuexGf7XC+aIzxUPDIj+lcb4hqPriLenh2fz1fYoPPiz5kx2/jMCsae+FZ2J17zoepCY
Q5FPfkxoPjcMAie9nlIgNaqzGJlth2cSlOiWmTLxtoguSPHVKgPFJe1txZLXATJD03OrBikeuIz2
0PllXcwsZBk8LHFu0bllxpR1GJn9pJtRUN3FKluTcrsAmKs9eHFsuY6W2FqbnxOZqR7CIIo+ZKOc
PBJsXGsmWoa+iAjXCeKt+evLPzAxUPgg5wcpxFPEMSuUuJCZ41ou6zUuS3w/dd5wN1p4Pmx1wjkm
wE9blYPFdlHwsANszakTwxFX12OJKM0PPc9PjNZoR7heh7n5zt72Qm2qdrkrLa8MJ44sayyH1DOH
G5Yssujn06cRi9inId1bDY5U1o/YxvPtjn3ICcvgGtzbzFUFDLP2WnUflcG5ymZXFZePWDO0CeF+
B8t9mYHEp8/Mpt7tLI9Yp1FwKrbHD7ug1V0Tzw58lCVGG591NvSzJ309ywbGLXcxaalfc91bBmjT
fm5tRplHtC+wROHgHvdgyDbUknM4TZ4Ol2mGNMVRBxIU5/4jgTw25TlmlIY99gA/UD2aSyj3GIk9
Bw3RlSQg4dF8M1Bt4IASOrIzl8+uEyd60kUQf0mbrbzhLWHfixucvLKEQa+3ox3FEm9e6qQzaKhN
Ll9nzCQeOhdUQ+HVZOm7GReOoPtm75FmKQtjq5zCLnQ9RsOCzC+cDETxEiQVAftANWQpbNNLzePQ
6EoWrwpuvhDK4TIP7puMnwVaTqfQOy0GWto4ZMsXeCNra1nvbRTbnLKbLsHIGWyt6ZQjfFfF5Qz8
bQzKDP51lPMPELLV/eSqUaNxP8craSbfPZOrY2sNp5HUHzEIQXeUdngygv4JZ5ez4ujay4iLA9lV
BZ508NMf9Gik9CoA6D4upZQ2Dh4glXJ0DkRh4yMsTP58fn/6/vz4FzQI68H9qBEKDCZL+63YXPFg
eEVDmomP+RvidqHD/yvpqiHb+E5oVBg+U5oEG9cG/EUAZYPyywT6Yq8S82KVv64uWVcpTi1W+01t
9ejrF7dFlnZPh1jzaEiff399e3r/49sPZUCATrFvt3K4vYnYZTuKmMpV1jKeC5s3nOi8dPn0owC5
gcoB/Y/XH+8fuNIWxZZu4NMXCjMe0ofpM35Zwes8CujLgRHGp9dWvDQ23TLILMecCHZleaFPnRFt
+HsAS0B5xPkDAhj7RysLK1kQJPaeAzz06W3DCCchrboifLJ4YRgxWNzMe02USn//eH/8dvMrerUd
vUP+9A1GwvPfN4/ffn38ikYRv4xc/4CtELqN/FkfE9us9mKf8lY0onpYBk4WDoBV4vKAWCaijFaP
dsWUZuW+4S7B1U2LBpqBHzQGVqWnQpdkcgbkfgmZiro4eWq+Zj25QBUhYEVArbY3xCZscy9WmXkK
N5fLRU/TgB6Sl+R5tIfvm/DqR09j3XNz8EwGvMapkaWWXuwuqV4GkESPWjKbt3tqTnfHTiX0pfoi
hdNuyRdffHoceJSFShsHrKyHQht5uFNRKdPBgESajhT0KsyOpC0PIXG6YfSbobSpuFieMCW1z+aV
ECgcrrrEOl4wAsu01BR/gR7zAhsnAH4Rcv5hNGmyyPfR8Z696ineg51MTbR9/0OslGM5kkhRl7jx
Ju2qx3tC7PPFS8JIpe3G2CzSIkcuaJq41KL3yBA13zlx9JVmbbzwf299Jbmw4OL8AYvmU1Jpn+6D
SnH7nmHQNKCMXqclhfmskpcNAGmUrnqsx7/wpIbfPKoO2Q+yHRT8oSiq4kKDlZqT14X8/ITu3JYh
gBmgzipXsOtMO6du6CDx65d/kpFLhu7qBnF8zao2uyX70Uw/b0x1LXDyhD8CVx6vVA7DVTaK0bzE
j8rj7gjJ1DNqzAl+o4sQwNwWMRzGsqnN9lirlPmR56llcPql85xE6c4JqekTjwnf1m4cWyI9jSx5
mjghddEyMdRZ5/nMic16TUanJsLKRnNQMCMXN3AowTYzDPXuYuaI1hlRKLuknBDx0JegnyuyAhG5
B57hxCHKGPUfExBnCvpGaUIb5l3prdLcLDwzI764iJmUdrG8jdLQrHNdoq4j6kcXqhtZTY6jldcV
Ck9M3YcunXG3cdyE6iWevQWIaCB0XGLMQQPiMCSajUASOlTr6rxOQpfSXuXEF6oePFc3JHNFKAo/
yDVJNtbENs+4Cg91fTlx3GVs4xC15hoYl/ed4kFYxdnWhrMscmOyK1lehxazNIkl3qx1NjTLDYgv
CApetyNqA8RrH6dRtNm6a2hG5DmjCTVmFjRZR4mZr+qYMhWfo8ZUcZoSqpBdj/iOHPGoSS4CoFxE
0FbjE1C3ZeKo6PHr08Pw+M+b708vX97fiBvdAh3oKoeW83C0EFGhLBkFeZHrkYN/CKNwdToCQxLR
SWERWF2thtiNfDpp7MaU+xiJIbBM9SH0k4hUQqw9quf+mZDGQhkmxRweLhJjBSZ8VFELEQfigKp9
cXeEzca2L4/UuSquXcrrtZHAHUpj/K8x2HrgehNHu9M2wVOSsr9T9QGh+ZjM6LxsxzSaEf+UU7lZ
prMcdgo3798evn9//HrDjVaNMczTRbCl1mIxcbq405P7iZPxDOOyZ2JBp+0+OJs407D0I+UejdPH
J8C2ZPk57bQvABNx3seqeaE9gi2j3YA/HFliyF1L+pETDL1u/yujh+qcazlyfxKnzMio3sYhiyiV
R8CqviPsfCondDXauMVVhkxap0HuwbBut0ejXPP6WEEVYT2NwEy2WOFETUJzmnROIJN5kFKjGua2
XkGrTsvl831zp5Mu+oit8+tudLI5Sx3rLJgP/jj18a/vDy9ftVMAkatpCq/CTWeOEowoShmjSTNV
H3qc6ultGqnqnagYDXgV4F+Mskc6prBVoMt2cRDpRQ1dmXmx6+hHDFr/COmyyz/qt20eOYFn7Tfc
TgWBUfuqiyPyZGtGg9BMJVaBtf4et0R6MgQsrxBEn5jW1WqXsTDw+LqkpUMgthxSLxyJS22xZNwz
s76rLzGtEAv8XFm8tnD4XMe+a44aJAdriSb9fJpY5gCYg5F+NDCG2GJ4Mg7O8sr9SFoeRkxMheDy
6M2YEI555nu6PxApzqneAGVswJ5dPojlAQzn7M8uXt4baqP7j38/jWdx9cOPd631kEicSPHnGi3d
BwtTzrxNTKlwMot7ll8szoCqSSx0tldOEIn6yu1gzw//etSbII4H0bklpSXNDEy5wZ7J2CgnsAGx
FcD3ifkYPtSsDfK49E2amg89pBQeyxMZmSd26LsrJR+fmk0qh2tpru9bgWvWZzbQ0nuBHFREBqLY
sQGWmsWFvItWETciRtY4giRduz3j/fCJdA/BMYy6I59SLUTz3E/Clks0rSwBW7Q2nQV/HVItSI/E
YzPgk3mqIfMSi5N4JS/YLFkGm8w21uiDyk8hX+jOmXQwAprVO7JwgQpSu6MvemT+z9RS2Rc8TmXd
qj6Ux7wllEiLgYxqLQelXHbsuurerL+gr7wZV9gO55p0ptWhPw1kNM+v0zy7btMBpKpSOugUceIF
IhUlAfj6y1/1KsuLIGtliVV5pi7WPxgq2FYCXinscZKB4qpsGMbaXtNsiJNNkJoIzn35QEamxzY6
UQKnK6rLhFTFHnZmJ+p4YWJhWzle+NgYhSgcKWrEKfn2zosu8pGuBuiPanT4kN+R40Xny4frEYYH
fAocpKtJUNcll4OpdcCgnPRJCRX6/GnxooNook4Xf5vjB+lxfN0di+q6T4+kcdOUJwxoNxIGb0bD
RoxSUhQWz72YjYBdCIxPXzmDmjA+ixybu2/Bg5sBL1rpVVUJWrLmg8cEqsEPA9dSG3ejWd/rX7AY
uD2D4A2DkCpY7DZsSOKTCB5tU5WCcbhxA0reKhwJUR4CXhDRQCSfmkkA7IMcqh6s3vqbta4ZN0mR
OVz50BPr5Ybs+H4AOUXrWhMLv0M/sm1HbbcnpmPGXMfxyG60blP5mrBUmv95PZWqwTEnjpfhVGTH
5uH96V+P1IOgMexbHm1cSadS6Mp3X5DadTzKh6PKEdgT01qwykM961c4fNdWgEvOFIkj8RT72RkY
ootrATZ2wLUAoWcByPB7HKD7DLROSngveBaFHlWLS3ndpQ3uFGG7VxEM+Jol60oC4U+UyNoMl872
VkZw5Cwk3VwuuEtW1zyRmZAyuMWHOit57vAeLNhRiRGKvR2thC1MgR8F9COxkWOADexxwPWWKmVf
BW7MqB2pxOE56q3uDIHSQ50eSTgxlkZrtobK8VAeQtdiwjj3Kh4YW/TOmWeII7PkT9nGo0qFdb53
vdWPj2HoYfkz8xRSOLABRC1GQNenFJj0DitxwApGjEQEPJeuy8bzyLZziLxOVThCYu4LgBRnuJqH
TkgvQQqTuyYwOUcYm0UjoF7gSYjvRh8MIQyOGa6uBZzDT8iSw3BDDGsOUJFLObBW2eSDymadv75w
1dWlL/bjnNKwIQuDDVl20ew8d1tnH06mqg594uvXEU2lxl8dUROhjohPW9UxNdZgR0cO39rimkZi
WFtVqzohS0uILwxUSx2SwCMf8iscG2rGcoDosS6LI5+adAhsPHI0NUMmzhdLNrT0S9aRMRtgVhFf
D4GIXs0Bgq0s/S5/4Ugccqw1HfcDupK4zbJrF6svWiSMlNp4G5NQ86KrtbdqY4Jae94jK18eGSt3
jj6MXiR3hPgvt/U12+06Mt+yYd2xv5Yds7gBnhl7P/BWpzhwjBZOROKOBRtnNTWrwtj1yTnowWYy
JABchiJSkx4hfCJzrNLB+qhz5vZj0jhKWywIbR4Qz4l8WqgCEtgWH5CqH8gFZNpsyPseiSUOY0JE
dZcCFi4qenWH9lL0QgtY4IfR2nJ3zPLEcYh8EfAo4JJ3hesRsupzBRWkxMe5tule7DC4630GHKuD
FHD/L0vW2bryTTxt0dXsuoB1nRjCRZ25G4eQZgB4rgUIz55DyGP0YrqJanJYTViyJgQF09ZPiIqy
7BCElws+xqtb+hMgB3k2o3D4xHxlw8AiSilkdR2GxAqT5pnrxXnsEgM8zVkUexQAPRd7ZPeUTeo5
a6MbGeTzRYnue3SeQ0b6jJrhQ50FDpmw7tzVxYozEEOD04mGA33j0HUEZHVWAEPgkorDdPmwOjNO
ZRrG4do26zS4nkvW7TTEHhm2YmI4x34U+XuzvQjEbk4DiUtusTnk2Z7wSzzUKbbCQGogAkHppZu5
U6wVLADD2sZY8IQN3XiYhYedDSlIyDAQkBHSRoAra6pPtZGEYXWHEt2FkZ61RqaiLvp90aCrnfGi
6ZoXVXp/rdn/Omaehp5vcLS2OJgCPvcld+p1HfqyW6tYXojXavv2hL6fu+u5VN3NUYy7tOxhpUgt
T2OoJOirCT2bWmLHTUnsuROMcn0JGGMj8P+o5tjrNDLyxybUd8+L064v7iZotTkYXDK1xOmdeFTD
xMmSRyp5RGa/3iaSpb2FCmPOpxoxvgxYa4N4DbLKgia/BM6Phbkz4S+v327wqdg3xWPUcskibrSp
PCaOrL42zGwc0lmvtGy8lreWKw6r+dPdm+Hx97cHombTp+Em1azNeP5y7qvpp+Ty/elSQ17+3Z8P
z1C51V5ZTPYxqC/G1u61y7exMtbMpooIo2Kz97hpukE9p0N2yNu9SdHe3M7kpj2n9+1xICDh14O7
R8DY2yCKcoIL/ZZyZx2YiWPAk2mw8IX98P7lj6+vv990b4/vT98eX/98v9m/QntfXjUjpCk5rNhj
3jjdjRE6Z2hzM8za3UD0ynifQiDifNkCwFwyAWF7tk5GV0EH0L3KIUu1WJjzwdDESxvtiJt3ikfi
CBy5InPi0aPRSuLPZdmjjYzZDE5mHZlvXUGmOWX0we8MutihOpJjW5aSWUrPndbqO1pmU5/pTOZ7
61/7oVzv474JhtCN18rF00VfqprSG5PYXy+kGI7rHEJyrVSCCxfod2nFGR3qU99vDDWh8E/E/nOq
0EdhY+Yyv6KmGs5F0WqT0qqsI9dx9dEyM5Sh7zgF21qGEwa2cfxYb3RzTT1XJaLPJUGYDD3/8evD
j8evi6TIHt6+KrIGfWtm65MvH2ifAgxdsraMlVvNzxqjrqGgFSnJjoAh2rg/k9/+fPny/vT6YsYb
mjphl2uSHSmjpzOQvfW+16DFrGYZuUhnfuRSm5cJVM9ZxKtjNDonL3J4onTw4sihqocBLq7o0kwJ
ZbFAhyrLMxXgPo0d1a0Cp+dJELn1+WSrhWZsstDU40/ekeNLd8U9DwLz+x2laEHVvSIrLPwdD3kc
N6OyIcNMVJ/+zGTL3cWCk2+p8FNx4x6j8/hi59n8Ok8MWgXFQkhlFVJbzRF01aMD3n+Z64+mTpZ0
hzKE3f70rHGxZxjQ7wErM6o8BCHHyTvQSK06oFq8ySDGyKjCWAfhAV2v+6e0+XzN6tYaxxp4bkH1
I99XIBjHXR3LZ4YL0fj2nByS76zFOBSGP/qY1Z9YL1TiW3B6TL1/XWD1QmamxxvbdxcGUmbF0PaQ
yCpOEuo0bkFjLSf+kE+jTfqUSsZlV6VIhl3zQiAoqPQrsm6i26PpQX58Ve47S8A6YJhf8Fo5yJcA
Mj4EjiXuAYezYAjiFfw2digTIo4J3UftIlZkhPRm5SYKLxRQB/Ip70zS3bwj/fY+hjHr6dxM+mzp
9hI48/Kx6BJb3x3J9q4e6o46EOCY9lIMaaAZprXvB5frwDLt6yNedX6ysXcs2vhZwpCMuVc17WeK
D8S0qlPyfKdjoesEiuzhZmoO+SBHQJEhqgTd8hhnYSCNIGZYsYybGsVfQZHkINQWDekNkk6NQz2P
8dERSfVoqhEsQGAgYX36KmQ4VxvHN8fRAuP7JGKUnyvXi3xjWPJxUPuBb5OF4yMtrfr8mZSez+kS
W+wJeSltdmjSfWqJbIn6TV9+bhtDM5EbUccbffGZj1QNmqkpic0mRSN5NbcJXOC0hxq34W5M3lTL
LLhTtyf37BOPDShubUqt5pqEd/x4RYBCQnFJOO2C568uOx20KenLbmu8uZUbMRNN43+DQ8SMPLXV
IIyiiEzQmelR+ABmx5q0uF+Y8dCUn5nO7HSmoHfsteeBFI+qxywQbjViWRCokL4LkdA88BP6s0pM
YnuxWjlz3yJhfBOwmlzac5jYPC7NDzrp2iQSkB0yK9UUoviM0BCXQnZpE/iBaia5oJZXRguDULup
jAVyCnyyQiWrEt8h24c2EV7kphSGq2vk0nXlGLWrkVniSFXQVcynFSqVKaD2aBoLPZQrIdgt5QMY
RvTSu3CtWO6rTEEcUlUwVX0dUxV+BY3DDXWPrPGEKxmAhv9hBprCr4HB+hcm3hfoDUxo7UxiyzoX
uoF+8CaxdYEt1pnMFMfBB50GLCEpA+ruLkos3wr2M65lIpjv8EiW2PadCJ8nBtO00fmIbXf8XLik
3y2J6RTHTkg2k0O2inKQ1EUlHvk58UIWly51jrswO96p8XUWeNwCfdB45tVdSpp/qTyMlswsqONI
9pgoQcaeSMKqfeAKYyWqTpDQIY0WFJ5YOAA3ILSVcmF0WbBpD0Jink9/Y7Gn8Hw7FllENkddf10i
mHsSAyOXZmnDYSua9nZgMFm0ipXIJpKyNrozpPQ4wkjFZLqr68z0z7Yw6Kq8igTkF5u3BESthApP
3cMYJwRIadqh3Ck+VnqdrUe/l4pLkqrsyaBjeBybtbmIS7tcGPTXppghIh0w9FkwMWhJ+yykksos
n05k7jILa5v79RqwtLlvLXVA64huPXkNGvrtNpcyWLBL3ZH0Ujz1MoE+q2sT4N2L8RmU3gVqCjv5
vqhbS3SaEnXBS3DILS62RUXWMGtwMtFwa3Q/XMvomHvYyCLvU0uoYezzoS/S+rPNqTJUbN/2XXXc
r5Re7o9pY/HdDdJhgKQlOf0z2Lm3ne4douxHX1NkIqyzEQlyJmLgkobVJb5TtCQue+27Xrbt5Zqf
qGNp4Je9FfFLRf70XER1WG6lvqGXtJsvr29EeGWRKktrfgE1J1ZQ6L+q3V+Hk40BA9gM2D4rR5+i
WxULyPLeBqF4WoFktxUjteXP4ip1/uoY9Ch143cq86JVr5ME6bSpPKjHFiO6pPLTugUmk2inXAJJ
89OKBwHBI44Q6rLhAdabfUGtMLyI3blRHBhAy4zDLqTVmm9yCWpk1xicN71ALdMOA83/rxuqGeX3
TYpXVLxytHUmZ+MRIVjBXffCVGIMvZZZanCsCtEl87jlQ5aw1BFfEt35jMOC7pfZ15oUJF3r4izd
Fdcss5zvTzzcbmGFQ7yptI4lxa+xIHG1FiYcI+q04pdcMHALs4yVtBiXeE4lLc0FCywWmcXADDuv
LmoPPWSMfWfl4x4jCCbpy659B5zBOk6WhQJijVFESRSi7fHrDWhbvzC86Rt9scv2RTW7IgS5KLGT
hHyaxjx1AjlKEDROl2Im8pLRIAyPE/lovXn9joeLUpm8y7fHnafpVAudkB+cDt+glR1lSynqtKrk
kA8LlNcgUWW7XWxymTYwGPPhRNG5FJWm3cPLl6fn54e3v5eYFe9/vsDP/4Eeefnxir88eV/gr+9P
/3Pz29vry/vjy9cfP5vzFEVmf+KRW1hRgSyw9mw6DCn3sqeMU1y/vbl2eD5evHx5/cqr8vVx+m2s
FNT7680rd5P/x+Pzd/iB0TRmb+npn1+fXqVU399evzz+mBN+e/pLGSnjRDmlx1y+DRvJeRptfEPm
AzmJVacWI1BgTPaAUpglBo9IWbPO3zi0HcEoo5jvk/eEExz4m4AQf0CvfI/ahY5Vqk6+56Rl5vlb
vaHHPHX9jdF+2HdE8gvHhSo/Fh3Xx86LWN0Z4pFr6dthdxUY/3R9zuYPJw+yMUWahpovRc50evr6
+Cqn01dh3c2yDNA66cKxsYTgXDhCh9qBLXhs9t9IRsFo1ms7xORz4BmV3YPMxDA0c7pljku+oxmH
XBWHUH351GPu6Mh1iS4TwFqH8EPXyHInO021LnA31Am/hMt74ZkcCS8cKvnsxepzy4me2FzASAyU
XcUCu0YlTt3F9/j0lUYeSpUHReiQYzdySYet4yy9eIGQKFLGjy/0kOaZqa9fJSCmjsylIR8ZrRJk
QnYg4K9+TM5BPmWZ8MSPE0OupLdx7BoiYTiwWDzwEx348O3x7WGU+ma05jEnWKIbDKtTGaO4LtOu
o5BDGQTEdCnri+fa5zKHDfGG1CCmqLKj+4WaGL0PVJ/M1w+IT9KevJB8r7nAQUIni9eTxYZAb09B
uDHqy6lkzYBulzbtSXUMsCQyBySnWoqwRP6aGCIvoA6BZzjyjGEHVLKZEVmzKKJ4Y0Iqt6ckpJQE
pJMvoSbY9eMgNtOdWBh69vFZD0ntyIY+Etn3zOwQcEnT0hnvHJ/Kb6CLGVzXEM9APjnq3YkE+Gvb
G+RYqx/rHd/pMt/4Gk3bNo47QXquQd1Wlp2O2FV9CjbNSqnBbZimhqxBqk9QN0W2v5i1ACTYpjt7
KVx26fkVQ1zcxpN4rEAuUjvnSfAGsbemTqa3kU++9h8PR85J5BLrKtBjJ7qeMjNy1e754ccfVjmd
4z2f0UVomhMaXxCo4SZUF8Onb6DI/+vx2+PL+6zva3U7djlMON+lTwFlHlXtW7YNv4iyYKP3/Q32
DGg8YikLldEo8A7E/jTvb/g2ak4q7W7xxb5YasU+7OnHl0fYgr08vmLoSHU3o6+Nke8Y/VcHXpQQ
w5w2MRqrPlzrsivz0aWZ5Kz7/2PTJZrclXrll4jTOqbuB4djs8R3zf788f767en/Pt4MJ9GHskn9
wo/h6Do5RJ2MwebMxUjzVjRWFmEDjIyzVjnfyLWiSSy7W1LAIg2i0JaSg4o2J8P14Dm0KZbGFFoa
xTHfinmy3wsNc31Lne8GVwl/IGOXzHM0wzAFDejwyCrTRvEAoVTrUkEOAVtDo8Ham9lmw2LLxkBh
xIlqcd1kjgqXtN+V2HaZ47iWzuSYt4JZPt5YtCVlYe/CXQYqq61747hnISS1duFwTBOHvGlXZ6jn
BtZBXQ6JSzrql5l6WMCM24D5M/uO2+8so7N2cxc6bmPpGo5voY2KU3pK+MhS6cfjDd4m7KZjsOm8
iV+9/HgH+fjw9vXmpx8P7yDRn94ff15OzOTlAw9L2bB14oTa5I+o6rZEEE9O4vxFEF2TM4Tdu+KC
ZKFT341fBcDEkS3qOC2Oc+YLDxFUU788/Pr8ePN/bt4f32C1fH97enhWGy3llfeXWzX3SZ5mXp5r
LShx6ml1aeJ4E3l6owTZXM0B+wezfgwpA9h4b1y9CznR843CBt+l7B8Q+1zBJ5NdkizERGtdcHA3
HvF5vTg2v9k2pMXlnCjRsxefnxo9jvEBYic2WonfxXHIJydTKk9ey5B4Kph7kV3Qcs5xqueuYxTN
IdH3eiqe/8Wo1TENadum5SuGeiJBps2rlu9s7V4YhvqUGBgsblpjYI4YDcQAPakbmiMeFid3mk44
SIebn/6T6cM6UC4cY3gglT6OG5vn0XEYF9SYUXx4kmY+4zTWJmsFm/7YpRq6MT5icxlWhjNMr8Co
Dk4hP6AOmHh1yi32fb3VvshIzgxyhGSS2uklAz2xV3ZsYqzmle4SxzVmVJHZRy7OTF/V/sTHyT1Y
/ijzgRneuErUWiD3Q+XFvjFMBJnea8/yltJg+AfIXVhq8Zq3zeWBm43y3zpkUSbE+lwR3eaR48Xz
TaHl8XdkYoM2MCizeX17/+Mm/fb49vTl4eWX29e3x4eXm2GZQr9kfFXKh5O1ZjAMPcfRZnbbB7oD
oYlMW70hus1g/6oL22qfD76v5z9SA5Iapnq51R6+iXXQ4BxVY9Xy0XeMA8+7QtOtn3pkOW0ojyBz
1u4sokqW/+cyKtG/K0yhmBaNnsOUItS1+r8/LlddHDJ8L2v7SFxH2PjzLVP+9PvT+8OzrLbcvL48
/z0qfb90VaU2TDlCXpYvaB1Ic2O2SaBqLyu2ykU2hXiejkpufnt9EwqLoTL5yeX+kzZimu3B00cR
0hKD1unfg9MMEYtvADaWoDQzTjr3WlBD5uEu2ya1qz2L95UxE4CoL7fpsAUl1DeFSBgGhoJbXmDX
H9jHPt/aeI7lknUS3+RDMQQPbX9kfqpVkGXt4GlmOYeiEhFTxDgVVgMlDN233x6+PN78VDSB43nu
z1Ksb9ODwCTmncSY56zzjHE1vL4+/7h5xzuofz0+v36/eXn8t33C5Me6vr/uNIMXdSNk7Hd4Jvu3
h+9/PH35YVqYnfapGu98JHAro3135BZGIyR8aRxaNqjOwmT6dVf2xTmtSEnVy4t4X/MDLVDEFBNy
pOcdiLwL99efF5ahgWzcB39NeQBfYFZUO7SEUUu+rRl+8E5Zi0f6brtARHlQuZoN16Ht2qrd31/7
Ykea10CCHTdJm31eqUUJsD0VvTAWgbXUhKsivb12h3s2BddSKlS1aX6FLXKOvV6fU8sj3rFLs4I6
XURwX9RXdKdh6xEbhunYAW2RKPSkfW2WHYpZGcGDy/Gm9ObVMAlRqg6sMBRA26NfkkwsrKzckLpo
mRiaS8cP/JL4olZMAQMjGKKtmkK/6Wvp8Fyp1CGvMsr2jI/8tIKRX7KuSu+1/m7rIk/lOshFqCX0
aV5Y7IIRTuscZrAVbtrjqUiPlhqe9uZ4O8FgsJfGaG80vLn7dO/ZRDjgWdmDmL7eFZaX3byxaDiX
f4SfodtryrvMzFKdcqZ2OSejg8BCtydG9O5icQcH2LbNDrbJj49IMS5od9SEHtOlIKuRi/tNLPTS
EeyLfclD+YG82ZcNbZmq5HTMqTeJEwv2EPyXdVRhII4tSacAsEoSIfvtBrMLDzRPr7zE06VNMTuF
y59+fH9++Pume3h5fJZX14mRu71CO0OQq/KNwsKwbYvrocS3bl6U5DaO4eQ67vkIc6EKKR5zrAi6
fpOxIEVV5un1NveDwZXdYSwcu6K8lM31Fj04lbW3TbXdvMx4jx4bd/egr3qbvPTC1HdsEkWkKasS
PVfBjySO3Ywqv2yatoLVtXOi5HOWUiyf8vJaDVBqXTiB9lBq4bqFrzmKMGiwk0S5QwfmlPqzSHOs
XzXcQr6HHLaa5HnqnKBpT9wVVzP4gbplm1naqqyLyxVkLf7aHKFzW5KvLxlGbDpc2wEfWSfGWB75
WI7/4PMMXhBH18Af7EJPJIH/U9Y2ZXY9nS6us3P8TUOfHcxJ+pR126Lv70EDGtojiJGsL4qGqnif
3ucljNG+DiM3cT9gGW1xiFqiv0ze/k8HJ4ga3Oh8UMe22bbXfgsDIffJvmdpzY4wRFmYu2H+AUvh
H1LLUJeYQv+Tc3FIdZ5ij+PUgYWObQKv2Klejmn+NF1vNCvK2/a68c+nnbsnG8SfGlV3MEB6l12s
ZQo25vjRKcrP5NULwb3xB7cqrJmWA3yU8gLCNIoc2heHxI3Gmml22Xib9JZ8XjCzDv2xuhezLImu
57vL3jI7YHZ1BXTlpeucIMi8SDugGnUWTYLLBW77Mt/TMntClEVg2YJt356+/v6orQdZ3rBxDyGr
u6NcAlLDg7SpMMr1Kz7eyowlsNin6FQWvZLn3QU9au2L6zYOnJN/3Z0tnYjaYzc0/iY05gDqaNeO
xaFHjP0Z3Nh1I9Br4V8Z0xGeBEeZOOqj/YlMx/YQKC5h5NcYDmWD4X6z0IeOcmHt0fCWHcptOpqN
hutotIrGGgrCcNdtdEEPZNaEAXxl1b3LlKTLXY85lggAXDflb6Rg3qTNJfQ3/xljRDtTmXYMaEQZ
uJo4loDZTlibEuZ4VqtQDE16KikPfLyCfdbtj3onHEoGGl25rennMjPLbdmXlOtlMfKF20tNOZ2c
YaLSqBf7eaC8/fBkF01vAsJuq82NynUNOXcp7PsZWOgpg/hRgOz6Vt/lD2XOtHpUOL/vjUGU7ywX
Mrg9cC1eccadjRU7lXaMpaeUjMHJh8AF305dd/hAumADqYKCOlM0Az9XuN4dy/5Wb2i5xbdpOfcJ
KSy93h6+Pd78+udvv8EWNtcNvnZb2ObnGCtsyQdo/PXxvUySfh8PHfgRhJIqg3+7sqp6kL0GkLXd
PaRKDQA+777YggarIOye0XkhQOaFgJzX3PFYq7Yvyn1zLRoY19RUmEpUnvbs8MXcDtS1Ir/K702A
jlvGqtwf1Lph2OLxUETNBvcrWK2hbPbkh/nj4e3rvx/eHikjQewnvlMmhxWgXU0dpwMA+6UMNGSt
M7J7UEGtZ6uYDBYf6CZ6Y8+/GBus4PFUMGq+AoRurvG5ldo3zM25D0utlqOLcUspfXmyYmVkWVfx
C6WgStGTHnO1n6xgtwz3NpkgUBvEaBMmRAx5oKCl9ZM3RQtDvaQFP+C39z3tZhEw3yb2ADu1bd62
tIqJ8AAKibU1A2gVhX3YpD395pyPYGumGQxiEE/WPjrArNvC9MKtIHXSiTyjU0VlkGzr6/4ybAL7
NFh5+IldIbyFESWi/2RxjguLUzOAzNHKrgvU59va2ii8dvNINYSPCvUUAkkML34jrRhWRy6tp5Nr
gghX8PDln89Pv//xfvPfN3iOObpjMy4QcN+dVSljo+sDuWjEppehRBNm0alnYOBjAAE57wXszrZQ
3BOH8CH2AdPoWGm1nsJZeKWGaV1g4Snkg3LSHL0Z0WNN4yIdskkNN5yuSumFQzcKQjtt30mtUEI3
rurigIw9vbCYTncWjAoJPX9exaWpVOQp8Jyo6ihsm4euOtClxvfZJWuo1X3hGZ0QWtpa5OR0+WBS
zHdoaLFNqwC6Gg27jZYsyriyW9Kw9tgo9eMT9lDm5uw8aLGry3yOxI3uO5r9QHlqBrY+PS+VPhLZ
jFPSvCr//vgF7+axOsb1KCZMN3gIJfUI0rJefoo/k667nV5u2oHMIycPR5lFOeLgETRFSk7zbimq
27LRS8sOeEZnSZIdSvjrXq131h73aa/S6hQDVdwbmfPNlbW62b09whbi8I32bYOnmlaWAq8zqQcr
HKwKxWM8p32+LbQG7Yt6W/bm99+RMp1DFWxOWjmMJVIhY37QqVHvCz3nc1oNLXVcheCpLM78qNWo
z31vCyyEcInOIvQ0Jbl/ReRTulXvOpA4nMvmkNJaoWhhw0CtHyyKI7JUGQ93ZSlViQkjCE17avV6
4AkFziFLLlwdrKH/C30UVqht6MT7HSy+B70M7vtnb+3OukT3/u1u0HJDLafXR1B9rIZy+vZKKc1A
XTYhAvvf4lZnh50vBumB4UVHauM8xZBW9w21UHEYpqzYCJlEsblVcxuReWmwlztyane+NE+RU7eG
Mkum+hriUJU2/PiXDKzGOXq88VLbxtKS6MnxRNxaU+43BZTeW0tJbChSTXQAqajQlVKhTXwoqKt0
adCryyCfwXgBAjtOas/I86nTfvjU3quZyVSxXMgztjy1GgX29YU+zfDAc1/rNNhnD3WKF69yTWW6
XbYecQG9dsxXMz2XJToBU4mXsqmNOf656FtskiX/z/c5LJD6ZBZR+66H45akZ1BxdNrI/9JW22oM
Azy9/yJW8dluQ9U05mrj2SdClDZjJJsAmTirG2x7bQ9ZecVzEtjPibMaSR0BfHE7NZeP5GPVldet
RQdABvi1sfnsRZyHljqk7HpQT0uOZBAaTNFl5XSQg0zYEknxmendH3//ePoCXVo9/K1Yjs1FNG3H
M7xkRUkbPSHK/ZudbE0c0sOp1SurpBeX8d2BPqOY+pD8iCvN0OqY5vuCFpXDfVfQZxWYsG/hc7Nz
OdABRGTT8O7cs+IONByCyPI4kl/1TeRpv7xo0uhX6Jj2dF3RLySevxo6rnBhJLwYHV5/vN9ki0lg
TnjFqjOrX3LE0r6GH4o8RDJIGd+DKtaWU33Okx+y0l75cgfTnV6PRGrQ4NvDlVxQeAY1OtNTvfaL
UkuTws9Nc9B1CahEvaDBEJgGPjn51JufbSOX3iUjeuKe6da6Jqcu63iFDvij3GnVwHqGMAAdoyJ3
BzJeFWIHdqezTzdcdJAr5KiHW7Xs9iyZKtegtA9ldmtSdCds317f/mbvT1/+SUSympIcG4ae1GAj
cawLKul/Mn6nzPh4spiAzUyfuG7YXH2LD56ZsQ/ICEtNceYK0tJ+/EscESk755l65RoskRVn2fao
tzUYiOBwRpvSZr+YIeJG3+g8nixtfMcLVCMRkV9Wh75HPbxYYNm3CKfyYBYORfRMYrihiInsA4NT
hRdro4JdliYB+fiBw+phi8geI7JsCGJgVKQLAjkMuI7JtusL0SeIatCrkRwHpJ3EhMah3oW8rWpQ
F5luW+lnntDXO3UM0oHGeEd9DM7+ftXCzONFpRjZvzanyCEslKGTe7Fj9PjgB4n5kYcsRbfPtkKH
KgsS5R2cGDGE//p5KAZ/2XIjwkBxesl8d1f5bqKXMwIiZro20fjDiV+fn17++ZP7M9cp+v32Zjxx
+/MFLW0J7fPmp0VR/1mbqlvcqNRGm0RsImubqosSlIQTMZaHRhLxhiwjHqdlZH6b0c23oTdgI4e3
p99/1wSsSAVyam/zsZhmWYGhDtG+jzqOKuH/BladRtrZLDQR2LlOV0BRgNwUiaO4dOPFORpdbhmX
0ce0oxY4o1TVjFiCuWvlGn/rDMtQij/N81446f2Isx4OmcWpsNSoHc0CA2Mj8X2UTZv1eU3nhMC1
v1BnTBxi5dnSNWXXltR+o4Bdn+lxtx8yvO5XCcZ6icRDBtrJPekPHVBABth3qfmMxOly5r/e3r84
/6Xmarf+RbQ5wRAwpgIgN0+TJYy09mIKUBZ3c6hjJS+OdH1La30zh/ZoRK5qf7qOr0Hm7SxWxdAB
JmYRkeei9gn3mrndBp8L5utVFFjRfk6sdRQsl5gOmDMyjKHAiYKnMDwaPWfjzR9Jv2ZFMxz7exqP
NlQzBGKJIisxheoL/wk53NdxENLXuRMPhgCmzVAlDjXqoQJogVBkKKFUNImDR2ikUvcsyHzdrlHj
KVnleo4lvIXCQz5w1FhCs3UXoJNt67JdHNCxS2QO4TyGTu2ToUUVFtn1jALEBFBv3EH2TKLStWDJ
0/A2Ij5NwJ3v3ZpkM7idgiSq48v5U2YYhYQMLjNyMFDBE/kydAJ2te/6RKN6mLcuTQ9il6wEpPBo
k8OJpahhs0HG/ZnyOPkO1Vs9BnghPgkLaoKYgyCYPZGhiyer6ON2jA2eA5cyP7qT+lBk5gx2JaRE
EAhsw2pSL5MGmic8ZVK9kPw/1p6muXFcx7+S2tN7VTs7kuXPwxxkSbY1kSxGlB13X1SZtKc7NUmc
TZza6ffrlyApCaAgJ29rD10dAyAJkSAJkviI2LoNrl+3yVz9eHdWaufTR4z7I35JUJiJz9vCYBI2
4gFeKOeTehXmacYvw9M5O+M15vJuokhmo/llGQOa8Sdo5p+p59KiFsvR2OM3FJ2x7XLtQ5mPWyGu
rv1ZFc7ZdX88r9gQKJgAp4jGcBqAs8XIfDq6+LnLmzE5tbUCKSYRjrjYwEFO2cWqbz3CEEzYolyu
KYfk65ftTS767Ng03c0sPz3/Eond5XkiN/1qROYFPGuZkzTU7eB9v7KwVGeVMJgfuAovRf1vF+9K
/cUndu20QMebrWWoGvWspXokw/m/WpLZ9OLWX84Crw3YAAddaSLm0p5v640hPzpo4P3QhQq13K36
ke3ll20ElrPo8lbeaih52LDF+5waRJ0X+6QzA8YMAbZxrx5wkTJEmyQUDkFjFE95b5oOd4fOObZ7
F4vH4xkbDzfN1+DUn6Y1fdut/Ok1SUodltqyWlhvwxZsvLg08jfPAZeF7sQJBZuLRHW8lTLEDhTC
OhcWVYv7D3ReAp92/aCc1QV9PWRJuG0S4Zune9x299MSktFmr8P2q7So0yLPd/p9BoeJXZHw+kC3
LTSlA81pXpYGxBgFgrlkPZyWwrjNoqqMG22ebHduLQosBl4/LHofCz6EvsYuwfEeX+pYeLoVu6rP
QZ4WDAe5fiIxlvM1M0UbasUJOeyvoj0bSRbCKKixqDIck0EDS2MyTmCx2Log21MEBou8tO+onQuE
DWZ6/3p6O/15vtr8fDm+/rK/+v5+fDuTB94mP+8HpJr2cGxzbfSs0cAetuv0ti8ALKNyt4SLoATs
QFfhLuMOnUCpQyrsq2iDvtxUHF07FrYKvOIXJt3kF6nOqCIp96ksOJMcIFL/lmBYwNjvAnq9rYYi
VGh0GW4rzbGO8fARXR726dqVW8sEUNPPFnuwLSMcMtiuczBSTUIlub89YSBkA6kPWeOKboeeGdXu
C9Zl8mXJmipYn2/caxHEN+AnbVllGb32Mnc0as16O999f3j+7j6sh/f3x8fj6+npeG72yyZoAsUY
6ue7x9N3HW7FBhO6Pz2r6nplL9Hhmhr0Hw+/fHt4PZq81aTOZj+Lq1lAI91ZkBvz12XioyZszP2X
u3tF9nx/HPy6ttkZSdOgfs/GUzzUH1dm3TOBmzYsk/z5fP5xfHsgHTlIo4m2x/P/nF7/0l/681/H
1/+8Sp9ejt90wxEdmJbZycJNqGqb+mRlVmrOSopUyePr959XWkJAttIId1Mym0/GdMA0aHjABms1
F57Ht9MjzJ8Pxe8jytamhpkXHbvG7H/CxLJ6Od799f4CVap2jldvL8fj/Q8S/JmnaPoGcrtv9wm6
J75W878ISxcMxmCFhtVCohOSgYAdpAsLv1Lndbt+1D1DWTsLv72eHr6hUdPBaNAjB97cwVEOLrN1
tBqbLbOda6aifsP6s5iFba0WXLEOQc0j6tU2VU1IpUlyeptJTxVl12p93R7gj9uv1LD2Ws6cU4sJ
33T39tfxzMWZafhch/I6qdQmEObJbeG61zQm5bQatAWlWR0eUvCzW3H64SpNshi2QaLkbXJ4JYeV
X4LJFZkrZXSwOJTXj7NlU3VoBdtkuWsruMkGnKHWRRavUva1H+SyO822OnCpNpzWCwW96PZJDcDm
tHKApchx2q4GrHivij7YRq7qI7QN6RLbhzeY/ZJpVb+srPpMWxs+YujXouzDCQbv5FLEPV/OPMmy
cFsc2t5BKP06Wm+KChJ44pGxGPYcoSRaB60qiusdumrYgKsFiL0oEzU1cH7bdkr8RuOuRY+n+7+M
dxIs690UR5PIzcuLUExoGABLMcdXt4bSpAiuCxlRzEbGxGwWVd+8Hlye5IpqMaZXeggrI/b5FFOk
k2Dss98HqMkgimaAoLgxH6KFErF+R4hkmftzfOGPUFEcJTNvOsAAYBcDd+GYTAf8qyM+syzm1eQG
58kUvrrNpt6ADyjgb4oyvflgqV4nW1ZiqWEHFr5owsKXSvWaH3iBtRlFc3zyBXgYNbkMCd/FbVbL
IYfFloCPItyiF3Sv1SxG+WgecD5wiNcUHmCZkvVWchdeDVZSM+pUzYAUkEyRKrXGG2Rl0EsCsiHR
6RCr419X8hSxC0Q/ogFG6mu+Cyg1XkJxMbQEGJo0Xzvv6ReIfxfrOIn49/c+db5aR6v1JQbz3PA3
SLA3zV0kSbYXSKaz2eICquWA/2hN0u+hYVKRXGZFJ2b9qMH95/rY0H749d0wXGgy3MWfanExG2xp
MfuwMxXJZ8VNEzMdcYnadMVHHzGbjoYmDaDqpNpc+gpNs0lXn+JLE/f7liee+zPu+cOhoYHze8ha
5xP9ZHuK3MjjJ4k/NxMMqdhps2t+j3WI/MufBGRhzMcwHKqU9Z3tE19cogzFRZnWJJ8WU0PdF9MB
6onvxAtt7jcu7iPtUVI/QdWhUFpIL7qpRQazw8HuUG6puTe1W1gPGQnf93pI7Vm+jokS2n3ODXHU
1LThJDARrrszk05dDVpRHsN5hRnCUNzU6yiq596c3m0oeJ5bBG/xZkuOPdacokFPPZ+8zKZtg1Pe
GhwIMoagVx4nZtRxLgE6JemTGugCp3DooFNq2a/gmYVzh8nYFFtMfaTNATTrQ1VVpvcWPD8u75aY
/aTFgodO2SpcsCWeu1+6FjuL4b4V1TfHYibtkCOOZKRjqymwzc/bwdcsUDfs5vJViFyduQDM3RpH
xoOeKxjr7OzA65hTU6UdNiIY8CHVDp5PascwATA3UymrQgDqQoVzmjxTg02fDvLRfIMpihC2A3vw
TIRS9hC2fXJr2wBH1BxAijyt1b9In8TZGGJ6kdisSHD8a6HG4hA5599SnXtkKB3gPJzNxkufg0Ye
AyUzooMueCg9LAN8EXrTtcd6M2g8hO5VJzS1FYt1rzAgd3I5Ur+K6BreqoeqMd8KlYBglmxPqHHb
o+kmRRnTCww0Dgolo8V86g2ccDqKIKRbiPHPg2bjFR4kgCBXqf4e0Rp4dDsdf5eCHtRvpUi30De9
K0dTSJ7eX++PfUuQKs2Tsi6QC5WBqJPhkt65yDJyjrUQhhQiLJoiHRzOpA7I9IUDDE0UvE0LR7eO
GAOPhBDjImQ3QkpaFFkN16ZhCaE1cJ0rmdVJWYbVThXwvPlkwDoKwutlEA6ipfankG3PZx1aVPPT
cUupKiVJOOBh0hp5S/BWi3KcUK267n+5FicN5WTNqa7Cj/ey6QLSSAsltHY4mcs17fKlB1Wk1XS8
JFLISVJbMEyzZXGgo5tvUKPN3aQLDUZenbtFW62svK3yBt32UpGHYqT9xAHDP0E2wulSNG1kVaJE
kjZcpY2ph/qerfoPSav9wMbonCproVD7Tyr4d2GbVUEO8gKXKiKOHGYAusqSQ5k7CBCcKI9vHLBZ
NmrIxEARxh4kLfahCwtF6oI6nwTzYAGvYA/3Vxp5Je6+H886v490LQKaRmqxrsIlFikXA7vjR2gm
2UOPTknJfkYdXXiStjL+LeWDL6Ttd/f4TqvW1KGGnb/aqNVnzb1sFKvasbmxpXNqwdYIr2GKuVfT
ImVHzNSHFHGA7nPJ+7LAvJR8rQ2q3gdU2hqeqdAPMdcY39hC9tH06XQ+vrye7jmbuDKBYAp9d5D2
HbVX2FT68vT2nbFupC88+qd+yCFdrKHmsAZeZwPnLEPWmjJ1LJGm0foN285tSvN3mNda9XH/kD/f
zsenq0Lt5T8eXv4JD7L3D38q6Yvdj4BNVCgNUy116baf4oSim14Onx5P31Vt6vxLurl5HWXQphw8
DH8bLNbHmsByr6e7b/enJ6dc2xNR3/XFAhTruDPZioxlwUH8uno9Ht/u79SUvDm9pjc9LhuR3KVK
kU62615kwcaw4IO6dGUP/5Ufhvqhh7Mu2N2lA+O+bddqZz5tV2VILlwAqvX92zIkocwAISPRuylp
LLm41jVfN+93j6pPB0bH7FpgS0Zsic3Ng5q44DIQLx2EUs/TWia9hWAtl9wLmMZlGT6OaFAeVzrh
DZZnjSgi8uivYSIu+7HXNOYGcl+0GMpRmVcr8Hbl4wkaEpFzK3SDE7HTnL2LcaC30Vb1YVSVmYMI
RYlFnB0NPFV6hzSt1LanIqodA0af1EJeJ23x+HyHwJHH17eY8A9RmOJyi87dDEbwj3uYglfIEcXs
Q/bYawiEx8dVDMbn9C8yYroPgfH5uAOTAzICLwbA2HsBjEIjbExgCAmoVQrWJYml18K7/WCoD4za
4EMwkiJyOsLgRnCjSR8Fccn5FLDDg2DJFmOXDEm6oVmRqGYInhW3dDp1OJG7TF8HdZhPma9RiN9n
Iz+hKF0VUnnt2yXZSPHDpqoFLpvCiPsWWzjdVuoYIVNbRbMVHx4eH57/HtqsTBzaeh9x+pNV5Bu7
qrZQA2eHuTPw7DeMP/8rzUz09TBaTGcf1fk53aU90kGCtf2qTG6azrA/r9YnRfh8Inn2DKpeF/sm
k0GxNd7kmE9MplZ8OEeGju8IRwldKMM9TouA0ODWLkVIrdpJeaXMp/u+Ltd8T09rC1EipaYHiOZd
XgfBYqH0/aihYCdT14V1snfiL1uS5FBFRStuyd/n+9OzDfzb58sQ16E6ZP7uZMayqJUMF+M5v75a
koEQHBabhwd/PJmhh9EOEQSTCdOmsb5h81RaClFtJ+S+1MLNjgyXpHkqI6bqspovZgF/ArIkMp9M
PN49yFI0UbqG+VMUUd/+TOkdRfnFHXqR+bNRnYucW0y0mpfjpUlLEV7wUnz3loLXw261wjpUB6uj
JQuGsDnFFgIIOcWuwV4QqCjYRrJIYrYt8yc2UUNleqS6VQmTtyUZYRJ52wsbbcFdjbypeNPH8SEL
8IW7BVgzQGT+q8BqJBzz3+aEkofk5UP9Hnu939S0cJlHSkh15I2Mh1L6OBzRx5A4DHw2rVAeljG1
wTIgNtcWYKj3NAoZaNgIOBNYPUDW5tCQ9XNrXB9kzHuuXh+i3yEFGh8eII+CUcA+y+XhbDzBb28G
QHsKgPRpMA/nJC61AiwmE78X20xDXQBRo/NDpEaSe/NRmOkI8yar63mAbYwAsAxphsn/g6NCK5Ez
b+GXRHRno4VPpXY29aZ1ulLblc43lGUJbwqgKBcL9srzIEbeATYB1JCCzecUBheP2jSMgiNIo+75
FBiHCxDytSDQZLtPskKAG1XVJG3qhPIwY4U9q6LReIbDTgFgPnEANEwP7DrBQGgKMNucsk3lkQjG
NI1Tmx4nr6ZqFwPHxZBNPrANd7M5zfTX7UapU4Yh2X9Moig4sSy3EAPBGaxW+5eQg4osdDLWG35e
xCZIFa/DKhLPJBjEmm8YS9/Jw4SQudrQHUHar6bq6EBAVsk9NGz9u045OvXxVUISncNaVSYyCrOE
qROVsPdhL49KRXWU700ejV3T1faGrC1gSvw4PukgmcanF8/ZKgvVbrbpBWFd5smUbiDw292EokjO
WdFMwxu6lIkczD/RhSw0mJbaCWItcGALKST13N5/nS8O7Hf2vovbC8yXyWZp7S6Y+zQf7CpNTRkE
qN2uszZ+4ebhW+MuDU4w5p2TRpm3+5fRImjoLgfd6QldUFq2fsxiLlvuzBCZy1opmnItT91pqIck
CkvlVMjjbKdaDywzD9SUuDOCfD/kNeWxiZEVIqAahYKMx5xZu0JMFqOyXob4/K2hQUkAJqgO+r2Y
OmqMKCAjB828J8fjEW94lE9HQcDr22qlnvhc1BRAzEdkI1Rr93jGZvdQK5PiZjKZ+e6y1DDZerNd
6O/WU/Hb+9PTT3uGJtGRYSDNSVXncWcnWK8Cmx/q+N/vx+f7n60H3b8gIl4cy19FljW+kOadVb9L
3Z1Pr7/GD2/n14c/3sFjEMvhRToTLeXH3dvxl0yRHb9dZafTy9U/VDv/vPqz5eMN8YHr/ndLdmlo
Ln4hEffvP19Pb/enl6PqumZ1bXt5ma991p5rdQjlSGkiWBI7GJVQtECsv5SFUn+RRih2gYePlhbA
zlpTGjyreBRE2XHR1TpoMrg6ctf/cLMYHu8ezz/QVtNAX89X5d35eJWfnh/OTj+Fq2Q8HkjXCydv
z2d9ByxqRBZLriWExMwZ1t6fHr49nH9y4xfmo4DVH+JNhXMtbmJQK91Q90348zyN0wonIajkCBtY
mN/OoFc7YoORqu1zQn+PyLD0PsMsAWpanSF25dPx7u399fh0VKrFu+oWpAQs89Sfkr0eflN2VodC
zmf4CNlAXJ3gOj9MWZVguwfhnGrhJJcAGMFIbSbzaSwPQ/BLZeo0IEvmhd4wATF1Lh1ODuLf1Xjy
x9sw3h18MxgNJAtITC71W00iZLcQilguAtybGkLu3pcbfzZxfhMnpzwY+XOfAmicKwUJ2NBsCjHF
0gS/pxOyQWHFx6Z3Klmzj7UYhcLDEYcMRH2w55Er/vRGTpWYhxlvLt3qGzIbLTyfswylJDgAmYb4
owk7A1WLLBy+CDP4uwz9kc9GyRGlR4MJV+UER1PK9mrExxFqR61NakmjPk0Wxt17bIvQD/CYFKJS
EkLGRCj2Rh5Aub5JfZPhvetQBeGtQavrIKB3LGrO7Pap5DWSSAZj6sSnQTOup5ohqtSATGjQPw2a
86dcwM3YChVmPAlQV+/kxJ+PyL36PtpmY4/dIgwKB9naJ3k2daJDGdjAw9w+m/KGwV/VGKkB8fES
Q5cQ87Z+9/35eDY3KmhxaWb+NbW81r/JPXN47S0WA16F9nouD9fbfiSAVurWauXivw3NBqgjqYo8
gUwiwWCU/mAyGvBgtGuv5kWrERfEQ51eJ/Oxcx5ECLqqN8gyV2LrDcHbnaixKuD63YzI++P54eXx
+LdzNNFHqR1/2CRl7N56//jwPDSu+Fi3jbJ02/YsuxaZW+O6LEwOXbprMe1oDprgzVe/QOSF52/q
FPB8pNcMm9JaTnIX2joNQrkTFY+uYN3PikKQQykebfDtbpBsr/Ec2s32WalqOobj3fP390f198vp
7UFHFOn1pt47xrUoJJ1sH1dBlPWX01lt+Q/MrftkNENbWCx9E8eSHO7GrN03HOWMmwkCkBWrEpmr
pQ4wxDKrOg6ra1kuFr7H6+S0iDk9vR7fQNdhVp6l8KZejux3lrkY0Vsf+N3XsBrFYBmWSJGLs41a
ROmDp1BKE7d0kl3YifS9ER6ntKSRAPtlctbJfOL4on87d+8iCwwRckCZDFyoKkQwo58qq5ZBBuoq
v9Vk7PEb3EaMvCl3E/tVhEptQ5cUFuCuZr1x7DTWZwi5grVWvBcRpJWI098PT3BUgInz7eHNBNfp
zznQqZwEtVkahyUkQkrqPTsZlr6jhIqhUOrlCmL9eKwSUa6oY4w8LCbs9g6UaOrts0mQeYd+3138
4v/fgDhmZT4+vcCFBp14VBX2QrXuJjkfVQBNkEGaPDssvKk/cGzWSHbFqnKlsCOJ07/Jg0SlVnZW
y9QIq3w1SzzzqV1N24rP/bTPEzcxViMwOI6B+uFGEAFQk3kGgcIqT7J6A8mW+1W0j0E9MMQXcICt
uWcnwwps1zyeYe2XsaqcVuE5HJyrHGgvDABAdfYPGp0DwGA8NdBk4wZUiV2vlH1OGSgJ7hm09Sb6
KAalSRSKHmxTms4l7X3t55ZIy5ur+x8PL/2oewoDvCGNt8zrdRr1ADW2U2xgah+ut+Vvvgvfjxhi
bAHeweq0kkNwmz6twWUCwijmkiTDCtVQp+yre5TPvGBeZz58JNpGrb1wNqJwiKEKBvAY1owq9BKi
3CuBBzaFC0ujnQsqYmyCYWAi7dUmE0QlQqUnguIJpg2RwKb95U3r6FWHaZz0/UYE+8TYWZaV/THH
ZmcdslN5XelpuRFhdO2GdzLBvio1dKOBGCQQ+ksNWyqKqGJT7rZ59tSunlQoSBQemcuYfoYEDLbv
fZhtgwcdPKvXXHYwQ9AaObs1N33vwt087AZqepyDOq7fBtH37aPwep3t2qcfSN8n3/9407Z13Uy3
OZkhux+6HeqAdQ5uPrFBdwuKQugoN7xNmcKa8C0DORABeV1sQ+NpSZpuym51BKqR22iH4tRPoNjK
ESwQCa0SoGBkFZNVFSosgdGwChmwKsC1rz4LGhho38aarquiVOtE5VbQoOOhdIqYSKbg7zfQEGxn
aX6Y5zeWUYTL04MSWDx0GKmXljCAi2ElnhfxuwqvUxg7P3SFCfOGwIQsMBSD3ykOYT2ab/N6I1P+
XoRQgUAMUmknx0uNAcFuxWozFnuQzOdEatcXg+kxddFQ/G9lT7LUxrLs/n4FwerdCJ9zjZAxLFiU
uktSmZ7oAQGbDhl0jOKYIRC8Y7+vf5k1dNeQJfsuHFiZ2TVXVlZWDtWyxDMozU9OSBEYycqEZyU+
y9apne4WUdqO//L048mUWIzKB0qirw3aaYHiMrAmKUlyIDCuvgF877hKkvi4KTTsrGUjJ4msQWZf
jZVgPA8mbqdHN229m51iR6zf+BjRsVe8sWZJg0EZUDyWK9KhEkVR9ks4z3+TdF+DHcK0EeHmHW3w
Ax43ekljwtRor/Yt5eHk2NNIm8Yb1AFFTZmyM73eVz3LTz5N9Q6J1K5s7Vfi1i4evXT3cwd1gocT
ai6fzuFofYpm3bD/IxaHYeDhavOKSUPk1fVRPW2G0jWKs4n0BrBkOA1Ek8/KdYHUmE8/fiCGFIyQ
wA0bQxWSNt2eEpqKDx+ZYdnTG0tGYmGCgTDOapHWpbAOXw3oZ6IACRtdmp3mOliS+3gF6Djq54df
t5gQ8MPDP/o///t0r/53GCseK9/vuhtGe00Z9dAmE5eNfZQ//bsxnjRcO6W4MvrlHK6/lG+oLgct
9prUTqI+sirXy2WAl23lNwdFmDJRiKH+YefKgmhdEIbkbKAqvreVftIQGWfANE895q8O3l7Xd1Ln
FaYEb1qqbLV/26Wj3dawaET/gWDRUg54AzpvOrrc9hflElnszEt/2EdTLQYBdq+qMj5AhctQGmuR
deJXfb6oDXlyRWkOBqqmrVkrrkMfK0kxq0UaCZYr8emcun8NhWv3IN0Rg22E80MmfMTQrkWZcheT
swZfWXRW2bHqEbXsqGuDRcCAW/HULbZxIl5JyIyju4FfSUl7WfFhhcJ/Q0fWslIU9s++WcJ9pMtl
XHyViuD8yFK7WeUM27/LWgF3v+vRz8B6tiL8eju0f118PptYg41ANykvQoZ0E+FzWNCMCphA5bCA
RkQCXDSZyGPJ4+XrFPy/4AnlOpSUHRJYs9KivMnS1BVQ8jLCeD03I2XbtsUA4/Kott27EpYsOYZk
ScfMpBp3xVAn3nKYfdSiOBlb+TVGoXADLRhYP5NBgMqKOn8ww0uPeC9bATqUoRH0jUNBLucebnn1
TTU8Jo6IK7h/k1lb5w2RV0eBSBYnMV6S2jkLy7jsypa6aWJuh3kz7e0TTMF6d8yQw/fkQV1CZzJ2
4xQxwvqap6KG5dPDH0eoI0hYtmI3UHOZZeWKXJDWV3i20yvaIrqGIZId+hVhzluWlNVNIOok67sH
Ox3pvJEr0Z1QtTgxQzS9jwzFUjRtCXIydQYaGqNYDz4uZ19wkDIR2Uy6pUpQ3W3e758P/oK9FGwl
6ZHhqPMRcOFbZ0voVe4fWTYW9VZt5hVUyag3ZSE8dw2JBKklS2tOBZO84HVht8qTq9q8clekBOBz
tAAOmlAnmqK4Zm3r+o10C95mM3Ixg4gjY8Zzle1kkJ+1anIhFqxoherkiFd/xj1j5OtwEoZ6RKMy
can8A07HyhrzSMnSiBZyyVK83TkAddih2IPfl/m8mdDlJrAq3Sjx+BvEWesYBsHQdNKByFwyIG7f
UOTon9k6T9IVbAJyURW8xZhb3sAYpFc1/r6aeL8dgwEFiSwOiZyeP3rk0z6S1BHTd8VyB6mmyV0a
xSP/1BmzU9Kx3hDhPgD5My28vqaikbGIurSygivZdZBpKWrp54V5N6yZwVPL/4mj4VToe0k0XVFX
if+7X8BRbI2ihgays1lWvFp6i1eD4sOnCfbu9UTMnWbgb8WQyUCBiMXESis4RhqedDUnfBUl1Yoz
DOyO239Jtw6pugqzKsXxkgnFGhJw/BFKqzxGPHoOVJhtJRL/VhL+RvuI4R94W8pc8SCQDZhpDVk+
+8XmGL7uYRq8tFsD0VlFc63CtiuFHyZ81vnhdvd8evrp7I+jQxsNveHygJoeO6/tDu7zMeVC4pJ8
/uTWO2BO3QCcHo5ajB5JvODPMYxttOxhjqKYSRRzHO/ACW3p4BHR8Vc8IsqpyCM5izTx7Pgk2sRY
6BmvAHpjuURT2lHZbeRnyo8KSURT4gLsT6NNPZr8TluBij6SkEqmuPxFA7wlYMATGnxMg6d+LwyC
Mle28Sd0eZ9p8FmsmiPqQdAhmNIlHnn76aIUp31NwDq/6pwlKMIwSlg1+ITDdT9xS1NwuBh3tmne
gKlL1gpWEJibWmQZVdqCcRpec9uIxYAFtIrZqf0GRNGJNtpNsbenbVdfCDu1KCK6dm6ZfqWZ8z4E
P6NiQFeIRCmObB0lgvoCQ7Jk4lYa4e7X2zqqAuVvubl7f0UrsyD3LZ6RY1PxF9w7LzuOuTD9Cx2G
AoNbFswhEmLkHvp4nemSSKS+/INc7JOMbejTZV9CbSzI6SKFEtECBUj08uW/rUXSkjUZWqIOg7IP
cJl8SaajKqBxqDvAi6/KM8la2wU5INqD6udQwMyLCRNSSSVa5a608aYLMi3qM5qyq8mYPCjQwe0L
S8thrfjBDEk0VNkuzw//s/u6ffrP+27z+vh8v/njYfP9Bd8MzFrVUTfHYWfWfsua/PwQnSTvn/95
+vBz/bj+8P15ff+yffqwW/+1gQZu7z9sn94233Dtffj68tehWo4Xm9enzfeDh/Xr/UZagY7LUsf8
e3x+/XmwfdqiT9T2/9baNVPXK+ASjZ1KLmBXFM4SxWDfmIhLFKgM7uAajnIq9py6BNjEUBrSOqOm
QH1bY1U5kolbfn708WNIk3NciO5aHZB1V6Ctu7mrkCor6BJGEMLVNgy7k5VPU8yBubkEVrBCctgM
Oj7qg+e1zybGWy9s2dJobpPXny9vzwd3z6+bg+fXA7VmrMRCkhi6snDi3zrgSQjnLCWBIWlzkYhq
6UT3dhHhJ0sn/bMFDEnrYkHBSMJBrg4aHm0JizX+oqpC6ouqCktA+5KQNIio7MLDD1z1qEs9XKtl
yvKAajE/mpzmXRYgii6jga77n4JX8i+pdJF4+YdYFF275G5udo3xT0RvdYg8NUu4ev/6fXv3x9+b
nwd3cjV/e12/PPwMFnHdsKD+NFxJ3MkJYGDpkmgjT+q0oXTOptNdfcUnnz4dnZm2sve3B/SduFu/
be4P+JNsMDqS/LN9ezhgu93z3Vai0vXbOuhBkuTh9BGwZAnHPZt8rMrsRvv7+U1nfCEamPg9Q8wv
xRUxEksG7OvKdGgmHevxvNmFzZ2FI5nMZyHMVV4OUFqHp5sxIz7JasrAUSNLouaKauJ12xBlgyiD
8WZp/YIeU8w03nZ0IFXTcIySF2jgl+vdQ2wQcxY2cUkBr6nOXClK4/Kz2b2FNdTJ8YSYKQSHlVxr
9ut3bJaxCz6hHj0dgpD/QD3t0cdUzMOlTXJ6a1F77C6djlm9BxhBJ2ANS+NCiu/Uebp3WyDeSe8x
gCefTijw8SSkbpbsiAJSRQD409Ek6BmAj0Pa/JjoEiaE4LOS1FVqZruoj87CyV5Vn2QkLyUpbF8e
nHfdgZOEcwowFTw02CJFNxMRRZ6mqJNItk6zjMpVJBeuWVAMc7yKkNknDG9CRuUb8BvAkkkgR3Q4
OSnR+bn8S7GQJbtllAbbzBPLGkasFsPOqanlnPahHfB1RcfEHFbMlCi25XtOtXZVzgWxMTV8HOF/
6dy2L+hU5kj9w+jNM+cVyvDx2zKAnU7D9ZndTinYMmRmt007yAv1+un++fGgeH/8unk1MWGo5rGi
EX1SUUJkWs/wJa3oaIzmz/6wKlxUy24RJbQqfaQI6v0i2pajvXbtXGIt+bCnRHiDoKXqARsV0wcK
apQGJHkhkE8X3j3k+/br6xruPa/P72/bJ+I4zMSM5DgSDqwj4JOI0EeP8QqgJIeRKj7uSKT24i9K
UkS/KGiQDa3C9pGRaIr/INwckiD04jX3bB/J/r4Ysn1LduzzKHPu7/1w1vlFLWmjCNbc5OpaLnVK
aB8cmjFg2JW/pGi9kzkOd9tvT8pj8O5hc/c3XJOtlAvy7RXnHO71ohm0YJbOwKfAHSJNE84PDy2T
hN+oVTvRBkt71MaxmInNTMDhjcmHLC4ptVvywZ7CGtcXOPWLBJVWtbRft/euTZLxIoIt0BGnFZmX
yrJOBemfWKNWpOjymZN+QOn9WBYWX6FnFto9jyjZJ3wgTvLqOlmqV9uazz0KNFOY41muLdGEFzOg
0LY2dDhikDfRGLl1LvrJkXO2J30okia9aLve/coVkBMMFj8m47GWtsRkIuGzG1q0tAimxKesXsE5
GdmCSAELgS73xDkhE/eX9UIBmzK8BySW5nsQ/M1MdKlo1XygDoO1IRurWZGWuTsoGgWnufzMdXpH
aMpD+C2yDFF4wsKtYoAeFGQHomSEUiWDtEBSgwxBw+n2gXRBkEswRX9926d2EGz1u78+dTiihkoL
/ki6LE0iGBnqUGNZnRPFArRdwm6Nf9dUMLtBI2fJlwDmzu3Y435xa7tjWogZICYkJrvNGYm4vo3Q
lxG4tdYNzyEeAKT95xXLerwkWT1jdc1uFIexFn3TlIkAliYZMBDYTLlBdmYbzysQWrH0DptDeGr3
sgApvm9kWOoe+PGiXXo4RKCHCIpMvtEW4lia1n3bn0xnwp6IHGPrJxmrgaOWS669+XxW2vC2qyRx
WflJVRAPl4E6LVfFHpLmpkgkej4EmfkVleP+O5AgFuavItqLKEwu5TahWYmyzWYuWVEW5nuMZl25
2JoHIH1gGMz4vodjiy6IkTe+ZpGpNWVxzarLWXPRl/O5fDRwMH3tVn1pn4tZOXN/EXyzyLSpnykz
u+1bZkewry9RZLPKzSsBjNKqVOTOb/gxT60q0KukRu1gW9+M0rSUOcw2ukoba9MZ6IK3+DJSzlN7
X8xLmITRmMuGnv6wT10JQjtW6DVMhjXFOIwpr0oHJjPbOqftEI/Ek7PcZyojB0roy+v26e1vFa/j
cbP7Fr6pglhT6OST9sLQYLQ4Ip+j4E9TStvpRQYCWjY8LnyOUlx2grfn02HadHLFoISp9TiLFnu6
KSnPGO06mt4UDNNlxe2XQLielSB9YHJOoKVThaD5EvwDaXNWNk5E6egoDgqA7ffNH2/bRy0S7yTp
nYK/hmOu6oLz3uHsBoa21F3CvZQnA7YBeZB+Q7aI0hWr57SaaZHCvktqUZHqZ17Il5S8Q03Sktvb
e17DyPVQcHF+enQ2sVdqBQcHelG5RrA1XIpV6sWGVhkvOYZuQDNw2AIZZRKoutTAdkFDglw0OWsT
6/DwMbJ5fVlk1gaVvHfFYPOpHlSlPBIbv2caHg47cPOEayNCLhk7bbv9u+vgX3YyTb1v083X92/f
8KFTPO3eXt8xpqbtYsIwuAbc2NzAFwNweGRV83f+8ccRRaUCONAl6OAODRpUFHC8HR66kxCYH6jc
SovUeajA35SPgjn/ulnDCpD3C9HCvR3PFvtriSUH97eGy22wMsL1d5jOEWM/3Q+FWVwRORO/bjG8
uqtMVaUgXp6L5LqWX4NAQXJOiYS11pSF55biYuCQV+MU8Zd3iW95TftHqPbWZcpaFntzHG6sLZqi
Ok2SEJPpNLpBlVtD44+1BhPHvIufK8nUa7PBysh7tErdJUS78181sa+TTvKdWFtU4JbQLcql0mzS
HFlH1lGTdTNDTNliSbzRDNrbSS9aELC1aYfXS4OJc0lpZNI1yq1hbBCw8VQjeZEqrr5nNK/ozNpG
flU0IKZ2LNhbEbBKgSSNQnyU5qco+9PshTW2mZ2HkAmB2MLWECaylQob3Ne90nyqkYlJRNm1mZc/
1MGLAtF+cUomthYELnyFIxlbwIO8SV2quEbqfROJDsrnl92HAwzH/v6iTpjl+umbLdIB10jQ/KZ0
bhIOGB3uOj4GgFJIKd527flgM4T6Kbw7jalbzKoq520UiWIbpqXJbTJZw+/QDE2zFibW0C87YHQt
3D3I1bu6hEMeRICUfAeUs6BqsSW7/SOqzBHhKL9/x/ObOCfU5vLiqCmgK95JmNn2ow0TUba/H3FO
Ljj3AwAqlSvaJoxn4f/sXrZPaK8AvXl8f9v82MB/Nm93f/7557+tyJfoMCnLXsgrRuiHUtXl1T63
SFkCdsbfzqgI6Fp+zYOjoIH242cBb6DJVyuFAXZZrqTxn1/TqnE8ixRUNsy7r0rHGF6FDFUjovyU
tSXeKpqMx77G4ZOPR/p8ow5I2STYHS36p/iK07Gb+0xk/5tZdu6UaAtoMSgpG8Po9F2Bz6qwRpUC
kzhr1DlHdMc6qpy7ksWf/lYi2v36bX2AstkdvhUEtx/5zhDKVaFnpLuMqOWoUNJhVjhyvTqEeyn6
JKUM0esFBd7bYrf8BK5lvGiFCoOuHlqTjmIKsdlG0QPzVQZimENhf010FknwxJQ3poFhT468QnDm
o1XwS9LZxwTmdHrl7ctLfRuqPQUXNmkJHD1TgkjLTYg3ayMCtEhu2tLRFMJymneFusXJVtcx7KJm
1ZKmMRqAubfiCWS/Eu0S9T++vKHRuZT8gAAfgjwS9JWVo46U8rroF5LoD1UpIxK/iDDbeXyuGoYh
6KIZfJU8JkN6CO0K52oNlL25pgkOj/Xr48nUWb/jASDw/JJTCJcgkVL3GFbnJ1PNQfAqh5RSKciJ
fb2ivbx1GTwrk6g9ZFnzBiNo24UOQGAjxUWDwWL6Bv9HvyAN1MoovedtPqUbZJGSQU5GPC5479y3
kJ5tkI2QCvmFejaU65DchP7k2Dq+drN7w4MABZUEs+iuv1nhyi86R86WP80Fzgf7HEpB+bVcd7EZ
MYwWlWkyLPsXpYSxJM2cJrJ0sHO5UeLl2e8DrYpRspdKaT/stowbjImsyRgd0wqR6i4dv85Lmjme
08RoeBUTyhL5eZ4nxlfFbZv79XhsowN1SyoQhr1/kZS2/aq6+sA9A8CKRfW2q69Ljb/MLVY+b9ao
SWg8AlTM1V2OzwyepsZ4CeAaQcaGpkJEW4Hv+OrrvYs4MP9X2uz/B3jjlrweOwIA
--===============0895121230316382858==--


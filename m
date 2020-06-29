Content-Type: multipart/mixed; boundary="===============1726516221679657202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/platforms/8xx/micropatch.c:329:34: sparse: got unsigned char COPYING CREDITS Documentation Kbuild Kconfig LICENSES MAINTAINERS Makefile README arch block certs crypto drivers fs include init ipc kernel lib mm net samples scripts security sound tools usr virt
Date: Mon, 29 Jun 2020 18:54:59 +0800
Message-ID: <202006291845.2NybtDhZ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1726516221679657202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@c-s.fr>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
commit: 43db76f41824aea0a31f817e69ad304a95cf068a powerpc/8xx: Add microcode=
 patch to move SMC parameter RAM.
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-s032-20200629 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-3-gfa153962-dirty
        git checkout 43db76f41824aea0a31f817e69ad304a95cf068a
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   arch/powerpc/platforms/8xx/cpm1.c:221:24: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected struct comm_proc =
[usertype] *cp @@     got struct comm_proc [noderef] [usertype] <asn:2> *[a=
ddressable] [assigned] [toplevel] cpmp @@
>> arch/powerpc/platforms/8xx/cpm1.c:221:24: sparse:     expected struct co=
mm_proc [usertype] *cp
   arch/powerpc/platforms/8xx/cpm1.c:221:24: sparse:     got struct comm_pr=
oc [noderef] [usertype] <asn:2> *[addressable] [assigned] [toplevel] cpmp
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:322:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:324:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:327:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:329:17: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:340:25: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int volatile=
 [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [noderef] =
<asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse:     expected unsigned =
int volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned int const vo=
latile [noderef] [usertype] <asn:2> *addr @@     got restricted __be32 [nod=
eref] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse:     expected unsigned =
int const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:342:25: sparse:     got restricted __b=
e32 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:362:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:364:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:367:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:369:17: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:373:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:375:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:379:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:381:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:383:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short volati=
le [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [noderef=
] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse:     expected unsigned =
short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse: sparse: incorrect type=
 in argument 1 (different base types) @@     expected unsigned short const =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 [n=
oderef] <asn:2> * @@
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse:     expected unsigned =
short const volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/cpm1.c:385:25: sparse:     got restricted __b=
e16 [noderef] <asn:2> *
--
   arch/powerpc/platforms/8xx/micropatch.c:329:34: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void volati=
le [noderef] <asn:2> *d @@     got unsigned char * @@
   arch/powerpc/platforms/8xx/micropatch.c:329:34: sparse:     expected voi=
d volatile [noderef] <asn:2> *d
>> arch/powerpc/platforms/8xx/micropatch.c:329:34: sparse:     got unsigned=
 char *
   arch/powerpc/platforms/8xx/micropatch.c:334:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:334:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
>> arch/powerpc/platforms/8xx/micropatch.c:334:19: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:347:27: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:347:27: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:347:27: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:351:27: sparse: sparse: incorrec=
t type in argument 1 (different base types) @@     expected unsigned short =
volatile [noderef] [usertype] <asn:2> *addr @@     got restricted __be16 * =
@@
   arch/powerpc/platforms/8xx/micropatch.c:351:27: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
>> arch/powerpc/platforms/8xx/micropatch.c:351:27: sparse:     got restrict=
ed __be16 *
   arch/powerpc/platforms/8xx/micropatch.c:357:35: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:357:35: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:357:35: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:365:27: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:365:27: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:365:27: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:367:27: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:367:27: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:367:27: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:370:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:370:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:370:19: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:371:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:371:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:371:19: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:372:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:372:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:372:19: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:373:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:373:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:373:19: sparse:     got unsigned=
 short *
   arch/powerpc/platforms/8xx/micropatch.c:375:19: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected unsigned sh=
ort volatile [noderef] [usertype] <asn:2> *addr @@     got unsigned short *=
 @@
   arch/powerpc/platforms/8xx/micropatch.c:375:19: sparse:     expected uns=
igned short volatile [noderef] [usertype] <asn:2> *addr
   arch/powerpc/platforms/8xx/micropatch.c:375:19: sparse:     got unsigned=
 short *

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D43db76f41824aea0a31f817e69ad304a95cf068a
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 43db76f41824aea0a31f817e69ad304a95cf068a
vim +329 arch/powerpc/platforms/8xx/micropatch.c

43db76f41824ae arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  324  =

372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  325  static void __init cpm_write_patch(cpm8xx_t *cp, int offset, =
uint *patch, int len)
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  326  {
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  327  	if (!len)
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  328  		return;
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14 @329  	memcpy_toio(cp->cp_dpmem + offset, patch, len);
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  330  }
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  331  =

af71bcfeaaaad9 arch/powerpc/sysdev/micropatch.c        Anton Vorontsov  201=
0-07-08  332  void __init cpm_load_patch(cpm8xx_t *cp)
f2a0bd3753dad7 arch/powerpc/sysdev/micropatch.c        Vitaly Bordug    200=
7-01-24  333  {
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14 @334  	out_be16(&cp->cp_rccr, 0);
f2a0bd3753dad7 arch/powerpc/sysdev/micropatch.c        Vitaly Bordug    200=
7-01-24  335  =

372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  336  	cpm_write_patch(cp, 0, patch_2000, sizeof(patch_2000));
372fba9c76af11 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  337  	cpm_write_patch(cp, 0xf00, patch_2f00, sizeof(patch_2f00));
11597ff20b6b3c arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  338  	cpm_write_patch(cp, 0xe00, patch_2e00, sizeof(patch_2e00));
f2a0bd3753dad7 arch/powerpc/sysdev/micropatch.c        Vitaly Bordug    200=
7-01-24  339  =

647d5ed0ae8a99 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  340  	if (IS_ENABLED(CONFIG_I2C_SPI_UCODE_PATCH) ||
647d5ed0ae8a99 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  341  	    IS_ENABLED(CONFIG_I2C_SPI_SMC1_UCODE_PATCH)) {
647d5ed0ae8a99 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  342  		u16 rpbase =3D 0x500;
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  343  		iic_t *iip;
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  344  		struct spi_pram *spp;
f2a0bd3753dad7 arch/powerpc/sysdev/micropatch.c        Vitaly Bordug    200=
7-01-24  345  =

c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  346  		iip =3D (iic_t *)&cp->cp_dparam[PROFF_IIC];
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  347  		out_be16(&iip->iic_rpbase, rpbase);
f2a0bd3753dad7 arch/powerpc/sysdev/micropatch.c        Vitaly Bordug    200=
7-01-24  348  =

647d5ed0ae8a99 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  349  		/* Put SPI above the IIC, also 32-byte aligned. */
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14  350  		spp =3D (struct spi_pram *)&cp->cp_dparam[PROFF_SPI];
c3eec5d7da3f77 arch/powerpc/platforms/8xx/micropatch.c Christophe Leroy 201=
9-06-14 @351  		out_be16(&spp->rpbase, (rpbase + sizeof(iic_t) + 31) & ~31);

:::::: The code at line 329 was first introduced by commit
:::::: 372fba9c76af11f1c7d162d22cff94e46f467bfb powerpc/8xx: refactor writi=
ng of CPM microcode arrays

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1726516221679657202==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1726516221679657202==--


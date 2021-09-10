Content-Type: multipart/mixed; boundary="===============1941222755909585681=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Fri, 10 Sep 2021 13:33:10 +0800
Message-ID: <202109101303.GvmCFn1x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1941222755909585681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bf9f243f23e6623f310ba03fbb14e10ec3a61290
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap acce=
ssors
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: powerpc64-randconfig-s032-20210910 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/dma/ppc4xx/adma.c:73:1: sparse: sparse: symbol 'ppc440spe_adma_c=
han_list' was not declared. Should it be static?
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:140:17: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:543:35: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] sg1l =
@@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     expected unsigned int [use=
rtype] sg1l
   drivers/dma/ppc4xx/adma.c:543:35: sparse:     got restricted __le32 [use=
rtype]
   drivers/dma/ppc4xx/adma.c:544:35: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:544:35: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:544:35: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:590:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:590:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:590:23: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:629:23: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] @@   =
  got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:629:23: sparse:     expected unsigned int [use=
rtype]
   drivers/dma/ppc4xx/adma.c:629:23: sparse:     got restricted __le32 [use=
rtype]
   drivers/dma/ppc4xx/adma.c:630:23: sparse: sparse: invalid assignment: |=
=3D
   drivers/dma/ppc4xx/adma.c:630:23: sparse:    left side has type unsigned=
 int
   drivers/dma/ppc4xx/adma.c:630:23: sparse:    right side has type restric=
ted __le32
   drivers/dma/ppc4xx/adma.c:655:34: sparse: sparse: incorrect type in assi=
gnment (different base types) @@     expected unsigned int [usertype] cnt @=
@     got restricted __le32 [usertype] @@
   drivers/dma/ppc4xx/adma.c:655:34: sparse:     expected unsigned int [use=
rtype] cnt
   drivers/dma/ppc4xx/adma.c:655:34: sparse:     got restricted __le32 [use=
rtype]
>> drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:688:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:689:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:689:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:690:38: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:690:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:691:39: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:691:39: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:691:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:738:69: sparse: sparse: Using plain integer as=
 NULL pointer
   drivers/dma/ppc4xx/adma.c:1187:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1187:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1187:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1188:34: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1188:34: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1188:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1190:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1190:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
>> drivers/dma/ppc4xx/adma.c:1191:36: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1191:36: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1191:36: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1138:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1138:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1138:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1147:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1147:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1157:49: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1157:49: sparse:     got unsigned int *
>> drivers/dma/ppc4xx/adma.c:1159:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:911:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:912:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:929:37: sparse: sparse: cast to restricted __l=
e32
   drivers/dma/ppc4xx/adma.c:974:32: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const volatile [node=
ref] __iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     expected void const volati=
le [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:979:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void volatile [noderef] _=
_iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     expected void volatile [no=
deref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:984:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct xor_regs *xor_reg =
@@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:984:25: sparse:     expected struct xor_regs *=
xor_reg
   drivers/dma/ppc4xx/adma.c:984:25: sparse:     got struct xor_regs [noder=
ef] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:985:34: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:986:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     expected void const [noder=
ef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:999:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem *a=
ddr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     expected void [noderef] __=
iomem *addr
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1027:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
>> drivers/dma/ppc4xx/adma.c:1031:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const volatile [nod=
eref] __iomem *addr @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     expected void const volat=
ile [noderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1038:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1038:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1038:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1039:37: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1053:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct xor_regs *xor_re=
g @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1053:48: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1053:48: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1055:25: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     expected void const [node=
ref] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1080:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1090:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void volatile [noderef] =
__iomem *addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     expected void volatile [n=
oderef] __iomem *addr
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1210:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct xor_regs *xor_reg=
 @@     got struct xor_regs [noderef] __iomem *xor_reg @@
   drivers/dma/ppc4xx/adma.c:1210:25: sparse:     expected struct xor_regs =
*xor_reg
   drivers/dma/ppc4xx/adma.c:1210:25: sparse:     got struct xor_regs [node=
ref] __iomem *xor_reg
   drivers/dma/ppc4xx/adma.c:1214:30: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
addr @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     expected void [noderef] _=
_iomem *addr
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2777:62: sparse: sparse: Using plain integer a=
s NULL pointer
   drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: too many warnings

vim +688 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin 2009-12-11  675  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  676  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  677   * ppc440spe_desc_set_dc=
heck - set CHECK pattern
12458ea06efd7b Anatolij Gustschin 2009-12-11  678   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  679  static void ppc440spe_de=
sc_set_dcheck(struct ppc440spe_adma_desc_slot *desc,
12458ea06efd7b Anatolij Gustschin 2009-12-11  680  				struct ppc440spe_adm=
a_chan *chan, u8 *qword)
12458ea06efd7b Anatolij Gustschin 2009-12-11  681  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  682  	struct dma_cdb *dma_hw_=
desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  683  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  684  	switch (chan->device->i=
d) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  685  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  686  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  687  		dma_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11 @688  		iowrite32(qword[0], &d=
ma_hw_desc->sg3l);
12458ea06efd7b Anatolij Gustschin 2009-12-11  689  		iowrite32(qword[4], &d=
ma_hw_desc->sg3u);
12458ea06efd7b Anatolij Gustschin 2009-12-11  690  		iowrite32(qword[8], &d=
ma_hw_desc->sg2l);
12458ea06efd7b Anatolij Gustschin 2009-12-11  691  		iowrite32(qword[12], &=
dma_hw_desc->sg2u);
12458ea06efd7b Anatolij Gustschin 2009-12-11  692  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  693  	default:
12458ea06efd7b Anatolij Gustschin 2009-12-11  694  		BUG();
12458ea06efd7b Anatolij Gustschin 2009-12-11  695  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  696  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  697  =


:::::: The code at line 688 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1941222755909585681==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
e7pvSrbzAQA=
--===============1941222755909585681==--


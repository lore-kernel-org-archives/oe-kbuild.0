Content-Type: multipart/mixed; boundary="===============4052844823154723116=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/ppc4xx/adma.c:688:38: sparse: sparse: incorrect type in argument 2 (different address spaces)
Date: Tue, 29 Jun 2021 22:35:06 +0800
Message-ID: <202106292255.8DHHE3nB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4052844823154723116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c54b245d011855ea91c5beff07f1db74143ce614
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap acce=
ssors
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-s032-20210629 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
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

12458ea06efd7b Anatolij Gustschin 2009-12-11  599  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  600  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  601   * ppc440spe_desc_set_de=
st_addr - set destination address into the descriptor
12458ea06efd7b Anatolij Gustschin 2009-12-11  602   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  603  static void ppc440spe_de=
sc_set_dest_addr(struct ppc440spe_adma_desc_slot *desc,
12458ea06efd7b Anatolij Gustschin 2009-12-11  604  				struct ppc440spe_adm=
a_chan *chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  605  				dma_addr_t addrh, dm=
a_addr_t addrl,
12458ea06efd7b Anatolij Gustschin 2009-12-11  606  				u32 dst_idx)
12458ea06efd7b Anatolij Gustschin 2009-12-11  607  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  608  	struct dma_cdb *dma_hw_=
desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  609  	struct xor_cb *xor_hw_d=
esc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  610  	phys_addr_t addr64, tmp=
hi, tmplow;
12458ea06efd7b Anatolij Gustschin 2009-12-11  611  	u32 *psgu, *psgl;
12458ea06efd7b Anatolij Gustschin 2009-12-11  612  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  613  	switch (chan->device->i=
d) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  614  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  615  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  616  		if (!addrh) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  617  			addr64 =3D addrl;
12458ea06efd7b Anatolij Gustschin 2009-12-11  618  			tmphi =3D (addr64 >> =
32);
12458ea06efd7b Anatolij Gustschin 2009-12-11  619  			tmplow =3D (addr64 & =
0xFFFFFFFF);
12458ea06efd7b Anatolij Gustschin 2009-12-11  620  		} else {
12458ea06efd7b Anatolij Gustschin 2009-12-11  621  			tmphi =3D addrh;
12458ea06efd7b Anatolij Gustschin 2009-12-11  622  			tmplow =3D addrl;
12458ea06efd7b Anatolij Gustschin 2009-12-11  623  		}
12458ea06efd7b Anatolij Gustschin 2009-12-11  624  		dma_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  625  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  626  		psgu =3D dst_idx ? &dm=
a_hw_desc->sg3u : &dma_hw_desc->sg2u;
12458ea06efd7b Anatolij Gustschin 2009-12-11  627  		psgl =3D dst_idx ? &dm=
a_hw_desc->sg3l : &dma_hw_desc->sg2l;
12458ea06efd7b Anatolij Gustschin 2009-12-11  628  =

12458ea06efd7b Anatolij Gustschin 2009-12-11 @629  		*psgl =3D cpu_to_le32(=
(u32)tmplow);
12458ea06efd7b Anatolij Gustschin 2009-12-11  630  		*psgu |=3D cpu_to_le32=
((u32)tmphi);
12458ea06efd7b Anatolij Gustschin 2009-12-11  631  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  632  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  633  		xor_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  634  		xor_hw_desc->cbtal =3D=
 addrl;
12458ea06efd7b Anatolij Gustschin 2009-12-11  635  		xor_hw_desc->cbtah |=
=3D addrh;
12458ea06efd7b Anatolij Gustschin 2009-12-11  636  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  637  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  638  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  639  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  640  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  641   * ppc440spe_desc_set_by=
te_count - set number of data bytes involved
12458ea06efd7b Anatolij Gustschin 2009-12-11  642   * into the operation
12458ea06efd7b Anatolij Gustschin 2009-12-11  643   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  644  static void ppc440spe_de=
sc_set_byte_count(struct ppc440spe_adma_desc_slot *desc,
12458ea06efd7b Anatolij Gustschin 2009-12-11  645  				struct ppc440spe_adm=
a_chan *chan,
12458ea06efd7b Anatolij Gustschin 2009-12-11  646  				u32 byte_count)
12458ea06efd7b Anatolij Gustschin 2009-12-11  647  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  648  	struct dma_cdb *dma_hw_=
desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  649  	struct xor_cb *xor_hw_d=
esc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  650  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  651  	switch (chan->device->i=
d) {
12458ea06efd7b Anatolij Gustschin 2009-12-11  652  	case PPC440SPE_DMA0_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  653  	case PPC440SPE_DMA1_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  654  		dma_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  655  		dma_hw_desc->cnt =3D c=
pu_to_le32(byte_count);
12458ea06efd7b Anatolij Gustschin 2009-12-11  656  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  657  	case PPC440SPE_XOR_ID:
12458ea06efd7b Anatolij Gustschin 2009-12-11  658  		xor_hw_desc =3D desc->=
hw_desc;
12458ea06efd7b Anatolij Gustschin 2009-12-11  659  		xor_hw_desc->cbbc =3D =
byte_count;
12458ea06efd7b Anatolij Gustschin 2009-12-11  660  		break;
12458ea06efd7b Anatolij Gustschin 2009-12-11  661  	}
12458ea06efd7b Anatolij Gustschin 2009-12-11  662  }
12458ea06efd7b Anatolij Gustschin 2009-12-11  663  =

12458ea06efd7b Anatolij Gustschin 2009-12-11  664  /**
12458ea06efd7b Anatolij Gustschin 2009-12-11  665   * ppc440spe_desc_set_rx=
or_block_size - set RXOR block size
12458ea06efd7b Anatolij Gustschin 2009-12-11  666   */
12458ea06efd7b Anatolij Gustschin 2009-12-11  667  static inline void ppc44=
0spe_desc_set_rxor_block_size(u32 byte_count)
12458ea06efd7b Anatolij Gustschin 2009-12-11  668  {
12458ea06efd7b Anatolij Gustschin 2009-12-11  669  	/* assume that byte_cou=
nt is aligned on the 512-boundary;
12458ea06efd7b Anatolij Gustschin 2009-12-11  670  	 * thus write it direct=
ly to the register (bits 23:31 are
12458ea06efd7b Anatolij Gustschin 2009-12-11  671  	 * reserved there).
12458ea06efd7b Anatolij Gustschin 2009-12-11  672  	 */
12458ea06efd7b Anatolij Gustschin 2009-12-11  673  	dcr_write(ppc440spe_mq_=
dcr_host, DCRN_MQ0_CF2H, byte_count);
12458ea06efd7b Anatolij Gustschin 2009-12-11  674  }
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
12458ea06efd7b Anatolij Gustschin 2009-12-11 @690  		iowrite32(qword[8], &d=
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

--===============4052844823154723116==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ywNGvaL9H/ZWnCeBygEA
--===============4052844823154723116==--


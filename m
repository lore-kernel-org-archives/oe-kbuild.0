Content-Type: multipart/mixed; boundary="===============5396201924578045667=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] lib: fix kconfig dependency on ARCH_WANT_FRAME_POINTERS
Date: Tue, 30 Mar 2021 11:38:03 +0800
Message-ID: <202103301156.Vg86nG9I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5396201924578045667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210329165329.27994-1-julianbraha@gmail.com>
References: <20210329165329.27994-1-julianbraha@gmail.com>
TO: Julian Braha <julianbraha@gmail.com>
TO: akpm(a)linux-foundation.org
CC: schwab(a)linux-m68k.org
CC: geert(a)linux-m68k.org
CC: linux-kernel(a)vger.kernel.org
CC: fazilyildiran(a)gmail.com

Hi Julian,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master hnaz-linux-mm/master v5.12-rc5 next-=
20210329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Julian-Braha/lib-fix-kconf=
ig-dependency-on-ARCH_WANT_FRAME_POINTERS/20210330-005647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
a74e6a014c9d4d4161061f770c9b4f98372ac778
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-s032-20210329 (attached as .config)
compiler: csky-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-277-gc089cd2d-dirty
        # https://github.com/0day-ci/linux/commit/41ca1a7330de6aa0b70ee618d=
49033ba5d63e80f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Julian-Braha/lib-fix-kconfig-depen=
dency-on-ARCH_WANT_FRAME_POINTERS/20210330-005647
        git checkout 41ca1a7330de6aa0b70ee618d49033ba5d63e80f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dcsky =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/csky/mm/tcm.c:9:2: error: #error "You should define ITCM_RAM_BASE"
       9 | #error "You should define ITCM_RAM_BASE"
         |  ^~~~~
>> arch/csky/mm/tcm.c:14:2: error: #error "You should define DTCM_RAM_BASE"
      14 | #error "You should define DTCM_RAM_BASE"
         |  ^~~~~
>> arch/csky/mm/tcm.c:18:2: error: #error "You should define correct DTCM_R=
AM_BASE"
      18 | #error "You should define correct DTCM_RAM_BASE"
         |  ^~~~~
   arch/csky/mm/tcm.c:109:7: warning: no previous prototype for 'tcm_alloc'=
 [-Wmissing-prototypes]
     109 | void *tcm_alloc(size_t len)
         |       ^~~~~~~~~
   arch/csky/mm/tcm.c:124:6: warning: no previous prototype for 'tcm_free' =
[-Wmissing-prototypes]
     124 | void tcm_free(void *addr, size_t len)
         |      ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - LOCK_STAT && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT


sparse warnings: (new ones prefixed by >>)
>> net/atm/br2684.c:731:23: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got unsign=
ed short const [noderef] __user *__gu_ptr @@
   net/atm/br2684.c:731:23: sparse:     expected void const *addr
   net/atm/br2684.c:731:23: sparse:     got unsigned short const [noderef] =
__user *__gu_ptr
--
>> net/netrom/af_netrom.c:359:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
int const [noderef] __user *__gu_ptr @@
   net/netrom/af_netrom.c:359:13: sparse:     expected void const *addr
   net/netrom/af_netrom.c:359:13: sparse:     got int const [noderef] __use=
r *__gu_ptr
>> net/netrom/af_netrom.c:392:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int *__pu_addr @@     got i=
nt [noderef] __user *optlen @@
   net/netrom/af_netrom.c:392:13: sparse:     expected int *__pu_addr
   net/netrom/af_netrom.c:392:13: sparse:     got int [noderef] __user *opt=
len
>> net/netrom/af_netrom.c:1211:24: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int *__pu_addr @@     got =
int [noderef] __user * @@
   net/netrom/af_netrom.c:1211:24: sparse:     expected int *__pu_addr
   net/netrom/af_netrom.c:1211:24: sparse:     got int [noderef] __user *
   net/netrom/af_netrom.c:1223:24: sparse: sparse: incorrect type in initia=
lizer (different address spaces) @@     expected int *__pu_addr @@     got =
int [noderef] __user * @@
   net/netrom/af_netrom.c:1223:24: sparse:     expected int *__pu_addr
   net/netrom/af_netrom.c:1223:24: sparse:     got int [noderef] __user *
--
>> net/rose/af_rose.c:438:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const *addr @@     got int =
const [noderef] __user *__gu_ptr @@
   net/rose/af_rose.c:438:13: sparse:     expected void const *addr
   net/rose/af_rose.c:438:13: sparse:     got int const [noderef] __user *_=
_gu_ptr
>> net/rose/af_rose.c:479:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int *__pu_addr @@     got int [=
noderef] __user *optlen @@
   net/rose/af_rose.c:479:13: sparse:     expected int *__pu_addr
   net/rose/af_rose.c:479:13: sparse:     got int [noderef] __user *optlen
>> net/rose/af_rose.c:1289:24: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected unsigned int *__pu_addr @@    =
 got unsigned int [noderef] __user * @@
   net/rose/af_rose.c:1289:24: sparse:     expected unsigned int *__pu_addr
   net/rose/af_rose.c:1289:24: sparse:     got unsigned int [noderef] __use=
r *
   net/rose/af_rose.c:1298:24: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected unsigned int *__pu_addr @@    =
 got unsigned int [noderef] __user * @@
   net/rose/af_rose.c:1298:24: sparse:     expected unsigned int *__pu_addr
   net/rose/af_rose.c:1298:24: sparse:     got unsigned int [noderef] __use=
r *
--
>> net/ax25/af_ax25.c:695:13: sparse: sparse: incorrect type in argument 1 =
(different address spaces) @@     expected void const *addr @@     got int =
const [noderef] __user *__gu_ptr @@
   net/ax25/af_ax25.c:695:13: sparse:     expected void const *addr
   net/ax25/af_ax25.c:695:13: sparse:     got int const [noderef] __user *_=
_gu_ptr
>> net/ax25/af_ax25.c:772:13: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected int *__pu_addr @@     got int [=
noderef] __user *optlen @@
   net/ax25/af_ax25.c:772:13: sparse:     expected int *__pu_addr
   net/ax25/af_ax25.c:772:13: sparse:     got int [noderef] __user *optlen
>> net/ax25/af_ax25.c:1710:23: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int *__pu_addr @@     got int =
[noderef] __user * @@
   net/ax25/af_ax25.c:1710:23: sparse:     expected int *__pu_addr
   net/ax25/af_ax25.c:1710:23: sparse:     got int [noderef] __user *
   net/ax25/af_ax25.c:1720:23: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int *__pu_addr @@     got int =
[noderef] __user * @@
   net/ax25/af_ax25.c:1720:23: sparse:     expected int *__pu_addr
   net/ax25/af_ax25.c:1720:23: sparse:     got int [noderef] __user *
>> net/ax25/af_ax25.c:1742:21: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const *addr @@     got lon=
g const [noderef] __user *__gu_ptr @@
   net/ax25/af_ax25.c:1742:21: sparse:     expected void const *addr
   net/ax25/af_ax25.c:1742:21: sparse:     got long const [noderef] __user =
*__gu_ptr
--
   drivers/net/ethernet/intel/e1000/e1000_param.c: note: in included file (=
through drivers/net/ethernet/intel/e1000/e1000_hw.h, drivers/net/ethernet/i=
ntel/e1000/e1000.h):
   drivers/net/ethernet/intel/e1000/e1000_osdep.h:13:9: sparse: sparse: pre=
processor token CONFIG_RAM_BASE redefined
   drivers/net/ethernet/intel/e1000/e1000_param.c: note: in included file (=
through include/linux/kconfig.h, builtin):
>> ./include/generated/autoconf.h:2158:9: sparse: this was the original def=
inition
--
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c: note: in included file=
 (through drivers/net/ethernet/intel/e1000/e1000_hw.h, drivers/net/ethernet=
/intel/e1000/e1000.h):
   drivers/net/ethernet/intel/e1000/e1000_osdep.h:13:9: sparse: sparse: pre=
processor token CONFIG_RAM_BASE redefined
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c: note: in included file=
 (through include/linux/kconfig.h, builtin):
>> ./include/generated/autoconf.h:2158:9: sparse: this was the original def=
inition
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:516:32: sparse: sparse:=
 incorrect type in assignment (different base types) @@     expected unsign=
ed short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:516:32: sparse:     exp=
ected unsigned short [usertype]
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c:516:32: sparse:     got=
 restricted __le16 [usertype]
   drivers/net/ethernet/intel/e1000/e1000_ethtool.c: note: in included file=
 (through arch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq=
.h, ...):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
--
   drivers/net/ethernet/intel/e1000/e1000_hw.c: note: in included file (thr=
ough drivers/net/ethernet/intel/e1000/e1000_hw.h, drivers/net/ethernet/inte=
l/e1000/e1000.h):
   drivers/net/ethernet/intel/e1000/e1000_osdep.h:13:9: sparse: sparse: pre=
processor token CONFIG_RAM_BASE redefined
   drivers/net/ethernet/intel/e1000/e1000_hw.c: note: in included file (thr=
ough include/linux/kconfig.h, builtin):
>> ./include/generated/autoconf.h:2158:9: sparse: this was the original def=
inition
   drivers/net/ethernet/intel/e1000/e1000_hw.c: note: in included file (thr=
ough arch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq.h, .=
..):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
--
   drivers/net/ethernet/intel/e1000/e1000_main.c: note: in included file (t=
hrough drivers/net/ethernet/intel/e1000/e1000_hw.h, drivers/net/ethernet/in=
tel/e1000/e1000.h):
   drivers/net/ethernet/intel/e1000/e1000_osdep.h:13:9: sparse: sparse: pre=
processor token CONFIG_RAM_BASE redefined
   drivers/net/ethernet/intel/e1000/e1000_main.c: note: in included file (t=
hrough include/linux/kconfig.h, builtin):
>> ./include/generated/autoconf.h:2158:9: sparse: this was the original def=
inition
   drivers/net/ethernet/intel/e1000/e1000_main.c: note: in included file (t=
hrough arch/csky/include/asm/io.h, include/linux/io.h, include/linux/irq.h,=
 ...):
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
--
   fs/notify/fanotify/fanotify_user.c:143:63: sparse: sparse: restricted fm=
ode_t degrades to integer
>> fs/notify/fanotify/fanotify_user.c:317:35: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *to @@     =
got char [noderef] __user *[assigned] buf @@
   fs/notify/fanotify/fanotify_user.c:317:35: sparse:     expected void *to
   fs/notify/fanotify/fanotify_user.c:317:35: sparse:     got char [noderef=
] __user *[assigned] buf
>> fs/notify/fanotify/fanotify_user.c:646:23: sparse: sparse: incorrect typ=
e in initializer (different address spaces) @@     expected int *__pu_addr =
@@     got int [noderef] __user * @@
   fs/notify/fanotify/fanotify_user.c:646:23: sparse:     expected int *__p=
u_addr
   fs/notify/fanotify/fanotify_user.c:646:23: sparse:     got int [noderef]=
 __user *
   fs/notify/fanotify/fanotify_user.c:972:28: sparse: sparse: restricted fm=
ode_t degrades to integer
--
>> drivers/net/hamradio/6pack.c:701:23: sparse: sparse: incorrect type in i=
nitializer (different address spaces) @@     expected int *__pu_addr @@    =
 got int [noderef] __user * @@
   drivers/net/hamradio/6pack.c:701:23: sparse:     expected int *__pu_addr
   drivers/net/hamradio/6pack.c:701:23: sparse:     got int [noderef] __use=
r *
>> drivers/net/hamradio/6pack.c:705:21: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const *addr @@   =
  got int const [noderef] __user *__gu_ptr @@
   drivers/net/hamradio/6pack.c:705:21: sparse:     expected void const *ad=
dr
   drivers/net/hamradio/6pack.c:705:21: sparse:     got int const [noderef]=
 __user *__gu_ptr
--
   drivers/net/slip/slip.c:458:14: sparse: sparse: incompatible types in co=
mparison expression (different address spaces):
   drivers/net/slip/slip.c:458:14: sparse:    void [noderef] __rcu *
   drivers/net/slip/slip.c:458:14: sparse:    void *
   drivers/net/slip/slip.c:892:9: sparse: sparse: incompatible types in com=
parison expression (different address spaces):
   drivers/net/slip/slip.c:892:9: sparse:    void [noderef] __rcu *
   drivers/net/slip/slip.c:892:9: sparse:    void *
>> drivers/net/slip/slip.c:1094:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected int *__pu_addr @@     got=
 int [noderef] __user *p @@
>> drivers/net/slip/slip.c:1099:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t int const [noderef] __user *__gu_ptr @@
   drivers/net/slip/slip.c:1124:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t int const [noderef] __user *__gu_ptr @@
   drivers/net/slip/slip.c:1145:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected int *__pu_addr @@     got=
 int [noderef] __user *p @@
   drivers/net/slip/slip.c:1150:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t int const [noderef] __user *__gu_ptr @@
   drivers/net/slip/slip.c:1170:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected int *__pu_addr @@     got=
 int [noderef] __user *p @@
--
>> drivers/scsi/megaraid.c:3017:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int *__pu_addr @=
@     got unsigned int [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3017:21: sparse:     expected unsigned int *__pu=
_addr
   drivers/scsi/megaraid.c:3017:21: sparse:     got unsigned int [noderef] =
[usertype] __user *
   drivers/scsi/megaraid.c:3023:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int *__pu_addr @=
@     got unsigned int [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3023:21: sparse:     expected unsigned int *__pu=
_addr
   drivers/scsi/megaraid.c:3023:21: sparse:     got unsigned int [noderef] =
[usertype] __user *
>> drivers/scsi/megaraid.c:3533:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char *__pu_addr =
@@     got unsigned char [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3533:21: sparse:     expected unsigned char *__p=
u_addr
   drivers/scsi/megaraid.c:3533:21: sparse:     got unsigned char [noderef]=
 [usertype] __user *
>> drivers/scsi/megaraid.c:3540:29: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t struct mega_passthru [noderef] [usertype] __user *const [noderef] __user =
*__gu_ptr @@
   drivers/scsi/megaraid.c:3540:29: sparse:     expected void const *addr
   drivers/scsi/megaraid.c:3540:29: sparse:     got struct mega_passthru [n=
oderef] [usertype] __user *const [noderef] __user *__gu_ptr
   drivers/scsi/megaraid.c:3540:29: sparse: sparse: Using plain integer as =
NULL pointer
   drivers/scsi/megaraid.c:3543:29: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char *__pu_addr =
@@     got unsigned char [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3543:29: sparse:     expected unsigned char *__p=
u_addr
   drivers/scsi/megaraid.c:3543:29: sparse:     got unsigned char [noderef]=
 [usertype] __user *
   drivers/scsi/megaraid.c:3550:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char *__pu_addr =
@@     got unsigned char [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3550:21: sparse:     expected unsigned char *__p=
u_addr
   drivers/scsi/megaraid.c:3550:21: sparse:     got unsigned char [noderef]=
 [usertype] __user *
   drivers/scsi/megaraid.c:3557:29: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t struct mega_passthru [noderef] [usertype] __user *const [noderef] __user =
*__gu_ptr @@
   drivers/scsi/megaraid.c:3557:29: sparse:     expected void const *addr
   drivers/scsi/megaraid.c:3557:29: sparse:     got struct mega_passthru [n=
oderef] [usertype] __user *const [noderef] __user *__gu_ptr
   drivers/scsi/megaraid.c:3557:29: sparse: sparse: Using plain integer as =
NULL pointer
   drivers/scsi/megaraid.c:3560:29: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char *__pu_addr =
@@     got unsigned char [noderef] [usertype] __user * @@
   drivers/scsi/megaraid.c:3560:29: sparse:     expected unsigned char *__p=
u_addr
   drivers/scsi/megaraid.c:3560:29: sparse:     got unsigned char [noderef]=
 [usertype] __user *
   drivers/scsi/megaraid.c:4497:26: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] __=
iomem *addr @@     got void * @@
   drivers/scsi/megaraid.c:4497:26: sparse:     expected void volatile [nod=
eref] __iomem *addr
   drivers/scsi/megaraid.c:4497:26: sparse:     got void *
   drivers/scsi/megaraid.c:4556:26: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void volatile [noderef] __=
iomem *addr @@     got void * @@
   drivers/scsi/megaraid.c:4556:26: sparse:     expected void volatile [nod=
eref] __iomem *addr
   drivers/scsi/megaraid.c:4556:26: sparse:     got void *
   drivers/scsi/megaraid.c: note: in included file (through arch/csky/inclu=
de/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
--
>> drivers/staging/comedi/comedi_fops.c:1083:29: sparse: sparse: incorrect =
type in initializer (different address spaces) @@     expected unsigned int=
 *__pu_addr @@     got unsigned int [noderef] __user * @@
   drivers/staging/comedi/comedi_fops.c:1083:29: sparse:     expected unsig=
ned int *__pu_addr
   drivers/staging/comedi/comedi_fops.c:1083:29: sparse:     got unsigned i=
nt [noderef] __user *
--
>> drivers/thunderbolt/debugfs.c:64:24: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected void const *addr @@   =
  got void const [noderef] __user *user_buf @@
   drivers/thunderbolt/debugfs.c:64:24: sparse:     expected void const *ad=
dr
   drivers/thunderbolt/debugfs.c:64:24: sparse:     got void const [noderef=
] __user *user_buf
--
   kernel/sys.c:1878:17: sparse: sparse: incorrect type in assignment (diff=
erent address spaces) @@     expected struct file *old_exe @@     got struc=
t file [noderef] __rcu * @@
   kernel/sys.c:1878:17: sparse:     expected struct file *old_exe
   kernel/sys.c:1878:17: sparse:     got struct file [noderef] __rcu *
   kernel/sys.c:1976:24: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected unsigned int *__pu_addr @@     got u=
nsigned int [noderef] __user * @@
   kernel/sys.c:1976:24: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:1976:24: sparse:     got unsigned int [noderef] __user *
>> kernel/sys.c:2243:16: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int [noderef] __user **__pu_addr @@ =
    got int [noderef] __user *[noderef] __user *tid_addr @@
   kernel/sys.c:2243:16: sparse:     expected int [noderef] __user **__pu_a=
ddr
   kernel/sys.c:2243:16: sparse:     got int [noderef] __user *[noderef] __=
user *tid_addr
   kernel/sys.c:710:18: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *ruidp @@
   kernel/sys.c:710:18: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:710:18: sparse:     got unsigned int [noderef] [usertype] _=
_user *ruidp
   kernel/sys.c:712:26: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *euidp @@
   kernel/sys.c:712:26: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:712:26: sparse:     got unsigned int [noderef] [usertype] _=
_user *euidp
   kernel/sys.c:714:32: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *suidp @@
   kernel/sys.c:714:32: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:714:32: sparse:     got unsigned int [noderef] [usertype] _=
_user *suidp
   kernel/sys.c:793:18: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *rgidp @@
   kernel/sys.c:793:18: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:793:18: sparse:     got unsigned int [noderef] [usertype] _=
_user *rgidp
   kernel/sys.c:795:26: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *egidp @@
   kernel/sys.c:795:26: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:795:26: sparse:     got unsigned int [noderef] [usertype] _=
_user *egidp
   kernel/sys.c:797:34: sparse: sparse: incorrect type in initializer (diff=
erent address spaces) @@     expected unsigned int *__pu_addr @@     got un=
signed int [noderef] [usertype] __user *sgidp @@
   kernel/sys.c:797:34: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:797:34: sparse:     got unsigned int [noderef] [usertype] _=
_user *sgidp
   kernel/sys.c:1049:32: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct task_struct *p1 @@     got str=
uct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1049:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1049:32: sparse:     got struct task_struct [noderef] __rcu=
 *real_parent
   kernel/sys.c: note: in included file (through include/linux/rcuwait.h, i=
nclude/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:708:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:708:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:708:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/sys.c:2304:25: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user * @@
   kernel/sys.c:2304:25: sparse:     expected int *__pu_addr
   kernel/sys.c:2304:25: sparse:     got int [noderef] __user *
   kernel/sys.c:2344:46: sparse: sparse: incorrect type in argument 2 (diff=
erent address spaces) @@     expected char const *src @@     got char [node=
ref] __user * @@
   kernel/sys.c:2344:46: sparse:     expected char const *src
   kernel/sys.c:2344:46: sparse:     got char [noderef] __user *
   kernel/sys.c:2440:25: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user * @@
   kernel/sys.c:2440:25: sparse:     expected int *__pu_addr
   kernel/sys.c:2440:25: sparse:     got int [noderef] __user *
   kernel/sys.c:2551:24: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected unsigned int *__pu_addr @@     got u=
nsigned int [noderef] __user *cpup @@
   kernel/sys.c:2551:24: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:2551:24: sparse:     got unsigned int [noderef] __user *cpup
   kernel/sys.c:2553:24: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected unsigned int *__pu_addr @@     got u=
nsigned int [noderef] __user *nodep @@
   kernel/sys.c:2553:24: sparse:     expected unsigned int *__pu_addr
   kernel/sys.c:2553:24: sparse:     got unsigned int [noderef] __user *nod=
ep
--
>> mm/kmemleak.c:1777:36: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected char const *src @@     got char cons=
t [noderef] __user *user_buf @@
   mm/kmemleak.c:1777:36: sparse:     expected char const *src
   mm/kmemleak.c:1777:36: sparse:     got char const [noderef] __user *user=
_buf
   mm/kmemleak.c:1616:13: sparse: sparse: context imbalance in 'kmemleak_se=
q_start' - different lock contexts for basic block
   mm/kmemleak.c: note: in included file (through include/linux/rculist.h, =
include/linux/sched/signal.h):
   include/linux/rcupdate.h:708:9: sparse: sparse: context imbalance in 'km=
emleak_seq_stop' - unexpected unlock
--
>> fs/ecryptfs/miscdev.c:283:13: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected char *__pu_addr @@     got c=
har [noderef] __user *buf @@
   fs/ecryptfs/miscdev.c:283:13: sparse:     expected char *__pu_addr
   fs/ecryptfs/miscdev.c:283:13: sparse:     got char [noderef] __user *buf
>> fs/ecryptfs/miscdev.c:285:13: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __be32 *__pu_addr=
 @@     got restricted __be32 [noderef] [usertype] __user * @@
   fs/ecryptfs/miscdev.c:285:13: sparse:     expected restricted __be32 *__=
pu_addr
   fs/ecryptfs/miscdev.c:285:13: sparse:     got restricted __be32 [noderef=
] [usertype] __user *
--
>> drivers/fsi/fsi-scom.c:497:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
unsigned int const [noderef] __user *__gu_ptr @@
   drivers/fsi/fsi-scom.c:497:13: sparse:     expected void const *addr
   drivers/fsi/fsi-scom.c:497:13: sparse:     got unsigned int const [noder=
ef] __user *__gu_ptr
   drivers/fsi/fsi-scom.c:511:16: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected unsigned int *__pu_addr @@ =
    got unsigned int [noderef] [usertype] __user * @@
   drivers/fsi/fsi-scom.c:511:16: sparse:     expected unsigned int *__pu_a=
ddr
   drivers/fsi/fsi-scom.c:511:16: sparse:     got unsigned int [noderef] [u=
sertype] __user *
--
>> sound/core/timer.c:2044:13: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected void const *addr @@     got int=
 const [noderef] __user *__gu_ptr @@
   sound/core/timer.c:2044:13: sparse:     expected void const *addr
   sound/core/timer.c:2044:13: sparse:     got int const [noderef] __user *=
__gu_ptr
>> sound/core/timer.c:2083:24: sparse: sparse: incorrect type in initialize=
r (different address spaces) @@     expected int *__pu_addr @@     got int =
[noderef] __user *p @@
   sound/core/timer.c:2083:24: sparse:     expected int *__pu_addr
   sound/core/timer.c:2083:24: sparse:     got int [noderef] __user *p
   sound/core/timer.c:790:25: sparse: sparse: context imbalance in 'snd_tim=
er_process_callbacks' - unexpected unlock
--
>> sound/core/pcm.c:92:29: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const *addr @@     got int con=
st [noderef] __user *__gu_ptr @@
   sound/core/pcm.c:92:29: sparse:     expected void const *addr
   sound/core/pcm.c:92:29: sparse:     got int const [noderef] __user *__gu=
_ptr
>> sound/core/pcm.c:97:29: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int *__pu_addr @@     got int [nod=
eref] __user * @@
   sound/core/pcm.c:97:29: sparse:     expected int *__pu_addr
   sound/core/pcm.c:97:29: sparse:     got int [noderef] __user *
>> sound/core/pcm.c:112:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got unsign=
ed int const [noderef] __user *__gu_ptr @@
   sound/core/pcm.c:112:29: sparse:     expected void const *addr
   sound/core/pcm.c:112:29: sparse:     got unsigned int const [noderef] __=
user *__gu_ptr
   sound/core/pcm.c:114:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got int co=
nst [noderef] __user *__gu_ptr @@
   sound/core/pcm.c:114:29: sparse:     expected void const *addr
   sound/core/pcm.c:114:29: sparse:     got int const [noderef] __user *__g=
u_ptr
   sound/core/pcm.c:119:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got unsign=
ed int const [noderef] __user *__gu_ptr @@
   sound/core/pcm.c:119:29: sparse:     expected void const *addr
   sound/core/pcm.c:119:29: sparse:     got unsigned int const [noderef] __=
user *__gu_ptr
   sound/core/pcm.c:155:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got int co=
nst [noderef] __user *__gu_ptr @@
   sound/core/pcm.c:155:29: sparse:     expected void const *addr
   sound/core/pcm.c:155:29: sparse:     got int const [noderef] __user *__g=
u_ptr
--
>> sound/core/pcm_lib.c:2375:13: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user *tlv @@
   sound/core/pcm_lib.c:2375:13: sparse:     expected unsigned int *__pu_ad=
dr
   sound/core/pcm_lib.c:2375:13: sparse:     got unsigned int [noderef] __u=
ser *tlv
>> sound/core/pcm_lib.c:2385:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user *[assigned] dst @@
   sound/core/pcm_lib.c:2385:21: sparse:     expected unsigned int *__pu_ad=
dr
   sound/core/pcm_lib.c:2385:21: sparse:     got unsigned int [noderef] __u=
ser *[assigned] dst
>> sound/core/pcm_lib.c:2386:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
   sound/core/pcm_lib.c:2386:21: sparse:     expected unsigned int *__pu_ad=
dr
   sound/core/pcm_lib.c:2386:21: sparse:     got unsigned int [noderef] __u=
ser *
   sound/core/pcm_lib.c:2396:29: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user *[assigned] dst @@
   sound/core/pcm_lib.c:2396:29: sparse:     expected unsigned int *__pu_ad=
dr
   sound/core/pcm_lib.c:2396:29: sparse:     got unsigned int [noderef] __u=
ser *[assigned] dst
   sound/core/pcm_lib.c:2401:13: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
   sound/core/pcm_lib.c:2401:13: sparse:     expected unsigned int *__pu_ad=
dr
   sound/core/pcm_lib.c:2401:13: sparse:     got unsigned int [noderef] __u=
ser *
--
>> sound/core/pcm_native.c:1015:20: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:1015:20: sparse:     expected void const *addr
   sound/core/pcm_native.c:1015:20: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
   sound/core/pcm_native.c:1041:20: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:1041:20: sparse:     expected void const *addr
   sound/core/pcm_native.c:1041:20: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
   sound/core/pcm_native.c:2951:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:2951:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:2951:13: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
   sound/core/pcm_native.c:3044:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3044:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3044:13: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
   sound/core/pcm_native.c:3045:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3045:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3045:13: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
   sound/core/pcm_native.c:3046:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3046:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3046:13: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
>> sound/core/pcm_native.c:3074:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected restricted snd_pcm_state_=
t *__pu_addr @@     got restricted snd_pcm_state_t [noderef] __user * @@
   sound/core/pcm_native.c:3074:13: sparse:     expected restricted snd_pcm=
_state_t *__pu_addr
   sound/core/pcm_native.c:3074:13: sparse:     got restricted snd_pcm_stat=
e_t [noderef] __user *
>> sound/core/pcm_native.c:3075:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int *__pu_addr @=
@     got unsigned int [noderef] __user * @@
   sound/core/pcm_native.c:3075:13: sparse:     expected unsigned int *__pu=
_addr
   sound/core/pcm_native.c:3075:13: sparse:     got unsigned int [noderef] =
__user *
>> sound/core/pcm_native.c:3076:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed int *__pu_addr @@ =
    got signed int [noderef] __user * @@
   sound/core/pcm_native.c:3076:13: sparse:     expected signed int *__pu_a=
ddr
   sound/core/pcm_native.c:3076:13: sparse:     got signed int [noderef] __=
user *
   sound/core/pcm_native.c:3077:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed int *__pu_addr @@ =
    got signed int [noderef] __user * @@
   sound/core/pcm_native.c:3077:13: sparse:     expected signed int *__pu_a=
ddr
   sound/core/pcm_native.c:3077:13: sparse:     got signed int [noderef] __=
user *
   sound/core/pcm_native.c:3078:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected restricted snd_pcm_state_=
t *__pu_addr @@     got restricted snd_pcm_state_t [noderef] __user * @@
   sound/core/pcm_native.c:3078:13: sparse:     expected restricted snd_pcm=
_state_t *__pu_addr
   sound/core/pcm_native.c:3078:13: sparse:     got restricted snd_pcm_stat=
e_t [noderef] __user *
   sound/core/pcm_native.c:3079:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed int *__pu_addr @@ =
    got signed int [noderef] __user * @@
   sound/core/pcm_native.c:3079:13: sparse:     expected signed int *__pu_a=
ddr
   sound/core/pcm_native.c:3079:13: sparse:     got signed int [noderef] __=
user *
   sound/core/pcm_native.c:3080:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed int *__pu_addr @@ =
    got signed int [noderef] __user * @@
   sound/core/pcm_native.c:3080:13: sparse:     expected signed int *__pu_a=
ddr
   sound/core/pcm_native.c:3080:13: sparse:     got signed int [noderef] __=
user *
   sound/core/pcm_native.c:3081:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int *__pu_addr @=
@     got unsigned int [noderef] __user * @@
   sound/core/pcm_native.c:3081:13: sparse:     expected unsigned int *__pu=
_addr
   sound/core/pcm_native.c:3081:13: sparse:     got unsigned int [noderef] =
__user *
   sound/core/pcm_native.c:3082:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int *__pu_addr @=
@     got unsigned int [noderef] __user * @@
   sound/core/pcm_native.c:3082:13: sparse:     expected unsigned int *__pu=
_addr
   sound/core/pcm_native.c:3082:13: sparse:     got unsigned int [noderef] =
__user *
>> sound/core/pcm_native.c:3094:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3094:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3094:13: sparse:     got int const [noderef] __u=
ser *__gu_ptr
>> sound/core/pcm_native.c:3111:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed long *__pu_addr @@=
     got signed long [noderef] __user * @@
   sound/core/pcm_native.c:3111:13: sparse:     expected signed long *__pu_=
addr
   sound/core/pcm_native.c:3111:13: sparse:     got signed long [noderef] _=
_user *
   sound/core/pcm_native.c:3119:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed long *__pu_addr @@=
     got signed long [noderef] __user * @@
   sound/core/pcm_native.c:3119:13: sparse:     expected signed long *__pu_=
addr
   sound/core/pcm_native.c:3119:13: sparse:     got signed long [noderef] _=
_user *
   sound/core/pcm_native.c:3136:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed long *__pu_addr @@=
     got signed long [noderef] __user * @@
   sound/core/pcm_native.c:3136:13: sparse:     expected signed long *__pu_=
addr
   sound/core/pcm_native.c:3136:13: sparse:     got signed long [noderef] _=
_user *
   sound/core/pcm_native.c:3149:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed long *__pu_addr @@=
     got signed long [noderef] __user * @@
   sound/core/pcm_native.c:3149:13: sparse:     expected signed long *__pu_=
addr
   sound/core/pcm_native.c:3149:13: sparse:     got signed long [noderef] _=
_user *
>> sound/core/pcm_native.c:3160:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned long const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3160:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3160:13: sparse:     got unsigned long const [no=
deref] __user *__gu_ptr
>> sound/core/pcm_native.c:3162:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned long *__pu_addr =
@@     got unsigned long [noderef] [usertype] __user *_frames @@
   sound/core/pcm_native.c:3162:13: sparse:     expected unsigned long *__p=
u_addr
   sound/core/pcm_native.c:3162:13: sparse:     got unsigned long [noderef]=
 [usertype] __user *_frames
   sound/core/pcm_native.c:3165:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned long *__pu_addr =
@@     got unsigned long [noderef] [usertype] __user *_frames @@
   sound/core/pcm_native.c:3165:13: sparse:     expected unsigned long *__p=
u_addr
   sound/core/pcm_native.c:3165:13: sparse:     got unsigned long [noderef]=
 [usertype] __user *_frames
   sound/core/pcm_native.c:3176:13: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned long const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3176:13: sparse:     expected void const *addr
   sound/core/pcm_native.c:3176:13: sparse:     got unsigned long const [no=
deref] __user *__gu_ptr
   sound/core/pcm_native.c:3178:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned long *__pu_addr =
@@     got unsigned long [noderef] [usertype] __user *_frames @@
   sound/core/pcm_native.c:3178:13: sparse:     expected unsigned long *__p=
u_addr
   sound/core/pcm_native.c:3178:13: sparse:     got unsigned long [noderef]=
 [usertype] __user *_frames
   sound/core/pcm_native.c:3181:13: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned long *__pu_addr =
@@     got unsigned long [noderef] [usertype] __user *_frames @@
   sound/core/pcm_native.c:3181:13: sparse:     expected unsigned long *__p=
u_addr
   sound/core/pcm_native.c:3181:13: sparse:     got unsigned long [noderef]=
 [usertype] __user *_frames
>> sound/core/pcm_native.c:3202:24: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected int *__pu_addr @@     got=
 int [noderef] __user * @@
   sound/core/pcm_native.c:3202:24: sparse:     expected int *__pu_addr
   sound/core/pcm_native.c:3202:24: sparse:     got int [noderef] __user *
   sound/core/pcm_native.c:3210:21: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void const *addr @@     go=
t unsigned int const [noderef] __user *__gu_ptr @@
   sound/core/pcm_native.c:3210:21: sparse:     expected void const *addr
   sound/core/pcm_native.c:3210:21: sparse:     got unsigned int const [nod=
eref] __user *__gu_ptr
>> sound/core/pcm_native.c:3257:21: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected signed long *__pu_addr @@=
     got signed long [noderef] [usertype] __user *res @@
   sound/core/pcm_native.c:3257:21: sparse:     expected signed long *__pu_=
addr
   sound/core/pcm_native.c:3257:21: sparse:     got signed long [noderef] [=
usertype] __user *res
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_=
pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_=
pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_=
pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_=
pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd=
_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_sn=
d_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:188:39: sparse: sparse: context imbalance in 'sn=
d_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1191:52: sparse: sparse: context imbalance in 's=
nd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1262:37: sparse: sparse: context imbalance in 's=
nd_pcm_stream_group_ref' - different lock contexts for basic block
--
>> sound/core/rawmidi.c:664:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got un=
signed int const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:664:13: sparse:     expected void const *addr
   sound/core/rawmidi.c:664:13: sparse:     got unsigned int const [noderef=
] __user *__gu_ptr
>> sound/core/rawmidi.c:666:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:666:13: sparse:     expected void const *addr
   sound/core/rawmidi.c:666:13: sparse:     got int const [noderef] __user =
*__gu_ptr
   sound/core/rawmidi.c:668:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got un=
signed int const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:668:13: sparse:     expected void const *addr
   sound/core/rawmidi.c:668:13: sparse:     got unsigned int const [noderef=
] __user *__gu_ptr
>> sound/core/rawmidi.c:840:24: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int *__pu_addr @@     got int=
 [noderef] __user * @@
   sound/core/rawmidi.c:840:24: sparse:     expected int *__pu_addr
   sound/core/rawmidi.c:840:24: sparse:     got int [noderef] __user *
   sound/core/rawmidi.c:846:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:846:21: sparse:     expected void const *addr
   sound/core/rawmidi.c:846:21: sparse:     got int const [noderef] __user =
*__gu_ptr
   sound/core/rawmidi.c:884:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:884:21: sparse:     expected void const *addr
   sound/core/rawmidi.c:884:21: sparse:     got int const [noderef] __user =
*__gu_ptr
   sound/core/rawmidi.c:899:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:899:21: sparse:     expected void const *addr
   sound/core/rawmidi.c:899:21: sparse:     got int const [noderef] __user =
*__gu_ptr
   sound/core/rawmidi.c:933:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:933:21: sparse:     expected void const *addr
   sound/core/rawmidi.c:933:21: sparse:     got int const [noderef] __user =
*__gu_ptr
   sound/core/rawmidi.c:947:21: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int *__pu_addr @@     got int=
 [noderef] __user * @@
   sound/core/rawmidi.c:947:21: sparse:     expected int *__pu_addr
   sound/core/rawmidi.c:947:21: sparse:     got int [noderef] __user *
   sound/core/rawmidi.c:955:21: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   sound/core/rawmidi.c:955:21: sparse:     expected void const *addr
   sound/core/rawmidi.c:955:21: sparse:     got int const [noderef] __user =
*__gu_ptr
--
   sound/core/control.c:788:17: sparse: sparse: restricted snd_ctl_elem_typ=
e_t degrades to integer
   sound/core/control.c:788:26: sparse: sparse: restricted snd_ctl_elem_typ=
e_t degrades to integer
   sound/core/control.c:789:17: sparse: sparse: restricted snd_ctl_elem_typ=
e_t degrades to integer
   sound/core/control.c:789:26: sparse: sparse: restricted snd_ctl_elem_typ=
e_t degrades to integer
   sound/core/control.c:808:48: sparse: sparse: restricted snd_ctl_elem_typ=
e_t degrades to integer
   sound/core/control.c:1474:40: sparse: sparse: restricted snd_ctl_elem_ty=
pe_t degrades to integer
>> sound/core/control.c:1577:13: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const *addr @@     got i=
nt const [noderef] __user *__gu_ptr @@
   sound/core/control.c:1577:13: sparse:     expected void const *addr
   sound/core/control.c:1577:13: sparse:     got int const [noderef] __user=
 *__gu_ptr
>> sound/core/control.c:1581:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected int *__pu_addr @@     got in=
t [noderef] __user *ptr @@
   sound/core/control.c:1581:21: sparse:     expected int *__pu_addr
   sound/core/control.c:1581:21: sparse:     got int [noderef] __user *ptr
>> sound/core/control.c:1714:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected int *__pu_addr @@     got in=
t [noderef] __user *ip @@
   sound/core/control.c:1714:24: sparse:     expected int *__pu_addr
   sound/core/control.c:1714:24: sparse:     got int [noderef] __user *ip
   sound/core/control.c:1758:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected int *__pu_addr @@     got in=
t [noderef] __user *ip @@
   sound/core/control.c:1758:24: sparse:     expected int *__pu_addr
   sound/core/control.c:1758:24: sparse:     got int [noderef] __user *ip
--
>> sound/core/oss/mixer_oss.c:312:29: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const *addr @@     =
got int const [noderef] __user *__gu_ptr @@
   sound/core/oss/mixer_oss.c:312:29: sparse:     expected void const *addr
   sound/core/oss/mixer_oss.c:312:29: sparse:     got int const [noderef] _=
_user *__gu_ptr
>> sound/core/oss/mixer_oss.c:317:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:317:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:317:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:319:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:319:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:319:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:321:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:321:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:321:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:326:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:326:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:326:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:331:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:331:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:331:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:336:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:336:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:336:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:341:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:341:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:341:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:346:32: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:346:32: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:346:32: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:350:21: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const *addr @@     =
got int const [noderef] __user *__gu_ptr @@
   sound/core/oss/mixer_oss.c:350:21: sparse:     expected void const *addr
   sound/core/oss/mixer_oss.c:350:21: sparse:     got int const [noderef] _=
_user *__gu_ptr
   sound/core/oss/mixer_oss.c:355:24: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:355:24: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:355:24: sparse:     got int [noderef] __user =
*p
   sound/core/oss/mixer_oss.c:360:24: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *p @@
   sound/core/oss/mixer_oss.c:360:24: sparse:     expected int *__pu_addr
   sound/core/oss/mixer_oss.c:360:24: sparse:     got int [noderef] __user =
*p
--
>> sound/core/oss/pcm_oss.c:2574:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2574:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2574:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2576:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2576:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2576:24: sparse:     got int [noderef] __user *p
>> sound/core/oss/pcm_oss.c:2602:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2602:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2602:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2606:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2606:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2606:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2611:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2611:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2611:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2613:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2613:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2613:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2618:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2618:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2618:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2623:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2623:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2623:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2625:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2625:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2625:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2630:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2630:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2630:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2635:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2635:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2635:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2637:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2637:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2637:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2642:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2642:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2642:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2647:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2647:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2647:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2654:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2654:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2654:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2659:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2659:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2659:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2661:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2661:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2661:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2668:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2668:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2668:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2681:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2681:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2681:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2686:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2686:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2686:24: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2688:21: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const *addr @@     g=
ot int const [noderef] __user *__gu_ptr @@
   sound/core/oss/pcm_oss.c:2688:21: sparse:     expected void const *addr
   sound/core/oss/pcm_oss.c:2688:21: sparse:     got int const [noderef] __=
user *__gu_ptr
   sound/core/oss/pcm_oss.c:2714:25: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2714:25: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2714:25: sparse:     got int [noderef] __user *p
   sound/core/oss/pcm_oss.c:2717:24: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected int *__pu_addr @@     go=
t int [noderef] __user *p @@
   sound/core/oss/pcm_oss.c:2717:24: sparse:     expected int *__pu_addr
   sound/core/oss/pcm_oss.c:2717:24: sparse:     got int [noderef] __user *p
--
>> drivers/mtd/mtdchar.c:417:13: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] [usertype] __user *retp @@
   drivers/mtd/mtdchar.c:417:13: sparse:     expected unsigned int *__pu_ad=
dr
   drivers/mtd/mtdchar.c:417:13: sparse:     got unsigned int [noderef] [us=
ertype] __user *retp
>> drivers/mtd/mtdchar.c:697:21: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const *addr @@     got u=
nsigned int const [noderef] __user *__gu_ptr @@
   drivers/mtd/mtdchar.c:697:21: sparse:     expected void const *addr
   drivers/mtd/mtdchar.c:697:21: sparse:     got unsigned int const [nodere=
f] __user *__gu_ptr
>> drivers/mtd/mtdchar.c:705:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
   drivers/mtd/mtdchar.c:705:21: sparse:     expected unsigned int *__pu_ad=
dr
   drivers/mtd/mtdchar.c:705:21: sparse:     got unsigned int [noderef] __u=
ser *
   drivers/mtd/mtdchar.c:706:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
   drivers/mtd/mtdchar.c:706:24: sparse:     expected unsigned int *__pu_ad=
dr
   drivers/mtd/mtdchar.c:706:24: sparse:     got unsigned int [noderef] __u=
ser *
   drivers/mtd/mtdchar.c:707:24: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] __user * @@
   drivers/mtd/mtdchar.c:707:24: sparse:     expected unsigned int *__pu_ad=
dr
   drivers/mtd/mtdchar.c:707:24: sparse:     got unsigned int [noderef] __u=
ser *
--
>> sound/core/seq/seq_clientmgr.c:412:24: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@     expected void const *addr @@ =
    got char [noderef] __user *buf @@
   sound/core/seq/seq_clientmgr.c:412:24: sparse:     expected void const *=
addr
   sound/core/seq/seq_clientmgr.c:412:24: sparse:     got char [noderef] __=
user *buf
   sound/core/seq/seq_clientmgr.c:708:9: sparse: sparse: context imbalance =
in 'deliver_to_subscribers' - different lock contexts for basic block
--
   fs/f2fs/file.c:48:54: sparse: sparse: cast from restricted vm_fault_t
   fs/f2fs/file.c:1972:16: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int *__pu_addr @@     got int [nod=
eref] __user * @@
   fs/f2fs/file.c:1972:16: sparse:     expected int *__pu_addr
   fs/f2fs/file.c:1972:16: sparse:     got int [noderef] __user *
>> fs/f2fs/file.c:1986:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const *addr @@     got int con=
st [noderef] __user *__gu_ptr @@
   fs/f2fs/file.c:1986:13: sparse:     expected void const *addr
   fs/f2fs/file.c:1986:13: sparse:     got int const [noderef] __user *__gu=
_ptr
   fs/f2fs/file.c:2020:16: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected int *__pu_addr @@     got int [nod=
eref] __user * @@
   fs/f2fs/file.c:2020:16: sparse:     expected int *__pu_addr
   fs/f2fs/file.c:2020:16: sparse:     got int [noderef] __user *
>> fs/f2fs/file.c:2240:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const *addr @@     got unsigne=
d int const [noderef] __user *__gu_ptr @@
   fs/f2fs/file.c:2240:13: sparse:     expected void const *addr
   fs/f2fs/file.c:2240:13: sparse:     got unsigned int const [noderef] __u=
ser *__gu_ptr
   fs/f2fs/file.c:2473:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const *addr @@     got unsigne=
d int const [noderef] __user *__gu_ptr @@
   fs/f2fs/file.c:2473:13: sparse:     expected void const *addr
   fs/f2fs/file.c:2473:13: sparse:     got unsigned int const [noderef] __u=
ser *__gu_ptr
   fs/f2fs/file.c:3001:16: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int *__pu_addr @@     got=
 unsigned int [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3001:16: sparse:     expected unsigned int *__pu_addr
   fs/f2fs/file.c:3001:16: sparse:     got unsigned int [noderef] [usertype=
] __user *
   fs/f2fs/file.c:3239:13: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected void const *addr @@     got unsigne=
d int const [noderef] __user *__gu_ptr @@
   fs/f2fs/file.c:3239:13: sparse:     expected void const *addr
   fs/f2fs/file.c:3239:13: sparse:     got unsigned int const [noderef] __u=
ser *__gu_ptr
   fs/f2fs/file.c:3296:16: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned int *__pu_addr @@     got=
 unsigned int [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3296:16: sparse:     expected unsigned int *__pu_addr
   fs/f2fs/file.c:3296:16: sparse:     got unsigned int [noderef] [usertype=
] __user *
   fs/f2fs/file.c:3400:36: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected unsigned short const [usertype] *pwcs @=
@     got restricted __le16 * @@
   fs/f2fs/file.c:3400:36: sparse:     expected unsigned short const [usert=
ype] *pwcs
   fs/f2fs/file.c:3400:36: sparse:     got restricted __le16 *
   fs/f2fs/file.c:3436:28: sparse: sparse: incorrect type in argument 4 (di=
fferent base types) @@     expected unsigned short [usertype] *pwcs @@     =
got restricted __le16 * @@
   fs/f2fs/file.c:3436:28: sparse:     expected unsigned short [usertype] *=
pwcs
   fs/f2fs/file.c:3436:28: sparse:     got restricted __le16 *
   fs/f2fs/file.c:3461:16: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned long long *__pu_addr @@  =
   got unsigned long long [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3461:16: sparse:     expected unsigned long long *__pu_ad=
dr
   fs/f2fs/file.c:3461:16: sparse:     got unsigned long long [noderef] [us=
ertype] __user *
   fs/f2fs/file.c:3612:23: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned long long *__pu_addr @@  =
   got unsigned long long [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3612:23: sparse:     expected unsigned long long *__pu_ad=
dr
   fs/f2fs/file.c:3612:23: sparse:     got unsigned long long [noderef] [us=
ertype] __user *
   fs/f2fs/file.c:3772:23: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected unsigned long long *__pu_addr @@  =
   got unsigned long long [noderef] [usertype] __user * @@
   fs/f2fs/file.c:3772:23: sparse:     expected unsigned long long *__pu_ad=
dr
   fs/f2fs/file.c:3772:23: sparse:     got unsigned long long [noderef] [us=
ertype] __user *
--
   fs/jfs/ioctl.c:70:24: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user * @@
   fs/jfs/ioctl.c:70:24: sparse:     expected int *__pu_addr
   fs/jfs/ioctl.c:70:24: sparse:     got int [noderef] __user *
>> fs/jfs/ioctl.c:83:21: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const *addr @@     got int const=
 [noderef] __user *__gu_ptr @@
   fs/jfs/ioctl.c:83:21: sparse:     expected void const *addr
   fs/jfs/ioctl.c:83:21: sparse:     got int const [noderef] __user *__gu_p=
tr
--
>> net/can/isotp.c:1260:13: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected void const *addr @@     got int co=
nst [noderef] __user *__gu_ptr @@
   net/can/isotp.c:1260:13: sparse:     expected void const *addr
   net/can/isotp.c:1260:13: sparse:     got int const [noderef] __user *__g=
u_ptr
>> net/can/isotp.c:1295:13: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected int *__pu_addr @@     got int [no=
deref] __user *optlen @@
   net/can/isotp.c:1295:13: sparse:     expected int *__pu_addr
   net/can/isotp.c:1295:13: sparse:     got int [noderef] __user *optlen
--
>> net/can/raw.c:657:13: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const *addr @@     got int const=
 [noderef] __user *__gu_ptr @@
   net/can/raw.c:657:13: sparse:     expected void const *addr
   net/can/raw.c:657:13: sparse:     got int const [noderef] __user *__gu_p=
tr
   net/can/raw.c:672:37: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user *optlen @@
   net/can/raw.c:672:37: sparse:     expected int *__pu_addr
   net/can/raw.c:672:37: sparse:     got int [noderef] __user *optlen
   net/can/raw.c:686:31: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user *optlen @@
   net/can/raw.c:686:31: sparse:     expected int *__pu_addr
   net/can/raw.c:686:31: sparse:     got int [noderef] __user *optlen
   net/can/raw.c:723:13: sparse: sparse: incorrect type in initializer (dif=
ferent address spaces) @@     expected int *__pu_addr @@     got int [noder=
ef] __user *optlen @@
   net/can/raw.c:723:13: sparse:     expected int *__pu_addr
   net/can/raw.c:723:13: sparse:     got int [noderef] __user *optlen
--
>> drivers/tty/moxa.c:332:23: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned long *__pu_addr @@    =
 got unsigned long [noderef] __user * @@
   drivers/tty/moxa.c:332:23: sparse:     expected unsigned long *__pu_addr
   drivers/tty/moxa.c:332:23: sparse:     got unsigned long [noderef] __use=
r *
   drivers/tty/moxa.c:336:23: sparse: sparse: incorrect type in initializer=
 (different address spaces) @@     expected unsigned long *__pu_addr @@    =
 got unsigned long [noderef] __user * @@
   drivers/tty/moxa.c:336:23: sparse:     expected unsigned long *__pu_addr
   drivers/tty/moxa.c:336:23: sparse:     got unsigned long [noderef] __use=
r *
   drivers/tty/moxa.c: note: in included file (through arch/csky/include/as=
m/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
--
>> drivers/tty/synclink_gt.c:2620:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *idle_mode @@
   drivers/tty/synclink_gt.c:2620:13: sparse:     expected int *__pu_addr
   drivers/tty/synclink_gt.c:2620:13: sparse:     got int [noderef] __user =
*idle_mode
>> drivers/tty/synclink_gt.c:2727:13: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const *addr @@     =
got int const [noderef] __user *__gu_ptr @@
   drivers/tty/synclink_gt.c:2727:13: sparse:     expected void const *addr
   drivers/tty/synclink_gt.c:2727:13: sparse:     got int const [noderef] _=
_user *__gu_ptr
>> drivers/tty/synclink_gt.c:2826:22: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *mask_ptr @@
   drivers/tty/synclink_gt.c:2826:22: sparse:     expected int *__pu_addr
   drivers/tty/synclink_gt.c:2826:22: sparse:     got int [noderef] __user =
*mask_ptr
>> drivers/tty/synclink_gt.c:2833:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *if_mode @@
   drivers/tty/synclink_gt.c:2833:13: sparse:     expected int *__pu_addr
   drivers/tty/synclink_gt.c:2833:13: sparse:     got int [noderef] __user =
*if_mode
>> drivers/tty/synclink_gt.c:2864:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *xsync @@
   drivers/tty/synclink_gt.c:2864:13: sparse:     expected int *__pu_addr
   drivers/tty/synclink_gt.c:2864:13: sparse:     got int [noderef] __user =
*xsync
>> drivers/tty/synclink_gt.c:2890:13: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected int *__pu_addr @@     g=
ot int [noderef] __user *xctrl @@
   drivers/tty/synclink_gt.c:2890:13: sparse:     expected int *__pu_addr
   drivers/tty/synclink_gt.c:2890:13: sparse:     got int [noderef] __user =
*xctrl
   drivers/tty/synclink_gt.c: note: in included file (through arch/csky/inc=
lude/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:259:16: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:291:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned short [usertype] valu=
e @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:291:22: sparse:     expected unsigned short [us=
ertype] value
   include/asm-generic/io.h:291:22: sparse:     got restricted __le16 [user=
type]
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:299:22: sparse:     got restricted __le32 [user=
type]
--
>> net/l2tp/l2tp_ppp.c:1075:21: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int *__pu_addr @@     got int=
 [noderef] __user * @@
   net/l2tp/l2tp_ppp.c:1075:21: sparse:     expected int *__pu_addr
   net/l2tp/l2tp_ppp.c:1075:21: sparse:     got int [noderef] __user *
>> net/l2tp/l2tp_ppp.c:1092:33: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t [noderef] __user * @@
   net/l2tp/l2tp_ppp.c:1092:33: sparse:     expected void const *addr
   net/l2tp/l2tp_ppp.c:1092:33: sparse:     got int [noderef] __user *
>> net/l2tp/l2tp_ppp.c:1348:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got in=
t const [noderef] __user *__gu_ptr @@
   net/l2tp/l2tp_ppp.c:1348:13: sparse:     expected void const *addr
   net/l2tp/l2tp_ppp.c:1348:13: sparse:     got int const [noderef] __user =
*__gu_ptr
>> net/l2tp/l2tp_ppp.c:1379:13: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected int *__pu_addr @@     got int=
 [noderef] __user *optlen @@
   net/l2tp/l2tp_ppp.c:1379:13: sparse:     expected int *__pu_addr
   net/l2tp/l2tp_ppp.c:1379:13: sparse:     got int [noderef] __user *optlen
--
>> drivers/vhost/scsi.c:1906:21: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const *addr @@     got u=
nsigned int const [noderef] __user *__gu_ptr @@
   drivers/vhost/scsi.c:1906:21: sparse:     expected void const *addr
   drivers/vhost/scsi.c:1906:21: sparse:     got unsigned int const [nodere=
f] __user *__gu_ptr
>> drivers/vhost/scsi.c:1916:21: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected unsigned int *__pu_addr @@  =
   got unsigned int [noderef] [usertype] __user *eventsp @@
   drivers/vhost/scsi.c:1916:21: sparse:     expected unsigned int *__pu_ad=
dr
   drivers/vhost/scsi.c:1916:21: sparse:     got unsigned int [noderef] [us=
ertype] __user *eventsp
   drivers/vhost/scsi.c: note: in included file (through include/linux/sche=
d/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:148:33: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *to @@     got void [n=
oderef] __user *to @@
   include/linux/uaccess.h:148:33: sparse:     expected void *to
   include/linux/uaccess.h:148:33: sparse:     got void [noderef] __user *to
   include/linux/uaccess.h:148:33: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *to @@     got void [n=
oderef] __user *to @@
   include/linux/uaccess.h:148:33: sparse:     expected void *to
   include/linux/uaccess.h:148:33: sparse:     got void [noderef] __user *to
--
>> drivers/vhost/vdpa.c:364:13: sparse: sparse: incorrect type in argument =
1 (different address spaces) @@     expected void const *addr @@     got un=
signed int const [noderef] __user *__gu_ptr @@
   drivers/vhost/vdpa.c:364:13: sparse:     expected void const *addr
   drivers/vhost/vdpa.c:364:13: sparse:     got unsigned int const [noderef=
] __user *__gu_ptr
--
>> drivers/vhost/vhost.c:734:35: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const *addr @@     got v=
oid [noderef] __user * @@
   drivers/vhost/vhost.c:734:35: sparse:     expected void const *addr
   drivers/vhost/vhost.c:734:35: sparse:     got void [noderef] __user *
   drivers/vhost/vhost.c:760:33: sparse: sparse: incorrect type in argument=
 1 (different address spaces) @@     expected void const *addr @@     got v=
oid [noderef] __user * @@
   drivers/vhost/vhost.c:760:33: sparse:     expected void const *addr
   drivers/vhost/vhost.c:760:33: sparse:     got void [noderef] __user *
   drivers/vhost/vhost.c:1079:25: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
void [noderef] __user * @@
   drivers/vhost/vhost.c:1079:25: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1079:25: sparse:     got void [noderef] __user *
   drivers/vhost/vhost.c:1082:25: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
void [noderef] __user * @@
   drivers/vhost/vhost.c:1082:25: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1082:25: sparse:     got void [noderef] __user *
>> drivers/vhost/vhost.c:1303:26: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
struct vring_desc [noderef] [usertype] __user *desc @@
   drivers/vhost/vhost.c:1303:26: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1303:26: sparse:     got struct vring_desc [nodere=
f] [usertype] __user *desc
>> drivers/vhost/vhost.c:1304:26: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
struct vring_avail [noderef] [usertype] __user *avail @@
   drivers/vhost/vhost.c:1304:26: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1304:26: sparse:     got struct vring_avail [noder=
ef] [usertype] __user *avail
>> drivers/vhost/vhost.c:1305:26: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
struct vring_used [noderef] [usertype] __user *used @@
   drivers/vhost/vhost.c:1305:26: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1305:26: sparse:     got struct vring_used [nodere=
f] [usertype] __user *used
>> drivers/vhost/vhost.c:1589:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
unsigned int const [noderef] __user *__gu_ptr @@
   drivers/vhost/vhost.c:1589:13: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1589:13: sparse:     got unsigned int const [noder=
ef] __user *__gu_ptr
>> drivers/vhost/vhost.c:1787:21: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
int const [noderef] __user *__gu_ptr @@
   drivers/vhost/vhost.c:1787:21: sparse:     expected void const *addr
   drivers/vhost/vhost.c:1787:21: sparse:     got int const [noderef] __use=
r *__gu_ptr
>> drivers/vhost/vhost.c:2012:27: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const *addr @@     got =
restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:2012:27: sparse:     expected void const *addr
   drivers/vhost/vhost.c:2012:27: sparse:     got restricted __virtio16 [no=
deref] __user *
   drivers/vhost/vhost.c: note: in included file (through include/linux/sch=
ed/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:148:33: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *to @@     got void [n=
oderef] __user *to @@
   include/linux/uaccess.h:148:33: sparse:     expected void *to
   include/linux/uaccess.h:148:33: sparse:     got void [noderef] __user *to
   include/linux/uaccess.h:148:33: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@     expected void *to @@     got void [n=
oderef] __user *to @@
   include/linux/uaccess.h:148:33: sparse:     expected void *to
   include/linux/uaccess.h:148:33: sparse:     got void [noderef] __user *to
   include/linux/uaccess.h:114:39: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void const *from @@     got=
 void const [noderef] __user *from @@
   include/linux/uaccess.h:114:39: sparse:     expected void const *from
   include/linux/uaccess.h:114:39: sparse:     got void const [noderef] __u=
ser *from
   include/linux/uaccess.h:114:39: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@     expected void const *from @@     got=
 void const [noderef] __user *from @@
   include/linux/uaccess.h:114:39: sparse:     expected void const *from
   include/linux/uaccess.h:114:39: sparse:     got void const [noderef] __u=
ser *from
>> drivers/vhost/vhost.c:963:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:963:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:963:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
>> drivers/vhost/vhost.c:963:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] __user *to @@
   drivers/vhost/vhost.c:963:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:963:16: sparse:     got restricted __virtio16 [nod=
eref] __user *to
>> drivers/vhost/vhost.c:948:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] [usertype] __user * @@
   drivers/vhost/vhost.c:948:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:948:16: sparse:     got restricted __virtio16 [nod=
eref] [usertype] __user *
>> drivers/vhost/vhost.c:948:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] [usertype] __user *to @@
   drivers/vhost/vhost.c:948:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:948:16: sparse:     got restricted __virtio16 [nod=
eref] [usertype] __user *to
   drivers/vhost/vhost.c:970:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:970:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:970:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:970:16: sparse: sparse: incorrect type in initiali=
zer (different address spaces) @@     expected restricted __virtio16 *__pu_=
addr @@     got restricted __virtio16 [noderef] __user *to @@
   drivers/vhost/vhost.c:970:16: sparse:     expected restricted __virtio16=
 *__pu_addr
   drivers/vhost/vhost.c:970:16: sparse:     got restricted __virtio16 [nod=
eref] __user *to

vim +14 arch/csky/mm/tcm.c

f525bb2c9e7cf1 Guo Ren 2019-11-27   7  =

f525bb2c9e7cf1 Guo Ren 2019-11-27   8  #if (CONFIG_ITCM_RAM_BASE =3D=3D 0xf=
fffffff)
f525bb2c9e7cf1 Guo Ren 2019-11-27  @9  #error "You should define ITCM_RAM_B=
ASE"
f525bb2c9e7cf1 Guo Ren 2019-11-27  10  #endif
f525bb2c9e7cf1 Guo Ren 2019-11-27  11  =

f525bb2c9e7cf1 Guo Ren 2019-11-27  12  #ifdef CONFIG_HAVE_DTCM
f525bb2c9e7cf1 Guo Ren 2019-11-27  13  #if (CONFIG_DTCM_RAM_BASE =3D=3D 0xf=
fffffff)
f525bb2c9e7cf1 Guo Ren 2019-11-27 @14  #error "You should define DTCM_RAM_B=
ASE"
f525bb2c9e7cf1 Guo Ren 2019-11-27  15  #endif
f525bb2c9e7cf1 Guo Ren 2019-11-27  16  =

f525bb2c9e7cf1 Guo Ren 2019-11-27  17  #if (CONFIG_DTCM_RAM_BASE =3D=3D CON=
FIG_ITCM_RAM_BASE)
f525bb2c9e7cf1 Guo Ren 2019-11-27 @18  #error "You should define correct DT=
CM_RAM_BASE"
f525bb2c9e7cf1 Guo Ren 2019-11-27  19  #endif
f525bb2c9e7cf1 Guo Ren 2019-11-27  20  #endif
f525bb2c9e7cf1 Guo Ren 2019-11-27  21  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5396201924578045667==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5396201924578045667==--


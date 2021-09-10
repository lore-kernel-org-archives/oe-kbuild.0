Content-Type: multipart/mixed; boundary="===============7636660430505047036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Fri, 10 Sep 2021 13:01:19 +0800
Message-ID: <202109101309.oL7M2jLW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7636660430505047036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bf9f243f23e6623f310ba03fbb14e10ec3a61290
commit: 68f35add4ba4c850a33878633e10c02d7ba32d84 dmaengine: ppc4xx: make pp=
c440spe_adma_chan_list static
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-s032-20210910 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D68f35add4ba4c850a33878633e10c02d7ba32d84
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 68f35add4ba4c850a33878633e10c02d7ba32d84
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/dma/ppc4xx/adma.c:1159:38: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1159:38: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:911:25: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct dma_regs *dma_reg =
@@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     expected struct dma_regs *=
dma_reg
   drivers/dma/ppc4xx/adma.c:911:25: sparse:     got struct dma_regs [noder=
ef] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:912:40: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:912:40: sparse:     expected void const [noder=
ef] __iomem *
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
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:974:32: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:979:40: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:979:40: sparse:     expected void [noderef] __=
iomem *
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
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:985:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:986:34: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:986:34: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:993:55: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:993:55: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:995:51: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:995:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:997:51: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void const [noderef] __io=
mem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     expected void const [noder=
ef] __iomem *
   drivers/dma/ppc4xx/adma.c:997:51: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:999:46: sparse: sparse: incorrect type in argu=
ment 2 (different address spaces) @@     expected void [noderef] __iomem * =
@@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     expected void [noderef] __=
iomem *
   drivers/dma/ppc4xx/adma.c:999:46: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1008:35: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1027:25: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected struct dma_regs *dma_reg=
 @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1027:25: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1031:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1031:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1031:60: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1032:31: sparse:     got unsigned short *
   drivers/dma/ppc4xx/adma.c:1032:60: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned short * @@
   drivers/dma/ppc4xx/adma.c:1032:60: sparse:     expected void const [node=
ref] __iomem *
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
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1039:37: sparse:     expected void const [node=
ref] __iomem *
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
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1055:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1062:41: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1064:39: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1065:25: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse: sparse: incorrect type in arg=
ument 1 (different address spaces) @@     expected void const [noderef] __i=
omem * @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     expected void const [node=
ref] __iomem *
   drivers/dma/ppc4xx/adma.c:1066:33: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1067:22: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:1080:48: sparse: sparse: incorrect type in ini=
tializer (different address spaces) @@     expected struct dma_regs *dma_re=
g @@     got struct dma_regs [noderef] __iomem *dma_reg @@
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     expected struct dma_regs =
*dma_reg
   drivers/dma/ppc4xx/adma.c:1080:48: sparse:     got struct dma_regs [node=
ref] __iomem *dma_reg
   drivers/dma/ppc4xx/adma.c:1090:26: sparse: sparse: incorrect type in arg=
ument 2 (different address spaces) @@     expected void [noderef] __iomem *=
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1090:26: sparse:     expected void [noderef] _=
_iomem *
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
 @@     got unsigned int * @@
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     expected void [noderef] _=
_iomem *
   drivers/dma/ppc4xx/adma.c:1214:30: sparse:     got unsigned int *
   drivers/dma/ppc4xx/adma.c:2777:62: sparse: sparse: Using plain integer a=
s NULL pointer
>> drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void *regs @@     got vo=
id [noderef] __iomem * @@
   drivers/dma/ppc4xx/adma.c:4094:14: sparse:     expected void *regs
   drivers/dma/ppc4xx/adma.c:4094:14: sparse:     got void [noderef] __iome=
m *
   drivers/dma/ppc4xx/adma.c:4102:31: sparse: sparse: too many warnings

vim +4094 drivers/dma/ppc4xx/adma.c

12458ea06efd7b Anatolij Gustschin       2009-12-11  4003  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4004  /**
12458ea06efd7b Anatolij Gustschin       2009-12-11  4005   * ppc440spe_adma=
_probe - probe the asynch device
12458ea06efd7b Anatolij Gustschin       2009-12-11  4006   */
463a1f8b3ceebe Bill Pemberton           2012-11-19  4007  static int ppc440=
spe_adma_probe(struct platform_device *ofdev)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4008  {
05c02542c20aa0 Anatolij Gustschin       2010-06-03  4009  	struct device_no=
de *np =3D ofdev->dev.of_node;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4010  	struct resource =
res;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4011  	struct ppc440spe=
_adma_device *adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4012  	struct ppc440spe=
_adma_chan *chan;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4013  	struct ppc_dma_c=
han_ref *ref, *_ref;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4014  	int ret =3D 0, i=
nitcode =3D PPC_ADMA_INIT_OK;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4015  	const u32 *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4016  	int len;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4017  	void *regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4018  	u32 id, pool_siz=
e;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4019  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4020  	if (of_device_is=
_compatible(np, "amcc,xor-accelerator")) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4021  		id =3D PPC440SP=
E_XOR_ID;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4022  		/* As far as th=
e XOR engine is concerned, it does not
12458ea06efd7b Anatolij Gustschin       2009-12-11  4023  		 * use FIFOs bu=
t uses linked list. So there is no dependency
12458ea06efd7b Anatolij Gustschin       2009-12-11  4024  		 * between pool=
 size to allocate and the engine configuration.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4025  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4026  		pool_size =3D P=
AGE_SIZE << 1;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4027  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4028  		/* it is DMA0 o=
r DMA1 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4029  		idx =3D of_get_=
property(np, "cell-index", &len);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4030  		if (!idx || (le=
n !=3D sizeof(u32))) {
c6c93048baff25 Rob Herring              2017-07-18  4031  			dev_err(&ofdev=
->dev, "Device node %pOF has missing "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4032  				"or invalid c=
ell-index property\n",
c6c93048baff25 Rob Herring              2017-07-18  4033  				np);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4034  			return -EINVAL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4035  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4036  		id =3D *idx;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4037  		/* DMA0,1 engin=
es use FIFO to maintain CDBs, so we
12458ea06efd7b Anatolij Gustschin       2009-12-11  4038  		 * should alloc=
ate the pool accordingly to size of this
12458ea06efd7b Anatolij Gustschin       2009-12-11  4039  		 * FIFO. Thus, =
the pool size depends on the FIFO depth:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4040  		 * how much CDB=
s pointers the FIFO may contain then so
12458ea06efd7b Anatolij Gustschin       2009-12-11  4041  		 * much CDBs we=
 should provide in the pool.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4042  		 * That is
12458ea06efd7b Anatolij Gustschin       2009-12-11  4043  		 *   CDB size =
=3D 32B;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4044  		 *   CDBs numbe=
r =3D (DMA0_FIFO_SIZE >> 3);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4045  		 *   Pool size =
=3D CDBs number * CDB size =3D
12458ea06efd7b Anatolij Gustschin       2009-12-11  4046  		 *      =3D (DM=
A0_FIFO_SIZE >> 3) << 5 =3D DMA0_FIFO_SIZE << 2.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4047  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4048  		pool_size =3D (=
id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4049  			    DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4050  		pool_size <<=3D=
 2;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4051  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4052  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4053  	if (of_address_t=
o_resource(np, 0, &res)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4054  		dev_err(&ofdev-=
>dev, "failed to get memory resource\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4055  		initcode =3D PP=
C_ADMA_INIT_MEMRES;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4056  		ret =3D -ENODEV;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4057  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4058  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4059  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4060  	if (!request_mem=
_region(res.start, resource_size(&res),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4061  				dev_driver_st=
ring(&ofdev->dev))) {
a584bff5efae8c Joe Perches              2010-11-12  4062  		dev_err(&ofdev-=
>dev, "failed to request memory region %pR\n",
a584bff5efae8c Joe Perches              2010-11-12  4063  			&res);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4064  		initcode =3D PP=
C_ADMA_INIT_MEMREG;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4065  		ret =3D -EBUSY;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4066  		goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4067  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4068  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4069  	/* create a devi=
ce */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4070  	adev =3D kzalloc=
(sizeof(*adev), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4071  	if (!adev) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4072  		initcode =3D PP=
C_ADMA_INIT_ALLOC;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4073  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4074  		goto err_adev_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4075  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4076  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4077  	adev->id =3D id;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4078  	adev->pool_size =
=3D pool_size;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4079  	/* allocate cohe=
rent memory for hardware descriptors */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4080  	adev->dma_desc_p=
ool_virt =3D dma_alloc_coherent(&ofdev->dev,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4081  					adev->pool_s=
ize, &adev->dma_desc_pool,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4082  					GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4083  	if (adev->dma_de=
sc_pool_virt =3D=3D NULL) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4084  		dev_err(&ofdev-=
>dev, "failed to allocate %d bytes of coherent "
12458ea06efd7b Anatolij Gustschin       2009-12-11  4085  			"memory for ha=
rdware descriptors\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4086  			adev->pool_siz=
e);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4087  		initcode =3D PP=
C_ADMA_INIT_COHERENT;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4088  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4089  		goto err_dma_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4090  	}
d73111c6d43f08 Masanari Iida            2012-08-04  4091  	dev_dbg(&ofdev->=
dev, "allocated descriptor pool virt 0x%p phys 0x%llx\n",
12458ea06efd7b Anatolij Gustschin       2009-12-11  4092  		adev->dma_desc_=
pool_virt, (u64)adev->dma_desc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4093  =

12458ea06efd7b Anatolij Gustschin       2009-12-11 @4094  	regs =3D ioremap=
(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4095  	if (!regs) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4096  		dev_err(&ofdev-=
>dev, "failed to ioremap regs!\n");
f3b77727e82722 Julia Lawall             2013-12-29  4097  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4098  		goto err_regs_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4099  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4100  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4101  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4102  		adev->xor_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4103  		/* Reset XOR */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4104  		iowrite32be(XOR=
_CRSR_XASR_BIT, &adev->xor_reg->crsr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4105  		iowrite32be(XOR=
_CRSR_64BA_BIT, &adev->xor_reg->crrr);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4106  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4107  		size_t fifo_siz=
e =3D (adev->id =3D=3D PPC440SPE_DMA0_ID) ?
12458ea06efd7b Anatolij Gustschin       2009-12-11  4108  				   DMA0_FIFO_=
SIZE : DMA1_FIFO_SIZE;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4109  		adev->dma_reg =
=3D regs;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4110  		/* DMAx_FIFO_SI=
ZE is defined in bytes,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4111  		 * <fsiz> - is =
defined in number of CDB pointers (8byte).
12458ea06efd7b Anatolij Gustschin       2009-12-11  4112  		 * DMA FIFO Len=
gth =3D CSlength + CPlength, where
12458ea06efd7b Anatolij Gustschin       2009-12-11  4113  		 * CSlength =3D=
 CPlength =3D (fsiz + 1) * 8.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4114  		 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4115  		iowrite32(DMA_F=
IFO_ENABLE | ((fifo_size >> 3) - 2),
12458ea06efd7b Anatolij Gustschin       2009-12-11  4116  			  &adev->dma_r=
eg->fsiz);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4117  		/* Configure DM=
A engine */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4118  		iowrite32(DMA_C=
FG_DXEPR_HP | DMA_CFG_DFMPP_HP | DMA_CFG_FALGN,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4119  			  &adev->dma_r=
eg->cfg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4120  		/* Clear Status=
 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4121  		iowrite32(~0, &=
adev->dma_reg->dsts);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4122  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4123  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4124  	adev->dev =3D &o=
fdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4125  	adev->common.dev=
 =3D &ofdev->dev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4126  	INIT_LIST_HEAD(&=
adev->common.channels);
dd3daca162f741 Jingoo Han               2013-05-24  4127  	platform_set_drv=
data(ofdev, adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4128  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4129  	/* create a chan=
nel */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4130  	chan =3D kzalloc=
(sizeof(*chan), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4131  	if (!chan) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4132  		initcode =3D PP=
C_ADMA_INIT_CHANNEL;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4133  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4134  		goto err_chan_a=
lloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4135  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4136  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4137  	spin_lock_init(&=
chan->lock);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4138  	INIT_LIST_HEAD(&=
chan->chain);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4139  	INIT_LIST_HEAD(&=
chan->all_slots);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4140  	chan->device =3D=
 adev;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4141  	chan->common.dev=
ice =3D &adev->common;
8ac695463f37af Russell King - ARM Linux 2012-03-06  4142  	dma_cookie_init(=
&chan->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4143  	list_add_tail(&c=
han->common.device_node, &adev->common.channels);
7f8281765f9949 Allen Pais               2020-08-31  4144  	tasklet_setup(&c=
han->irq_tasklet, ppc440spe_adma_tasklet);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4145  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4146  	/* allocate and =
map helper pages for async validation or
12458ea06efd7b Anatolij Gustschin       2009-12-11  4147  	 * async_mult/as=
ync_sum_product operations on DMA0/1.
12458ea06efd7b Anatolij Gustschin       2009-12-11  4148  	 */
12458ea06efd7b Anatolij Gustschin       2009-12-11  4149  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4150  		chan->pdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4151  		chan->qdest_pag=
e =3D alloc_page(GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4152  		if (!chan->pdes=
t_page ||
12458ea06efd7b Anatolij Gustschin       2009-12-11  4153  		    !chan->qdes=
t_page) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4154  			if (chan->pdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4155  				__free_page(c=
han->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4156  			if (chan->qdes=
t_page)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4157  				__free_page(c=
han->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4158  			ret =3D -ENOME=
M;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4159  			goto err_page_=
alloc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4160  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4161  		chan->pdest =3D=
 dma_map_page(&ofdev->dev, chan->pdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4162  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4163  		chan->qdest =3D=
 dma_map_page(&ofdev->dev, chan->qdest_page, 0,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4164  					   PAGE_SIZE=
, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4165  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4166  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4167  	ref =3D kmalloc(=
sizeof(*ref), GFP_KERNEL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4168  	if (ref) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4169  		ref->chan =3D &=
chan->common;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4170  		INIT_LIST_HEAD(=
&ref->node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4171  		list_add_tail(&=
ref->node, &ppc440spe_adma_chan_list);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4172  	} else {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4173  		dev_err(&ofdev-=
>dev, "failed to allocate channel reference!\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4174  		ret =3D -ENOMEM;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4175  		goto err_ref_al=
loc;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4176  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4177  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4178  	ret =3D ppc440sp=
e_adma_setup_irqs(adev, chan, &initcode);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4179  	if (ret)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4180  		goto err_irq;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4181  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4182  	ppc440spe_adma_i=
nit_capabilities(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4183  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4184  	ret =3D dma_asyn=
c_device_register(&adev->common);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4185  	if (ret) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4186  		initcode =3D PP=
C_ADMA_INIT_REGISTER;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4187  		dev_err(&ofdev-=
>dev, "failed to register dma device\n");
12458ea06efd7b Anatolij Gustschin       2009-12-11  4188  		goto err_dev_re=
g;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4189  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4190  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4191  	goto out;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4192  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4193  err_dev_reg:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4194  	ppc440spe_adma_r=
elease_irqs(adev, chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4195  err_irq:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4196  	list_for_each_en=
try_safe(ref, _ref, &ppc440spe_adma_chan_list, node) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4197  		if (chan =3D=3D=
 to_ppc440spe_adma_chan(ref->chan)) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4198  			list_del(&ref-=
>node);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4199  			kfree(ref);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4200  		}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4201  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4202  err_ref_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4203  	if (adev->id !=
=3D PPC440SPE_XOR_ID) {
12458ea06efd7b Anatolij Gustschin       2009-12-11  4204  		dma_unmap_page(=
&ofdev->dev, chan->pdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4205  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4206  		dma_unmap_page(=
&ofdev->dev, chan->qdest,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4207  			       PAGE_SI=
ZE, DMA_BIDIRECTIONAL);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4208  		__free_page(cha=
n->pdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4209  		__free_page(cha=
n->qdest_page);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4210  	}
12458ea06efd7b Anatolij Gustschin       2009-12-11  4211  err_page_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4212  	kfree(chan);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4213  err_chan_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4214  	if (adev->id =3D=
=3D PPC440SPE_XOR_ID)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4215  		iounmap(adev->x=
or_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4216  	else
12458ea06efd7b Anatolij Gustschin       2009-12-11  4217  		iounmap(adev->d=
ma_reg);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4218  err_regs_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4219  	dma_free_coheren=
t(adev->dev, adev->pool_size,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4220  			  adev->dma_de=
sc_pool_virt,
12458ea06efd7b Anatolij Gustschin       2009-12-11  4221  			  adev->dma_de=
sc_pool);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4222  err_dma_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4223  	kfree(adev);
12458ea06efd7b Anatolij Gustschin       2009-12-11  4224  err_adev_alloc:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4225  	release_mem_regi=
on(res.start, resource_size(&res));
12458ea06efd7b Anatolij Gustschin       2009-12-11  4226  out:
12458ea06efd7b Anatolij Gustschin       2009-12-11  4227  	if (id < PPC440S=
PE_ADMA_ENGINES_NUM)
12458ea06efd7b Anatolij Gustschin       2009-12-11  4228  		ppc440spe_adma_=
devices[id] =3D initcode;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4229  =

12458ea06efd7b Anatolij Gustschin       2009-12-11  4230  	return ret;
12458ea06efd7b Anatolij Gustschin       2009-12-11  4231  }
12458ea06efd7b Anatolij Gustschin       2009-12-11  4232  =


:::::: The code@line 4094 was first introduced by commit
:::::: 12458ea06efd7b44281e68fe59c950ec7d59c649 ppc440spe-adma: adds update=
d ppc440spe adma driver

:::::: TO: Anatolij Gustschin <agust@denx.de>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7636660430505047036==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7636660430505047036==--


Content-Type: multipart/mixed; boundary="===============7070099537682246594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/ppc4xx/adma.c:4094:14: sparse: sparse: incorrect type in assignment (different address spaces)
Date: Tue, 29 Jun 2021 20:56:05 +0800
Message-ID: <202106292000.Mg8I64ND-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7070099537682246594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c54b245d011855ea91c5beff07f1db74143ce614
commit: 68f35add4ba4c850a33878633e10c02d7ba32d84 dmaengine: ppc4xx: make pp=
c440spe_adma_chan_list static
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: powerpc64-randconfig-s032-20210629 (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D68f35add4ba4c850a33878633e10c02d7ba32d84
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 68f35add4ba4c850a33878633e10c02d7ba32d84
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
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

--===============7070099537682246594==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7070099537682246594==--


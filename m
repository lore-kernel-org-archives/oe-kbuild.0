Content-Type: multipart/mixed; boundary="===============5852805594692683302=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/pci_endpoint_test.c:347:6: warning: Local variable irq_type shadows outer variable
Date: Wed, 09 Sep 2020 23:42:17 +0800
Message-ID: <202009092315.vdvRRQPo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5852805594692683302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kishon Vijay Abraham I <kishon@ti.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
commit: b2ba9225e0313b1de631a44b7b48c109032bffec misc: pci_endpoint_test: A=
void using module parameter to determine irqtype
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/pci_endpoint_test.c:347:6: warning: Local variable irq_type=
 shadows outer variable [shadowVar]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:347:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:481:6: warning: Local variable irq_type=
 shadows outer variable [shadowVar]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:481:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:580:6: warning: Local variable irq_type=
 shadows outer variable [shadowVar]
    int irq_type =3D test->irq_type;
        ^
   drivers/misc/pci_endpoint_test.c:86:12: note: Shadowed declaration
   static int irq_type =3D IRQ_TYPE_MSI;
              ^
   drivers/misc/pci_endpoint_test.c:580:6: note: Shadow variable
    int irq_type =3D test->irq_type;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db2ba9225e0313b1de631a44b7b48c109032bffec
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout b2ba9225e0313b1de631a44b7b48c109032bffec
vim +347 drivers/misc/pci_endpoint_test.c

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  326  =

cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  327  static bool pci_end=
point_test_copy(struct pci_endpoint_test *test,
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  328  				   unsigned lon=
g arg)
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  329  {
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  330  	struct pci_endpoin=
t_test_xfer_param param;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  331  	bool ret =3D false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  332  	void *src_addr;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  333  	void *dst_addr;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  334  	u32 flags =3D 0;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  335  	bool use_dma;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  336  	size_t size;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  337  	dma_addr_t src_phy=
s_addr;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  338  	dma_addr_t dst_phy=
s_addr;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  339  	struct pci_dev *pd=
ev =3D test->pdev;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  340  	struct device *dev=
 =3D &pdev->dev;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  341  	void *orig_src_add=
r;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  342  	dma_addr_t orig_sr=
c_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  343  	void *orig_dst_add=
r;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  344  	dma_addr_t orig_ds=
t_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  345  	size_t offset;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  346  	size_t alignment =
=3D test->alignment;
b2ba9225e0313b1 Kishon Vijay Abraham I 2020-03-17 @347  	int irq_type =3D t=
est->irq_type;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  348  	u32 src_crc32;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  349  	u32 dst_crc32;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  350  	int err;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  351  =

cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  352  	err =3D copy_from_=
user(&param, (void __user *)arg, sizeof(param));
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  353  	if (err) {
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  354  		dev_err(dev, "Fai=
led to get transfer param\n");
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  355  		return false;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  356  	}
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  357  =

cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  358  	size =3D param.siz=
e;
343dc693f7b7988 Dan Carpenter          2017-09-30  359  	if (size > SIZE_MA=
X - alignment)
343dc693f7b7988 Dan Carpenter          2017-09-30  360  		goto err;
343dc693f7b7988 Dan Carpenter          2017-09-30  361  =

cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  362  	use_dma =3D !!(par=
am.flags & PCITEST_FLAGS_USE_DMA);
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  363  	if (use_dma)
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  364  		flags |=3D FLAG_U=
SE_DMA;
cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  365  =

e03327122e2c8e6 Gustavo Pimentel       2018-07-19  366  	if (irq_type < IRQ=
_TYPE_LEGACY || irq_type > IRQ_TYPE_MSIX) {
e03327122e2c8e6 Gustavo Pimentel       2018-07-19  367  		dev_err(dev, "Inv=
alid IRQ type option\n");
e03327122e2c8e6 Gustavo Pimentel       2018-07-19  368  		goto err;
e03327122e2c8e6 Gustavo Pimentel       2018-07-19  369  	}
e03327122e2c8e6 Gustavo Pimentel       2018-07-19  370  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  371  	orig_src_addr =3D =
kzalloc(size + alignment, GFP_KERNEL);
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  372  	if (!orig_src_addr=
) {
0e52ea611600527 Gustavo Pimentel       2018-05-14  373  		dev_err(dev, "Fai=
led to allocate source buffer\n");
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  374  		ret =3D false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  375  		goto err;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  376  	}
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  377  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  378  	get_random_bytes(o=
rig_src_addr, size + alignment);
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  379  	orig_src_phys_addr=
 =3D dma_map_single(dev, orig_src_addr,
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  380  					    size + ali=
gnment, DMA_TO_DEVICE);
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  381  	if (dma_mapping_er=
ror(dev, orig_src_phys_addr)) {
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  382  		dev_err(dev, "fai=
led to map source buffer address\n");
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  383  		ret =3D false;
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  384  		goto err_src_phys=
_addr;
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  385  	}
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  386  =

13107c60681f19f Kishon Vijay Abraham I 2017-08-18  387  	if (alignment && !=
IS_ALIGNED(orig_src_phys_addr, alignment)) {
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  388  		src_phys_addr =3D=
 PTR_ALIGN(orig_src_phys_addr, alignment);
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  389  		offset =3D src_ph=
ys_addr - orig_src_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  390  		src_addr =3D orig=
_src_addr + offset;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  391  	} else {
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  392  		src_phys_addr =3D=
 orig_src_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  393  		src_addr =3D orig=
_src_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  394  	}
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  395  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  396  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_LOWER_SRC_ADDR,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  397  				 lower_32_bits(=
src_phys_addr));
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  398  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  399  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_UPPER_SRC_ADDR,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  400  				 upper_32_bits(=
src_phys_addr));
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  401  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  402  	src_crc32 =3D crc3=
2_le(~0, src_addr, size);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  403  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  404  	orig_dst_addr =3D =
kzalloc(size + alignment, GFP_KERNEL);
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  405  	if (!orig_dst_addr=
) {
0e52ea611600527 Gustavo Pimentel       2018-05-14  406  		dev_err(dev, "Fai=
led to allocate destination address\n");
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  407  		ret =3D false;
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  408  		goto err_dst_addr;
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  409  	}
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  410  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  411  	orig_dst_phys_addr=
 =3D dma_map_single(dev, orig_dst_addr,
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  412  					    size + ali=
gnment, DMA_FROM_DEVICE);
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  413  	if (dma_mapping_er=
ror(dev, orig_dst_phys_addr)) {
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  414  		dev_err(dev, "fai=
led to map destination buffer address\n");
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  415  		ret =3D false;
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  416  		goto err_dst_phys=
_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  417  	}
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  418  =

13107c60681f19f Kishon Vijay Abraham I 2017-08-18  419  	if (alignment && !=
IS_ALIGNED(orig_dst_phys_addr, alignment)) {
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  420  		dst_phys_addr =3D=
 PTR_ALIGN(orig_dst_phys_addr, alignment);
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  421  		offset =3D dst_ph=
ys_addr - orig_dst_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  422  		dst_addr =3D orig=
_dst_addr + offset;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  423  	} else {
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  424  		dst_phys_addr =3D=
 orig_dst_phys_addr;
13107c60681f19f Kishon Vijay Abraham I 2017-08-18  425  		dst_addr =3D orig=
_dst_addr;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  426  	}
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  427  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  428  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_LOWER_DST_ADDR,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  429  				 lower_32_bits(=
dst_phys_addr));
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  430  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_UPPER_DST_ADDR,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  431  				 upper_32_bits(=
dst_phys_addr));
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  432  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  433  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_SIZE,
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  434  				 size);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  435  =

cf376b4b59da999 Kishon Vijay Abraham I 2020-03-16  436  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_FLAGS, flags);
9133e394d5ed1c8 Gustavo Pimentel       2018-07-19  437  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_IRQ_TYPE, irq_type);
e8817de7fbfca40 Gustavo Pimentel       2018-07-19  438  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_IRQ_NUMBER, 1);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  439  	pci_endpoint_test_=
writel(test, PCI_ENDPOINT_TEST_COMMAND,
e8817de7fbfca40 Gustavo Pimentel       2018-07-19  440  				 COMMAND_COPY);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  441  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  442  	wait_for_completio=
n(&test->irq_raised);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  443  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  444  	dma_unmap_single(d=
ev, orig_dst_phys_addr, size + alignment,
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  445  			 DMA_FROM_DEVICE=
);
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  446  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  447  	dst_crc32 =3D crc3=
2_le(~0, dst_addr, size);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  448  	if (dst_crc32 =3D=
=3D src_crc32)
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  449  		ret =3D true;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  450  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  451  err_dst_phys_addr:
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  452  	kfree(orig_dst_add=
r);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  453  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  454  err_dst_addr:
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  455  	dma_unmap_single(d=
ev, orig_src_phys_addr, size + alignment,
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  456  			 DMA_TO_DEVICE);
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  457  =

0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  458  err_src_phys_addr:
0a121f9bc3f55b8 Kishon Vijay Abraham I 2020-03-16  459  	kfree(orig_src_add=
r);
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  460  =

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  461  err:
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  462  	return ret;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  463  }
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  464  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5852805594692683302==--


Content-Type: multipart/mixed; boundary="===============2585902835214899305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 4/5] drivers/pci/controller/dwc/pcie-keembay.c:255 thunderbay_pcie_host_rd_other_conf() error: uninitialized symbol 'ret'.
Date: Sat, 23 Apr 2022 21:15:27 +0800
Message-ID: <202204232110.SCXHVYG9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2585902835214899305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Srikanth Thokala <srikanth.thokala@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   7acd0be121091f12349a4dcefd2e6deee2e73946
commit: 28f72667fffb64d777e6f3f3017995d7d4f9e558 [4/5] PCI: thunderbay: Add=
 support for Thunderbay Root Port
:::::: branch date: 4 days ago
:::::: commit date: 9 weeks ago
config: xtensa-randconfig-m031-20220422 (https://download.01.org/0day-ci/ar=
chive/20220423/202204232110.SCXHVYG9-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/controller/dwc/pcie-keembay.c:255 thunderbay_pcie_host_rd_other=
_conf() error: uninitialized symbol 'ret'.
drivers/pci/controller/dwc/pcie-keembay.c:294 thunderbay_pcie_rc_dma_cfg() =
warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/pci/controller/dwc/pcie-keembay.c:301 thunderbay_pcie_rc_dma_cfg() =
warn: passing zero to 'PTR_ERR'

vim +/ret +255 drivers/pci/controller/dwc/pcie-keembay.c

28f72667fffb64 Srikanth Thokala 2021-09-16  219  =

28f72667fffb64 Srikanth Thokala 2021-09-16  220  static int
28f72667fffb64 Srikanth Thokala 2021-09-16  221  thunderbay_pcie_host_rd_ot=
her_conf(struct pci_bus *bus, unsigned int devfn,
28f72667fffb64 Srikanth Thokala 2021-09-16  222  				   int where, int size=
, u32 *val)
28f72667fffb64 Srikanth Thokala 2021-09-16  223  {
28f72667fffb64 Srikanth Thokala 2021-09-16  224  	struct pcie_port *pp =3D =
bus->sysdata;
28f72667fffb64 Srikanth Thokala 2021-09-16  225  	struct keembay_pcie *pcie;
28f72667fffb64 Srikanth Thokala 2021-09-16  226  	int ret, where_align;
28f72667fffb64 Srikanth Thokala 2021-09-16  227  	struct dw_pcie *pci;
28f72667fffb64 Srikanth Thokala 2021-09-16  228  =

28f72667fffb64 Srikanth Thokala 2021-09-16  229  	pci =3D to_dw_pcie_from_p=
p(pp);
28f72667fffb64 Srikanth Thokala 2021-09-16  230  	pcie =3D dev_get_drvdata(=
pci->dev);
28f72667fffb64 Srikanth Thokala 2021-09-16  231  =

28f72667fffb64 Srikanth Thokala 2021-09-16  232  	if (pcie->rc_dma) {
28f72667fffb64 Srikanth Thokala 2021-09-16  233  		where_align =3D where & =
~((typeof(where))(4) - 1);
28f72667fffb64 Srikanth Thokala 2021-09-16  234  		if (thunderbay_pcie_rc_d=
ma_rd(pp,
28f72667fffb64 Srikanth Thokala 2021-09-16  235  					      pcie->rd_dma_ch=
an,
28f72667fffb64 Srikanth Thokala 2021-09-16  236  					      pcie->rc_dma_me=
m_pa + where_align,
28f72667fffb64 Srikanth Thokala 2021-09-16  237  					      pp->cfg0_base +=
 where_align,
28f72667fffb64 Srikanth Thokala 2021-09-16  238  					      4))
28f72667fffb64 Srikanth Thokala 2021-09-16  239  			ret =3D PCIBIOS_BAD_REG=
ISTER_NUMBER;
28f72667fffb64 Srikanth Thokala 2021-09-16  240  =

28f72667fffb64 Srikanth Thokala 2021-09-16  241  		*val =3D *((int *)(pcie-=
>rc_dma_mem_va + where));
28f72667fffb64 Srikanth Thokala 2021-09-16  242  =

28f72667fffb64 Srikanth Thokala 2021-09-16  243  		if (size =3D=3D 4)
28f72667fffb64 Srikanth Thokala 2021-09-16  244  			*val &=3D 0xFFFFFFFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  245  		else if (size =3D=3D 2)
28f72667fffb64 Srikanth Thokala 2021-09-16  246  			*val &=3D 0xFFFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  247  		else if (size =3D=3D 1)
28f72667fffb64 Srikanth Thokala 2021-09-16  248  			*val &=3D 0xFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  249  		else
28f72667fffb64 Srikanth Thokala 2021-09-16  250  			ret =3D PCIBIOS_BAD_REG=
ISTER_NUMBER;
28f72667fffb64 Srikanth Thokala 2021-09-16  251  	} else {
28f72667fffb64 Srikanth Thokala 2021-09-16  252  		ret =3D dw_pcie_read(pp-=
>va_cfg0_base + where, size, val);
28f72667fffb64 Srikanth Thokala 2021-09-16  253  	}
28f72667fffb64 Srikanth Thokala 2021-09-16  254  =

28f72667fffb64 Srikanth Thokala 2021-09-16 @255  	return ret;
28f72667fffb64 Srikanth Thokala 2021-09-16  256  }
28f72667fffb64 Srikanth Thokala 2021-09-16  257  =

28f72667fffb64 Srikanth Thokala 2021-09-16  258  static struct pci_ops thun=
derbay_child_pci_ops =3D {
28f72667fffb64 Srikanth Thokala 2021-09-16  259  	.map_bus =3D thunderbay_p=
cie_conf_addr_map_bus,
28f72667fffb64 Srikanth Thokala 2021-09-16  260  	.read =3D thunderbay_pcie=
_host_rd_other_conf,
28f72667fffb64 Srikanth Thokala 2021-09-16  261  	.write =3D pci_generic_co=
nfig_write,
28f72667fffb64 Srikanth Thokala 2021-09-16  262  };
28f72667fffb64 Srikanth Thokala 2021-09-16  263  =

28f72667fffb64 Srikanth Thokala 2021-09-16  264  static int thunderbay_pcie=
_rc_dma_cfg(struct keembay_pcie *pcie,
28f72667fffb64 Srikanth Thokala 2021-09-16  265  				      struct platform_=
device *pdev)
28f72667fffb64 Srikanth Thokala 2021-09-16  266  {
28f72667fffb64 Srikanth Thokala 2021-09-16  267  	struct dw_pcie *pci =3D &=
pcie->pci;
28f72667fffb64 Srikanth Thokala 2021-09-16  268  	struct device *dev =3D &p=
dev->dev;
28f72667fffb64 Srikanth Thokala 2021-09-16  269  	struct dma_chan *rd_chan;
28f72667fffb64 Srikanth Thokala 2021-09-16  270  	dma_addr_t phys;
28f72667fffb64 Srikanth Thokala 2021-09-16  271  	void *segment;
28f72667fffb64 Srikanth Thokala 2021-09-16  272  	int ret;
28f72667fffb64 Srikanth Thokala 2021-09-16  273  =

28f72667fffb64 Srikanth Thokala 2021-09-16  274  	ret =3D dma_set_mask_and_=
coherent(dev, DMA_BIT_MASK(64));
28f72667fffb64 Srikanth Thokala 2021-09-16  275  	if (ret)
28f72667fffb64 Srikanth Thokala 2021-09-16  276  		dev_warn(dev, "failed to=
 set dma mask\n");
28f72667fffb64 Srikanth Thokala 2021-09-16  277  =

28f72667fffb64 Srikanth Thokala 2021-09-16  278  	rd_chan =3D dma_request_c=
han(&pdev->dev, "rx");
28f72667fffb64 Srikanth Thokala 2021-09-16  279  	if (IS_ERR(rd_chan)) {
28f72667fffb64 Srikanth Thokala 2021-09-16  280  		ret =3D PTR_ERR(rd_chan);
28f72667fffb64 Srikanth Thokala 2021-09-16  281  		if (ret !=3D -EPROBE_DEF=
ER)
28f72667fffb64 Srikanth Thokala 2021-09-16  282  			dev_err(dev, "No RC AXI=
 DMA Rd channel available\n");
28f72667fffb64 Srikanth Thokala 2021-09-16  283  		return ret;
28f72667fffb64 Srikanth Thokala 2021-09-16  284  	}
28f72667fffb64 Srikanth Thokala 2021-09-16  285  	pcie->rd_dma_chan =3D rd_=
chan;
28f72667fffb64 Srikanth Thokala 2021-09-16  286  =

28f72667fffb64 Srikanth Thokala 2021-09-16  287  	pcie->rc_dma_pool =3D dma=
_pool_create("thb_pcie_rc_dma_pool",
28f72667fffb64 Srikanth Thokala 2021-09-16  288  					    pci->dev,
28f72667fffb64 Srikanth Thokala 2021-09-16  289  					    PAGE_SIZE,
28f72667fffb64 Srikanth Thokala 2021-09-16  290  					    PAGE_SIZE,
28f72667fffb64 Srikanth Thokala 2021-09-16  291  					    0);
28f72667fffb64 Srikanth Thokala 2021-09-16  292  	if (!pcie->rc_dma_pool) {
28f72667fffb64 Srikanth Thokala 2021-09-16  293  		dev_err(dev, "unable to =
allocate RC AXI DMA pool\n");
28f72667fffb64 Srikanth Thokala 2021-09-16 @294  		ret =3D PTR_ERR(pcie->rc=
_dma_pool);
28f72667fffb64 Srikanth Thokala 2021-09-16  295  		goto free_dma_channel;
28f72667fffb64 Srikanth Thokala 2021-09-16  296  	}
28f72667fffb64 Srikanth Thokala 2021-09-16  297  =

28f72667fffb64 Srikanth Thokala 2021-09-16  298  	segment =3D dma_pool_zall=
oc(pcie->rc_dma_pool, GFP_ATOMIC, &phys);
28f72667fffb64 Srikanth Thokala 2021-09-16  299  	if (!segment) {
28f72667fffb64 Srikanth Thokala 2021-09-16  300  		dev_err(dev, "unable to =
get mem from RC AXI DMA pool\n");
28f72667fffb64 Srikanth Thokala 2021-09-16  301  		ret =3D PTR_ERR(segment);
28f72667fffb64 Srikanth Thokala 2021-09-16  302  		goto free_dma_pool;
28f72667fffb64 Srikanth Thokala 2021-09-16  303  	}
28f72667fffb64 Srikanth Thokala 2021-09-16  304  	pcie->rc_dma_mem_pa =3D p=
hys;
28f72667fffb64 Srikanth Thokala 2021-09-16  305  	pcie->rc_dma_mem_va =3D s=
egment;
28f72667fffb64 Srikanth Thokala 2021-09-16  306  =

28f72667fffb64 Srikanth Thokala 2021-09-16  307  	return 0;
28f72667fffb64 Srikanth Thokala 2021-09-16  308  =

28f72667fffb64 Srikanth Thokala 2021-09-16  309  free_dma_channel:
28f72667fffb64 Srikanth Thokala 2021-09-16  310  	dma_release_channel(pcie-=
>rd_dma_chan);
28f72667fffb64 Srikanth Thokala 2021-09-16  311  free_dma_pool:
28f72667fffb64 Srikanth Thokala 2021-09-16  312  	dma_pool_destroy(pcie->rc=
_dma_pool);
28f72667fffb64 Srikanth Thokala 2021-09-16  313  =

28f72667fffb64 Srikanth Thokala 2021-09-16  314  	return ret;
28f72667fffb64 Srikanth Thokala 2021-09-16  315  }
28f72667fffb64 Srikanth Thokala 2021-09-16  316  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2585902835214899305==--


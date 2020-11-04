Content-Type: multipart/mixed; boundary="===============3115888652615878973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pci:for-linus 3/4] drivers/pci/controller/dwc/pcie-designware-host.c:597:27: warning: Possible null pointer dereference: entry
Date: Wed, 04 Nov 2020 14:41:06 +0800
Message-ID: <202011041456.pJb2gaZS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3115888652615878973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-pci(a)vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git for=
-linus
head:   8f113d33e39f4a1a290f8d4557a0b853a1ab6753
commit: cdb690e51537633c586bb29c4db3076add72a359 [3/4] PCI: dwc: Restore AT=
U memory resource setup to use last entry
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/controller/dwc/pcie-designware-host.c:597:27: warning: Possi=
ble null pointer dereference: entry [nullPointer]
          PCIE_ATU_TYPE_MEM, entry->res->start,
                             ^
   drivers/pci/controller/dwc/pcie-designware-host.c:589:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:597:27: note: Null poi=
nter dereference
          PCIE_ATU_TYPE_MEM, entry->res->start,
                             ^
   drivers/pci/controller/dwc/pcie-designware-host.c:598:8: warning: Possib=
le null pointer dereference: entry [nullPointer]
          entry->res->start - entry->offset,
          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:589:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:598:8: note: Null poin=
ter dereference
          entry->res->start - entry->offset,
          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:599:22: warning: Possi=
ble null pointer dereference: entry [nullPointer]
          resource_size(entry->res));
                        ^
   drivers/pci/controller/dwc/pcie-designware-host.c:589:40: note: Assignme=
nt 'entry=3DNULL', assigned value is 0
     struct resource_entry *tmp, *entry =3D NULL;
                                          ^
   drivers/pci/controller/dwc/pcie-designware-host.c:599:22: note: Null poi=
nter dereference
          resource_size(entry->res));
                        ^

vim +597 drivers/pci/controller/dwc/pcie-designware-host.c

feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  531  =

feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  532  void dw_pcie_setup_rc(struct pcie_port *pp)
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  533  {
1f319cb0538a10 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-03-06  534  	u32 val, ctrl, num_ctrls;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  535  	struct dw_pcie *pci =3D to_dw_pcie_from_pp(p=
p);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  536  =

3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  537  	/*
3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  538  	 * Enable DBI read-only registers for writin=
g/updating configuration.
3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  539  	 * Write permission gets disabled towards th=
e end of this function.
3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  540  	 */
3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  541  	dw_pcie_dbi_ro_wr_en(pci);
3924bc2fd1b607 drivers/pci/controller/dwc/pcie-designware-host.c Vidya Saga=
r            2019-08-13  542  =

feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  543  	dw_pcie_setup(pci);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  544  =

742833249198bf drivers/pci/controller/dwc/pcie-designware-host.c Jisheng Zh=
ang          2020-10-09  545  	if (pci_msi_enabled() && !pp->ops->msi_host_=
init) {
1f319cb0538a10 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-03-06  546  		num_ctrls =3D pp->num_vectors / MAX_MSI_IRQ=
S_PER_CTRL;
1f319cb0538a10 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-03-06  547  =

7c5925afbc58c6 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-03-06  548  		/* Initialize IRQ Status array */
830920e065e90d drivers/pci/controller/dwc/pcie-designware-host.c Marc Zyngi=
er           2018-11-13  549  		for (ctrl =3D 0; ctrl < num_ctrls; ctrl++) {
a348d015f0de7a drivers/pci/controller/dwc/pcie-designware-host.c Gustavo Pi=
mentel       2019-01-31  550  			pp->irq_mask[ctrl] =3D ~0;
f81c770df72e72 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  551  			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MAS=
K +
76cbf066b1ab75 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  552  					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
f81c770df72e72 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  553  					    pp->irq_mask[ctrl]);
f81c770df72e72 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  554  			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENA=
BLE +
76cbf066b1ab75 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  555  					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
f81c770df72e72 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  556  					    ~0);
830920e065e90d drivers/pci/controller/dwc/pcie-designware-host.c Marc Zyngi=
er           2018-11-13  557  		}
fd8a44bd5b76dc drivers/pci/controller/dwc/pcie-designware-host.c Kishon Vij=
ay Abraham I 2019-03-21  558  	}
b4a8a51caf7de4 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  559  =

b4a8a51caf7de4 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  560  	/* Setup RC BARs */
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  561  	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, =
0x00000004);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  562  	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_1, =
0x00000000);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  563  =

b4a8a51caf7de4 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  564  	/* Setup interrupt pins */
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  565  	val =3D dw_pcie_readl_dbi(pci, PCI_INTERRUPT=
_LINE);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  566  	val &=3D 0xffff00ff;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  567  	val |=3D 0x00000100;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  568  	dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, =
val);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  569  =

b4a8a51caf7de4 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  570  	/* Setup bus numbers */
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  571  	val =3D dw_pcie_readl_dbi(pci, PCI_PRIMARY_B=
US);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  572  	val &=3D 0xff000000;
fc110ebdd014dd drivers/pci/dwc/pcie-designware-host.c            Koen Vande=
putte        2018-03-07  573  	val |=3D 0x00ff0100;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  574  	dw_pcie_writel_dbi(pci, PCI_PRIMARY_BUS, val=
);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  575  =

b4a8a51caf7de4 drivers/pci/dwc/pcie-designware-host.c            Gustavo Pi=
mentel       2018-05-14  576  	/* Setup command register */
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  577  	val =3D dw_pcie_readl_dbi(pci, PCI_COMMAND);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  578  	val &=3D 0xffff0000;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  579  	val |=3D PCI_COMMAND_IO | PCI_COMMAND_MEMORY=
 |
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  580  		PCI_COMMAND_MASTER | PCI_COMMAND_SERR;
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  581  	dw_pcie_writel_dbi(pci, PCI_COMMAND, val);
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  582  =

feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  583  	/*
444ddca52484e9 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  584  	 * If the platform provides its own child bu=
s config accesses, it means
444ddca52484e9 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  585  	 * the platform uses its own address transla=
tion component rather than
444ddca52484e9 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  586  	 * ATU, so we should not program the ATU her=
e.
feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  587  	 */
c2b0c098fbd15d drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  588  	if (pp->bridge->child_ops =3D=3D &dw_child_p=
cie_ops) {
cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  589  		struct resource_entry *tmp, *entry =3D NULL;
cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  590  =

cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  591  		/* Get last memory resource entry */
cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  592  		resource_list_for_each_entry(tmp, &pp->brid=
ge->windows)
cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  593  			if (resource_type(tmp->res) =3D=3D IORESOU=
RCE_MEM)
cdb690e5153763 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-10-26  594  				entry =3D tmp;
0f71c60ffd2694 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20  595  =

feb85d9b1c47ea drivers/pci/dwc/pcie-designware-host.c            Kishon Vij=
ay Abraham I 2017-02-15  596  		dw_pcie_prog_outbound_atu(pci, PCIE_ATU_REG=
ION_INDEX0,
0f71c60ffd2694 drivers/pci/controller/dwc/pcie-designware-host.c Rob Herrin=
g            2020-08-20 @597  					  PCIE_ATU_TYPE_MEM, entry->res->start,

:::::: The code at line 597 was first introduced by commit
:::::: 0f71c60ffd26943fa9646aa73ad7889ace116ce2 PCI: dwc: Remove storing of=
 PCI resources

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3115888652615878973==--


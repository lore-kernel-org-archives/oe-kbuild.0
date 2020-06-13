Content-Type: multipart/mixed; boundary="===============2593749971614870366=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pci-mvebu.c:368:17: sparse: sparse: restricted __le16 degrades to integer
Date: Sun, 14 Jun 2020 07:13:28 +0800
Message-ID: <202006140714.Ag8L58No%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2593749971614870366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Grzegorz Jaszczyk <jaz@semihalf.com>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f82e7b57b5fc48199e2f26ffafe2f96f7338ad3d
commit: e0d9d30b73548fbfe5c024ed630169bdc9a08aee PCI: pci-bridge-emul: Fix =
big-endian support
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-s032-20200613 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        git checkout e0d9d30b73548fbfe5c024ed630169bdc9a08aee
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm CF=3D'-fdiagnostic-prefix -D__CHECK_END=
IAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/pci/controller/pci-mvebu.c:368:17: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:368:38: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:369:19: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:389:30: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:392:31: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:406:17: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:406:34: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:407:19: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:419:30: sparse: sparse: restricted __=
le16 degrades to integer
   drivers/pci/controller/pci-mvebu.c:420:31: sparse: sparse: restricted __=
le16 degrades to integer
>> drivers/pci/controller/pci-mvebu.c:483:39: sparse: sparse: invalid assig=
nment: &=3D
>> drivers/pci/controller/pci-mvebu.c:483:39: sparse:    left side has type=
 restricted __le16
>> drivers/pci/controller/pci-mvebu.c:483:39: sparse:    right side has typ=
e int
   drivers/pci/controller/pci-mvebu.c:557:28: sparse: sparse: symbol 'mvebu=
_pci_bridge_emul_ops' was not declared. Should it be static?
>> drivers/pci/controller/pci-mvebu.c:571:29: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le16 [u=
sertype] vendor @@     got int @@
>> drivers/pci/controller/pci-mvebu.c:571:29: sparse:     expected restrict=
ed __le16 [usertype] vendor
>> drivers/pci/controller/pci-mvebu.c:571:29: sparse:     got int
>> drivers/pci/controller/pci-mvebu.c:572:29: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le16 [u=
sertype] device @@     got unsigned int @@
>> drivers/pci/controller/pci-mvebu.c:572:29: sparse:     expected restrict=
ed __le16 [usertype] device
>> drivers/pci/controller/pci-mvebu.c:572:29: sparse:     got unsigned int
>> drivers/pci/controller/pci-mvebu.c:573:37: sparse: sparse: incorrect typ=
e in assignment (different base types) @@     expected restricted __le32 [u=
sertype] class_revision @@     got unsigned int @@
>> drivers/pci/controller/pci-mvebu.c:573:37: sparse:     expected restrict=
ed __le32 [usertype] class_revision
   drivers/pci/controller/pci-mvebu.c:573:37: sparse:     got unsigned int
   drivers/pci/controller/pci-mvebu.c:716:31: sparse: sparse: incorrect typ=
e in return expression (different address spaces) @@     expected void [nod=
eref] <asn:2> * @@     got void * @@
   drivers/pci/controller/pci-mvebu.c:716:31: sparse:     expected void [no=
deref] <asn:2> *
   drivers/pci/controller/pci-mvebu.c:716:31: sparse:     got void *

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De0d9d30b73548fbfe5c024ed630169bdc9a08aee
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout e0d9d30b73548fbfe5c024ed630169bdc9a08aee
vim +368 drivers/pci/controller/pci-mvebu.c

d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  360  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  361  static void mvebu_pcie_handle_iobase_change(struct mvebu_pcie_port=
 *port)
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  362  {
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  363  	struct mvebu_pcie_window desired =3D {};
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  364  	struct pci_bridge_emul_conf *conf =3D &port->bridge.conf;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  365  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  366  	/* Are the new iobase/iolimit values invalid? */
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  367  	if (conf->iolimit < conf->iobase ||
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18 @368  	    conf->iolimitupper < conf->iobaseupper ||
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  369  	    !(conf->command & PCI_COMMAND_IO)) {
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  370  		mvebu_pcie_set_window(port, port->io_target, port->io_attr,
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  371  				      &desired, &port->iowin);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  372  		return;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  373  	}
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  374  =

641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  375  	if (!mvebu_has_ioport(port)) {
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  376  		dev_WARN(&port->pcie->pdev->dev,
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  377  			 "Attempt to set IO when IO is disabled\n");
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  378  		return;
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  379  	}
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  380  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  381  	/*
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  382  	 * We read the PCI-to-PCI bridge emulated registers, and
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  383  	 * calculate the base address and size of the address decoding
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  384  	 * window to setup, according to the PCI-to-PCI bridge
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  385  	 * specifications. iobase is the bus address, port->iowin_base
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  386  	 * is the CPU address.
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  387  	 */
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  388  	desired.remap =3D ((conf->iobase & 0xF0) << 8) |
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  389  			(conf->iobaseupper << 16);
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  390  	desired.base =3D port->pcie->io.start + desired.remap;
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  391  	desired.size =3D ((0xFFF | ((conf->iolimit & 0xF0) << 8) |
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  392  			 (conf->iolimitupper << 16)) -
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  393  			desired.remap) +
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  394  		       1;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  395  =

d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  396  	mvebu_pcie_set_window(port, port->io_target, port->io_attr, &desi=
red,
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  397  			      &port->iowin);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  398  }
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  399  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  400  static void mvebu_pcie_handle_membase_change(struct mvebu_pcie_por=
t *port)
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  401  {
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  402  	struct mvebu_pcie_window desired =3D {.remap =3D MVEBU_MBUS_NO_RE=
MAP};
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  403  	struct pci_bridge_emul_conf *conf =3D &port->bridge.conf;
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  404  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  405  	/* Are the new membase/memlimit values invalid? */
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  406  	if (conf->memlimit < conf->membase ||
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  407  	    !(conf->command & PCI_COMMAND_MEMORY)) {
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  408  		mvebu_pcie_set_window(port, port->mem_target, port->mem_attr,
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  409  				      &desired, &port->memwin);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  410  		return;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  411  	}
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  412  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  413  	/*
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  414  	 * We read the PCI-to-PCI bridge emulated registers, and
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  415  	 * calculate the base address and size of the address decoding
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  416  	 * window to setup, according to the PCI-to-PCI bridge
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  417  	 * specifications.
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  418  	 */
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  419  	desired.base =3D ((conf->membase & 0xFFF0) << 16);
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  420  	desired.size =3D (((conf->memlimit & 0xFFF0) << 16) | 0xFFFFF) -
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  421  		       desired.base + 1;
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  422  =

d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  423  	mvebu_pcie_set_window(port, port->mem_target, port->mem_attr, &de=
sired,
d9bf28e2650fe3 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2016-12-=
12  424  			      &port->memwin);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  425  }
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  426  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  427  static pci_bridge_emul_read_status_t
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  428  mvebu_pci_bridge_emul_pcie_conf_read(struct pci_bridge_emul *bridg=
e,
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  429  				     int reg, u32 *value)
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  430  {
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  431  	struct mvebu_pcie_port *port =3D bridge->data;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  432  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  433  	switch (reg) {
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  434  	case PCI_EXP_DEVCAP:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  435  		*value =3D mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCAP);
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  436  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  437  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  438  	case PCI_EXP_DEVCTL:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  439  		*value =3D mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCTL) &
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  440  				 ~(PCI_EXP_DEVCTL_URRE | PCI_EXP_DEVCTL_FERE |
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  441  				   PCI_EXP_DEVCTL_NFERE | PCI_EXP_DEVCTL_CERE);
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  442  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  443  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  444  	case PCI_EXP_LNKCAP:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  445  		/*
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  446  		 * PCIe requires the clock power management capability to be
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  447  		 * hard-wired to zero for downstream ports
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  448  		 */
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  449  		*value =3D mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_LNKCAP) &
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  450  			 ~PCI_EXP_LNKCAP_CLKPM;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  451  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  452  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  453  	case PCI_EXP_LNKCTL:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  454  		*value =3D mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_LNKCTL);
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  455  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  456  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  457  	case PCI_EXP_SLTCTL:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  458  		*value =3D PCI_EXP_SLTSTA_PDS << 16;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  459  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  460  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  461  	case PCI_EXP_RTSTA:
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  462  		*value =3D mvebu_readl(port, PCIE_RC_RTSTA);
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  463  		break;
dc0352ab0b2a0c drivers/pci/host/pci-mvebu.c       Russell King     2015-10-=
03  464  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  465  	default:
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  466  		return PCI_BRIDGE_EMUL_NOT_HANDLED;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  467  	}
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  468  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  469  	return PCI_BRIDGE_EMUL_HANDLED;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  470  }
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  471  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  472  static void
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  473  mvebu_pci_bridge_emul_base_conf_write(struct pci_bridge_emul *brid=
ge,
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  474  				      int reg, u32 old, u32 new, u32 mask)
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  475  {
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  476  	struct mvebu_pcie_port *port =3D bridge->data;
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  477  	struct pci_bridge_emul_conf *conf =3D &bridge->conf;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  478  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  479  	switch (reg) {
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  480  	case PCI_COMMAND:
43a16f94445310 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  481  	{
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  482  		if (!mvebu_has_ioport(port))
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18 @483  			conf->command &=3D ~PCI_COMMAND_IO;
641e674d6c0f97 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  484  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  485  		if ((old ^ new) & PCI_COMMAND_IO)
43a16f94445310 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  486  			mvebu_pcie_handle_iobase_change(port);
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  487  		if ((old ^ new) & PCI_COMMAND_MEMORY)
43a16f94445310 drivers/pci/host/pci-mvebu.c       Jason Gunthorpe  2013-11-=
26  488  			mvebu_pcie_handle_membase_change(port);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  489  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  490  		break;
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  491  	}
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  492  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  493  	case PCI_IO_BASE:
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  494  		/*
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  495  		 * We keep bit 1 set, it is a read-only bit that
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  496  		 * indicates we support 32 bits addressing for the
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  497  		 * I/O
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  498  		 */
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  499  		conf->iobase |=3D PCI_IO_RANGE_TYPE_32;
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  500  		conf->iolimit |=3D PCI_IO_RANGE_TYPE_32;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  501  		mvebu_pcie_handle_iobase_change(port);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  502  		break;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  503  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  504  	case PCI_MEMORY_BASE:
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  505  		mvebu_pcie_handle_membase_change(port);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  506  		break;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  507  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  508  	case PCI_IO_BASE_UPPER16:
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  509  		mvebu_pcie_handle_iobase_change(port);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  510  		break;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  511  =

45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  512  	case PCI_PRIMARY_BUS:
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  513  		mvebu_pcie_set_local_bus_nr(port, conf->secondary_bus);
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  514  		break;
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  515  =

1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  516  	default:
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  517  		break;
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  518  	}
1f08673eef1236 drivers/pci/controller/pci-mvebu.c Thomas Petazzoni 2018-10-=
18  519  }
45361a4fe44641 drivers/pci/host/pci-mvebu.c       Thomas Petazzoni 2013-05-=
16  520  =


:::::: The code at line 368 was first introduced by commit
:::::: 1f08673eef1236f7d02d93fcf596bb8531ef0d12 PCI: mvebu: Convert to PCI =
emulated bridge config space

:::::: TO: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2593749971614870366==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Ahu/kk7zAQIA
--===============2593749971614870366==--


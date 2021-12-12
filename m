Content-Type: multipart/mixed; boundary="===============1626879361741330963=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/dwc/pcie-kirin.c:321:2: warning: Value stored to 'pdev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 13 Dec 2021 03:05:13 +0800
Message-ID: <202112130331.sD2AP5Nn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1626879361741330963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 61d37547436dce45e3590db72360df0e230ca969 PCI: kirin: Reorganize the=
 PHY logic inside the driver
date:   6 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-c006-20211130 (https://download.01.org/0day-ci/arc=
hive/20211213/202112130331.sD2AP5Nn-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D61d37547436dce45e3590db72360df0e230ca969
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 61d37547436dce45e3590db72360df0e230ca969
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_refcount.c:112:19: note: Value stored to 'agno' during=
 its initialization is never read
           xfs_agnumber_t                  agno =3D cur->bc_ag.pag->pag_agn=
o;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/pci/controller/dwc/pci-keystone.c:260:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:260:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:578:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:578:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:620:17: warning: Value stored =
to 'dev' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:620:17: note: Value stored to =
'dev' during its initialization is never read
           struct device *dev =3D pci->dev;
                          ^~~   ~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:1114:2: warning: Value stored =
to 'ep_ops' is never read [clang-analyzer-deadcode.DeadStores]
           ep_ops =3D data->ep_ops;
           ^        ~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:1114:2: note: Value stored to =
'ep_ops' is never read
           ep_ops =3D data->ep_ops;
           ^        ~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: warning: Value stored =
to 'pci' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-artpec6.c:243:18: note: Value stored to =
'pci' during its initialization is never read
           struct dw_pcie *pci =3D artpec6_pcie->pci;
                           ^~~   ~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/pci/controller/dwc/pcie-kirin.c:321:2: warning: Value stored to =
'pdev' is never read [clang-analyzer-deadcode.DeadStores]
           pdev =3D container_of(dev, struct platform_device, dev);
           ^
   drivers/pci/controller/dwc/pcie-kirin.c:321:2: note: Value stored to 'pd=
ev' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/scrub/dabtree.c:90:47: warning: Access to field 'b_addr' results =
in a dereference of a null pointer (loaded from field 'bp') [clang-analyzer=
-core.NullDereference]
           xfs_da3_node_hdr_from_disk(ds->sc->mp, &hdr, blk->bp->b_addr);
                                                        ^
   fs/xfs/scrub/dabtree.c:485:29: note: Assuming 'whichfork' is not equal t=
o 0
           if (!xfs_ifork_has_extents(XFS_IFORK_PTR(sc->ip, whichfork)))
                                      ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dabtree.c:485:29: note: '?' condition is false
           if (!xfs_ifork_has_extents(XFS_IFORK_PTR(sc->ip, whichfork)))
                                      ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/scrub/dabtree.c:485:29: note: Assuming 'whichfork' is not equal t=
o 1
           if (!xfs_ifork_has_extents(XFS_IFORK_PTR(sc->ip, whichfork)))
                                      ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dabtree.c:485:29: note: '?' condition is false
           if (!xfs_ifork_has_extents(XFS_IFORK_PTR(sc->ip, whichfork)))
                                      ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/scrub/dabtree.c:485:2: note: Taking false branch
           if (!xfs_ifork_has_extents(XFS_IFORK_PTR(sc->ip, whichfork)))
           ^
   fs/xfs/scrub/dabtree.c:496:6: note: 'whichfork' is not equal to XFS_ATTR=
_FORK
           if (whichfork =3D=3D XFS_ATTR_FORK) {
               ^~~~~~~~~
   fs/xfs/scrub/dabtree.c:496:2: note: Taking false branch
           if (whichfork =3D=3D XFS_ATTR_FORK) {
           ^
   fs/xfs/scrub/dabtree.c:511:6: note: 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/dabtree.c:511:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/dabtree.c:518:6: note: Assuming field 'bp' is not equal to =
NULL
           if (blks[level].bp =3D=3D NULL)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dabtree.c:518:2: note: Taking false branch
           if (blks[level].bp =3D=3D NULL)
           ^
   fs/xfs/scrub/dabtree.c:522:9: note: 'level' is >=3D 0
           while (level >=3D 0 && level < XFS_DA_NODE_MAXDEPTH) {
                  ^~~~~
   fs/xfs/scrub/dabtree.c:522:9: note: Left side of '&&' is true
   fs/xfs/scrub/dabtree.c:522:2: note: Loop condition is true.  Entering lo=
op body
           while (level >=3D 0 && level < XFS_DA_NODE_MAXDEPTH) {
           ^
   fs/xfs/scrub/dabtree.c:524:7: note: Assuming field 'magic' is equal to X=
FS_DA_NODE_MAGIC
                   if (blks[level].magic !=3D XFS_DA_NODE_MAGIC) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/dabtree.c:524:3: note: Taking false branch
                   if (blks[level].magic !=3D XFS_DA_NODE_MAGIC) {
                   ^

vim +/pdev +321 drivers/pci/controller/dwc/pcie-kirin.c

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  305  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  306  static int hi3660_pcie_phy_init(struct platform_device *=
pdev,
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  307  				struct kirin_pcie *pcie)
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  308  {
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  309  	struct device *dev =3D &pdev->dev;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  310  	struct hi3660_pcie_phy *phy;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  311  	int ret;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  312  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  313  	phy =3D devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  314  	if (!phy)
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  315  		return -ENOMEM;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  316  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  317  	pcie->phy_priv =3D phy;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  318  	phy->dev =3D dev;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  319  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  320  	/* registers */
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21 @321  	pdev =3D container_of(dev, struct platform_device, dev);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  322  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  323  	ret =3D hi3660_pcie_phy_get_clk(phy);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  324  	if (ret)
fc5165db245ac4 drivers/pci/dwc/pcie-kirin.c            Xiaowei Song        =
  2017-06-19  325  		return ret;
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  326  =

61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  327  	return hi3660_pcie_phy_get_resource(phy);
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  328  }
61d37547436dce drivers/pci/controller/dwc/pcie-kirin.c Mauro Carvalho Cheha=
b 2021-10-21  329  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1626879361741330963==--


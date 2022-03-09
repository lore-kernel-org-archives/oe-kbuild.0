Content-Type: multipart/mixed; boundary="===============2920961711704442351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/msi/msi.c:646:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Wed, 09 Mar 2022 11:56:17 +0800
Message-ID: <202203091151.tGIsnkT5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2920961711704442351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   92f90cc9fe0e7a984ea3d4bf3d120e30ba8a2118
commit: 54324c2f3d728f451d9053fcc7859b26fc9cecb4 PCI/MSI: Split out CONFIG_=
PCI_MSI independent part
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/msi/msi.c:646:4: warning: Assignment of function parameter h=
as no effect outside the function. Did you forget dereferencing it? [useles=
sAssignmentPtrArg]
      entries++;
      ^

vim +646 drivers/pci/msi/msi.c

d9d7070e6117651 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  638  =

7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  639  static v=
oid msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
75cb3426878d479 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  640  {
75cb3426878d479 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  641  	struct =
msi_desc *entry;
75cb3426878d479 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  642  =

7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  643  	if (ent=
ries) {
7112158d97a1539 drivers/pci/msi.c Thomas Gleixner 2021-12-06  644  		for_ea=
ch_pci_msi_entry(entry, dev) {
7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  645  			entri=
es->vector =3D entry->irq;
7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29 @646  			entri=
es++;
7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  647  		}
7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  648  	}
7d5ec3d3612396d drivers/pci/msi.c Thomas Gleixner 2021-07-29  649  }
d7cc609fb679e11 drivers/pci/msi.c Logan Gunthorpe 2019-05-23  650  =


:::::: The code at line 646 was first introduced by commit
:::::: 7d5ec3d3612396dc6d4b76366d20ab9fc06f399f PCI/MSI: Mask all unused MS=
I-X entries

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2920961711704442351==--


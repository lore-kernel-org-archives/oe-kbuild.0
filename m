Content-Type: multipart/mixed; boundary="===============6112242258201562418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/msi/msi.c:646:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Mon, 14 Feb 2022 21:25:20 +0800
Message-ID: <202202142143.51C8EXel-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6112242258201562418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 54324c2f3d728f451d9053fcc7859b26fc9cecb4 PCI/MSI: Split out CONFIG_=
PCI_MSI independent part
date:   10 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 weeks ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/msi/msi.c:646:4: warning: Assignment of function parameter h=
as no effect outside the function. Did you forget dereferencing it? [useles=
sAssignmentPtrArg]
      entries++;
      ^

vim +646 drivers/pci/msi/msi.c

d9d7070e611765 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  638  =

7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  639  static vo=
id msix_update_entries(struct pci_dev *dev, struct msix_entry *entries)
75cb3426878d47 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  640  {
75cb3426878d47 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  641  	struct m=
si_desc *entry;
75cb3426878d47 drivers/pci/msi.c Hidetoshi Seto  2009-08-06  642  =

7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  643  	if (entr=
ies) {
7112158d97a153 drivers/pci/msi.c Thomas Gleixner 2021-12-06  644  		for_eac=
h_pci_msi_entry(entry, dev) {
7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  645  			entrie=
s->vector =3D entry->irq;
7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29 @646  			entrie=
s++;
7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  647  		}
7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  648  	}
7d5ec3d3612396 drivers/pci/msi.c Thomas Gleixner 2021-07-29  649  }
d7cc609fb679e1 drivers/pci/msi.c Logan Gunthorpe 2019-05-23  650  =


:::::: The code at line 646 was first introduced by commit
:::::: 7d5ec3d3612396dc6d4b76366d20ab9fc06f399f PCI/MSI: Mask all unused MS=
I-X entries

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6112242258201562418==--


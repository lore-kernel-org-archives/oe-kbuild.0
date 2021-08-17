Content-Type: multipart/mixed; boundary="===============7903235787593163568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-linux-stable:pending-5.10 80/96] drivers/pci/msi.c:755:4: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Tue, 17 Aug 2021 21:21:00 +0800
Message-ID: <202108172143.JoBV4czK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7903235787593163568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.10
head:   3b1d600f362c132644c723e5361bddbb28d2b958
commit: af6fd39080dc3a0ce40d47997abd7ddba2a16b02 [80/96] PCI/MSI: Mask all =
unused MSI-X entries
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/msi.c:755:4: warning: Assignment of function parameter has n=
o effect outside the function. Did you forget dereferencing it? [uselessAss=
ignmentPtrArg]
      entries++;
      ^

vim +755 drivers/pci/msi.c

d9d7070e611765 Hidetoshi Seto  2009-08-06  747  =

af6fd39080dc3a Thomas Gleixner 2021-07-29  748  static void msix_update_ent=
ries(struct pci_dev *dev, struct msix_entry *entries)
75cb3426878d47 Hidetoshi Seto  2009-08-06  749  {
75cb3426878d47 Hidetoshi Seto  2009-08-06  750  	struct msi_desc *entry;
75cb3426878d47 Hidetoshi Seto  2009-08-06  751  =

5004e98a91e8ad Jiang Liu       2015-07-09  752  	for_each_pci_msi_entry(ent=
ry, dev) {
af6fd39080dc3a Thomas Gleixner 2021-07-29  753  		if (entries) {
af6fd39080dc3a Thomas Gleixner 2021-07-29  754  			entries->vector =3D entr=
y->irq;
af6fd39080dc3a Thomas Gleixner 2021-07-29 @755  			entries++;
af6fd39080dc3a Thomas Gleixner 2021-07-29  756  		}
af6fd39080dc3a Thomas Gleixner 2021-07-29  757  	}
af6fd39080dc3a Thomas Gleixner 2021-07-29  758  }
d7cc609fb679e1 Logan Gunthorpe 2019-05-23  759  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7903235787593163568==--


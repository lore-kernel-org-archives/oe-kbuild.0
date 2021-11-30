Content-Type: multipart/mixed; boundary="===============8628283720679424136=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tglx-devel:msi 67/101] drivers/pci/msi/msi.c:520 msix_setup_msi_descs() error: uninitialized symbol 'ret'.
Date: Tue, 30 Nov 2021 16:35:14 +0800
Message-ID: <202111301651.UmAV0HXb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8628283720679424136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi
head:   1fd2d0e8970556f4495ebc122b6e7f249393022e
commit: 865668a0262e3104a4682cef082467927b630fbf [67/101] PCI/MSI: Use msi_=
add_msi_desc()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-m001-20211128 (https://download.01.org/0day-ci/ar=
chive/20211130/202111301651.UmAV0HXb-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pci/msi/msi.c:520 msix_setup_msi_descs() error: uninitialized symbo=
l 'ret'.

vim +/ret +520 drivers/pci/msi/msi.c

5a05a9d819a328 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  485  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  486  sta=
tic int msix_setup_msi_descs(struct pci_dev *dev, void __iomem *base,
e75eafb9b0395c drivers/pci/msi.c     Thomas Gleixner   2016-09-14  487  			=
	struct msix_entry *entries, int nvec,
b56b352ec3dc0a drivers/pci/msi/msi.c Thomas Gleixner   2021-11-14  488  			=
	struct irq_affinity_desc *masks)
d9d7070e611765 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  489  {
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  490  	in=
t ret, i, vec_count =3D pci_msix_vec_count(dev);
b56b352ec3dc0a drivers/pci/msi/msi.c Thomas Gleixner   2021-11-14  491  	st=
ruct irq_affinity_desc *curmsk;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  492  	st=
ruct msi_desc desc;
7d5ec3d3612396 drivers/pci/msi.c     Thomas Gleixner   2021-07-29  493  	vo=
id __iomem *addr;
4ef33685aa0957 drivers/pci/msi.c     Christoph Hellwig 2016-07-12  494  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  495  	me=
mset(&desc, 0, sizeof(desc));
d9d7070e611765 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  496  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  497  	de=
sc.nvec_used			=3D 1;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  498  	de=
sc.pci.msi_attrib.is_msix	=3D 1;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  499  	de=
sc.pci.msi_attrib.is_64	=3D 1;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  500  	de=
sc.pci.msi_attrib.default_irq	=3D dev->irq;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  501  	de=
sc.pci.mask_base		=3D base;
7d5ec3d3612396 drivers/pci/msi.c     Thomas Gleixner   2021-07-29  502  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  503  	fo=
r (i =3D 0, curmsk =3D masks; i < nvec; i++, curmsk++) {
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  504  		d=
esc.msi_index =3D entries ? entries[i].entry : i;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  505  		d=
esc.affinity =3D masks ? curmsk : NULL;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  506  		d=
esc.pci.msi_attrib.is_virtual =3D desc.msi_index >=3D vec_count;
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  507  		d=
esc.pci.msi_attrib.can_mask =3D !pci_msi_ignore_mask &&
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  508  			=
		       !desc.pci.msi_attrib.is_virtual;
9c8e9c9681a0f3 drivers/pci/msi.c     Thomas Gleixner   2021-11-04  509  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  510  		i=
f (!desc.pci.msi_attrib.can_mask) {
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  511  			=
addr =3D pci_msix_desc_addr(&desc);
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  512  			=
desc.pci.msix_ctrl =3D readl(addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
b296ababcc4bbf drivers/pci/msi.c     Thomas Gleixner   2021-07-29  513  		}
7d5ec3d3612396 drivers/pci/msi.c     Thomas Gleixner   2021-07-29  514  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  515  		r=
et =3D msi_add_msi_desc(&dev->dev, &desc);
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  516  		i=
f (ret)
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  517  			=
break;
d9d7070e611765 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  518  	}
865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09  519  =

865668a0262e31 drivers/pci/msi/msi.c Thomas Gleixner   2021-11-09 @520  	re=
turn ret;
d9d7070e611765 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  521  }
d9d7070e611765 drivers/pci/msi.c     Hidetoshi Seto    2009-08-06  522  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8628283720679424136==--


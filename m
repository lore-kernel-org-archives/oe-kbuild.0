Content-Type: multipart/mixed; boundary="===============5859133682249306878=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tglx-devel:msi 100/101] drivers/pci/msi/msi.c:1050 pci_msix_expand_vectors_at() warn: variable dereferenced before check 'dev' (see line 1046)
Date: Tue, 30 Nov 2021 17:56:51 +0800
Message-ID: <202111301709.vSHraXYF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5859133682249306878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi
head:   1fd2d0e8970556f4495ebc122b6e7f249393022e
commit: 4044aa7eefffadc52424d908337708eaa82cf84c [100/101] PCI/MSI: Provide=
 pci_msix_expand_vectors[_at]()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-m001-20211128 (https://download.01.org/0day-ci/ar=
chive/20211130/202111301709.vSHraXYF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pci/msi/msi.c:1050 pci_msix_expand_vectors_at() warn: variable dere=
ferenced before check 'dev' (see line 1046)

Old smatch warnings:
drivers/pci/msi/msi.c:517 msix_setup_msi_descs() error: uninitialized symbo=
l 'ret'.

vim +/dev +1050 drivers/pci/msi/msi.c

aff171641d181e drivers/pci/msi.c     Christoph Hellwig 2016-07-12  1030  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1031  /**
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1032   *=
 pci_msix_expand_vectors_at - Expand MSI-X interrupts for a device
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1033   *
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1034   *=
 @dev:	PCI device to operate on
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1035   *=
 @at:		Allocate at MSI-X index.
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1036   *=
 @nvec:	Number of vectors to allocate
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1037   *
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1038   *=
 Expand the MSI-X vectors of a device after an initial enablement and
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1039   *=
 allocation.
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1040   *
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1041   *=
 Return: 0 if the allocation was successful, an error code otherwise.
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1042   */
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1043  in=
t pci_msix_expand_vectors_at(struct pci_dev *dev, unsigned int at, unsigned=
 int nvec)
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1044  {
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1045  	s=
truct msi_range range =3D MSI_RANGE_LINEAR(at, nvec);
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22 @1046  	s=
truct msi_device_data *md =3D dev->dev.msi.data;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1047  	u=
nsigned int max_vecs;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1048  	i=
nt ret;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1049  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22 @1050  	i=
f (!pci_msi_enable || !dev || !dev->msix_enabled || !md)
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1051  		=
return -ENOTSUPP;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1052  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1053  	i=
f (!pci_msi_domain_supports_expand(dev))
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1054  		=
return -ENOTSUPP;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1055  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1056  	m=
ax_vecs =3D pci_msix_vec_count(dev);
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1057  	i=
f (!nvec || nvec > max_vecs)
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1058  		=
return -EINVAL;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1059  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1060  	i=
f (at >=3D max_vecs || nvec > max_vecs - at)
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1061  		=
return -ENOSPC;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1062  =

4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1063  	r=
et =3D msix_setup_interrupts(dev, dev->msix_base, &range, NULL, NULL, true);
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1064  	r=
eturn ret <=3D 0 ? ret : -ENOSPC;
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1065  }
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1066  EX=
PORT_SYMBOL_GPL(pci_msix_expand_vectors_at);
4044aa7eefffad drivers/pci/msi/msi.c Thomas Gleixner   2021-11-22  1067  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5859133682249306878==--


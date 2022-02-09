Content-Type: multipart/mixed; boundary="===============7062889078286886984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/irq/msi.c:555 msi_handle_pci_fail() warn: ignoring unreachable code.
Date: Wed, 09 Feb 2022 23:40:16 +0800
Message-ID: <202202092336.cXjVyapN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7062889078286886984==
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
head:   e6251ab4551f51fa4cee03523e08051898c3ce82
commit: 890337624e1fa2da079fc1c036a62d178c985280 genirq/msi: Handle PCI/MSI=
 allocation fail in core code
date:   9 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-m031-20220208 (https://download.01.org/0day-ci/archi=
ve/20220209/202202092336.cXjVyapN-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/irq/msi.c:555 msi_handle_pci_fail() warn: ignoring unreachable code.

vim +555 kernel/irq/msi.c

da5dd9e854d2edd Thomas Gleixner 2017-12-29  540  =

890337624e1fa2d Thomas Gleixner 2021-12-06  541  static int msi_handle_pci_=
fail(struct irq_domain *domain, struct msi_desc *desc,
890337624e1fa2d Thomas Gleixner 2021-12-06  542  			       int allocated)
890337624e1fa2d Thomas Gleixner 2021-12-06  543  {
890337624e1fa2d Thomas Gleixner 2021-12-06  544  	switch(domain->bus_token)=
 {
890337624e1fa2d Thomas Gleixner 2021-12-06  545  	case DOMAIN_BUS_PCI_MSI:
890337624e1fa2d Thomas Gleixner 2021-12-06  546  	case DOMAIN_BUS_VMD_MSI:
890337624e1fa2d Thomas Gleixner 2021-12-06  547  		if (IS_ENABLED(CONFIG_PC=
I_MSI))
890337624e1fa2d Thomas Gleixner 2021-12-06  548  			break;
890337624e1fa2d Thomas Gleixner 2021-12-06  549  		fallthrough;
890337624e1fa2d Thomas Gleixner 2021-12-06  550  	default:
890337624e1fa2d Thomas Gleixner 2021-12-06  551  		return -ENOSPC;
890337624e1fa2d Thomas Gleixner 2021-12-06  552  	}
890337624e1fa2d Thomas Gleixner 2021-12-06  553  =

890337624e1fa2d Thomas Gleixner 2021-12-06  554  	/* Let a failed PCI multi=
 MSI allocation retry */
890337624e1fa2d Thomas Gleixner 2021-12-06 @555  	if (desc->nvec_used > 1)
890337624e1fa2d Thomas Gleixner 2021-12-06  556  		return 1;
890337624e1fa2d Thomas Gleixner 2021-12-06  557  =

890337624e1fa2d Thomas Gleixner 2021-12-06  558  	/* If there was a success=
ful allocation let the caller know */
890337624e1fa2d Thomas Gleixner 2021-12-06  559  	return allocated ? alloca=
ted : -ENOSPC;
890337624e1fa2d Thomas Gleixner 2021-12-06  560  }
890337624e1fa2d Thomas Gleixner 2021-12-06  561  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7062889078286886984==--


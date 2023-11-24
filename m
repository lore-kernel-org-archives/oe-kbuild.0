Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79452C856
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5dD9X8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700836814; x=1732372814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qzmsv3s6NbPZ+YFJdR99rIXkRirhEI+x9mJDPRZbmNI=;
  b=C5dD9X8S794teM7jo+fuke4ZHx2gN5MSrAsnzgvldRw035VFsD9YvRtV
   zatz6WHtdsCAeIZnLaUCeGLRmrymgt1qmuxvofqR4IoxSlgdBdFiuDqzO
   86igSLeGIwqZ56OVpE9SPDg5WkObhM8eYJQU2AXfzwrssT9I+X3VWXddE
   Kmkq7hnEfrYN/9SqttMBczLyUMH8U/bFz/SsYpxh3wm2WCr6AMgrog7u6
   u8JCoAw8TMKrP3DUYovBw+NlM8TQtjOTWUDF3x6sE8xCdRbtEQbr81VMg
   N9VKjDNrziT11MZ3umpe1i8dKLTItwOQbINzI69JmddiVDcWDsK/wmc46
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="395249001"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="395249001"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 06:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="760975144"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="760975144"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 06:40:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6XLh-0002ta-1Q;
	Fri, 24 Nov 2023 14:40:05 +0000
Date: Fri, 24 Nov 2023 22:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202311241507.Af76zcvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pali Rohár" <pali@kernel.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a09972a45ae63efbd1587337c4be13b1893330
commit: 22fdf79171e8509db54599fd2c05ef0022ee83f5 powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-r122-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241507.Af76zcvC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241507.Af76zcvC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311241507.Af76zcvC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *dummy @@     got void [noderef] __iomem * @@
   arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse:     expected unsigned char [usertype] *dummy
   arch/powerpc/platforms/fsl_uli1575.c:236:39: sparse:     got void [noderef] __iomem *
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [usertype] *dummy @@     got void [noderef] __iomem * @@
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse:     expected unsigned char [usertype] *dummy
   arch/powerpc/platforms/fsl_uli1575.c:238:39: sparse:     got void [noderef] __iomem *
>> arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned char const volatile [noderef] [usertype] __iomem *addr @@     got unsigned char [usertype] *dummy @@
   arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse:     expected unsigned char const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/fsl_uli1575.c:240:38: sparse:     got unsigned char [usertype] *dummy
>> arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *dummy @@
   arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse:     expected void volatile [noderef] __iomem *addr
   arch/powerpc/platforms/fsl_uli1575.c:241:41: sparse:     got unsigned char [usertype] *dummy
>> arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *addr @@     got unsigned int * @@
   arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse:     expected restricted __be32 const [usertype] *addr
   arch/powerpc/platforms/fsl_uli1575.c:338:26: sparse:     got unsigned int *
   arch/powerpc/platforms/fsl_uli1575.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false

vim +236 arch/powerpc/platforms/fsl_uli1575.c

b66510cb9992d2 Kumar Gala         2007-08-16  217  
b66510cb9992d2 Kumar Gala         2007-08-16  218  /* We have to do a dummy read on the P2P for the RTC to work, WTF */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  219  static void quirk_final_uli5249(struct pci_dev *dev)
b66510cb9992d2 Kumar Gala         2007-08-16  220  {
b66510cb9992d2 Kumar Gala         2007-08-16  221  	int i;
b66510cb9992d2 Kumar Gala         2007-08-16  222  	u8 *dummy;
b66510cb9992d2 Kumar Gala         2007-08-16  223  	struct pci_bus *bus = dev->bus;
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  224  	struct resource *res;
1fce2d01dff65a Kumar Gala         2008-10-02  225  	resource_size_t end = 0;
1fce2d01dff65a Kumar Gala         2008-10-02  226  
1fce2d01dff65a Kumar Gala         2008-10-02  227  	for (i = PCI_BRIDGE_RESOURCES; i < PCI_BRIDGE_RESOURCES+3; i++) {
1fce2d01dff65a Kumar Gala         2008-10-02  228  		unsigned long flags = pci_resource_flags(dev, i);
1fce2d01dff65a Kumar Gala         2008-10-02  229  		if ((flags & (IORESOURCE_MEM|IORESOURCE_PREFETCH)) == IORESOURCE_MEM)
1fce2d01dff65a Kumar Gala         2008-10-02  230  			end = pci_resource_end(dev, i);
1fce2d01dff65a Kumar Gala         2008-10-02  231  	}
b66510cb9992d2 Kumar Gala         2007-08-16  232  
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  233  	pci_bus_for_each_resource(bus, res, i) {
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  234  		if (res && res->flags & IORESOURCE_MEM) {
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  235  			if (res->end == end)
89a74ecccd1f78 Bjorn Helgaas      2010-02-23 @236  				dummy = ioremap(res->start, 0x4);
1fce2d01dff65a Kumar Gala         2008-10-02  237  			else
89a74ecccd1f78 Bjorn Helgaas      2010-02-23  238  				dummy = ioremap(res->end - 3, 0x4);
b66510cb9992d2 Kumar Gala         2007-08-16  239  			if (dummy) {
b66510cb9992d2 Kumar Gala         2007-08-16 @240  				in_8(dummy);
b66510cb9992d2 Kumar Gala         2007-08-16 @241  				iounmap(dummy);
b66510cb9992d2 Kumar Gala         2007-08-16  242  			}
b66510cb9992d2 Kumar Gala         2007-08-16  243  			break;
b66510cb9992d2 Kumar Gala         2007-08-16  244  		}
b66510cb9992d2 Kumar Gala         2007-08-16  245  	}
b66510cb9992d2 Kumar Gala         2007-08-16  246  }
b66510cb9992d2 Kumar Gala         2007-08-16  247  
b66510cb9992d2 Kumar Gala         2007-08-16  248  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AL, 0x5249, early_uli5249);
b66510cb9992d2 Kumar Gala         2007-08-16  249  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AL, 0x1575, quirk_uli1575);
b66510cb9992d2 Kumar Gala         2007-08-16  250  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AL, 0x5288, quirk_uli5288);
b66510cb9992d2 Kumar Gala         2007-08-16  251  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_AL, 0x5229, quirk_uli5229);
b66510cb9992d2 Kumar Gala         2007-08-16  252  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL, 0x5249, quirk_final_uli5249);
b66510cb9992d2 Kumar Gala         2007-08-16  253  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AL, 0x1575, quirk_final_uli1575);
1433fa7d8da608 Jason Jin          2008-12-04  254  DECLARE_PCI_FIXUP_RESUME(PCI_VENDOR_ID_AL, 0x5229, quirk_uli5229);
b66510cb9992d2 Kumar Gala         2007-08-16  255  
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  256  static void hpcd_quirk_uli1575(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  257  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  258  	u32 temp32;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  259  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  260  	if (!machine_is(mpc86xx_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  261  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  262  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  263  	/* Disable INTx */
52ddd1cdc92380 Anton Vorontsov    2008-06-12  264  	pci_read_config_dword(dev, 0x48, &temp32);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  265  	pci_write_config_dword(dev, 0x48, (temp32 | 1<<26));
52ddd1cdc92380 Anton Vorontsov    2008-06-12  266  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  267  	/* Enable sideband interrupt */
52ddd1cdc92380 Anton Vorontsov    2008-06-12  268  	pci_read_config_dword(dev, 0x90, &temp32);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  269  	pci_write_config_dword(dev, 0x90, (temp32 | 1<<22));
52ddd1cdc92380 Anton Vorontsov    2008-06-12  270  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  271  
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  272  static void hpcd_quirk_uli5288(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  273  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  274  	unsigned char c;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  275  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  276  	if (!machine_is(mpc86xx_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  277  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  278  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  279  	pci_read_config_byte(dev, 0x83, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  280  	c |= 0x80;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  281  	pci_write_config_byte(dev, 0x83, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  282  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  283  	pci_write_config_byte(dev, PCI_CLASS_PROG, 0x01);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  284  	pci_write_config_byte(dev, PCI_CLASS_DEVICE, 0x06);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  285  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  286  	pci_read_config_byte(dev, 0x83, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  287  	c &= 0x7f;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  288  	pci_write_config_byte(dev, 0x83, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  289  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  290  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  291  /*
52ddd1cdc92380 Anton Vorontsov    2008-06-12  292   * Since 8259PIC was disabled on the board, the IDE device can not
52ddd1cdc92380 Anton Vorontsov    2008-06-12  293   * use the legacy IRQ, we need to let the IDE device work under
52ddd1cdc92380 Anton Vorontsov    2008-06-12  294   * native mode and use the interrupt line like other PCI devices.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  295   * IRQ14 is a sideband interrupt from IDE device to CPU and we use this
52ddd1cdc92380 Anton Vorontsov    2008-06-12  296   * as the interrupt for IDE device.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  297   */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  298  static void hpcd_quirk_uli5229(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  299  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  300  	unsigned char c;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  301  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  302  	if (!machine_is(mpc86xx_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  303  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  304  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  305  	pci_read_config_byte(dev, 0x4b, &c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  306  	c |= 0x10;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  307  	pci_write_config_byte(dev, 0x4b, c);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  308  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  309  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  310  /*
52ddd1cdc92380 Anton Vorontsov    2008-06-12  311   * SATA interrupt pin bug fix
52ddd1cdc92380 Anton Vorontsov    2008-06-12  312   * There's a chip bug for 5288, The interrupt pin should be 2,
52ddd1cdc92380 Anton Vorontsov    2008-06-12  313   * not the read only value 1, So it use INTB#, not INTA# which
52ddd1cdc92380 Anton Vorontsov    2008-06-12  314   * actually used by the IDE device 5229.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  315   * As of this bug, during the PCI initialization, 5288 read the
52ddd1cdc92380 Anton Vorontsov    2008-06-12  316   * irq of IDE device from the device tree, this function fix this
52ddd1cdc92380 Anton Vorontsov    2008-06-12  317   * bug by re-assigning a correct irq to 5288.
52ddd1cdc92380 Anton Vorontsov    2008-06-12  318   *
52ddd1cdc92380 Anton Vorontsov    2008-06-12  319   */
cad5cef62a5a0c Greg Kroah-Hartman 2012-12-21  320  static void hpcd_final_uli5288(struct pci_dev *dev)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  321  {
52ddd1cdc92380 Anton Vorontsov    2008-06-12  322  	struct pci_controller *hose = pci_bus_to_host(dev->bus);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  323  	struct device_node *hosenode = hose ? hose->dn : NULL;
530210c7814e83 Grant Likely       2013-09-15  324  	struct of_phandle_args oirq;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  325  	u32 laddr[3];
52ddd1cdc92380 Anton Vorontsov    2008-06-12  326  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  327  	if (!machine_is(mpc86xx_hpcd))
52ddd1cdc92380 Anton Vorontsov    2008-06-12  328  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  329  
52ddd1cdc92380 Anton Vorontsov    2008-06-12  330  	if (!hosenode)
52ddd1cdc92380 Anton Vorontsov    2008-06-12  331  		return;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  332  
2361613206e66c Grant Likely       2013-09-15  333  	oirq.np = hosenode;
2361613206e66c Grant Likely       2013-09-15  334  	oirq.args[0] = 2;
2361613206e66c Grant Likely       2013-09-15  335  	oirq.args_count = 1;
52ddd1cdc92380 Anton Vorontsov    2008-06-12  336  	laddr[0] = (hose->first_busno << 16) | (PCI_DEVFN(31, 0) << 8);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  337  	laddr[1] = laddr[2] = 0;
2361613206e66c Grant Likely       2013-09-15 @338  	of_irq_parse_raw(laddr, &oirq);
e6d30ab1e7d128 Grant Likely       2013-09-15  339  	dev->irq = irq_create_of_mapping(&oirq);
52ddd1cdc92380 Anton Vorontsov    2008-06-12  340  }
52ddd1cdc92380 Anton Vorontsov    2008-06-12  341  

:::::: The code at line 236 was first introduced by commit
:::::: 89a74ecccd1f78e51faf6287e5c0e93a92ac096e PCI: add pci_bus_for_each_resource(), remove direct bus->resource[] refs

:::::: TO: Bjorn Helgaas <bjorn.helgaas@hp.com>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

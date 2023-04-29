Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD61FD3
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682781548; x=1714317548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AqiVL9aGLvNmKcN/ex1Ay8XEmL5GX50juQpfkdlVOXQ=;
  b=jf+Xl6olyS9akecCKV6FLBmDNOTx4/Bpz1Qf2gU2i2vaI3w2wTL04ZVi
   KgNJvUEQqsewMA4da/UgBv+AYGUH2k+FpH2t1Qdd097lXZBLMKWAmoMCC
   F438Sd0NW5vF6LVro3qekTQDkU4xAjnymNHzM/sDY/IFuQ7r5gZoM94hs
   +Sam+0Q5oviEOXP0k6m2vHJfRw0sZfJRY0xN4h9zslPHxQwGhIVWcL8qD
   sX74A1jIDes+D5UVi2at9t4Qmmr484WVMrvR5xqT8FFkyndj5ZKuFx5OS
   nFcY+af9AaxGQJ1oBTob9ih3pF5X4r5yLXxyFN6VjRfhFvK1bk+GM6xt2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="345406240"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="345406240"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 08:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="697954647"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="697954647"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 08:19:06 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psmLp-0001E9-2j;
	Sat, 29 Apr 2023 15:19:05 +0000
Date: Sat, 29 Apr 2023 23:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/ips.c:7035 ips_init_phase1() warn: 'ioremap_ptr' from
 ioremap() not released on lines:
 6899,6929,6942,6951,6963,6973,6981,6989,7003.
Message-ID: <202304292341.wY3Cep4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Will Deacon <will@kernel.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89d77f71f493a3663b10fa812d17f472935d24be
commit: f23eab0bfaefb3319c7de90c9c632bebf53a03bc arm64: mm: Convert to GENERIC_IOREMAP
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230429/202304292341.wY3Cep4i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304292341.wY3Cep4i-lkp@intel.com/

New smatch warnings:
drivers/scsi/ips.c:7035 ips_init_phase1() warn: 'ioremap_ptr' from ioremap() not released on lines: 6899,6929,6942,6951,6963,6973,6981,6989,7003.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:734 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:812 netxen_setup_pci_map() warn: 'ahw->pci_base0' from ioremap() not released on lines: 812.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:812 netxen_setup_pci_map() warn: 'ahw->pci_base1' from ioremap() not released on lines: 812.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:812 netxen_setup_pci_map() warn: 'ahw->pci_base1' from ioremap() not released on lines: 812.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:812 netxen_setup_pci_map() warn: 'ahw->pci_base2' from ioremap() not released on lines: 812.
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:812 netxen_setup_pci_map() warn: 'ahw->pci_base2' from ioremap() not released on lines: 812.

Old smatch warnings:
drivers/scsi/ips.c:2051 ips_host_info() warn: argument 3 to %lx specifier is cast from pointer
drivers/scsi/ips.c:2081 ips_host_info() warn: inconsistent indenting
drivers/scsi/ips.c:3206 ips_done() warn: variable dereferenced before check 'scb->scsi_cmd' (see line 3167)
drivers/scsi/ips.c:3214 ips_done() warn: variable dereferenced before check 'scb->scsi_cmd' (see line 3167)
drivers/scsi/ips.c:6899 ips_init_phase1() warn: returning -1 instead of -ENOMEM is sloppy
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:735 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:737 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:750 netxen_setup_pci_map() warn: consider using resource_size() here
drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c:751 netxen_setup_pci_map() warn: consider using resource_size() here

vim +/ioremap_ptr +7035 drivers/scsi/ips.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  6822  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6823  /*---------------------------------------------------------------------------*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  6824  /*   Routine Name: ips_init_phase1                                           */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6825  /*                                                                           */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6826  /*   Routine Description:                                                    */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6827  /*     Adapter Initialization                                                */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6828  /*                                                                           */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6829  /*   Return Value:                                                           */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6830  /*     0 if Successful, else non-zero                                        */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6831  /*---------------------------------------------------------------------------*/
^1da177e4c3f41 Linus Torvalds    2005-04-16  6832  static int
^1da177e4c3f41 Linus Torvalds    2005-04-16  6833  ips_init_phase1(struct pci_dev *pci_dev, int *indexPtr)
^1da177e4c3f41 Linus Torvalds    2005-04-16  6834  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6835  	ips_ha_t *ha;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6836  	uint32_t io_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6837  	uint32_t mem_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6838  	uint32_t io_len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6839  	uint32_t mem_len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6840  	int j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6841  	int index;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6842  	dma_addr_t dma_address;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6843  	char __iomem *ioremap_ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6844  	char __iomem *mem_ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6845  	uint32_t IsDead;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6846  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6847  	METHOD_TRACE("ips_init_phase1", 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6848  	index = IPS_MAX_ADAPTERS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6849  	for (j = 0; j < IPS_MAX_ADAPTERS; j++) {
21e1a5f26c4375 Jeff Garzik       2007-12-13  6850  		if (ips_ha[j] == NULL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6851  			index = j;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6852  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6853  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6854  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6855  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6856  	if (index >= IPS_MAX_ADAPTERS)
^1da177e4c3f41 Linus Torvalds    2005-04-16  6857  		return -1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6858  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6859  	/* Init MEM/IO addresses to 0 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6860  	mem_addr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6861  	io_addr = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6862  	mem_len = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6863  	io_len = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6864  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6865  	for (j = 0; j < 2; j++) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6866  		if (!pci_resource_start(pci_dev, j))
^1da177e4c3f41 Linus Torvalds    2005-04-16  6867  			break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6868  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6869  		if (pci_resource_flags(pci_dev, j) & IORESOURCE_IO) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6870  			io_addr = pci_resource_start(pci_dev, j);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6871  			io_len = pci_resource_len(pci_dev, j);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6872  		} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6873  			mem_addr = pci_resource_start(pci_dev, j);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6874  			mem_len = pci_resource_len(pci_dev, j);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6875  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6876  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6877  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6878  	/* setup memory mapped area (if applicable) */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6879  	if (mem_addr) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6880  		uint32_t base;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6881  		uint32_t offs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6882  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6883  		base = mem_addr & PAGE_MASK;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6884  		offs = mem_addr - base;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6885  		ioremap_ptr = ioremap(base, PAGE_SIZE);
21e1a5f26c4375 Jeff Garzik       2007-12-13  6886  		if (!ioremap_ptr)
21e1a5f26c4375 Jeff Garzik       2007-12-13  6887  			return -1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6888  		mem_ptr = ioremap_ptr + offs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6889  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6890  		ioremap_ptr = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6891  		mem_ptr = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6892  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6893  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6894  	/* found a controller */
dd00cc486ab1c1 Yoann Padioleau   2007-07-19  6895  	ha = kzalloc(sizeof (ips_ha_t), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6896  	if (ha == NULL) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6897  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6898  			   "Unable to allocate temporary ha struct\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6899  		return -1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6900  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6901  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6902  	ips_sh[index] = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6903  	ips_ha[index] = ha;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6904  	ha->active = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6905  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6906  	/* Store info in HA structure */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6907  	ha->io_addr = io_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6908  	ha->io_len = io_len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6909  	ha->mem_addr = mem_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6910  	ha->mem_len = mem_len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6911  	ha->mem_ptr = mem_ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6912  	ha->ioremap_ptr = ioremap_ptr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6913  	ha->host_num = (uint32_t) index;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6914  	ha->slot_num = PCI_SLOT(pci_dev->devfn);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6915  	ha->pcidev = pci_dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6916  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6917  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  6918  	 * Set the pci_dev's dma_mask.  Not all adapters support 64bit
^1da177e4c3f41 Linus Torvalds    2005-04-16  6919  	 * addressing so don't enable it if the adapter can't support
^1da177e4c3f41 Linus Torvalds    2005-04-16  6920  	 * it!  Also, don't use 64bit addressing if dma addresses
^1da177e4c3f41 Linus Torvalds    2005-04-16  6921  	 * are guaranteed to be < 4G.
^1da177e4c3f41 Linus Torvalds    2005-04-16  6922  	 */
88693b3c9681a0 Christoph Hellwig 2018-10-18  6923  	if (sizeof(dma_addr_t) > 4 && IPS_HAS_ENH_SGLIST(ha) &&
32e76961dd63eb Christoph Hellwig 2018-10-11  6924  	    !dma_set_mask(&ha->pcidev->dev, DMA_BIT_MASK(64))) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6925  		(ha)->flags |= IPS_HA_ENH_SG;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6926  	} else {
32e76961dd63eb Christoph Hellwig 2018-10-11  6927  		if (dma_set_mask(&ha->pcidev->dev, DMA_BIT_MASK(32)) != 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6928  			printk(KERN_WARNING "Unable to set DMA Mask\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6929  			return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6930  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6931  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6932  	if(ips_cd_boot && !ips_FlashData){
32e76961dd63eb Christoph Hellwig 2018-10-11  6933  		ips_FlashData = dma_alloc_coherent(&pci_dev->dev,
32e76961dd63eb Christoph Hellwig 2018-10-11  6934  				PAGE_SIZE << 7, &ips_flashbusaddr, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6935  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6936  
32e76961dd63eb Christoph Hellwig 2018-10-11  6937  	ha->enq = dma_alloc_coherent(&pci_dev->dev, sizeof (IPS_ENQ),
32e76961dd63eb Christoph Hellwig 2018-10-11  6938  			&ha->enq_busaddr, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6939  	if (!ha->enq) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6940  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6941  			   "Unable to allocate host inquiry structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6942  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6943  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6944  
32e76961dd63eb Christoph Hellwig 2018-10-11  6945  	ha->adapt = dma_alloc_coherent(&pci_dev->dev,
32e76961dd63eb Christoph Hellwig 2018-10-11  6946  			sizeof (IPS_ADAPTER) + sizeof (IPS_IO_CMD),
32e76961dd63eb Christoph Hellwig 2018-10-11  6947  			&dma_address, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6948  	if (!ha->adapt) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6949  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6950  			   "Unable to allocate host adapt & dummy structures\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6951  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6952  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6953  	ha->adapt->hw_status_start = dma_address;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6954  	ha->dummy = (void *) (ha->adapt + 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6955  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6956  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6957  
32e76961dd63eb Christoph Hellwig 2018-10-11  6958  	ha->logical_drive_info = dma_alloc_coherent(&pci_dev->dev,
32e76961dd63eb Christoph Hellwig 2018-10-11  6959  			sizeof (IPS_LD_INFO), &dma_address, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6960  	if (!ha->logical_drive_info) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6961  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6962  			   "Unable to allocate logical drive info structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6963  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6964  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6965  	ha->logical_drive_info_dma_addr = dma_address;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6966  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6967  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6968  	ha->conf = kmalloc(sizeof (IPS_CONF), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6969  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6970  	if (!ha->conf) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6971  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6972  			   "Unable to allocate host conf structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6973  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6974  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6975  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6976  	ha->nvram = kmalloc(sizeof (IPS_NVRAM_P5), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6977  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6978  	if (!ha->nvram) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6979  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6980  			   "Unable to allocate host NVRAM structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6981  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6982  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6983  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6984  	ha->subsys = kmalloc(sizeof (IPS_SUBSYS), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6985  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6986  	if (!ha->subsys) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  6987  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  6988  			   "Unable to allocate host subsystem structure\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  6989  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6990  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  6991  
^1da177e4c3f41 Linus Torvalds    2005-04-16  6992  	/* the ioctl buffer is now used during adapter initialization, so its
^1da177e4c3f41 Linus Torvalds    2005-04-16  6993  	 * successful allocation is now required */
^1da177e4c3f41 Linus Torvalds    2005-04-16  6994  	if (ips_ioctlsize < PAGE_SIZE)
^1da177e4c3f41 Linus Torvalds    2005-04-16  6995  		ips_ioctlsize = PAGE_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  6996  
32e76961dd63eb Christoph Hellwig 2018-10-11  6997  	ha->ioctl_data = dma_alloc_coherent(&pci_dev->dev, ips_ioctlsize,
32e76961dd63eb Christoph Hellwig 2018-10-11  6998  			&ha->ioctl_busaddr, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  6999  	ha->ioctl_len = ips_ioctlsize;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7000  	if (!ha->ioctl_data) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7001  		IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  7002  			   "Unable to allocate IOCTL data\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  7003  		return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7004  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7005  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7006  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7007  	 * Setup Functions
^1da177e4c3f41 Linus Torvalds    2005-04-16  7008  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7009  	ips_setup_funclist(ha);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7010  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7011  	if ((IPS_IS_MORPHEUS(ha)) || (IPS_IS_MARCO(ha))) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7012  		/* If Morpheus appears dead, reset it */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7013  		IsDead = readl(ha->mem_ptr + IPS_REG_I960_MSG1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7014  		if (IsDead == 0xDEADBEEF) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7015  			ips_reset_morpheus(ha);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7016  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7017  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7018  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7019  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7020  	 * Initialize the card if it isn't already
^1da177e4c3f41 Linus Torvalds    2005-04-16  7021  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7022  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7023  	if (!(*ha->func.isinit) (ha)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7024  		if (!(*ha->func.init) (ha)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  7025  			/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  7026  			 * Initialization failed
^1da177e4c3f41 Linus Torvalds    2005-04-16  7027  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  7028  			IPS_PRINTK(KERN_WARNING, pci_dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  7029  				   "Unable to initialize controller\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  7030  			return ips_abort_init(ha, index);
^1da177e4c3f41 Linus Torvalds    2005-04-16  7031  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7032  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  7033  
^1da177e4c3f41 Linus Torvalds    2005-04-16  7034  	*indexPtr = index;
^1da177e4c3f41 Linus Torvalds    2005-04-16 @7035  	return SUCCESS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  7036  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  7037  

:::::: The code at line 7035 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

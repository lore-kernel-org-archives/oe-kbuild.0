Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1101F199
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Sep 2023 14:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695394230; x=1726930230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2GPiPH9jsvqlRVQX/+MCoODU0+A8Fy3wlX1/Y74Mf88=;
  b=DjDbmNMM6x4kE+mrCXC/qAB3aajV/i5lTm+DxxZjeMiYCWpX4OuBfn3N
   4HbkgExnsd1TlS8gWcNpZouvdPoADFjvrqEfzJ/nFF2WBGsFHYJXch0rR
   OERfQ4iKINMXC0MBWkmTiO295NcsCvGBPG/z8lSBJoyP8607mHokmrJYa
   c4FM5psKjfuHUw0d0HHryElzScrdsnqyHw6+IOVKDhtnd0Emhf9RRNL+q
   Fpoi1PzZC2Cft05w8WTrgrYMoC0oy5/21s+yCf8aCSVklLAbDi8uf2hkv
   qi+ESjjJPdN2S3KVxCMPRlcxbJXisnHtxZhBKaMq8bHhmnNFFGzyZ0/xb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="371162356"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="371162356"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:50:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="813087325"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="813087325"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Sep 2023 07:50:28 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjhUA-0000rt-0p;
	Fri, 22 Sep 2023 14:50:26 +0000
Date: Fri, 22 Sep 2023 22:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/amd/init.c:1114 __copy_device_table() warn:
 'old_devtb' from ioremap_encrypted() not released on lines: 1075,1106.
Message-ID: <202309222240.y2C8i9FN-lkp@intel.com>
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
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: 0715fdb03e2c4f5748d245a231e422602ed29f33 docs: bump minimal GNU Make version to 3.82
date:   12 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230922 (https://download.01.org/0day-ci/archive/20230922/202309222240.y2C8i9FN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309222240.y2C8i9FN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309222240.y2C8i9FN-lkp@intel.com/

smatch warnings:
drivers/iommu/amd/init.c:1114 __copy_device_table() warn: 'old_devtb' from ioremap_encrypted() not released on lines: 1075,1106.

vim +/old_devtb +1114 drivers/iommu/amd/init.c

c5cca146aa03e1 arch/x86/kernel/amd_iommu_init.c Joerg Roedel          2009-10-09  1026  
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1027  static bool __copy_device_table(struct amd_iommu *iommu)
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1028  {
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1029  	u64 int_ctl, int_tab_len, entry = 0;
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1030  	struct amd_iommu_pci_seg *pci_seg = iommu->pci_seg;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1031  	struct dev_table_entry *old_devtb = NULL;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1032  	u32 lo, hi, devid, old_devtb_size;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1033  	phys_addr_t old_devtb_phys;
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1034  	u16 dom_id, dte_v, irq_v;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1035  	gfp_t gfp_flag;
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1036  	u64 tmp;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1037  
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1038  	/* Each IOMMU use separate device table with the same size */
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1039  	lo = readl(iommu->mmio_base + MMIO_DEV_TABLE_OFFSET);
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1040  	hi = readl(iommu->mmio_base + MMIO_DEV_TABLE_OFFSET + 4);
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1041  	entry = (((u64) hi) << 32) + lo;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1042  
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1043  	old_devtb_size = ((entry & ~PAGE_MASK) + 1) << 12;
b5c852907e0e8a drivers/iommu/amd/init.c         Vasant Hegde          2022-07-06  1044  	if (old_devtb_size != pci_seg->dev_table_size) {
3c6bae62136ba5 drivers/iommu/amd_iommu_init.c   Arvind Yadav          2017-09-26  1045  		pr_err("The device table size of IOMMU:%d is not expected!\n",
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1046  			iommu->index);
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1047  		return false;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1048  	}
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1049  
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1050  	/*
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1051  	 * When SME is enabled in the first kernel, the entry includes the
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1052  	 * memory encryption mask(sme_me_mask), we must remove the memory
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1053  	 * encryption mask to obtain the true physical address in kdump kernel.
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1054  	 */
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1055  	old_devtb_phys = __sme_clr(entry) & PAGE_MASK;
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1056  
b336781b82cc12 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1057  	if (old_devtb_phys >= 0x100000000ULL) {
3c6bae62136ba5 drivers/iommu/amd_iommu_init.c   Arvind Yadav          2017-09-26  1058  		pr_err("The address of old device table is above 4G, not trustworthy!\n");
b336781b82cc12 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1059  		return false;
b336781b82cc12 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1060  	}
32cb4d02fb02ca drivers/iommu/amd/init.c         Tom Lendacky          2021-09-08  1061  	old_devtb = (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) && is_kdump_kernel())
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1062  		    ? (__force void *)ioremap_encrypted(old_devtb_phys,
b5c852907e0e8a drivers/iommu/amd/init.c         Vasant Hegde          2022-07-06  1063  							pci_seg->dev_table_size)
b5c852907e0e8a drivers/iommu/amd/init.c         Vasant Hegde          2022-07-06  1064  		    : memremap(old_devtb_phys, pci_seg->dev_table_size, MEMREMAP_WB);
8780158cf977ea drivers/iommu/amd_iommu_init.c   Lianbo Jiang          2018-09-30  1065  
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1066  	if (!old_devtb)
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1067  		return false;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1068  
b336781b82cc12 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1069  	gfp_flag = GFP_KERNEL | __GFP_ZERO | GFP_DMA32;
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1070  	pci_seg->old_dev_tbl_cpy = (void *)__get_free_pages(gfp_flag,
b5c852907e0e8a drivers/iommu/amd/init.c         Vasant Hegde          2022-07-06  1071  						    get_order(pci_seg->dev_table_size));
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1072  	if (pci_seg->old_dev_tbl_cpy == NULL) {
3c6bae62136ba5 drivers/iommu/amd_iommu_init.c   Arvind Yadav          2017-09-26  1073  		pr_err("Failed to allocate memory for copying old device table!\n");
434d2defa93b59 drivers/iommu/amd/init.c         Vasant Hegde          2022-03-01  1074  		memunmap(old_devtb);
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1075  		return false;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1076  	}
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1077  
401360ec98c61b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1078  	for (devid = 0; devid <= pci_seg->last_bdf; ++devid) {
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1079  		pci_seg->old_dev_tbl_cpy[devid] = old_devtb[devid];
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1080  		dom_id = old_devtb[devid].data[1] & DEV_DOMID_MASK;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1081  		dte_v = old_devtb[devid].data[0] & DTE_FLAG_V;
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1082  
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1083  		if (dte_v && dom_id) {
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1084  			pci_seg->old_dev_tbl_cpy[devid].data[0] = old_devtb[devid].data[0];
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1085  			pci_seg->old_dev_tbl_cpy[devid].data[1] = old_devtb[devid].data[1];
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1086  			__set_bit(dom_id, amd_iommu_pd_alloc_bitmap);
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1087  			/* If gcr3 table existed, mask it out */
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1088  			if (old_devtb[devid].data[0] & DTE_FLAG_GV) {
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1089  				tmp = DTE_GCR3_VAL_B(~0ULL) << DTE_GCR3_SHIFT_B;
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1090  				tmp |= DTE_GCR3_VAL_C(~0ULL) << DTE_GCR3_SHIFT_C;
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1091  				pci_seg->old_dev_tbl_cpy[devid].data[1] &= ~tmp;
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1092  				tmp = DTE_GCR3_VAL_A(~0ULL) << DTE_GCR3_SHIFT_A;
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1093  				tmp |= DTE_FLAG_GV;
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1094  				pci_seg->old_dev_tbl_cpy[devid].data[0] &= ~tmp;
daae2d25a4779b drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1095  			}
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1096  		}
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1097  
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1098  		irq_v = old_devtb[devid].data[2] & DTE_IRQ_REMAP_ENABLE;
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1099  		int_ctl = old_devtb[devid].data[2] & DTE_IRQ_REMAP_INTCTL_MASK;
5ae9a046a452d6 drivers/iommu/amd/init.c         Suravee Suthikulpanit 2020-12-10  1100  		int_tab_len = old_devtb[devid].data[2] & DTE_INTTABLEN_MASK;
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1101  		if (irq_v && (int_ctl || int_tab_len)) {
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1102  			if ((int_ctl != DTE_IRQ_REMAP_INTCTL) ||
5ae9a046a452d6 drivers/iommu/amd/init.c         Suravee Suthikulpanit 2020-12-10  1103  			    (int_tab_len != DTE_INTTABLEN)) {
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1104  				pr_err("Wrong old irq remapping flag: %#x\n", devid);
434d2defa93b59 drivers/iommu/amd/init.c         Vasant Hegde          2022-03-01  1105  				memunmap(old_devtb);
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1106  				return false;
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1107  			}
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1108  
eb21ef0227915b drivers/iommu/amd/init.c         Suravee Suthikulpanit 2022-07-06  1109  			pci_seg->old_dev_tbl_cpy[devid].data[2] = old_devtb[devid].data[2];
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1110  		}
53019a9e88cc14 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1111  	}
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1112  	memunmap(old_devtb);
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1113  
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09 @1114  	return true;
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1115  }
45a01c42933b93 drivers/iommu/amd_iommu_init.c   Baoquan He            2017-08-09  1116  

:::::: The code at line 1114 was first introduced by commit
:::::: 45a01c42933b93e59811099f97aa4179d499a42c iommu/amd: Add function copy_dev_tables()

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

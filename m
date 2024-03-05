Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFF18627
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Mar 2024 02:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709605292; cv=none; b=sKg1juudCxGbRGlSmUbTzH8R8E4O3S+eX/U5JxgqTLV6MMYTkYqGuncj8mDdH8p9xcVK4PRKixeil6N32OMVSLusXFe/3ooJl/dJCxH+EB7KezC7lzXUNekpO3H4cbpQ2r+L3XaIocTiE64hlqJvhI+qWkZFWy29McPoaqzcZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709605292; c=relaxed/simple;
	bh=Sms/NPQ4fpMGNM/S1i33HuVomedm1H0eYYtTHpTl7Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sj0ILoMtFrz/4eREJYCWnswJmOfdNqA02OdhjN3OFw0mzMZG0jK9dlQUbFIu+g70ftxL23wXE04HwLXB4v/aHIV0wT1lsfrHsmeRg3TU9m66aCtbO+q7579JBiw1Q64HaRWvjBmTX0naqhv3eAQPcQs8EA8TWEa4I3S0LhGEfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2d8uLhn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2d8uLhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709605290; x=1741141290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sms/NPQ4fpMGNM/S1i33HuVomedm1H0eYYtTHpTl7Rc=;
  b=E2d8uLhnF78jqfFz0Ui1mtVEkurwf1JUPeDm2ffSWGAPYt2OmmsZepeG
   R48uWHDPlHNfzozJ8DoZGZyMBD/85kAw/FYp2A4+B0N7VZf8uAIbif1oF
   OqjM+9ID3pMhuPcwatlwUUe9DXJUqaoP/f4MRAomiQ1qWIYq0E8D9DXf2
   WldTi1vKKziax9RMGotyP63X4NCFaS4Kg9N0hjV1LbGImaxDKs8k4Gyol
   MC2ybSJPEYbXfX1piJU+85DgWOm1iqPJu7XyXKIm4vmN7z8F6bVULyozb
   yDIXI1x1uhSbf2pXm1ntuHuU5oQ/d+luNvZEMl5yJm9dkahp6subT+NOQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21662879"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="21662879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 18:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9155185"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2024 18:21:27 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhKQn-0002v7-0X;
	Tue, 05 Mar 2024 02:21:25 +0000
Date: Tue, 5 Mar 2024 10:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:7618 base_alloc_rdpq_dma_pool()
 warn: KERN_* level not at start of string
Message-ID: <202403051018.xIL8XsUZ-lkp@intel.com>
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
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 1549c764245c433658fc299210efea4c91365b89 driver: update mpt3sas from 32.00.00.00 to 37.00.00.00
date:   2 years, 10 months ago
:::::: branch date: 5 months ago
:::::: commit date: 2 years, 10 months ago
config: x86_64-randconfig-161-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051018.xIL8XsUZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403051018.xIL8XsUZ-lkp@intel.com/

New smatch warnings:
drivers/scsi/mpt3sas/mpt3sas_base.c:7618 base_alloc_rdpq_dma_pool() warn: KERN_* level not at start of string
drivers/scsi/mpt3sas/mpt3sas_base.c:7770 _base_allocate_chain_dma_pool() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:8322 _base_allocate_memory_pools() error: uninitialized symbol 'ct'.
drivers/scsi/mpt3sas/mpt3sas_base.c:8378 _base_allocate_memory_pools() warn: if statement not indented
drivers/scsi/mpt3sas/mpt3sas_base.c:8425 _base_allocate_memory_pools() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:8894 _base_send_ioc_init() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:7917 _scsih_update_vphys_after_reset() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_transport.c:1079 mpt3sas_transport_port_remove() error: dereferencing freed memory 'port'

Old smatch warnings:
drivers/scsi/mpt3sas/mpt3sas_base.c:1030 mpt3sas_base_start_watchdog() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:1092 mpt3sas_base_start_hba_unplug_watchdog() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:1152 mpt3sas_base_start_smart_polling() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:2987 base_mod64() warn: KERN_* level not at start of string
drivers/scsi/mpt3sas/mpt3sas_base.c:3655 _base_build_sg_scmd_ieee() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:4969 _base_diag_reset() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:4988 _base_diag_reset() warn: curly braces intended?
drivers/scsi/mpt3sas/mpt3sas_base.c:5470 mpt3sas_base_map_resources() warn: 'ioc->chip' from ioremap() not released on lines: 5470.
drivers/scsi/mpt3sas/mpt3sas_base.c:7628 base_alloc_rdpq_dma_pool() warn: KERN_* level not at start of string
drivers/scsi/mpt3sas/mpt3sas_base.c:7771 _base_allocate_chain_dma_pool() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_base.c:8329 _base_allocate_memory_pools() error: uninitialized symbol 'ct'.
drivers/scsi/mpt3sas/mpt3sas_base.c:8331 _base_allocate_memory_pools() warn: missing unwind goto?
drivers/scsi/mpt3sas/mpt3sas_base.c:8331 _base_allocate_memory_pools() warn: missing unwind goto?
drivers/scsi/mpt3sas/mpt3sas_base.c:9505 _base_make_ioc_operational() warn: missing error code? 'r'
drivers/scsi/mpt3sas/mpt3sas_base.c:9748 mpt3sas_base_attach() warn: missing error code 'r'
drivers/scsi/mpt3sas/mpt3sas_scsih.c:2916 _scsih_enable_tlr() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:3054 _scsih_slave_configure() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:5912 _scsih_check_pcie_topo_remove_events() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:6375 _scsih_setup_eedp() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8827 _scsih_expander_add() warn: returning -1 instead of -ENOMEM is sloppy
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8902 _scsih_expander_add() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:8848 _scsih_expander_add() warn: missing error code 'rc'
drivers/scsi/mpt3sas/mpt3sas_scsih.c:11979 _scsih_sas_broadcast_primitive_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:12128 _scsih_sas_discovery_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:12202 _scsih_pcie_enumeration_event() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:13970 _scsih_scan_for_devices_after_reset() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_scsih.c:14906 _scsih_probe_boot_devices() warn: inconsistent indenting
drivers/scsi/mpt3sas/mpt3sas_transport.c:708 mpt3sas_transport_add_phy_to_an_existing_port() warn: inconsistent indenting

vim +7618 drivers/scsi/mpt3sas/mpt3sas_base.c

1549c764245c43 Fuhai Wang 2021-04-25  7581  
1549c764245c43 Fuhai Wang 2021-04-25  7582  /**
1549c764245c43 Fuhai Wang 2021-04-25  7583   * base_alloc_rdpq_dma_pool - Allocating DMA'able memory
1549c764245c43 Fuhai Wang 2021-04-25  7584   *			for reply queues.
1549c764245c43 Fuhai Wang 2021-04-25  7585   * @ioc: Adapter object
1549c764245c43 Fuhai Wang 2021-04-25  7586   * @sz: DMA Pool size
1549c764245c43 Fuhai Wang 2021-04-25  7587   * Return: 0 for success, non-zero for failure.
1549c764245c43 Fuhai Wang 2021-04-25  7588   */
1549c764245c43 Fuhai Wang 2021-04-25  7589  static int
1549c764245c43 Fuhai Wang 2021-04-25  7590  base_alloc_rdpq_dma_pool(struct MPT3SAS_ADAPTER *ioc, int sz)
1549c764245c43 Fuhai Wang 2021-04-25  7591  {
1549c764245c43 Fuhai Wang 2021-04-25  7592  	int i = 0;
1549c764245c43 Fuhai Wang 2021-04-25  7593  	u32 dma_alloc_count = 0;
1549c764245c43 Fuhai Wang 2021-04-25  7594  	int reply_post_free_sz = ioc->reply_post_queue_depth *
1549c764245c43 Fuhai Wang 2021-04-25  7595  		sizeof(Mpi2DefaultReplyDescriptor_t);
1549c764245c43 Fuhai Wang 2021-04-25  7596  	int count = ioc->rdpq_array_enable ? ioc->reply_queue_count : 1;
1549c764245c43 Fuhai Wang 2021-04-25  7597  	ioc->reply_post = kcalloc(count, sizeof(struct reply_post_struct), GFP_KERNEL);
1549c764245c43 Fuhai Wang 2021-04-25  7598  	if (!ioc->reply_post) {
1549c764245c43 Fuhai Wang 2021-04-25  7599  		printk(MPT3SAS_ERR_FMT
1549c764245c43 Fuhai Wang 2021-04-25  7600  		    "reply_post_free pool: kcalloc failed\n", ioc->name);
1549c764245c43 Fuhai Wang 2021-04-25  7601  		return -ENOMEM;
1549c764245c43 Fuhai Wang 2021-04-25  7602  	}
1549c764245c43 Fuhai Wang 2021-04-25  7603  	/*
1549c764245c43 Fuhai Wang 2021-04-25  7604  	 *  For INVADER_SERIES each set of 8 reply queues(0-7, 8-15, ..) and
1549c764245c43 Fuhai Wang 2021-04-25  7605  	 *  VENTURA_SERIES each set of 16 reply queues(0-15, 16-31, ..) should
1549c764245c43 Fuhai Wang 2021-04-25  7606  	 *  be within 4GB boundary and also reply queues in a set must have same
1549c764245c43 Fuhai Wang 2021-04-25  7607  	 *  upper 32-bits in their memory address. so here driver is allocating
1549c764245c43 Fuhai Wang 2021-04-25  7608  	 *  the DMA'able memory for reply queues according.
1549c764245c43 Fuhai Wang 2021-04-25  7609  	 *  Driver uses limitation of
1549c764245c43 Fuhai Wang 2021-04-25  7610  	 *  VENTURA_SERIES to manage INVADER_SERIES as well.
1549c764245c43 Fuhai Wang 2021-04-25  7611  	 */
1549c764245c43 Fuhai Wang 2021-04-25  7612  	dma_alloc_count = DIV_ROUND_UP(count,
1549c764245c43 Fuhai Wang 2021-04-25  7613  				RDPQ_MAX_INDEX_IN_ONE_CHUNK);
1549c764245c43 Fuhai Wang 2021-04-25  7614  	ioc->reply_post_free_dma_pool =
1549c764245c43 Fuhai Wang 2021-04-25  7615  		dma_pool_create("reply_post_free pool",
1549c764245c43 Fuhai Wang 2021-04-25  7616  		    &ioc->pdev->dev, sz, 16, 0);
1549c764245c43 Fuhai Wang 2021-04-25  7617  	if (!ioc->reply_post_free_dma_pool) {
1549c764245c43 Fuhai Wang 2021-04-25 @7618  		pr_err(KERN_ERR "reply_post_free pool: dma_pool_create failed\n");
1549c764245c43 Fuhai Wang 2021-04-25  7619  		return -ENOMEM;
1549c764245c43 Fuhai Wang 2021-04-25  7620  	}
1549c764245c43 Fuhai Wang 2021-04-25  7621  	for (i = 0; i < count; i++) {
1549c764245c43 Fuhai Wang 2021-04-25  7622  		if ((i % RDPQ_MAX_INDEX_IN_ONE_CHUNK == 0) && dma_alloc_count) {
1549c764245c43 Fuhai Wang 2021-04-25  7623  			ioc->reply_post[i].reply_post_free =
1549c764245c43 Fuhai Wang 2021-04-25  7624  				dma_pool_zalloc(ioc->reply_post_free_dma_pool,
1549c764245c43 Fuhai Wang 2021-04-25  7625  				    GFP_KERNEL,
1549c764245c43 Fuhai Wang 2021-04-25  7626  				    &ioc->reply_post[i].reply_post_free_dma);
1549c764245c43 Fuhai Wang 2021-04-25  7627  			if (!ioc->reply_post[i].reply_post_free) {
1549c764245c43 Fuhai Wang 2021-04-25  7628  				pr_err(KERN_ERR "reply_post_free pool: "
1549c764245c43 Fuhai Wang 2021-04-25  7629  				    "dma_pool_alloc failed\n");
1549c764245c43 Fuhai Wang 2021-04-25  7630  				return -EAGAIN; 
1549c764245c43 Fuhai Wang 2021-04-25  7631  			}
1549c764245c43 Fuhai Wang 2021-04-25  7632  		/* reply desc pool requires to be in same 4 gb region.
1549c764245c43 Fuhai Wang 2021-04-25  7633  		 * Below function will check this.
1549c764245c43 Fuhai Wang 2021-04-25  7634  		 * In case of failure, new pci pool will be created with updated
1549c764245c43 Fuhai Wang 2021-04-25  7635  		 * alignment.
1549c764245c43 Fuhai Wang 2021-04-25  7636  		 * For RDPQ buffers, driver allocates two separate pci pool.
1549c764245c43 Fuhai Wang 2021-04-25  7637  		 * Alignment will be used such a way that next allocation if
1549c764245c43 Fuhai Wang 2021-04-25  7638  		 * success, will always meet same 4gb region requirement.
1549c764245c43 Fuhai Wang 2021-04-25  7639  		 * Flag dma_pool keeps track of each buffers pool,
1549c764245c43 Fuhai Wang 2021-04-25  7640  		 * It will help driver while freeing the resources.
1549c764245c43 Fuhai Wang 2021-04-25  7641  		 */
1549c764245c43 Fuhai Wang 2021-04-25  7642  			if (!mpt3sas_check_same_4gb_region(
1549c764245c43 Fuhai Wang 2021-04-25  7643  				(long)ioc->reply_post[i].reply_post_free, sz)) {
1549c764245c43 Fuhai Wang 2021-04-25  7644  				dinitprintk(ioc,
1549c764245c43 Fuhai Wang 2021-04-25  7645  				    printk(MPT3SAS_ERR_FMT "bad Replypost free pool(0x%p)"
1549c764245c43 Fuhai Wang 2021-04-25  7646  				    "reply_post_free_dma = (0x%llx)\n", ioc->name,
1549c764245c43 Fuhai Wang 2021-04-25  7647  				    ioc->reply_post[i].reply_post_free,
1549c764245c43 Fuhai Wang 2021-04-25  7648  				    (unsigned long long)
1549c764245c43 Fuhai Wang 2021-04-25  7649  				    ioc->reply_post[i].reply_post_free_dma));
1549c764245c43 Fuhai Wang 2021-04-25  7650  				ioc->use_32bit_dma = 1;
1549c764245c43 Fuhai Wang 2021-04-25  7651  				return -EAGAIN;
1549c764245c43 Fuhai Wang 2021-04-25  7652  			}
1549c764245c43 Fuhai Wang 2021-04-25  7653  			dma_alloc_count--;
1549c764245c43 Fuhai Wang 2021-04-25  7654  		} else {
1549c764245c43 Fuhai Wang 2021-04-25  7655  			ioc->reply_post[i].reply_post_free =
1549c764245c43 Fuhai Wang 2021-04-25  7656  			    (Mpi2ReplyDescriptorsUnion_t *)
1549c764245c43 Fuhai Wang 2021-04-25  7657  			    ((long)ioc->reply_post[i-1].reply_post_free
1549c764245c43 Fuhai Wang 2021-04-25  7658  			    + reply_post_free_sz);
1549c764245c43 Fuhai Wang 2021-04-25  7659  			ioc->reply_post[i].reply_post_free_dma =
1549c764245c43 Fuhai Wang 2021-04-25  7660  			    (dma_addr_t)
1549c764245c43 Fuhai Wang 2021-04-25  7661  			    (ioc->reply_post[i-1].reply_post_free_dma +
1549c764245c43 Fuhai Wang 2021-04-25  7662  			    reply_post_free_sz);
1549c764245c43 Fuhai Wang 2021-04-25  7663  		}
1549c764245c43 Fuhai Wang 2021-04-25  7664  	}
1549c764245c43 Fuhai Wang 2021-04-25  7665  	return 0;
1549c764245c43 Fuhai Wang 2021-04-25  7666  }
1549c764245c43 Fuhai Wang 2021-04-25  7667  
1549c764245c43 Fuhai Wang 2021-04-25  7668  /**
1549c764245c43 Fuhai Wang 2021-04-25  7669   * _base_allocate_pcie_sgl_pool - Allocating DMA'able memory
1549c764245c43 Fuhai Wang 2021-04-25  7670   *			for pcie sgl pools.
1549c764245c43 Fuhai Wang 2021-04-25  7671   * @ioc: Adapter object
1549c764245c43 Fuhai Wang 2021-04-25  7672   * @sz: DMA Pool size
1549c764245c43 Fuhai Wang 2021-04-25  7673   * @ct: Chain tracker
1549c764245c43 Fuhai Wang 2021-04-25  7674   * Return: 0 for success, non-zero for failure.
1549c764245c43 Fuhai Wang 2021-04-25  7675   */
1549c764245c43 Fuhai Wang 2021-04-25  7676  
1549c764245c43 Fuhai Wang 2021-04-25  7677  static int
1549c764245c43 Fuhai Wang 2021-04-25  7678  _base_allocate_pcie_sgl_pool(struct MPT3SAS_ADAPTER *ioc, int sz,
1549c764245c43 Fuhai Wang 2021-04-25  7679  	struct chain_tracker *ct)
1549c764245c43 Fuhai Wang 2021-04-25  7680  {
1549c764245c43 Fuhai Wang 2021-04-25  7681  	int i = 0, j = 0;
1549c764245c43 Fuhai Wang 2021-04-25  7682  
1549c764245c43 Fuhai Wang 2021-04-25  7683  	ioc->pcie_sgl_dma_pool = dma_pool_create("PCIe SGL pool", &ioc->pdev->dev, sz,
1549c764245c43 Fuhai Wang 2021-04-25  7684  			ioc->page_size, 0);
1549c764245c43 Fuhai Wang 2021-04-25  7685  	if (!ioc->pcie_sgl_dma_pool) {
1549c764245c43 Fuhai Wang 2021-04-25  7686  		printk(MPT3SAS_ERR_FMT "PCIe SGL pool: dma_pool_create failed\n",
1549c764245c43 Fuhai Wang 2021-04-25  7687  				ioc->name);
1549c764245c43 Fuhai Wang 2021-04-25  7688  		return -ENOMEM;
1549c764245c43 Fuhai Wang 2021-04-25  7689  	}
1549c764245c43 Fuhai Wang 2021-04-25  7690  
1549c764245c43 Fuhai Wang 2021-04-25  7691  	ioc->chains_per_prp_buffer = sz/ioc->chain_segment_sz;
1549c764245c43 Fuhai Wang 2021-04-25  7692  	ioc->chains_per_prp_buffer =
1549c764245c43 Fuhai Wang 2021-04-25  7693  	    min(ioc->chains_per_prp_buffer, ioc->chains_needed_per_io);
1549c764245c43 Fuhai Wang 2021-04-25  7694  	for (i = 0; i < ioc->scsiio_depth; i++) {
1549c764245c43 Fuhai Wang 2021-04-25  7695  		ioc->pcie_sg_lookup[i].pcie_sgl =
1549c764245c43 Fuhai Wang 2021-04-25  7696  		    dma_pool_alloc(ioc->pcie_sgl_dma_pool, GFP_KERNEL,
1549c764245c43 Fuhai Wang 2021-04-25  7697  		    &ioc->pcie_sg_lookup[i].pcie_sgl_dma);
1549c764245c43 Fuhai Wang 2021-04-25  7698  		if (!ioc->pcie_sg_lookup[i].pcie_sgl) {
1549c764245c43 Fuhai Wang 2021-04-25  7699  			printk(MPT3SAS_ERR_FMT
1549c764245c43 Fuhai Wang 2021-04-25  7700  			    "PCIe SGL pool: dma_pool_alloc failed\n", ioc->name);
1549c764245c43 Fuhai Wang 2021-04-25  7701  			return -EAGAIN; 
1549c764245c43 Fuhai Wang 2021-04-25  7702  		}
1549c764245c43 Fuhai Wang 2021-04-25  7703  
1549c764245c43 Fuhai Wang 2021-04-25  7704  		if (!mpt3sas_check_same_4gb_region(
1549c764245c43 Fuhai Wang 2021-04-25  7705  		    (long)ioc->pcie_sg_lookup[i].pcie_sgl, sz)) {
1549c764245c43 Fuhai Wang 2021-04-25  7706  			printk(MPT3SAS_ERR_FMT "PCIE SGLs are not in same 4G !!"
1549c764245c43 Fuhai Wang 2021-04-25  7707  			    " pcie sgl (0x%p) dma = (0x%llx)\n",
1549c764245c43 Fuhai Wang 2021-04-25  7708  			    ioc->name, ioc->pcie_sg_lookup[i].pcie_sgl,
1549c764245c43 Fuhai Wang 2021-04-25  7709  			    (unsigned long long)
1549c764245c43 Fuhai Wang 2021-04-25  7710  			    ioc->pcie_sg_lookup[i].pcie_sgl_dma);
1549c764245c43 Fuhai Wang 2021-04-25  7711  			ioc->use_32bit_dma = 1;
1549c764245c43 Fuhai Wang 2021-04-25  7712  			return -EAGAIN;
1549c764245c43 Fuhai Wang 2021-04-25  7713  		}
1549c764245c43 Fuhai Wang 2021-04-25  7714  
1549c764245c43 Fuhai Wang 2021-04-25  7715  		for (j = 0; j < ioc->chains_per_prp_buffer; j++) {
1549c764245c43 Fuhai Wang 2021-04-25  7716  			ct = &ioc->chain_lookup[i].chains_per_smid[j];
1549c764245c43 Fuhai Wang 2021-04-25  7717  			ct->chain_buffer =
1549c764245c43 Fuhai Wang 2021-04-25  7718  			    ioc->pcie_sg_lookup[i].pcie_sgl +
1549c764245c43 Fuhai Wang 2021-04-25  7719  			    (j * ioc->chain_segment_sz);
1549c764245c43 Fuhai Wang 2021-04-25  7720  			ct->chain_buffer_dma =
1549c764245c43 Fuhai Wang 2021-04-25  7721  			    ioc->pcie_sg_lookup[i].pcie_sgl_dma +
1549c764245c43 Fuhai Wang 2021-04-25  7722  			    (j * ioc->chain_segment_sz);
1549c764245c43 Fuhai Wang 2021-04-25  7723  		}
1549c764245c43 Fuhai Wang 2021-04-25  7724  	}
1549c764245c43 Fuhai Wang 2021-04-25  7725  	dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "PCIe sgl pool depth(%d), "
1549c764245c43 Fuhai Wang 2021-04-25  7726  	    "element_size(%d), pool_size(%d kB)\n",
1549c764245c43 Fuhai Wang 2021-04-25  7727  	     ioc->name, ioc->scsiio_depth, sz, (sz * ioc->scsiio_depth)/1024));
1549c764245c43 Fuhai Wang 2021-04-25  7728  	dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "Number of chains can "
1549c764245c43 Fuhai Wang 2021-04-25  7729  	    "fit in a PRP page(%d)\n", ioc->name, ioc->chains_per_prp_buffer));
1549c764245c43 Fuhai Wang 2021-04-25  7730  	return 0;
1549c764245c43 Fuhai Wang 2021-04-25  7731  }
1549c764245c43 Fuhai Wang 2021-04-25  7732  
1549c764245c43 Fuhai Wang 2021-04-25  7733  /**
1549c764245c43 Fuhai Wang 2021-04-25  7734   * _base_allocate_chain_dma_pool - Allocating DMA'able memory
1549c764245c43 Fuhai Wang 2021-04-25  7735   *			for chain dma pool.
1549c764245c43 Fuhai Wang 2021-04-25  7736   * @ioc: Adapter object
1549c764245c43 Fuhai Wang 2021-04-25  7737   * @sz: DMA Pool size
1549c764245c43 Fuhai Wang 2021-04-25  7738   * @ct: Chain tracker
1549c764245c43 Fuhai Wang 2021-04-25  7739   * Return: 0 for success, non-zero for failure.
1549c764245c43 Fuhai Wang 2021-04-25  7740   */
1549c764245c43 Fuhai Wang 2021-04-25  7741  static int
1549c764245c43 Fuhai Wang 2021-04-25  7742  _base_allocate_chain_dma_pool(struct MPT3SAS_ADAPTER *ioc, int sz,
1549c764245c43 Fuhai Wang 2021-04-25  7743  	struct chain_tracker *ctr)
1549c764245c43 Fuhai Wang 2021-04-25  7744  {
1549c764245c43 Fuhai Wang 2021-04-25  7745  	int i = 0, j = 0;
1549c764245c43 Fuhai Wang 2021-04-25  7746  
1549c764245c43 Fuhai Wang 2021-04-25  7747  	ioc->chain_dma_pool = dma_pool_create("chain pool", &ioc->pdev->dev,
1549c764245c43 Fuhai Wang 2021-04-25  7748  			ioc->chain_segment_sz, 16, 0);
1549c764245c43 Fuhai Wang 2021-04-25  7749  	if (!ioc->chain_dma_pool) {
1549c764245c43 Fuhai Wang 2021-04-25  7750  		printk(MPT3SAS_ERR_FMT "chain_dma_pool: dma_pool_create "
1549c764245c43 Fuhai Wang 2021-04-25  7751  				"failed\n", ioc->name);
1549c764245c43 Fuhai Wang 2021-04-25  7752  		return -ENOMEM;
1549c764245c43 Fuhai Wang 2021-04-25  7753  	}
1549c764245c43 Fuhai Wang 2021-04-25  7754  
1549c764245c43 Fuhai Wang 2021-04-25  7755  	for (i = 0; i < ioc->scsiio_depth; i++) {
1549c764245c43 Fuhai Wang 2021-04-25  7756  		for (j = ioc->chains_per_prp_buffer;
1549c764245c43 Fuhai Wang 2021-04-25  7757  		    j < ioc->chains_needed_per_io; j++) {
1549c764245c43 Fuhai Wang 2021-04-25  7758  			ctr = &ioc->chain_lookup[i].chains_per_smid[j];
1549c764245c43 Fuhai Wang 2021-04-25  7759  			ctr->chain_buffer = dma_pool_alloc(ioc->chain_dma_pool,
1549c764245c43 Fuhai Wang 2021-04-25  7760  			    GFP_KERNEL, &ctr->chain_buffer_dma);
1549c764245c43 Fuhai Wang 2021-04-25  7761  			if (!ctr->chain_buffer)
1549c764245c43 Fuhai Wang 2021-04-25  7762  				return -EAGAIN;
1549c764245c43 Fuhai Wang 2021-04-25  7763  			if (!mpt3sas_check_same_4gb_region(
1549c764245c43 Fuhai Wang 2021-04-25  7764  				(long)ctr->chain_buffer, ioc->chain_segment_sz)) {
1549c764245c43 Fuhai Wang 2021-04-25  7765  				printk(MPT3SAS_ERR_FMT
1549c764245c43 Fuhai Wang 2021-04-25  7766  				    "Chain buffers are not in same 4G !!!"
1549c764245c43 Fuhai Wang 2021-04-25  7767  				    "Chain buff (0x%p) dma = (0x%llx)\n",
1549c764245c43 Fuhai Wang 2021-04-25  7768  				    ioc->name, ctr->chain_buffer,
1549c764245c43 Fuhai Wang 2021-04-25  7769  				    (unsigned long long)ctr->chain_buffer_dma);
1549c764245c43 Fuhai Wang 2021-04-25 @7770  				    ioc->use_32bit_dma = 1;
1549c764245c43 Fuhai Wang 2021-04-25  7771  					return -EAGAIN;
1549c764245c43 Fuhai Wang 2021-04-25  7772  			}
1549c764245c43 Fuhai Wang 2021-04-25  7773  		}
1549c764245c43 Fuhai Wang 2021-04-25  7774  	}
1549c764245c43 Fuhai Wang 2021-04-25  7775  	dinitprintk(ioc, printk(MPT3SAS_INFO_FMT "chain_lookup depth"
1549c764245c43 Fuhai Wang 2021-04-25  7776  	    "(%d), frame_size(%d), pool_size(%d kB)\n", ioc->name,
1549c764245c43 Fuhai Wang 2021-04-25  7777  	    ioc->scsiio_depth, ioc->chain_segment_sz, ((ioc->scsiio_depth *
1549c764245c43 Fuhai Wang 2021-04-25  7778  	    (ioc->chains_needed_per_io - ioc->chains_per_prp_buffer) *
1549c764245c43 Fuhai Wang 2021-04-25  7779  	    ioc->chain_segment_sz))/1024));
1549c764245c43 Fuhai Wang 2021-04-25  7780  	return 0;
1549c764245c43 Fuhai Wang 2021-04-25  7781  }
1549c764245c43 Fuhai Wang 2021-04-25  7782  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

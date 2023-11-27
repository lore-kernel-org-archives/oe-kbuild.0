Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AD920F5
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DWtIQiah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701054805; x=1732590805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yo0vwP2PmQsVhHe1Ky2LucrfZM5x0fAax7KiU+E9KXk=;
  b=DWtIQiahbqH2P/yWrRJYdsFtneooKf1bPULTvXIrmuJLmbA4CnGP1ERG
   1XWM0Da72R7wg23HjsJkqHhNVQrcpCVn9vPCVY/Cz5nhDB6CXECKvHGkC
   j8yoAoEMLH66GKphL0+gK7NEAuU7FIXksfDPmf0r944UtYM4J6otvHS3Y
   U1FOtrrZCT6pliURjYxMK6oy1O3P10MulNfx/y2ZEZM1qk3ZdZf7IjGNZ
   GU0YQPgDxWWT8g/lC7ehBuu5MuLidj6She8+GhFarFpFtBtI7LN69Z86G
   9hlQ9KeWGWCYRAMYQC2Cqa+bHq2bgjpzpcrgko93K/XBKAdAfOQiDyCQR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="371981188"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="371981188"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 19:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="834196201"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="834196201"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2023 19:13:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7S3j-0005me-1Z;
	Mon, 27 Nov 2023 03:13:19 +0000
Date: Mon, 27 Nov 2023 11:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [net-next:main 8/21]
 drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs()
 warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
Message-ID: <202311271039.3eBHI08D-lkp@intel.com>
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
CC: netdev@vger.kernel.org
TO: Shinas Rasheed <srasheed@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   dba1b8a7ab6853a84bf3afdbeac1c2f2370d3444
commit: 0a5f8534e3986b636570f4d6d32e22af7d868d45 [8/21] octeon_ep: get max rx packet length from firmware
:::::: branch date: 12 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271039.3eBHI08D-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311271039.3eBHI08D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311271039.3eBHI08D-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:464 octep_request_irqs() warn: 'msix_entry->vector' from request_irq() not released on lines: 464.
drivers/net/ethernet/marvell/octeon_ep/octep_main.c:1386 octep_probe() warn: missing error code 'err'

vim +464 drivers/net/ethernet/marvell/octeon_ep/octep_main.c

37d79d05960620 Veerasenareddy Burru 2022-04-12  327  
37d79d05960620 Veerasenareddy Burru 2022-04-12  328  /**
37d79d05960620 Veerasenareddy Burru 2022-04-12  329   * octep_request_irqs() - Register interrupt handlers.
37d79d05960620 Veerasenareddy Burru 2022-04-12  330   *
37d79d05960620 Veerasenareddy Burru 2022-04-12  331   * @oct: Octeon device private data structure.
37d79d05960620 Veerasenareddy Burru 2022-04-12  332   *
37d79d05960620 Veerasenareddy Burru 2022-04-12  333   * Register handlers for all queue and non-queue interrupts.
37d79d05960620 Veerasenareddy Burru 2022-04-12  334   *
37d79d05960620 Veerasenareddy Burru 2022-04-12  335   * Return: 0, on successful registration of all interrupt handlers.
37d79d05960620 Veerasenareddy Burru 2022-04-12  336   *         -1, on any error.
37d79d05960620 Veerasenareddy Burru 2022-04-12  337   */
37d79d05960620 Veerasenareddy Burru 2022-04-12  338  static int octep_request_irqs(struct octep_device *oct)
37d79d05960620 Veerasenareddy Burru 2022-04-12  339  {
37d79d05960620 Veerasenareddy Burru 2022-04-12  340  	struct net_device *netdev = oct->netdev;
37d79d05960620 Veerasenareddy Burru 2022-04-12  341  	struct octep_ioq_vector *ioq_vector;
37d79d05960620 Veerasenareddy Burru 2022-04-12  342  	struct msix_entry *msix_entry;
37d79d05960620 Veerasenareddy Burru 2022-04-12  343  	char **non_ioq_msix_names;
37d79d05960620 Veerasenareddy Burru 2022-04-12  344  	int num_non_ioq_msix;
3588c189e45aac Christophe JAILLET   2022-05-17  345  	int ret, i, j;
37d79d05960620 Veerasenareddy Burru 2022-04-12  346  
37d79d05960620 Veerasenareddy Burru 2022-04-12  347  	num_non_ioq_msix = CFG_GET_NON_IOQ_MSIX(oct->conf);
37d79d05960620 Veerasenareddy Burru 2022-04-12  348  	non_ioq_msix_names = CFG_GET_NON_IOQ_MSIX_NAMES(oct->conf);
37d79d05960620 Veerasenareddy Burru 2022-04-12  349  
37d79d05960620 Veerasenareddy Burru 2022-04-12  350  	oct->non_ioq_irq_names = kcalloc(num_non_ioq_msix,
37d79d05960620 Veerasenareddy Burru 2022-04-12  351  					 OCTEP_MSIX_NAME_SIZE, GFP_KERNEL);
37d79d05960620 Veerasenareddy Burru 2022-04-12  352  	if (!oct->non_ioq_irq_names)
37d79d05960620 Veerasenareddy Burru 2022-04-12  353  		goto alloc_err;
37d79d05960620 Veerasenareddy Burru 2022-04-12  354  
37d79d05960620 Veerasenareddy Burru 2022-04-12  355  	/* First few MSI-X interrupts are non-queue interrupts */
37d79d05960620 Veerasenareddy Burru 2022-04-12  356  	for (i = 0; i < num_non_ioq_msix; i++) {
37d79d05960620 Veerasenareddy Burru 2022-04-12  357  		char *irq_name;
37d79d05960620 Veerasenareddy Burru 2022-04-12  358  
37d79d05960620 Veerasenareddy Burru 2022-04-12  359  		irq_name = &oct->non_ioq_irq_names[i * OCTEP_MSIX_NAME_SIZE];
37d79d05960620 Veerasenareddy Burru 2022-04-12  360  		msix_entry = &oct->msix_entries[i];
37d79d05960620 Veerasenareddy Burru 2022-04-12  361  
37d79d05960620 Veerasenareddy Burru 2022-04-12  362  		snprintf(irq_name, OCTEP_MSIX_NAME_SIZE,
37d79d05960620 Veerasenareddy Burru 2022-04-12  363  			 "%s-%s", netdev->name, non_ioq_msix_names[i]);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  364  		if (!strncmp(non_ioq_msix_names[i], "epf_oei_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  365  			     strlen("epf_oei_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  366  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  367  					  octep_oei_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  368  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  369  		} else if (!strncmp(non_ioq_msix_names[i], "epf_ire_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  370  			   strlen("epf_ire_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  371  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  372  					  octep_ire_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  373  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  374  		} else if (!strncmp(non_ioq_msix_names[i], "epf_ore_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  375  			   strlen("epf_ore_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  376  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  377  					  octep_ore_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  378  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  379  		} else if (!strncmp(non_ioq_msix_names[i], "epf_vfire_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  380  			   strlen("epf_vfire_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  381  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  382  					  octep_vfire_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  383  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  384  		} else if (!strncmp(non_ioq_msix_names[i], "epf_vfore_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  385  			   strlen("epf_vfore_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  386  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  387  					  octep_vfore_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  388  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  389  		} else if (!strncmp(non_ioq_msix_names[i], "epf_dma_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  390  			   strlen("epf_dma_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  391  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  392  					  octep_dma_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  393  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  394  		} else if (!strncmp(non_ioq_msix_names[i], "epf_dma_vf_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  395  			   strlen("epf_dma_vf_rint"))) {
37d79d05960620 Veerasenareddy Burru 2022-04-12  396  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  397  					  octep_dma_vf_intr_handler, 0,
37d79d05960620 Veerasenareddy Burru 2022-04-12  398  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  399  		} else if (!strncmp(non_ioq_msix_names[i], "epf_pp_vf_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  400  			   strlen("epf_pp_vf_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  401  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  402  					  octep_pp_vf_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  403  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  404  		} else if (!strncmp(non_ioq_msix_names[i], "epf_misc_rint",
0b8ef824eedef9 Shinas Rasheed       2023-09-17  405  			   strlen("epf_misc_rint"))) {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  406  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  407  					  octep_misc_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  408  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  409  		} else {
0b8ef824eedef9 Shinas Rasheed       2023-09-17  410  			ret = request_irq(msix_entry->vector,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  411  					  octep_rsvd_intr_handler, 0,
0b8ef824eedef9 Shinas Rasheed       2023-09-17  412  					  irq_name, oct);
0b8ef824eedef9 Shinas Rasheed       2023-09-17  413  		}
0b8ef824eedef9 Shinas Rasheed       2023-09-17  414  
37d79d05960620 Veerasenareddy Burru 2022-04-12  415  		if (ret) {
37d79d05960620 Veerasenareddy Burru 2022-04-12  416  			netdev_err(netdev,
37d79d05960620 Veerasenareddy Burru 2022-04-12  417  				   "request_irq failed for %s; err=%d",
37d79d05960620 Veerasenareddy Burru 2022-04-12  418  				   irq_name, ret);
37d79d05960620 Veerasenareddy Burru 2022-04-12  419  			goto non_ioq_irq_err;
37d79d05960620 Veerasenareddy Burru 2022-04-12  420  		}
37d79d05960620 Veerasenareddy Burru 2022-04-12  421  	}
37d79d05960620 Veerasenareddy Burru 2022-04-12  422  
37d79d05960620 Veerasenareddy Burru 2022-04-12  423  	/* Request IRQs for Tx/Rx queues */
3588c189e45aac Christophe JAILLET   2022-05-17  424  	for (j = 0; j < oct->num_oqs; j++) {
3588c189e45aac Christophe JAILLET   2022-05-17  425  		ioq_vector = oct->ioq_vector[j];
3588c189e45aac Christophe JAILLET   2022-05-17  426  		msix_entry = &oct->msix_entries[j + num_non_ioq_msix];
37d79d05960620 Veerasenareddy Burru 2022-04-12  427  
37d79d05960620 Veerasenareddy Burru 2022-04-12  428  		snprintf(ioq_vector->name, sizeof(ioq_vector->name),
3588c189e45aac Christophe JAILLET   2022-05-17  429  			 "%s-q%d", netdev->name, j);
37d79d05960620 Veerasenareddy Burru 2022-04-12  430  		ret = request_irq(msix_entry->vector,
37d79d05960620 Veerasenareddy Burru 2022-04-12  431  				  octep_ioq_intr_handler, 0,
37d79d05960620 Veerasenareddy Burru 2022-04-12  432  				  ioq_vector->name, ioq_vector);
37d79d05960620 Veerasenareddy Burru 2022-04-12  433  		if (ret) {
37d79d05960620 Veerasenareddy Burru 2022-04-12  434  			netdev_err(netdev,
37d79d05960620 Veerasenareddy Burru 2022-04-12  435  				   "request_irq failed for Q-%d; err=%d",
3588c189e45aac Christophe JAILLET   2022-05-17  436  				   j, ret);
37d79d05960620 Veerasenareddy Burru 2022-04-12  437  			goto ioq_irq_err;
37d79d05960620 Veerasenareddy Burru 2022-04-12  438  		}
37d79d05960620 Veerasenareddy Burru 2022-04-12  439  
3588c189e45aac Christophe JAILLET   2022-05-17  440  		cpumask_set_cpu(j % num_online_cpus(),
37d79d05960620 Veerasenareddy Burru 2022-04-12  441  				&ioq_vector->affinity_mask);
37d79d05960620 Veerasenareddy Burru 2022-04-12  442  		irq_set_affinity_hint(msix_entry->vector,
37d79d05960620 Veerasenareddy Burru 2022-04-12  443  				      &ioq_vector->affinity_mask);
37d79d05960620 Veerasenareddy Burru 2022-04-12  444  	}
37d79d05960620 Veerasenareddy Burru 2022-04-12  445  
37d79d05960620 Veerasenareddy Burru 2022-04-12  446  	return 0;
37d79d05960620 Veerasenareddy Burru 2022-04-12  447  ioq_irq_err:
3588c189e45aac Christophe JAILLET   2022-05-17  448  	while (j) {
3588c189e45aac Christophe JAILLET   2022-05-17  449  		--j;
3588c189e45aac Christophe JAILLET   2022-05-17  450  		ioq_vector = oct->ioq_vector[j];
3588c189e45aac Christophe JAILLET   2022-05-17  451  		msix_entry = &oct->msix_entries[j + num_non_ioq_msix];
3588c189e45aac Christophe JAILLET   2022-05-17  452  
3588c189e45aac Christophe JAILLET   2022-05-17  453  		irq_set_affinity_hint(msix_entry->vector, NULL);
3588c189e45aac Christophe JAILLET   2022-05-17  454  		free_irq(msix_entry->vector, ioq_vector);
37d79d05960620 Veerasenareddy Burru 2022-04-12  455  	}
37d79d05960620 Veerasenareddy Burru 2022-04-12  456  non_ioq_irq_err:
37d79d05960620 Veerasenareddy Burru 2022-04-12  457  	while (i) {
37d79d05960620 Veerasenareddy Burru 2022-04-12  458  		--i;
37d79d05960620 Veerasenareddy Burru 2022-04-12  459  		free_irq(oct->msix_entries[i].vector, oct);
37d79d05960620 Veerasenareddy Burru 2022-04-12  460  	}
4d3bf6fb533461 Christophe JAILLET   2022-05-17  461  	kfree(oct->non_ioq_irq_names);
4d3bf6fb533461 Christophe JAILLET   2022-05-17  462  	oct->non_ioq_irq_names = NULL;
37d79d05960620 Veerasenareddy Burru 2022-04-12  463  alloc_err:
37d79d05960620 Veerasenareddy Burru 2022-04-12 @464  	return -1;
37d79d05960620 Veerasenareddy Burru 2022-04-12  465  }
37d79d05960620 Veerasenareddy Burru 2022-04-12  466  

:::::: The code at line 464 was first introduced by commit
:::::: 37d79d0596062057f588bdbb2ebad5455a43d353 octeon_ep: add Tx/Rx processing and interrupt support

:::::: TO: Veerasenareddy Burru <vburru@marvell.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

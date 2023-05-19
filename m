Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB27472
	for <oe-kbuild@lists.linux.dev>; Fri, 19 May 2023 10:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684492929; x=1716028929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSC1JQSyLbvSi2+NajVCvzF2z8vgsmCELmpYlXvF+0k=;
  b=JhOc3cUgaGoEU/3hO9Bv2EXTHSuuQNUZ6DDFtVpSHvPgRmzBraizA+oR
   Qqa8+bALcn6ym7WlArqKFwqUzQgoV4V7XlRFz0xnw03XeoTvWWphPj6be
   Q+vHSP82h47+Z4ZJCNjB78lj4fBQb+F+vn0IfsoME3KjL28Yo6cLklEiV
   6PiIUkGJhHgV228pwRPzHfsFQbVDRsYQNjgbiHGwFe8m2qaa+3sS4S9KE
   8j65jcSiBgphHAPftZFLo0GK3UI7pgxGo4yUhBUkWG/vDwj2wVakwBLpZ
   Ko/a4XqYSIxFWI4UyfGL8xsKUIiEcqgoQuEtD9YbWTOCz5gqeEOay8MXm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="332704854"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="332704854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 03:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="680011210"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="680011210"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 May 2023 03:42:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzxYk-000AmU-28;
	Fri, 19 May 2023 10:42:06 +0000
Date: Fri, 19 May 2023 18:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/sfc/ef100_netdev.c:457 ef100_probe_netdev()
 warn: 'net_dev' from alloc_etherdev_mqs() not released on lines: 418.
Message-ID: <202305191859.O6KpRymX-lkp@intel.com>
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
TO: Alejandro Lucero <alejandro.lucero-palau@amd.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d1bcbc6cd703e64caf8df314e3669b4786e008a
commit: 7e056e2360d9267a20509aa2cdb8905485499e95 sfc: obtain device mac address based on firmware handle for ef100
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: ia64-randconfig-m041-20230514 (https://download.01.org/0day-ci/archive/20230519/202305191859.O6KpRymX-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305191859.O6KpRymX-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/sfc/ef100_netdev.c:457 ef100_probe_netdev() warn: 'net_dev' from alloc_etherdev_mqs() not released on lines: 418.

Old smatch warnings:
drivers/net/ethernet/sfc/ef100_netdev.c:141 ef100_net_open() warn: missing unwind goto?

vim +/net_dev +457 drivers/net/ethernet/sfc/ef100_netdev.c

98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  357  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  358  int ef100_probe_netdev(struct efx_probe_data *probe_data)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  359  {
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  360  	struct efx_nic *efx = &probe_data->efx;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  361  	struct efx_probe_data **probe_ptr;
7e056e2360d926 Alejandro Lucero 2023-02-15  362  	struct ef100_nic_data *nic_data;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  363  	struct net_device *net_dev;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  364  	int rc;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  365  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  366  	if (efx->mcdi->fn_flags &
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  367  			(1 << MC_CMD_DRV_ATTACH_EXT_OUT_FLAG_NO_ACTIVE_PORT)) {
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  368  		pci_info(efx->pci_dev, "No network port on this PCI function");
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  369  		return 0;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  370  	}
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  371  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  372  	/* Allocate and initialise a struct net_device */
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  373  	net_dev = alloc_etherdev_mq(sizeof(probe_data), EFX_MAX_CORE_TX_QUEUES);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  374  	if (!net_dev)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  375  		return -ENOMEM;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  376  	probe_ptr = netdev_priv(net_dev);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  377  	*probe_ptr = probe_data;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  378  	efx->net_dev = net_dev;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  379  	SET_NETDEV_DEV(net_dev, &efx->pci_dev->dev);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  380  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  381  	net_dev->features |= efx->type->offload_features;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  382  	net_dev->hw_features |= efx->type->offload_features;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  383  	net_dev->hw_enc_features |= efx->type->offload_features;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  384  	net_dev->vlan_features |= NETIF_F_HW_CSUM | NETIF_F_SG |
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  385  				  NETIF_F_HIGHDMA | NETIF_F_ALL_TSO;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  386  	netif_set_tso_max_segs(net_dev,
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  387  			       ESE_EF100_DP_GZ_TSO_MAX_HDR_NUM_SEGS_DEFAULT);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  388  	efx->mdio.dev = net_dev;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  389  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  390  	rc = efx_ef100_init_datapath_caps(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  391  	if (rc < 0)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  392  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  393  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  394  	rc = ef100_phy_probe(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  395  	if (rc)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  396  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  397  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  398  	rc = efx_init_channels(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  399  	if (rc)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  400  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  401  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  402  	down_write(&efx->filter_sem);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  403  	rc = ef100_filter_table_probe(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  404  	up_write(&efx->filter_sem);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  405  	if (rc)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  406  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  407  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  408  	netdev_rss_key_fill(efx->rss_context.rx_hash_key,
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  409  			    sizeof(efx->rss_context.rx_hash_key));
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  410  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  411  	/* Don't fail init if RSS setup doesn't work. */
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  412  	efx_mcdi_push_default_indir_table(efx, efx->n_rx_channels);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  413  
7e056e2360d926 Alejandro Lucero 2023-02-15  414  	nic_data = efx->nic_data;
7e056e2360d926 Alejandro Lucero 2023-02-15  415  	rc = ef100_get_mac_address(efx, net_dev->perm_addr, CLIENT_HANDLE_SELF,
7e056e2360d926 Alejandro Lucero 2023-02-15  416  				   efx->type->is_vf);
7e056e2360d926 Alejandro Lucero 2023-02-15  417  	if (rc)
7e056e2360d926 Alejandro Lucero 2023-02-15  418  		return rc;
7e056e2360d926 Alejandro Lucero 2023-02-15  419  	/* Assign MAC address */
7e056e2360d926 Alejandro Lucero 2023-02-15  420  	eth_hw_addr_set(net_dev, net_dev->perm_addr);
7e056e2360d926 Alejandro Lucero 2023-02-15  421  	ether_addr_copy(nic_data->port_id, net_dev->perm_addr);
7e056e2360d926 Alejandro Lucero 2023-02-15  422  
fa34a5140a8e8f Alejandro Lucero 2023-02-15  423  	/* devlink creation, registration and lock */
fa34a5140a8e8f Alejandro Lucero 2023-02-15  424  	rc = efx_probe_devlink_and_lock(efx);
fa34a5140a8e8f Alejandro Lucero 2023-02-15  425  	if (rc)
fa34a5140a8e8f Alejandro Lucero 2023-02-15  426  		pci_info(efx->pci_dev, "devlink registration failed");
fa34a5140a8e8f Alejandro Lucero 2023-02-15  427  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  428  	rc = ef100_register_netdev(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  429  	if (rc)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  430  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  431  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  432  	if (!efx->type->is_vf) {
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  433  		rc = ef100_probe_netdev_pf(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  434  		if (rc)
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  435  			goto fail;
25414b2a64ae7e Alejandro Lucero 2023-02-15  436  #ifdef CONFIG_SFC_SRIOV
25414b2a64ae7e Alejandro Lucero 2023-02-15  437  		ef100_pf_set_devlink_port(efx);
25414b2a64ae7e Alejandro Lucero 2023-02-15  438  #endif
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  439  	}
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  440  
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  441  	efx->netdev_notifier.notifier_call = ef100_netdev_event;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  442  	rc = register_netdevice_notifier(&efx->netdev_notifier);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  443  	if (rc) {
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  444  		netif_err(efx, probe, efx->net_dev,
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  445  			  "Failed to register netdevice notifier, rc=%d\n", rc);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  446  		goto fail;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  447  	}
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  448  
25414b2a64ae7e Alejandro Lucero 2023-02-15  449  	efx_probe_devlink_unlock(efx);
25414b2a64ae7e Alejandro Lucero 2023-02-15  450  	return rc;
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28  451  fail:
25414b2a64ae7e Alejandro Lucero 2023-02-15  452  #ifdef CONFIG_SFC_SRIOV
25414b2a64ae7e Alejandro Lucero 2023-02-15  453  	/* remove devlink port if does exist */
25414b2a64ae7e Alejandro Lucero 2023-02-15  454  	ef100_pf_unset_devlink_port(efx);
25414b2a64ae7e Alejandro Lucero 2023-02-15  455  #endif
fa34a5140a8e8f Alejandro Lucero 2023-02-15  456  	efx_probe_devlink_unlock(efx);
98ff4c7c8ac7f5 Jonathan Cooper  2022-06-28 @457  	return rc;

:::::: The code at line 457 was first introduced by commit
:::::: 98ff4c7c8ac7f5339aac6114105395fea19f992e sfc: Separate netdev probe/remove from PCI probe/remove

:::::: TO: Jonathan Cooper <jonathan.s.cooper@amd.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

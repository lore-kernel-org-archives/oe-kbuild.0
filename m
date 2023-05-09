Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E538A
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 04:34:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3062c1e7df8so3439892f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 08 May 2023 21:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683606896; x=1686198896;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbxwRvm7hhLbWBjkdeZJS6kDPtZzWa2hv6bdpCzQNOs=;
        b=FyrREQGyPf3mgBNk+E9I7yMwwnb2oTREUqTwqCPL+TyzzXAIaN+r6aqa8Bmbuukz9C
         vvojGx4O7N34hvnzjs2gHqJXV75PEUomgzWmHWBPKA89hyvLx9KZjLpqKtRoYIZcK3WE
         bTOE7qAfsnvFYIPtKX3sbNVtd0r0fV2ZiReSL1HGGGXHaMT3QkutJVNtpO9YkNf+tEXB
         bX2NFYn7rh3btp8XEU+OoUzE8FZuZexWKoaeVDgLhH7dSTCbIThntYxoN11Aj9YnBG5m
         RGUQzeEnN/PlIxBqII3YDz8/4/IYecVUhj1wFRDxzFPGzgWm3XTeJUDLB9WP5vvEZfM2
         ZRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683606896; x=1686198896;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbxwRvm7hhLbWBjkdeZJS6kDPtZzWa2hv6bdpCzQNOs=;
        b=H/6PIRQQgnYC5FhcYwXJ0YsOIRjMYksQzCcTYoNXxDdkXyZjvOoH9VKvAVRvYnqp9A
         1R7lG0CcwHFkSdsNZW6jlkaCC1RIViXTx2/SOQjYf16ZBvdz7OsDmBzaggEVVDRL7U3d
         ff8e9B7ByIDd8yCoFVsn/xwKNzaWykmTUJQHKARrcYpoDBUk9xgzpGUJCbOgGLBQiSTE
         scvlZ/V9+JihiwOf/a3kmoIc65t8BiwiJMkajVIpBgA4PtHUfY2Dv1eOP7Ji3kESd3LJ
         reN7j5Zlo1QjRUahykv4pjDjfRb0liVC8gD6bOjobK9rqWtWfH4HDHq+DW18CcW7+TNN
         85Ug==
X-Gm-Message-State: AC+VfDz0ZtVh7bgLTtP7xF+fiUtmfxfYVDH9HcYbBDQnRSd0+t7zAlEf
	TQ+wRDhcprbwKsfmTOFBYMJ5m2y1lxYbi+sQrLM=
X-Google-Smtp-Source: ACHHUZ50cJG2ecUgRUUxm1qCr/sqs2v3uPdbQ2dXF+tf3xoNy1MV3R71hPhHLVckRNydvtbcOqf++g==
X-Received: by 2002:a5d:604e:0:b0:306:29c8:23f7 with SMTP id j14-20020a5d604e000000b0030629c823f7mr8426342wrt.29.1683606895750;
        Mon, 08 May 2023 21:34:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q15-20020adff94f000000b003078b3e2845sm8882952wrr.31.2023.05.08.21.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 21:34:54 -0700 (PDT)
Date: Tue, 9 May 2023 07:34:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: drivers/net/ethernet/sfc/ef100_netdev.c:457 ef100_probe_netdev()
 warn: 'net_dev' from alloc_etherdev_mqs() not released on lines: 418.
Message-ID: <c953d588-7323-4b49-aa94-40138f1b1e6d@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba0ad6ed89fd5dada3b7b65ef2b08e95d449d4ab
commit: 7e056e2360d9267a20509aa2cdb8905485499e95 sfc: obtain device mac address based on firmware handle for ef100
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230509/202305090926.xAinp8CH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305090926.xAinp8CH-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/sfc/ef100_netdev.c:457 ef100_probe_netdev() warn: 'net_dev' from alloc_etherdev_mqs() not released on lines: 418.

Old smatch warnings:
drivers/net/ethernet/sfc/ef100_netdev.c:141 ef100_net_open() warn: missing unwind goto?

vim +/net_dev +457 drivers/net/ethernet/sfc/ef100_netdev.c

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

These goto fails are problematic because they call efx_probe_devlink_unlock()
which was never locked.   Typical problem with one err label style
error handling.

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

No clean up on this path.  Needs to call free_netdev().

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


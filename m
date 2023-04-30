Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0D023AE
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Apr 2023 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682897873; x=1714433873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPTLeXU0QLAXdvf5aJ6aB4tnIerGaixvD5mUPlbmQIo=;
  b=P4ffn46KDguFlXu3DFhVpLtOUlHr6BSpjOjaJc71ii0gNqZohYGsdmll
   gp0sAXRKOp0uQEFqM0kB4THQecSnbyYj8+B0Nj+ZDwXLJQJ9iPw5b7SaS
   OSNEtcdMrTPdAEfA2ndij+evZZMJ9fZtxcEu65P9jP9cO0EzPh4zbp+/h
   4xYopTvZno2OrzZdO6RwpQBx+r3xEYMA+azxgjKgJU/qPHu4JXTEzqr6l
   rvx2tUe5wJ9nG9jWaKW4bhq/g24ovzr1KFRfrkOSwomaKsDYNXAPRGqSP
   2PEcqpz/CQbAp1cxkKPWLQFZCqZ5oDJteuOcroLCgyxvm5blFyU2nviQv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="332407847"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="332407847"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 16:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695619273"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695619273"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 16:37:50 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptGc1-0000Au-2p;
	Sun, 30 Apr 2023 23:37:49 +0000
Date: Mon, 1 May 2023 07:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/atm/eni.c:480 do_rx_dma() error: we previously assumed 'skb'
 could be null (see line 352)
Message-ID: <202305010757.950GPlFA-lkp@intel.com>
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
TO: Stafford Horne <shorne@gmail.com>

Hi Stafford,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010757.950GPlFA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305010757.950GPlFA-lkp@intel.com/

New smatch warnings:
drivers/atm/eni.c:480 do_rx_dma() error: we previously assumed 'skb' could be null (see line 352)
drivers/scsi/bfa/bfad_bsg.c:101 bfad_iocmd_ioc_get_info() error: testing array offset 'i' after use.
drivers/scsi/bfa/bfad_bsg.c:3247 bfad_fcxp_map_sg() warn: double check that we're allocating correct size: 12 vs 1
drivers/scsi/cxgbi/libcxgbi.h:313 cxgbi_sock_free() warn: can 'csk' even be NULL?
drivers/scsi/elx/efct/efct_hw.c:1357 efct_hw_cmd_submit_pending() warn: can 'ctx' even be NULL?
drivers/scsi/elx/efct/efct_hw.c:2536 efct_hw_wq_write() warn: can 'wqe' even be NULL?
drivers/scsi/sym53c8xx_2/sym_glue.c:1054 sym_user_command() warn: inconsistent indenting
drivers/scsi/sym53c8xx_2/sym_glue.c:1373 sym_attach() warn: 'pdev->irq' from request_irq() not released on lines: 1373.
drivers/scsi/sym53c8xx_2/sym_hipd.c:3713 sym_evaluate_dp() error: testing array offset 'dp_sg' after use.
drivers/staging/qlge/qlge_mpi.c:1061 qlge_mb_get_mgmnt_traffic_ctl() warn: missing error code? 'status'
drivers/staging/rtl8192e/rtllib_tx.c:948 rtllib_xmit_inter() error: we previously assumed 'ieee->hard_start_xmit' could be null (see line 579)
drivers/staging/rtl8192e/rtllib_wx.c:389 rtllib_wx_set_encode() error: we previously assumed '(*crypt)->ops' could be null (see line 342)
drivers/staging/rtl8192e/rtllib_softmac.c:2040 rtllib_sta_ps_sleep() warn: inconsistent indenting
drivers/staging/rtl8192e/rtllib_rx.c:512 rtllib_indicate_packets() warn: variable dereferenced before check 'sub_skb' (see line 488)
drivers/staging/rtl8192e/rtllib_rx.c:1054 rtllib_rx_get_crypt() warn: potential spectre issue 'ieee->crypt_info.crypt' [r]
drivers/staging/rtl8192e/rtllib_rx.c:1058 rtllib_rx_get_crypt() warn: possible spectre second half.  '*crypt'
drivers/staging/rtl8192u/ieee80211/ieee80211_tx.c:822 ieee80211_xmit() error: we previously assumed 'ieee->hard_start_xmit' could be null (see line 557)
drivers/net/ethernet/chelsio/cxgb/sge.c:1385 sge_rx() warn: potential spectre issue 'sge->port_stats' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/sge.c:2097 rx_eth() warn: potential spectre issue 'adap->port' [r]
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:768 do_stid_rpl() warn: potential spectre issue 't3c_tid->client->handlers' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:786 do_hwtid_rpl() warn: potential spectre issue 't3c_tid->client->handlers' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:853 do_abort_req_rss() warn: potential spectre issue 't3c_tid->client->handlers' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2202 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->params.sge.qset' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2220 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->sge.qs' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2292 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->msix_info' [r]
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3561 cudbg_collect_qdesc() error: uninitialized symbol 'rc'.
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3598 cudbg_collect_flash() error: uninitialized symbol 'rc'.
drivers/usb/gadget/udc/pch_udc.c:1839 pch_udc_pcd_queue() warn: can 'req' even be NULL?
drivers/net/ethernet/fungible/funcore/fun_queue.c:555 fun_request_irq() warn: excess argument passed to 'snprintf'
drivers/net/ethernet/mellanox/mlx5/core/en/reporter_rx.c:91 mlx5e_rx_reporter_err_icosq_cqe_recover() warn: missing error code 'err'
drivers/net/ethernet/mellanox/mlx5/core/en/reporter_tx.c:63 mlx5e_tx_reporter_err_cqe_recover() warn: missing error code 'err'
drivers/net/ethernet/mellanox/mlx5/core/esw/acl/egress_ofld.c:120 esw_acl_egress_ofld_groups_create() warn: missing error code 'ret'
drivers/net/ethernet/mellanox/mlx5/core/steering/dr_action.c:1716 dr_action_create_modify_action() warn: double check that we're allocating correct size: 8 vs 128
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1392 mlx5_alloc_cmd_msg() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/pci_irq.c:259 mlx5_irq_alloc() error: passing non negative 536870911 to ERR_PTR
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1710 dest_is_valid() error: we previously assumed 'dest' could be null (see line 1699)
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1992 _mlx5_add_flow_rules() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2509 init_root_tree_recursive() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2817 create_fdb_sub_ns_prio_chain() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2888 create_fdb_bypass() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:311 mlx5_fc_stats_work() warn: can 'counter' even be NULL?
drivers/net/ethernet/mellanox/mlx5/core/lag/lag.c:1489 mlx5_lag_query_cong_counters() error: uninitialized symbol 'ret'.
drivers/net/ethernet/mellanox/mlx5/core/lib/devcom.c:248 mlx5_devcom_get_peer_data() error: buffer overflow 'comp->device' 2 <= 2 (assuming for loop doesn't break)
drivers/net/ethernet/fungible/funeth/funeth_main.c:281 fun_alloc_qirq() warn: passing zero to 'ERR_PTR'
drivers/net/ethernet/intel/fm10k/fm10k_netdev.c:759 fm10k_uc_vlan_unsync() warn: replace divide condition 'vid / 4096' with 'vid >= 4096'
drivers/net/ethernet/intel/fm10k/fm10k_netdev.c:779 fm10k_mc_vlan_unsync() warn: replace divide condition 'vid / 4096' with 'vid >= 4096'
drivers/net/ethernet/intel/fm10k/fm10k_pci.c:2149 fm10k_probe() warn: consider using resource_size() here
drivers/net/ethernet/sfc/siena/efx_common.c:767 efx_siena_reset_up() warn: missing error code 'rc'
drivers/net/ethernet/intel/i40e/i40e_txrx_common.h:77 i40e_arm_wb() warn: replace divide condition 'j / 4' with 'j >= 4'
drivers/net/ethernet/intel/i40e/i40e_client.c:363 i40e_client_add_instance() warn: can 'mac' even be NULL?
drivers/net/ethernet/intel/i40e/i40e_main.c:13307 i40e_queue_pair_toggle_rings() warn: missing error code? 'ret'
drivers/net/ethernet/intel/i40e/i40e_main.c:14094 i40e_vsi_setup_vectors() warn: missing error code? 'ret'
drivers/net/ethernet/intel/iavf/iavf_txrx.c:297 iavf_clean_tx_irq() warn: replace divide condition 'j / 4' with 'j >= 4'
drivers/net/ethernet/intel/iavf/iavf_client.c:224 iavf_client_add_instance() warn: can 'mac' even be NULL?
drivers/net/ethernet/intel/ice/ice_flow.c:1064 ice_flow_xtract_fld() error: testing array offset 'sib' after use.
drivers/net/ethernet/intel/ice/ice_flow.c:2155 ice_add_rss_cfg_sync() error: we previously assumed 'prof' could be null (see line 2132)
drivers/net/ethernet/intel/igb/igb_main.c:8518 igb_run_xdp() error: (-2147483647) too low for ERR_PTR
drivers/net/ethernet/intel/igb/igb_main.c:8869 igb_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/intel/igb/igb_ethtool.c:1776 igb_loopback_cleanup() error: uninitialized symbol 'phy_reg'.
drivers/net/ethernet/dec/tulip/eeprom.c:179 tulip_parse_eeprom() warn: inconsistent indenting
drivers/net/ethernet/dec/tulip/interrupt.c:580 tulip_interrupt() warn: inconsistent indenting
drivers/net/ethernet/dec/tulip/pnic2.c:300 pnic2_lnk_change() warn: inconsistent indenting
drivers/net/ethernet/intel/igc/igc_main.c:2273 igc_xdp_run_prog() warn: passing zero to 'ERR_PTR'
drivers/net/ethernet/intel/igc/igc_main.c:2421 igc_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2249 ixgbe_run_xdp() error: (-2147483647) too low for ERR_PTR
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:2395 ixgbe_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3277 ixgbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 3277.
drivers/net/ethernet/intel/ixgbe/ixgbe_x540.c:715 ixgbe_release_swfw_sync_semaphore() warn: inconsistent indenting
drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c:1433 ixgbe_identify_sfp_module_generic() warn: missing unwind goto?
drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c:1699 ixgbe_identify_qsfp_module_generic() warn: missing unwind goto?
drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c:1909 ixgbe_get_sfp_init_sequence_offsets() warn: missing unwind goto?
drivers/scsi/cxgbi/cxgb3i/../libcxgbi.h:313 cxgbi_sock_free() warn: can 'csk' even be NULL?
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:945 do_act_establish() warn: potential spectre issue 'lldi->mtus' [r]
drivers/scsi/cxgbi/cxgb4i/../libcxgbi.h:313 cxgbi_sock_free() warn: can 'csk' even be NULL?
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2345 t4_uld_rx_handler() warn: potential spectre issue 'cxgb4i_cplhandlers' [w] (local cap)
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1084 ixgbevf_run_xdp() error: (-2147483647) too low for ERR_PTR
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1213 ixgbevf_clean_rx_irq() error: 'skb' dereferencing possible ERR_PTR()
drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c:1601 ixgbevf_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 1601.

Old smatch warnings:
drivers/scsi/cxgbi/libcxgbi.c:524 sock_put_port() warn: potential spectre issue 'pmap->port_csk' [w] (local cap)
drivers/scsi/cxgbi/libcxgbi.c:1194 cxgbi_ddp_set_one_ppod() error: we previously assumed 'sg_off' could be null (see line 1159)
drivers/scsi/sym53c8xx_2/sym_hipd.c:3714 sym_evaluate_dp() error: testing array offset 'dp_sg' after use.
drivers/staging/rtl8192e/rtllib_rx.c:1494 rtllib_rx_Monitor() error: dereferencing freed memory 'skb'
drivers/net/ethernet/chelsio/cxgb/sge.c:1386 sge_rx() warn: potential spectre issue 'adapter->port' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1693 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1694 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1695 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1696 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1698 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1699 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1700 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1701 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1747 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1748 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1750 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1752 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1754 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1755 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1757 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1759 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3110 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3111 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3113 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3115 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3116 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1512 outlen_write() warn: sscanf doesn't return error codes

vim +/skb +480 drivers/atm/eni.c

^1da177e4c3f41 Linus Torvalds             2005-04-16  336  
^1da177e4c3f41 Linus Torvalds             2005-04-16  337  
^1da177e4c3f41 Linus Torvalds             2005-04-16  338  static int do_rx_dma(struct atm_vcc *vcc,struct sk_buff *skb,
^1da177e4c3f41 Linus Torvalds             2005-04-16  339      unsigned long skip,unsigned long size,unsigned long eff)
^1da177e4c3f41 Linus Torvalds             2005-04-16  340  {
^1da177e4c3f41 Linus Torvalds             2005-04-16  341  	struct eni_dev *eni_dev;
^1da177e4c3f41 Linus Torvalds             2005-04-16  342  	struct eni_vcc *eni_vcc;
^1da177e4c3f41 Linus Torvalds             2005-04-16  343  	u32 dma_rd,dma_wr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  344  	u32 dma[RX_DMA_BUF*2];
^1da177e4c3f41 Linus Torvalds             2005-04-16  345  	dma_addr_t paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  346  	unsigned long here;
^1da177e4c3f41 Linus Torvalds             2005-04-16  347  	int i,j;
^1da177e4c3f41 Linus Torvalds             2005-04-16  348  
^1da177e4c3f41 Linus Torvalds             2005-04-16  349  	eni_dev = ENI_DEV(vcc->dev);
^1da177e4c3f41 Linus Torvalds             2005-04-16  350  	eni_vcc = ENI_VCC(vcc);
^1da177e4c3f41 Linus Torvalds             2005-04-16  351  	paddr = 0; /* GCC, shut up */
^1da177e4c3f41 Linus Torvalds             2005-04-16 @352  	if (skb) {
ede58ef28e105d chas williams - CONTRACTOR 2015-01-16  353  		paddr = dma_map_single(&eni_dev->pci_dev->dev,skb->data,skb->len,
ede58ef28e105d chas williams - CONTRACTOR 2015-01-16  354  				       DMA_FROM_DEVICE);
ede58ef28e105d chas williams - CONTRACTOR 2015-01-16  355  		if (dma_mapping_error(&eni_dev->pci_dev->dev, paddr))
541675580ffcd0 Tina Johnson               2014-11-20  356  			goto dma_map_error;
^1da177e4c3f41 Linus Torvalds             2005-04-16  357  		ENI_PRV_PADDR(skb) = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  358  		if (paddr & 3)
^1da177e4c3f41 Linus Torvalds             2005-04-16  359  			printk(KERN_CRIT DEV_LABEL "(itf %d): VCI %d has "
^1da177e4c3f41 Linus Torvalds             2005-04-16  360  			    "mis-aligned RX data (0x%lx)\n",vcc->dev->number,
^1da177e4c3f41 Linus Torvalds             2005-04-16  361  			    vcc->vci,(unsigned long) paddr);
^1da177e4c3f41 Linus Torvalds             2005-04-16  362  		ENI_PRV_SIZE(skb) = size+skip;
^1da177e4c3f41 Linus Torvalds             2005-04-16  363  		    /* PDU plus descriptor */
^1da177e4c3f41 Linus Torvalds             2005-04-16  364  		ATM_SKB(skb)->vcc = vcc;
^1da177e4c3f41 Linus Torvalds             2005-04-16  365  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  366  	j = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  367  	if ((eff && skip) || 1) { /* @@@ actually, skip is always == 1 ... */
^1da177e4c3f41 Linus Torvalds             2005-04-16  368  		here = (eni_vcc->descr+skip) & (eni_vcc->words-1);
^1da177e4c3f41 Linus Torvalds             2005-04-16  369  		dma[j++] = (here << MID_DMA_COUNT_SHIFT) | (vcc->vci
^1da177e4c3f41 Linus Torvalds             2005-04-16  370  		    << MID_DMA_VCI_SHIFT) | MID_DT_JK;
30780d086a8333 Arnd Bergmann              2020-01-07  371  		dma[j++] = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  372  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  373  	here = (eni_vcc->descr+size+skip) & (eni_vcc->words-1);
^1da177e4c3f41 Linus Torvalds             2005-04-16  374  	if (!eff) size += skip;
^1da177e4c3f41 Linus Torvalds             2005-04-16  375  	else {
^1da177e4c3f41 Linus Torvalds             2005-04-16  376  		unsigned long words;
^1da177e4c3f41 Linus Torvalds             2005-04-16  377  
^1da177e4c3f41 Linus Torvalds             2005-04-16  378  		if (!size) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  379  			DPRINTK("strange things happen ...\n");
^1da177e4c3f41 Linus Torvalds             2005-04-16  380  			EVENT("strange things happen ... (skip=%ld,eff=%ld)\n",
^1da177e4c3f41 Linus Torvalds             2005-04-16  381  			    size,eff);
^1da177e4c3f41 Linus Torvalds             2005-04-16  382  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  383  		words = eff;
^1da177e4c3f41 Linus Torvalds             2005-04-16  384  		if (paddr & 15) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  385  			unsigned long init;
^1da177e4c3f41 Linus Torvalds             2005-04-16  386  
^1da177e4c3f41 Linus Torvalds             2005-04-16  387  			init = 4-((paddr & 15) >> 2);
^1da177e4c3f41 Linus Torvalds             2005-04-16  388  			if (init > words) init = words;
^1da177e4c3f41 Linus Torvalds             2005-04-16  389  			dma[j++] = MID_DT_WORD | (init << MID_DMA_COUNT_SHIFT) |
^1da177e4c3f41 Linus Torvalds             2005-04-16  390  			    (vcc->vci << MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  391  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  392  			paddr += init << 2;
^1da177e4c3f41 Linus Torvalds             2005-04-16  393  			words -= init;
^1da177e4c3f41 Linus Torvalds             2005-04-16  394  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  395  #ifdef CONFIG_ATM_ENI_BURST_RX_16W /* may work with some PCI chipsets ... */
^1da177e4c3f41 Linus Torvalds             2005-04-16  396  		if (words & ~15) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  397  			dma[j++] = MID_DT_16W | ((words >> 4) <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  398  			    MID_DMA_COUNT_SHIFT) | (vcc->vci <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  399  			    MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  400  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  401  			paddr += (words & ~15) << 2;
^1da177e4c3f41 Linus Torvalds             2005-04-16  402  			words &= 15;
^1da177e4c3f41 Linus Torvalds             2005-04-16  403  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  404  #endif
^1da177e4c3f41 Linus Torvalds             2005-04-16  405  #ifdef CONFIG_ATM_ENI_BURST_RX_8W  /* works only with *some* PCI chipsets ... */
^1da177e4c3f41 Linus Torvalds             2005-04-16  406  		if (words & ~7) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  407  			dma[j++] = MID_DT_8W | ((words >> 3) <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  408  			    MID_DMA_COUNT_SHIFT) | (vcc->vci <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  409  			    MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  410  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  411  			paddr += (words & ~7) << 2;
^1da177e4c3f41 Linus Torvalds             2005-04-16  412  			words &= 7;
^1da177e4c3f41 Linus Torvalds             2005-04-16  413  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  414  #endif
^1da177e4c3f41 Linus Torvalds             2005-04-16  415  #ifdef CONFIG_ATM_ENI_BURST_RX_4W /* recommended */
^1da177e4c3f41 Linus Torvalds             2005-04-16  416  		if (words & ~3) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  417  			dma[j++] = MID_DT_4W | ((words >> 2) <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  418  			    MID_DMA_COUNT_SHIFT) | (vcc->vci <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  419  			    MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  420  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  421  			paddr += (words & ~3) << 2;
^1da177e4c3f41 Linus Torvalds             2005-04-16  422  			words &= 3;
^1da177e4c3f41 Linus Torvalds             2005-04-16  423  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  424  #endif
^1da177e4c3f41 Linus Torvalds             2005-04-16  425  #ifdef CONFIG_ATM_ENI_BURST_RX_2W /* probably useless if RX_4W, RX_8W, ... */
^1da177e4c3f41 Linus Torvalds             2005-04-16  426  		if (words & ~1) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  427  			dma[j++] = MID_DT_2W | ((words >> 1) <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  428  			    MID_DMA_COUNT_SHIFT) | (vcc->vci <<
^1da177e4c3f41 Linus Torvalds             2005-04-16  429  			    MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  430  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  431  			paddr += (words & ~1) << 2;
^1da177e4c3f41 Linus Torvalds             2005-04-16  432  			words &= 1;
^1da177e4c3f41 Linus Torvalds             2005-04-16  433  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  434  #endif
^1da177e4c3f41 Linus Torvalds             2005-04-16  435  		if (words) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  436  			dma[j++] = MID_DT_WORD | (words << MID_DMA_COUNT_SHIFT)
^1da177e4c3f41 Linus Torvalds             2005-04-16  437  			    | (vcc->vci << MID_DMA_VCI_SHIFT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  438  			dma[j++] = paddr;
^1da177e4c3f41 Linus Torvalds             2005-04-16  439  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  440  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  441  	if (size != eff) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  442  		dma[j++] = (here << MID_DMA_COUNT_SHIFT) |
^1da177e4c3f41 Linus Torvalds             2005-04-16  443  		    (vcc->vci << MID_DMA_VCI_SHIFT) | MID_DT_JK;
30780d086a8333 Arnd Bergmann              2020-01-07  444  		dma[j++] = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  445  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  446  	if (!j || j > 2*RX_DMA_BUF) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  447  		printk(KERN_CRIT DEV_LABEL "!j or j too big!!!\n");
^1da177e4c3f41 Linus Torvalds             2005-04-16  448  		goto trouble;
^1da177e4c3f41 Linus Torvalds             2005-04-16  449  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  450  	dma[j-2] |= MID_DMA_END;
^1da177e4c3f41 Linus Torvalds             2005-04-16  451  	j = j >> 1;
^1da177e4c3f41 Linus Torvalds             2005-04-16  452  	dma_wr = eni_in(MID_DMA_WR_RX);
^1da177e4c3f41 Linus Torvalds             2005-04-16  453  	dma_rd = eni_in(MID_DMA_RD_RX);
^1da177e4c3f41 Linus Torvalds             2005-04-16  454  	/*
^1da177e4c3f41 Linus Torvalds             2005-04-16  455  	 * Can I move the dma_wr pointer by 2j+1 positions without overwriting
^1da177e4c3f41 Linus Torvalds             2005-04-16  456  	 * data that hasn't been read (position of dma_rd) yet ?
^1da177e4c3f41 Linus Torvalds             2005-04-16  457  	 */
^1da177e4c3f41 Linus Torvalds             2005-04-16  458  	if (!NEPMOK(dma_wr,j+j+1,dma_rd,NR_DMA_RX)) { /* @@@ +1 is ugly */
^1da177e4c3f41 Linus Torvalds             2005-04-16  459  		printk(KERN_WARNING DEV_LABEL "(itf %d): RX DMA full\n",
^1da177e4c3f41 Linus Torvalds             2005-04-16  460  		    vcc->dev->number);
^1da177e4c3f41 Linus Torvalds             2005-04-16  461  		goto trouble;
^1da177e4c3f41 Linus Torvalds             2005-04-16  462  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  463          for (i = 0; i < j; i++) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  464  		writel(dma[i*2],eni_dev->rx_dma+dma_wr*8);
^1da177e4c3f41 Linus Torvalds             2005-04-16  465  		writel(dma[i*2+1],eni_dev->rx_dma+dma_wr*8+4);
^1da177e4c3f41 Linus Torvalds             2005-04-16  466  		dma_wr = (dma_wr+1) & (NR_DMA_RX-1);
^1da177e4c3f41 Linus Torvalds             2005-04-16  467          }
^1da177e4c3f41 Linus Torvalds             2005-04-16  468  	if (skb) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  469  		ENI_PRV_POS(skb) = eni_vcc->descr+size+1;
^1da177e4c3f41 Linus Torvalds             2005-04-16  470  		skb_queue_tail(&eni_dev->rx_queue,skb);
^1da177e4c3f41 Linus Torvalds             2005-04-16  471  		eni_vcc->last = skb;
^1da177e4c3f41 Linus Torvalds             2005-04-16  472  		rx_enqueued++;
^1da177e4c3f41 Linus Torvalds             2005-04-16  473  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  474  	eni_vcc->descr = here;
^1da177e4c3f41 Linus Torvalds             2005-04-16  475  	eni_out(dma_wr,MID_DMA_WR_RX);
^1da177e4c3f41 Linus Torvalds             2005-04-16  476  	return 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  477  
^1da177e4c3f41 Linus Torvalds             2005-04-16  478  trouble:
^1da177e4c3f41 Linus Torvalds             2005-04-16  479  	if (paddr)
ede58ef28e105d chas williams - CONTRACTOR 2015-01-16 @480  		dma_unmap_single(&eni_dev->pci_dev->dev,paddr,skb->len,
ede58ef28e105d chas williams - CONTRACTOR 2015-01-16  481  				 DMA_FROM_DEVICE);
541675580ffcd0 Tina Johnson               2014-11-20  482  dma_map_error:
^1da177e4c3f41 Linus Torvalds             2005-04-16  483  	if (skb) dev_kfree_skb_irq(skb);
^1da177e4c3f41 Linus Torvalds             2005-04-16  484  	return -1;
^1da177e4c3f41 Linus Torvalds             2005-04-16  485  }
^1da177e4c3f41 Linus Torvalds             2005-04-16  486  

:::::: The code at line 480 was first introduced by commit
:::::: ede58ef28e105de94475b2b69fa069c9a2ce6933 atm: remove deprecated use of pci api

:::::: TO: chas williams - CONTRACTOR <chas@cmf.nrl.navy.mil>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

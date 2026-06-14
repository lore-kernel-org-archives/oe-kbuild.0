Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347024DD15
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781429107; cv=none; b=M/GRhq8nPyd3XVyiqLhDjglMmaTeZ50fibhFl6ym9T5S31cev49RIDmY90fXz3T+tRujgnz5wtQpx1nU8y2WdxRhBf1hYG748qLqj0LgpVD5FtFLYMu4pnAdJRX9YtsZ2SZoQvcAg5aVLHMQWxRVmb9MDQdUpsvVIPikBxqR3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781429107; c=relaxed/simple;
	bh=5c2vSCv9uCSe0JU/AFid85pSl+Et5xYJEx4mwbTHdP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=klGsYq2r5ccbg7lNI4Tz2HBijyo5uxUQox6wHdVI0nmGd+LHj6KjgHTPQ4TlvYayTxTKiP5IHJTtAZw1mi5ZnLNJqvNuC0UDnfbG4J6wJu8R0o1kaalErqDurzWRsVbfkulogFiamtZLJ2LRdWjuAc5pXLsQwbeKcr7Jb6u6pwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJbJ+0U5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJbJ+0U5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781429103; x=1812965103;
  h=date:from:to:cc:subject:message-id;
  bh=5c2vSCv9uCSe0JU/AFid85pSl+Et5xYJEx4mwbTHdP8=;
  b=BJbJ+0U586aEEYF722SdrgULfCVYiRAnPQCRxXPs0qS7PFCJm1W46Qpu
   nYpQS6h0SnNALIgCAS1/f+nWLgJbW6uF0g6tboxMNTAl/aTVI8IV+J4qo
   +ZALBVyu6tnUOc+8tu9/qncIrz4BZgGjC9F1DMgINN/2X0b4phkki/MPs
   kvM+ACxYwd6opPfm4l/cm6zOUKs5ZMLTnScmj8zjJZkt5RdowRXy+Dkly
   hR5ZNG2rq2ygj5DtsqG3J8IJz+uEZ/cUvLHLyk4j1VBCWOCAKnlfKKLJq
   +TIUcG9XrQ+deoyCDFZFj7uPN+CqCPDqWFu6COKtbOnC2u6HLrdiPjhBO
   A==;
X-CSE-ConnectionGUID: MMbsLglJSY2bULU67X7AWw==
X-CSE-MsgGUID: MPM3QysDSie1SHykZHXG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="69741753"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="69741753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 02:25:02 -0700
X-CSE-ConnectionGUID: L9jPICjgQjaByvvJTkWiKw==
X-CSE-MsgGUID: EJ6qnp1lQhmBZjViJNphTA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2026 02:25:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYh5O-00000000QiY-14pC;
	Sun, 14 Jun 2026 09:24:58 +0000
Date: Sun, 14 Jun 2026 17:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11556/13763]
 arch/x86/platform/efi/efi_64.c:683 efi_thunk_set_variable_nonblocking()
 error: calling 'spin_unlock_irqrestore()' with bogus flags
Message-ID: <202606141752.jNkZM7Yv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: e07d10ed0f238d3f4a8276932a36fe1f74775621 [11556/13763] lib/Kconfig.debug: enable CONFIG_PREEMPT_RT for syzbot kernels.
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141752.jNkZM7Yv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606141752.jNkZM7Yv-lkp@intel.com/

New smatch warnings:
arch/x86/platform/efi/efi_64.c:683 efi_thunk_set_variable_nonblocking() error: calling 'spin_unlock_irqrestore()' with bogus flags
arch/x86/platform/efi/efi_64.c:801 efi_thunk_query_variable_info_nonblocking() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/usb-ljca.c:372 ljca_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/amd/pasid.c:144 iommu_sva_set_dev_pasid() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:452 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-aen.c:167 ncsi_aen_handler_cr() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/cong.c:163 rds_cong_from_addr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/megaraid/megaraid_mm.c:571 mraid_mm_attach_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/generic_pt/fmt/../iommu_pt.h:830 increase_top() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/rdma.c:109 rds_destroy_mr() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/rdma.c:145 rds_rdma_drop_keys() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/generic_pt/fmt/../iommu_pt.h:830 increase_top() error: calling 'spin_unlock_irqrestore()' with bogus flags
mm/backing-dev.c:741 cgwb_create() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/connection.c:347 __rds_conn_create() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-rsp.c:909 ncsi_rsp_handler_gp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/generic_pt/fmt/../iommu_pt.h:830 increase_top() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-manage.c:81 ncsi_report_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-manage.c:156 ncsi_channel_monitor() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-manage.c:1299 ncsi_choose_active_channel() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/ncsi/ncsi-manage.c:1925 ncsi_reset_dev() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:189 get_free_entries() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:300 get_free_entries_seq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:521 gnttab_handle_deferred() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:1021 gnttab_page_cache_shrink() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/generic_pt/fmt/../iommu_pt.h:830 increase_top() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/bluetooth/hci_bcm4377.c:974 bcm4377_enqueue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/amd/iommu.c:3402 alloc_irq_table() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/send.c:725 rds_send_remove_from_sock() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_gsm.c:2500 gsm_kick_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/tty/n_gsm.c:3558 gsmld_write_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/firmware/efi/unaccepted_memory.c:213 range_contains_unaccepted_memory() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/m66592-udc.c:1380 m66592_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/m66592-udc.c:1418 m66592_set_halt() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/agere/et131x.c:2760 et131x_free_busy_send_packets() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/agere/et131x.c:2811 et131x_handle_send_pkts() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fcloop.c:878 fcloop_fcp_op() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fcloop.c:1118 fcloop_remoteport_delete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fcloop.c:1139 fcloop_targetport_delete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/xen-netfront.c:853 xennet_start_xmit() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:409 __nvmet_fc_send_ls_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:1587 nvmet_fc_delete_ctrl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:1901 nvmet_fc_ls_disconnect() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:2384 nvmet_fc_fod_op_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:2738 nvmet_fc_rcv_fcp_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:2925 nvmet_fc_remove_port() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:2948 nvmet_fc_discovery_chg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/wan/farsync.c:945 fst_issue_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/ata/pata_atiixp.c:198 atiixp_set_dmamode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/v4l2-core/v4l2-mem2mem.c:237 v4l2_m2m_get_curr_priv() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/v4l2-core/v4l2-mem2mem.c:934 v4l2_m2m_poll_for_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3035 fc_rport_final_delete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3338 fc_remote_port_add() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3595 fc_remote_port_rolechg() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3811 fc_block_rport() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3970 fc_vport_setup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/gadget/udc/bdc/bdc_udc.c:392 bdc_udc_start() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla1280.c:1221 qla1280_sdev_configure() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/esp_scsi.c:2582 esp_eh_abort_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/esp_scsi.c:2634 esp_eh_bus_reset_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/megaraid.c:1401 megaraid_isr_memmapped() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/natsemi/ns83820.c:1483 ns83820_do_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:306 cxgb_rdma_ctl() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:941 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:1045 initio_exec_scb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/3w-xxxx.c:1328 tw_reset_device_extension() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/3w-sas.c:1389 twl_reset_device_extension() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/stex.c:1413 stex_do_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/vmw_pvscsi.c:868 pvscsi_abort() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/vmw_pvscsi.c:946 pvscsi_host_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc911x.c:2000 smsc911x_ethtool_getregs() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/dpcsup.c:129 aac_response_normal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/dpcsup.c:214 aac_command_normal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/pensando/ionic/ionic_lif.c:1237 ionic_adminq_napi() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3345 ipr_worker_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3523 ipr_store_diagnostics() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3950 ipr_update_ioa_ucode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:4950 ipr_wait_for_ops() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:4995 ipr_eh_host_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:5289 ipr_scan_finished() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:5550 ipr_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:5599 ipr_isr_mhrrq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:9351 ipr_test_msi() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:9698 __ipr_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:9863 ipr_shutdown() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:617 aac_fib_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:745 aac_hba_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:2149 aac_process_events() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:218 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:664 fnic_send_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:1128 fnic_reset_work_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:1164 fnic_fcpio_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_init.c:865 qla4xxx_start_firmware() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/efct/efct_io.c:161 efct_io_pool_io_free() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_attr.c:41 bfad_im_get_starget_port_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_attr.c:67 bfad_im_get_starget_node_name() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_attr.c:93 bfad_im_get_starget_port_name() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_attr.c:466 bfad_im_issue_fc_host_lip() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm8001_sas.c:120 pm80xx_get_tag_opcodes() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm8001_sas.c:528 pm8001_queue_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm8001_sas.c:794 pm8001_dev_gone_notify() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm8001_sas.c:868 pm8001_open_reject_retry() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm8001_sas.c:1213 pm8001_abort_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad.c:653 bfad_vport_create() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_mbx.c:264 qla4xxx_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_im.c:402 bfad_im_reset_target_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_im.c:1197 bfad_im_itnim_work_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/arcmsr/arcmsr_hba.c:3185 arcmsr_iop_message_xfer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_isr.c:1323 qla4_83xx_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_isr.c:1378 qla4_83xx_mailbox_intr_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_isr.c:1458 qla4_8xxx_msix_rsp_q() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_isr.c:1523 qla4xxx_process_aen() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:282 fnic_fw_reset_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:347 fnic_flogi_reg_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:503 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:1630 fnic_cleanup_io() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2099 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2427 fnic_pending_aborts_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2637 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2329 fnic_queue_dr_io_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2904 fnic_host_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mvsas/mv_sas.c:846 mvs_queue_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mvsas/mv_sas.c:1347 mvs_abort_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/efct/efct_hw.c:1527 efct_hw_command_cancel() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/efct/efct_hw.c:1614 efct_hw_io_alloc() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/csiostor/csio_hw.c:3867 csio_enqueue_evt_lock() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_os.c:1848 mpi3mr_sastopochg_evt_bh() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_os.c:3677 mpi3mr_get_chain_idx() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_os.c:5723 mpi3mr_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/efct/efct_hw_queues.c:516 efct_hw_rqpair_get() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/csiostor/csio_lnode.c:395 csio_ln_fdmi_rhba_cbfn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/csiostor/csio_lnode.c:502 csio_ln_fdmi_dprt_cbfn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/csiostor/csio_lnode.c:554 csio_ln_fdmi_dhba_cbfn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc/efc_domain.c:1018 efc_domain_dispatch_frame() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad_bsg.c:1365 bfad_iocmd_faa_query() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aic94xx/aic94xx_tmf.c:348 asd_clear_nexus() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aic94xx/aic94xx_tmf.c:408 asd_abort_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aic94xx/aic94xx_task.c:516 asd_can_queue() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc/efc_nport.c:675 efc_nport_vport_new() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_base.c:825 _base_fault_reset_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_base.c:6988 _base_send_ioc_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_base.c:9027 mpt3sas_base_hard_reset_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_trigger_diag.c:223 mpt3sas_trigger_master() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_transport.c:1954 mpi3mr_refresh_expanders() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mid.c:320 qla2x00_alert_all_vps() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mid.c:452 qla2x00_do_dpc_all_vps() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_app.c:573 mpi3mr_scsisense_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_app.c:614 mpi3mr_event_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_app.c:663 mpi3mr_reply_trigger() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/pm8001/pm80xx_hwi.c:4138 process_oq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_fw.c:160 mpi3mr_repost_reply_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_fw.c:177 mpi3mr_repost_sense_buf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_fw.c:786 mpi3mr_request_irq() warn: why call request_threaded_irq() with a NULL thread
drivers/scsi/mpi3mr/mpi3mr_fw.c:1912 mpi3mr_admin_request_post() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpi3mr/mpi3mr_fw.c:2641 mpi3mr_op_request_post() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:216 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:1598 qla2x00_abort_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_nx.c:3606 qla82xx_chip_reset_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_gs.c:3554 qla_fab_async_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1211 sli_eq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1255 sli_cq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1294 sli_mq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:565 qla2x00_free_queues() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:1397 __qla2x00_eh_wait_for_pending_commands() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:5159 qla2x00_post_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:5318 qla24xx_create_new_sess() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:7533 qla2x00_timer() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:7759 qla_pci_error_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:471 qla2x00_release_all_sadb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:1259 qla_edif_dbell_bsg_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:2771 qla_edif_sadb_delete_sa_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:3317 qla_edif_sadb_get_sa_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:1891 qla4xxx_eh_cmd_timed_out() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:4659 qla4xxx_cmd_wait() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:4745 qla4xxx_soft_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:9237 qla4xxx_eh_abort() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:1937 qla2xxx_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:2118 qla2xxx_dif_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:3935 qla2x00_start_sp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:4270 qla_start_scsi_type6() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_scsih.c:1339 _scsih_pcie_device_remove() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_scsih.c:10031 _scsih_sas_broadcast_primitive_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:591 qla2x00_async_nack_sp_done() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:727 qlt_fc_port_added() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:1224 qlt_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:5061 qlt_handle_login() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6185 qlt_24xx_handle_els() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6568 __qlt_send_busy() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:7384 qlt_abort_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:7437 qlt_sess_work_fn() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:1481 __qla24xx_handle_gpdb_event() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:2302 qla_get_tmf() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:3691 qla2x00_chip_diag() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:6037 qla2x00_configure_local_loop() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:6793 qla2x00_reserve_mgmt_server_loop_id() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:7390 qla2x00_quiesce_io() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:7485 qla2x00_abort_isp_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:7706 qla2x00_abort_isp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:9680 qla82xx_restart_isp() error: calling 'spin_unlock_irqrestore()' with bogus flags

Old smatch warnings:
drivers/usb/misc/adutux.c:480 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/usb/misc/adutux.c:493 adu_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
net/rds/connection.c:549 rds_conn_destroy() warn: mixing irq and irqsave
net/ncsi/ncsi-manage.c:1930 ncsi_reset_dev() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:210 get_free_entries() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/xen/grant-table.c:549 gnttab_handle_deferred() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/iommu/amd/iommu.c:2247 init_gcr3_table() warn: missing error code? 'ret'
net/rds/send.c:1456 rds_sendmsg() error: we previously assumed 'rm' could be null (see line 1295)
drivers/net/ethernet/agere/et131x.c:2823 et131x_handle_send_pkts() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fcloop.c:937 fcloop_fcp_op() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/nvme/target/fc.c:423 __nvmet_fc_send_ls_req() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/media/v4l2-core/v4l2-mem2mem.c:943 v4l2_m2m_poll_for_data() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/scsi_transport_fc.c:3054 fc_rport_final_delete() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla1280.c:1516 qla1280_request_firmware() error: we previously assumed 'fw' could be null (see line 1504)
drivers/scsi/qla1280.c:1579 qla1280_chip_diag() warn: missing error code 'status'
drivers/scsi/esp_scsi.c:2587 esp_eh_abort_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/esp_scsi.c:2595 esp_eh_abort_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/esp_scsi.c:2603 esp_eh_abort_handler() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/megaraid.c:3085 megadev_ioctl() error: buffer overflow 'hba_soft_state' 32 <= 27904
drivers/scsi/megaraid.c:4473 megaraid_probe_one() warn: 'mega_baseport' from __request_region() not released on lines: 4473.
drivers/net/ethernet/natsemi/ns83820.c:800 ns83820_rx_kick() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1182 ns83820_update_stats() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1185 ns83820_update_stats() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1186 ns83820_update_stats() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1188 ns83820_update_stats() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1329 ns83820_set_link_ksettings() warn: inconsistent indenting
drivers/net/ethernet/natsemi/ns83820.c:1497 ns83820_do_isr() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:334 cxgb_rdma_ctl() warn: mixing irqsave and irq
drivers/scsi/initio.c:955 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:966 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:969 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:988 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/initio.c:995 initio_abort_srb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/3w-sas.c:336 twl_scsiop_execute_scsi() error: we previously assumed 'srb' could be null (see line 322)
drivers/scsi/stex.c:1418 stex_do_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/smsc/smsc911x.c:1701 smsc911x_open() warn: argument 3 to %#08lx specifier is cast from pointer
drivers/scsi/aacraid/dpcsup.c:143 aac_response_normal() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/net/ethernet/pensando/ionic/ionic_lif.c:4078 ionic_lif_size() warn: missing unwind goto?
drivers/scsi/ipr.c:3351 ipr_worker_thread() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3529 ipr_store_diagnostics() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3536 ipr_store_diagnostics() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3961 ipr_update_ioa_ucode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3969 ipr_update_ioa_ucode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:3974 ipr_update_ioa_ucode() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/ipr.c:9270 ipr_request_other_msi_irqs() error: buffer overflow 'ioa_cfg->hrrq' 16 <= s32max
drivers/scsi/ipr.c:9637 ipr_probe_ioa() warn: 'pdev->irq' from request_irq() not released on lines: 9620.
drivers/scsi/aacraid/commsup.c:620 aac_fib_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:631 aac_fib_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:679 aac_fib_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:682 aac_fib_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:753 aac_hba_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:766 aac_hba_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:769 aac_hba_send() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aacraid/commsup.c:1526 _aac_reset_adapter() warn: mixing irq and irqsave
drivers/scsi/fnic/fnic_fcs.c:239 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:245 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:255 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:262 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:268 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_fcs.c:280 fnic_handle_link() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/bfa/bfad.c:450 bfa_fcb_lport_new() error: we previously assumed 'vp_drv' could be null (see line 445)
drivers/scsi/fnic/fnic_scsi.c:523 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:546 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:561 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:566 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:578 fnic_queuecommand() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2106 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2139 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2164 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2193 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2202 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2216 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2238 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2243 fnic_abort_cmd() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2448 fnic_pending_aborts_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2457 fnic_pending_aborts_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2469 fnic_pending_aborts_iter() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2657 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2704 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2709 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2737 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2779 fnic_device_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2925 fnic_host_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/fnic/fnic_scsi.c:2934 fnic_host_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mvsas/mv_sas.c:804 mvs_task_prep() error: we previously assumed 'tei.port' could be null (see line 716)
drivers/scsi/elx/efct/efct_hw.c:1357 efct_hw_cmd_submit_pending() warn: can 'ctx' even be NULL?
drivers/scsi/elx/efct/efct_hw.c:2536 efct_hw_wq_write() warn: can 'wqe' even be NULL?
drivers/scsi/csiostor/csio_hw.c:1007 csio_do_hello() warn: variable dereferenced before check 'state' (see line 954)
drivers/scsi/csiostor/csio_hw.c:2096 csio_hw_use_fwconfig() warn: missing unwind goto?
drivers/scsi/csiostor/csio_hw.c:4128 csio_mgmt_tmo_handler() warn: assigning (-110) to unsigned variable 'io_req->wr_status'
drivers/scsi/csiostor/csio_hw.c:4167 csio_mgmtm_cleanup() warn: assigning (-110) to unsigned variable 'io_req->wr_status'
drivers/scsi/bfa/bfad_bsg.c:101 bfad_iocmd_ioc_get_info() error: testing array offset 'i' after use.
drivers/scsi/aic94xx/aic94xx_tmf.c:472 asd_abort_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/aic94xx/aic94xx_tmf.c:513 asd_abort_task() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/mpt3sas/mpt3sas_base.c:3782 mpt3sas_base_map_resources() warn: 'ioc->chip' from ioremap() not released on lines: 3782.
drivers/scsi/mpt3sas/mpt3sas_base.c:6629 _base_allocate_memory_pools() warn: missing unwind goto?
drivers/scsi/mpt3sas/mpt3sas_base.c:6629 _base_allocate_memory_pools() warn: missing unwind goto?
drivers/scsi/mpt3sas/mpt3sas_base.c:8369 _base_make_ioc_operational() warn: missing error code? 'r'
drivers/scsi/mpi3mr/mpi3mr_transport.c:2411 mpi3mr_report_tgtdev_to_sas_transport() warn: inconsistent indenting
drivers/scsi/mpi3mr/mpi3mr_app.c:1884 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:1884 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:1884 mpi3mr_bsg_build_sgl() warn: missing unwind goto?
drivers/scsi/mpi3mr/mpi3mr_app.c:2796 mpi3mr_bsg_process_mpt_cmds() warn: inconsistent indenting
drivers/scsi/pm8001/pm80xx_hwi.c:2343 mpi_sata_completion() error: we previously assumed 't->dev' could be null (see line 2318)
drivers/scsi/pm8001/pm80xx_hwi.c:2367 mpi_sata_completion() error: we previously assumed 'pm8001_dev' could be null (see line 2330)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2296 mpi3mr_create_op_reply_q() error: we previously assumed 'op_reply_q->q_segments' could be null (see line 2249)
drivers/scsi/mpi3mr/mpi3mr_fw.c:2407 mpi3mr_create_op_req_q() error: we previously assumed 'op_req_q->q_segments' could be null (see line 2380)
drivers/scsi/qla2xxx/qla_mbx.c:275 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:292 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:304 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:321 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:335 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:345 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:383 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:465 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_mbx.c:483 qla2x00_mailbox_command() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_nx.c:1661 qla82xx_iospace_config() warn: 'ha->nx_pcibase' from ioremap() not released on lines: 1661.
drivers/scsi/qla2xxx/qla_nx.c:1661 qla82xx_iospace_config() warn: 'ha->pdev' from pci_request_regions() not released on lines: 1661.
drivers/scsi/qla2xxx/qla_gs.c:3568 qla_fab_async_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_gs.c:3587 qla_fab_async_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_gs.c:3634 qla_fab_async_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_gs.c:3729 qla_fab_async_scan() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1233 sli_eq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1277 sli_cq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/elx/libefc_sli/sli4.c:1301 sli_mq_read() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:579 qla2x00_free_queues() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:583 qla2x00_free_queues() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:4254 qla2x00_mem_alloc() warn: missing unwind goto?
drivers/scsi/qla2xxx/qla_os.c:5378 qla24xx_create_new_sess() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:5438 qla24xx_create_new_sess() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_os.c:7774 qla_pci_error_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:480 qla2x00_release_all_sadb() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_edif.c:3326 qla_edif_sadb_get_sa_index() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:4765 qla4xxx_soft_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:4784 qla4xxx_soft_reset() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla4xxx/ql4_os.c:5644 qla4xxx_iospace_config() warn: 'ha->pdev' from pci_request_regions() not released on lines: 5644.
drivers/scsi/qla4xxx/ql4_os.c:6834 qla4xxx_build_st_list() warn: 'flash_index' 4294967295 can't fit into 65535 'st_ddb_idx->flash_ddb_idx'
drivers/scsi/qla4xxx/ql4_os.c:9243 qla4xxx_eh_abort() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:1299 qla24xx_walk_and_build_prot_sglist() error: we previously assumed 'difctx' could be null (see line 1077)
drivers/scsi/qla2xxx/qla_iocb.c:2042 qla2xxx_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:2050 qla2xxx_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:2260 qla2xxx_dif_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:2272 qla2xxx_dif_start_scsi_mq() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:4044 qla2x00_start_sp() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:4468 qla_start_scsi_type6() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_iocb.c:4486 qla_start_scsi_type6() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:680 qla24xx_delete_sess_fn() warn: can 'fcport' even be NULL?
drivers/scsi/qla2xxx/qla_target.c:735 qlt_fc_port_added() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:759 qlt_fc_port_added() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6232 qlt_24xx_handle_els() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6258 qlt_24xx_handle_els() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6294 qlt_24xx_handle_els() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:6337 qlt_24xx_handle_els() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_target.c:7393 qlt_abort_work() error: calling 'spin_unlock_irqrestore()' with bogus flags
drivers/scsi/qla2xxx/qla_init.c:7508 qla2x00_abort_isp_cleanup() error: calling 'spin_unlock_irqrestore()' with bogus flags

vim +683 arch/x86/platform/efi/efi_64.c

83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  656  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  657  static efi_status_t
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  658  efi_thunk_set_variable_nonblocking(efi_char16_t *name, efi_guid_t *vendor,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  659  				   u32 attr, unsigned long data_size,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  660  				   void *data)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  661  {
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  662  	u8 buf[24] __aligned(8);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  663  	efi_guid_t *vnd = PTR_ALIGN((efi_guid_t *)buf, sizeof(*vnd));
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  664  	u32 phys_name, phys_vendor, phys_data;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  665  	efi_status_t status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  666  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  667  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  668  	if (!spin_trylock_irqsave(&efi_runtime_lock, flags))
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  669  		return EFI_NOT_READY;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  670  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  671  	*vnd = *vendor;
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  672  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  673  	phys_name = virt_to_phys_or_null_size(name, efi_name_size(name));
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  674  	phys_vendor = virt_to_phys_or_null(vnd);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  675  	phys_data = virt_to_phys_or_null_size(data, data_size);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  676  
a4b81ccfd4caba Gary Lin       2020-04-09  677  	if (!phys_name || (data && !phys_data))
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  678  		status = EFI_INVALID_PARAMETER;
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  679  	else
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  680  		status = efi_thunk(set_variable, phys_name, phys_vendor,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  681  				   attr, data_size, phys_data);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  682  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20 @683  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  684  
4f9dbcfc40299d Matt Fleming   2014-01-10  685  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  686  }
4f9dbcfc40299d Matt Fleming   2014-01-10  687  
4f9dbcfc40299d Matt Fleming   2014-01-10  688  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  689  efi_thunk_get_next_variable(unsigned long *name_size,
4f9dbcfc40299d Matt Fleming   2014-01-10  690  			    efi_char16_t *name,
4f9dbcfc40299d Matt Fleming   2014-01-10  691  			    efi_guid_t *vendor)
4f9dbcfc40299d Matt Fleming   2014-01-10  692  {
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  693  	u8 buf[24] __aligned(8);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  694  	efi_guid_t *vnd = PTR_ALIGN((efi_guid_t *)buf, sizeof(*vnd));
4f9dbcfc40299d Matt Fleming   2014-01-10  695  	efi_status_t status;
4f9dbcfc40299d Matt Fleming   2014-01-10  696  	u32 phys_name_size, phys_name, phys_vendor;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  697  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  698  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  699  	spin_lock_irqsave(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  700  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  701  	*vnd = *vendor;
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  702  
f6697df36bdf0b Matt Fleming   2016-11-12  703  	phys_name_size = virt_to_phys_or_null(name_size);
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  704  	phys_vendor = virt_to_phys_or_null(vnd);
f6697df36bdf0b Matt Fleming   2016-11-12  705  	phys_name = virt_to_phys_or_null_size(name, *name_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  706  
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  707  	if (!phys_name)
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  708  		status = EFI_INVALID_PARAMETER;
8319e9d5ad98ff Ard Biesheuvel 2020-02-21  709  	else
4f9dbcfc40299d Matt Fleming   2014-01-10  710  		status = efi_thunk(get_next_variable, phys_name_size,
4f9dbcfc40299d Matt Fleming   2014-01-10  711  				   phys_name, phys_vendor);
4f9dbcfc40299d Matt Fleming   2014-01-10  712  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  713  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  714  
63056e8b5ebf41 Ard Biesheuvel 2020-02-21  715  	*vendor = *vnd;
4f9dbcfc40299d Matt Fleming   2014-01-10  716  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  717  }
4f9dbcfc40299d Matt Fleming   2014-01-10  718  
4f9dbcfc40299d Matt Fleming   2014-01-10  719  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  720  efi_thunk_get_next_high_mono_count(u32 *count)
4f9dbcfc40299d Matt Fleming   2014-01-10  721  {
f80c9f6476db6c Ard Biesheuvel 2020-02-21  722  	return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  723  }
4f9dbcfc40299d Matt Fleming   2014-01-10  724  
4f9dbcfc40299d Matt Fleming   2014-01-10  725  static void
4f9dbcfc40299d Matt Fleming   2014-01-10  726  efi_thunk_reset_system(int reset_type, efi_status_t status,
4f9dbcfc40299d Matt Fleming   2014-01-10  727  		       unsigned long data_size, efi_char16_t *data)
4f9dbcfc40299d Matt Fleming   2014-01-10  728  {
4f9dbcfc40299d Matt Fleming   2014-01-10  729  	u32 phys_data;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  730  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  731  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  732  	spin_lock_irqsave(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  733  
f6697df36bdf0b Matt Fleming   2016-11-12  734  	phys_data = virt_to_phys_or_null_size(data, data_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  735  
4f9dbcfc40299d Matt Fleming   2014-01-10  736  	efi_thunk(reset_system, reset_type, status, data_size, phys_data);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  737  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  738  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
4f9dbcfc40299d Matt Fleming   2014-01-10  739  }
4f9dbcfc40299d Matt Fleming   2014-01-10  740  
4f9dbcfc40299d Matt Fleming   2014-01-10  741  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  742  efi_thunk_update_capsule(efi_capsule_header_t **capsules,
4f9dbcfc40299d Matt Fleming   2014-01-10  743  			 unsigned long count, unsigned long sg_list)
4f9dbcfc40299d Matt Fleming   2014-01-10  744  {
4f9dbcfc40299d Matt Fleming   2014-01-10  745  	/*
4f9dbcfc40299d Matt Fleming   2014-01-10  746  	 * To properly support this function we would need to repackage
4f9dbcfc40299d Matt Fleming   2014-01-10  747  	 * 'capsules' because the firmware doesn't understand 64-bit
4f9dbcfc40299d Matt Fleming   2014-01-10  748  	 * pointers.
4f9dbcfc40299d Matt Fleming   2014-01-10  749  	 */
4f9dbcfc40299d Matt Fleming   2014-01-10  750  	return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  751  }
4f9dbcfc40299d Matt Fleming   2014-01-10  752  
4f9dbcfc40299d Matt Fleming   2014-01-10  753  static efi_status_t
4f9dbcfc40299d Matt Fleming   2014-01-10  754  efi_thunk_query_variable_info(u32 attr, u64 *storage_space,
4f9dbcfc40299d Matt Fleming   2014-01-10  755  			      u64 *remaining_space,
4f9dbcfc40299d Matt Fleming   2014-01-10  756  			      u64 *max_variable_size)
4f9dbcfc40299d Matt Fleming   2014-01-10  757  {
4f9dbcfc40299d Matt Fleming   2014-01-10  758  	efi_status_t status;
4f9dbcfc40299d Matt Fleming   2014-01-10  759  	u32 phys_storage, phys_remaining, phys_max;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  760  	unsigned long flags;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  761  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  762  	if (efi.runtime_version < EFI_2_00_SYSTEM_TABLE_REVISION)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  763  		return EFI_UNSUPPORTED;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  764  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  765  	spin_lock_irqsave(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  766  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  767  	phys_storage = virt_to_phys_or_null(storage_space);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  768  	phys_remaining = virt_to_phys_or_null(remaining_space);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  769  	phys_max = virt_to_phys_or_null(max_variable_size);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  770  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  771  	status = efi_thunk(query_variable_info, attr, phys_storage,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  772  			   phys_remaining, phys_max);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  773  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  774  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  775  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  776  	return status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  777  }
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  778  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  779  static efi_status_t
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  780  efi_thunk_query_variable_info_nonblocking(u32 attr, u64 *storage_space,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  781  					  u64 *remaining_space,
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  782  					  u64 *max_variable_size)
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  783  {
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  784  	efi_status_t status;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  785  	u32 phys_storage, phys_remaining, phys_max;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  786  	unsigned long flags;
4f9dbcfc40299d Matt Fleming   2014-01-10  787  
4f9dbcfc40299d Matt Fleming   2014-01-10  788  	if (efi.runtime_version < EFI_2_00_SYSTEM_TABLE_REVISION)
4f9dbcfc40299d Matt Fleming   2014-01-10  789  		return EFI_UNSUPPORTED;
4f9dbcfc40299d Matt Fleming   2014-01-10  790  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  791  	if (!spin_trylock_irqsave(&efi_runtime_lock, flags))
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  792  		return EFI_NOT_READY;
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  793  
f6697df36bdf0b Matt Fleming   2016-11-12  794  	phys_storage = virt_to_phys_or_null(storage_space);
f6697df36bdf0b Matt Fleming   2016-11-12  795  	phys_remaining = virt_to_phys_or_null(remaining_space);
f6697df36bdf0b Matt Fleming   2016-11-12  796  	phys_max = virt_to_phys_or_null(max_variable_size);
4f9dbcfc40299d Matt Fleming   2014-01-10  797  
9a11040ff96230 Matt Fleming   2014-03-16  798  	status = efi_thunk(query_variable_info, attr, phys_storage,
4f9dbcfc40299d Matt Fleming   2014-01-10  799  			   phys_remaining, phys_max);
4f9dbcfc40299d Matt Fleming   2014-01-10  800  
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20 @801  	spin_unlock_irqrestore(&efi_runtime_lock, flags);
83a0a2ea0b9919 Ard Biesheuvel 2018-07-20  802  
4f9dbcfc40299d Matt Fleming   2014-01-10  803  	return status;
4f9dbcfc40299d Matt Fleming   2014-01-10  804  }
4f9dbcfc40299d Matt Fleming   2014-01-10  805  

:::::: The code at line 683 was first introduced by commit
:::::: 83a0a2ea0b991927e42984be220329e776ce7137 efi/x86: Prevent reentrant firmware calls in mixed mode

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

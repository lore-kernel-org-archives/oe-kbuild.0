Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D01C69D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774483849; cv=none; b=Cmzu3o29B5SF1kTS0RHlJpQH6xL5nTOSMD7GNaWPNT3/lWkva/Fq2PrEACeu7q44+7KkZlH9wsCD1UkFlixFWuiCakvuzYtQ5BOPHTBjWt+Wsk1yNA02QjINLXSZZ82ZEyVFl9cIKv2ej9+UeZSBzu2AlRpDd++nSVe/PigUlFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774483849; c=relaxed/simple;
	bh=LhkVI6b/m4WOxhFiS9i0LW2OFtqlKvriZO84m/gwPDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I/tjdgRFcmmpyC7H8JchNIcSuPd9HmCm6UA7LoSnjdUxERj95xIsq6qQMyon4483EiHPVT/VPQFYTiJN33BiyekJnq4uVCMsTNIuGdegIYFXJc1OGlyPF5tULZyaaGX1nja0iJ36n4QVdSvWAwprzUYwaPF4ajEolpU4L+o7g4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfN3autF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfN3autF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774483846; x=1806019846;
  h=date:from:to:cc:subject:message-id;
  bh=LhkVI6b/m4WOxhFiS9i0LW2OFtqlKvriZO84m/gwPDk=;
  b=LfN3autF2LZHqxvGZgfMKhcb2cctpVXRP4b+ambgRzZOkwyTJrerVvP4
   MbscKlk3ChNmTBdLIFtfIO2FCItXKm60qcmGlnZAT/kYa/Th6atmuqyCf
   B16PqNzZ4ms5jcUJbHgVzhR5xuIHooCcW/wqXtyMF0jr7rhPut2ZxdE18
   gr7FMTa/sAdxX3LZZbUZRikNs0exWhg+Aek3HcgxbFkHqmoKnv8O8Omkq
   lYuQHswX8Jj+5pZ1kfW/FlLX6BT49BeNXxXhhA6oVHfvZpHZhZoOjKRDA
   vmlspfLMR8sDIULGuW5X6pHSbUeRamBoSeOUOirnDt/TzTDfluzqlisDb
   A==;
X-CSE-ConnectionGUID: IFvIu9M4Tbi1unRT1XI2+Q==
X-CSE-MsgGUID: LZiuMp7YTu+JwJqQogNytw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79391096"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79391096"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 17:10:46 -0700
X-CSE-ConnectionGUID: OE/Amjb5Tj+/YYEZ6/lMlA==
X-CSE-MsgGUID: CCXr8GL8RYuUtCrWMmk4SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="221937662"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Mar 2026 17:10:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5YJ8-000000007tR-25PY;
	Thu, 26 Mar 2026 00:10:42 +0000
Date: Thu, 26 Mar 2026 08:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tty/serial/serial_core.c:3004 iomem_base_show()
 warn: argument 3 to %lX specifier is cast from pointer
Message-ID: <202603260847.hY03TkUN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2a43e7f89da55d6f0f96aaadaa243f35557291e
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260847.hY03TkUN-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260847.hY03TkUN-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/serial_core.c:3004 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer
drivers/usb/chipidea/otg_fsm.c:276 ci_otg_del_timer() error: testing array offset 'next_timer' after use.
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:1315 cxgb_up() warn: 'adap->pdev->irq' from request_irq() not released on lines: 1312.
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2201 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->params.sge.qset' [r] (local cap)
drivers/net/ethernet/sfc/efx_common.c:740 efx_reset_up() warn: missing error code 'rc'
drivers/net/ethernet/chelsio/cxgb/sge.c:1376 sge_rx() warn: potential spectre issue 'sge->port_stats' [r] (local cap)
drivers/usb/dwc2/gadget.c:1920 dwc2_hsotg_stall_ep0() warn: inconsistent indenting
drivers/net/wireless/ath/wil6210/debugfs.c:800 wil_write_back() warn: sscanf doesn't return error codes
drivers/net/wireless/ath/wil6210/debugfs.c:812 wil_write_back() warn: potential spectre issue 'wil->ring_tx_data' [r] (local cap)
drivers/net/wireless/ath/wil6210/debugfs.c:1956 wil_link_stats_write() warn: sscanf doesn't return error codes
drivers/net/wireless/ath/wil6210/debugfs.c:2121 wil_write_led_blink_time() warn: sscanf doesn't return error codes
drivers/net/ethernet/chelsio/cxgb3/sge.c:2092 rx_eth() warn: potential spectre issue 'adap->port' [r]
drivers/net/ethernet/broadcom/tg3.c:10825 tg3_reset_hw() warn: inconsistent indenting
drivers/net/ethernet/netronome/nfp/devlink_param.c:126 nfp_devlink_param_u8_get() warn: potential spectre issue 'arg->hi_to_dl' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c:334 cxgb_rdma_ctl() warn: mixing irqsave and irq
drivers/scsi/pm8001/pm8001_ctl.c:697 pm8001_set_nvmd() error: __builtin_memcpy() '&payload->func_specific' too small (4 vs 4096)
drivers/net/wireless/ath/ath10k/wmi.c:5522 ath10k_wmi_10x_op_pull_svc_rdy_ev() warn: potential user controlled sizeof overflow '((arg->num_mem_reqs)) * 4' '0-u32max * 4'
drivers/media/dvb-frontends/dibx000_common.c:312 dibx000_i2c_gated_gpio67_xfer() error: __builtin_memcpy() '&mst->msg[1]' too small (396 vs u32max)
drivers/scsi/myrs.c:603 myrs_get_config() error: __builtin_memcpy() 'info->ctlr_name' too small (16 vs 19)
drivers/scsi/myrs.c:2918 DAC960_LP_write_cmd_mbox() error: __builtin_memcpy() '&mem_mbox->words[1]' too small (60 vs 84)
drivers/scsi/myrs.c:2918 DAC960_LP_write_cmd_mbox() error: __builtin_memcpy() '&mbox->words[1]' too small (60 vs 84)
drivers/scsi/myrs.c:2699 DAC960_BA_write_cmd_mbox() error: __builtin_memcpy() '&mem_mbox->words[1]' too small (60 vs 84)
drivers/scsi/myrs.c:2699 DAC960_BA_write_cmd_mbox() error: __builtin_memcpy() '&mbox->words[1]' too small (60 vs 84)
drivers/scsi/myrs.c:2482 DAC960_GEM_write_cmd_mbox() error: __builtin_memcpy() '&mem_mbox->words[1]' too small (60 vs 84)
drivers/scsi/myrs.c:2482 DAC960_GEM_write_cmd_mbox() error: __builtin_memcpy() '&mbox->words[1]' too small (60 vs 84)
drivers/net/ethernet/sfc/ef100_netdev.c:181 ef100_net_open() warn: missing unwind goto?
drivers/net/ethernet/sfc/ef100_netdev.c:531 ef100_probe_netdev() warn: 'net_dev' from alloc_etherdev_mqs() not released on lines: 484,531.
drivers/scsi/mpt3sas/mpt3sas_ctl.c:773 _ctl_do_mpt_command() error: __builtin_memcpy() 'mpi_request' too small (65535 vs 4294967292)
drivers/net/ethernet/chelsio/cxgb4/sge.c:4163 process_intrq() warn: potential spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/chelsio/cxgb4/sge.c:4478 t4_sge_alloc_rxq() warn: potential spectre issue 'adap->sge.ingr_map' [w]
drivers/net/ethernet/sfc/falcon/efx.c:2370 ef4_reset_up() warn: missing error code 'rc'
drivers/usb/gadget/function/f_uac2.c:1245 afunc_bind() warn: missing unwind goto?
drivers/usb/gadget/function/f_tcm.c:1434 usbg_submit_command() error: __builtin_memcpy() 'cmd_iu->cdb' too small (16 vs 64)
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1699 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3424 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __builtin_memcpy() '&buf[2]' too small (30 vs 16384)
drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2920 sge_qinfo_show() error: we previously assumed 's->uld_txq_info' could be null (see line 2906)
drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2938 sge_qinfo_show() error: we previously assumed 's->uld_rxq_info' could be null (see line 2910)
drivers/scsi/cxgbi/libcxgbi.h:312 cxgbi_sock_free() warn: can 'csk' even be NULL?
drivers/scsi/cxgbi/libcxgbi.c:524 sock_put_port() warn: potential spectre issue 'pmap->port_csk' [w] (local cap)
drivers/scsi/cxgbi/libcxgbi.c:1194 cxgbi_ddp_set_one_ppod() error: we previously assumed 'sg_off' could be null (see line 1159)
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:945 do_act_establish() warn: potential spectre issue 'lldi->mtus' [r]
drivers/scsi/cxgbi/cxgb4i/../libcxgbi.h:312 cxgbi_sock_free() warn: can 'csk' even be NULL?
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:2345 t4_uld_rx_handler() warn: potential spectre issue 'cxgb4i_cplhandlers' [w] (local cap)

Old smatch warnings:
drivers/usb/chipidea/otg_fsm.c:410 ci_otg_hrtimer_func() error: testing array offset 'next_timer' after use.
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2219 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->sge.qs' [r] (local cap)
drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c:2291 cxgb_siocdevprivate() warn: potential spectre issue 'adapter->msix_info' [r]
drivers/net/ethernet/chelsio/cxgb/sge.c:1377 sge_rx() warn: potential spectre issue 'adapter->port' [r] (local cap)
drivers/net/wireless/ath/wil6210/debugfs.c:840 wil_write_back() warn: potential spectre issue 'wil->sta' [r] (local cap)
drivers/net/wireless/ath/wil6210/debugfs.c:897 wil_write_pmccfg() warn: sscanf doesn't return error codes
drivers/net/wireless/ath/ath10k/wmi.c:2591 ath10k_wmi_event_mgmt_rx() warn: 'snr + -95' 4294967201 can't fit into 127 'status->signal'
drivers/net/wireless/ath/ath10k/wmi.c:5475 ath10k_wmi_main_op_pull_svc_rdy_ev() warn: potential user controlled sizeof overflow '((arg->num_mem_reqs)) * 4' '0-u32max * 4'
drivers/media/dvb-frontends/dibx000_common.c:358 dibx000_i2c_gated_tuner_xfer() error: __builtin_memcpy() '&mst->msg[1]' too small (396 vs u32max)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:749 _ctl_do_mpt_command() error: copy_from_user() 'mpi_request' too small (65535 vs 4294967292)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2003 _ctl_diag_register() warn: potential spectre issue 'ioc->diag_buffer_status' [w] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2145 _ctl_diag_query() warn: potential spectre issue 'ioc->diag_buffer' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2146 _ctl_diag_query() warn: possible spectre second half.  'request_data'
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2170 _ctl_diag_query() warn: potential spectre issue 'ioc->product_specific' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2172 _ctl_diag_query() warn: potential spectre issue 'ioc->diag_buffer_sz' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2174 _ctl_diag_query() warn: potential spectre issue 'ioc->unique_id' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2175 _ctl_diag_query() warn: potential spectre issue 'ioc->diagnostic_flags' [r] (local cap)
drivers/scsi/mpt3sas/mpt3sas_ctl.c:2640 _ctl_enable_diag_sbr_reload() warn: inconsistent indenting
drivers/net/ethernet/chelsio/cxgb4/sge.c:2560 cxgb4_ethofld_send_flowc() warn: missing error code 'ret'
drivers/net/ethernet/chelsio/cxgb4/sge.c:4485 t4_sge_alloc_rxq() warn: potential spectre issue 'adap->sge.egr_map' [w]
drivers/usb/gadget/function/f_tcm.c:1326 usbg_cmd_work() error: we previously assumed 'active_cmd' could be null (see line 1283)
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1694 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1695 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1696 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1697 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_pio_array' 11 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1700 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1701 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1702 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_pio_array' 12 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1748 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1749 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1751 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1753 cudbg_collect_tp_indirect() error: buffer overflow 't5_tp_mib_index_array' 9 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1755 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1756 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1758 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:1760 cudbg_collect_tp_indirect() error: buffer overflow 't6_tp_mib_index_array' 6 <= 20
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3111 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3112 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3114 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3116 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3117 cudbg_collect_up_cim_indirect() error: buffer overflow 't5_up_cim_reg_array' 13 <= 21
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3428 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3432 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3436 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3439 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3442 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3445 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3460 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3477 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3489 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3502 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3516 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3522 cudbg_collect_qdesc() warn: 'size' unsigned <= 0
drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c:3526 cudbg_collect_qdesc() warn: 'size' unsigned <= 0

vim +3004 drivers/tty/serial/serial_core.c

373bac4cf4c319 Alan Cox        2012-10-29  2996  
143c02c88d6d3f Andy Shevchenko 2020-02-17  2997  static ssize_t iomem_base_show(struct device *dev,
373bac4cf4c319 Alan Cox        2012-10-29  2998  	struct device_attribute *attr, char *buf)
373bac4cf4c319 Alan Cox        2012-10-29  2999  {
373bac4cf4c319 Alan Cox        2012-10-29  3000  	struct serial_struct tmp;
373bac4cf4c319 Alan Cox        2012-10-29  3001  	struct tty_port *port = dev_get_drvdata(dev);
373bac4cf4c319 Alan Cox        2012-10-29  3002  
373bac4cf4c319 Alan Cox        2012-10-29  3003  	uart_get_info(port, &tmp);
9cfbf7a6416b5f Alex Dewar      2020-08-24 @3004  	return sprintf(buf, "0x%lX\n", (unsigned long)tmp.iomem_base);
373bac4cf4c319 Alan Cox        2012-10-29  3005  }
373bac4cf4c319 Alan Cox        2012-10-29  3006  

:::::: The code at line 3004 was first introduced by commit
:::::: 9cfbf7a6416b5fa2b88ac337d092be82778a0469 serial: core: don't use snprintf() for formatting sysfs attrs

:::::: TO: Alex Dewar <alex.dewar90@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

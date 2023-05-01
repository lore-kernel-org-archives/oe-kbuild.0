Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9C7E
	for <oe-kbuild@lists.linux.dev>; Mon,  1 May 2023 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682929803; x=1714465803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5AsfEWBwa762iZw1VEdvUanc6Pw3SXwv5dVpSNnylI4=;
  b=MLN5d/ulJM3/0jjzE6QgQE65lf1bdWZmO4BBVIDb2rqTTrfhYteYaVnF
   Q8xcj5KhYVYlKwnh1LYJxuOY6VaYV93WMH4v9l+iM0MCqOInH3RjdoNmZ
   Vq6mrRpRhLdRLOXnaPiWLT0CaCfD2JG2RJLQSvmiEQiECS4xOYy0AyZEm
   MGX+FzdWMbvR36dNA8n6auS83OKosx6p3is/doIyO1/umTBgo7/Fe0GGE
   F71GN9UabUjhi5o/EuXY8T0RLGdVm7Z5GMB+yPdOkxowjbK/bC5wOcecZ
   dN2dOQ7mQhh47tWANOqDkc2XlETPVcnoKDXCefW9fRNOF22QIQJwUVxu7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346914672"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="346914672"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 01:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="941978531"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="941978531"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 May 2023 01:30:01 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptOv3-0000Mp-0u;
	Mon, 01 May 2023 08:30:01 +0000
Date: Mon, 1 May 2023 16:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_fcoe.c:479 bnx2fc_rcv() error: double
 free of 'skb'
Message-ID: <202305011605.QvaGdGjJ-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m041-20230501 (https://download.01.org/0day-ci/archive/20230501/202305011605.QvaGdGjJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305011605.QvaGdGjJ-lkp@intel.com/

New smatch warnings:
drivers/scsi/bnx2fc/bnx2fc_fcoe.c:479 bnx2fc_rcv() error: double free of 'skb'
drivers/scsi/csiostor/csio_scsi.c:2222 csio_eh_lun_reset_handler() error: we previously assumed 'rn' could be null (see line 2076)
drivers/scsi/csiostor/csio_hw.c:1007 csio_do_hello() warn: variable dereferenced before check 'state' (see line 954)
drivers/scsi/csiostor/csio_hw.c:2096 csio_hw_use_fwconfig() warn: missing unwind goto?
drivers/scsi/csiostor/csio_hw.c:4128 csio_mgmt_tmo_handler() warn: assigning (-110) to unsigned variable 'io_req->wr_status'
drivers/scsi/csiostor/csio_hw.c:4167 csio_mgmtm_cleanup() warn: assigning (-110) to unsigned variable 'io_req->wr_status'
drivers/scsi/qedf/qedf_main.c:3038 qedf_alloc_global_queues() warn: missing unwind goto?
drivers/scsi/qla2xxx/qla_mr.c:805 qlafx00_iospace_config() warn: 'ha->cregbase' from ioremap() not released on lines: 805.
drivers/scsi/qla2xxx/qla_mr.c:1191 qlafx00_find_all_targets() warn: missing error code? 'rval'
drivers/scsi/qla2xxx/qla_nx2.c:3510 qla8044_poll_flash_status_reg() warn: should this be 'retries == -1'
drivers/scsi/qla2xxx/qla_os.c:4164 qla2x00_mem_alloc() warn: missing unwind goto?
drivers/scsi/qla2xxx/qla_target.c:703 qla24xx_delete_sess_fn() warn: can 'fcport' even be NULL?
drivers/scsi/qla2xxx/qla_tmpl.c:862 qla27xx_walk_template() warn: should this be 'tmp->count == -1'
drivers/net/ethernet/realtek/r8169_main.c:1741 rtl_get_coalesce() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/realtek/r8169_main.c:1772 rtl_coalesce_choose_scale() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/qlogic/qed/qed_fcoe.c:588 qed_fcoe_free() warn: can 'p_conn' even be NULL?
drivers/net/ethernet/emulex/benet/be_cmds.c:3162 be_check_ufi_compatibility() warn: ignoring unreachable code.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:1663 bnxt_tpa_end() warn: bitwise AND condition is false here
drivers/net/ethernet/broadcom/bnxt/bnxt.c:5124 bnxt_hwrm_vnic_set_tpa() warn: bitwise AND condition is false here
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:931 bnxt_ptp_init() warn: missing error code 'rc'
drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:1552 bnxt_tc_add_flow() warn: missing unwind goto?

Old smatch warnings:
drivers/net/ethernet/emulex/benet/be_cmds.c:1120 be_cmd_pmac_add() warn: inconsistent indenting
drivers/net/ethernet/broadcom/bnxt/bnxt.c:8354 bnxt_accumulate_all_stats() error: potentially dereferencing uninitialized 'ring0_stats'.
drivers/net/ethernet/broadcom/bnxt/bnxt.c:8479 bnxt_hwrm_port_qstats_ext() warn: missing error code? 'rc'
drivers/net/ethernet/broadcom/bnxt/bnxt.c:9338 bnxt_request_irq() warn: 'irq->vector' from request_irq() not released on lines: 9338.

vim +/skb +479 drivers/scsi/bnx2fc/bnx2fc_fcoe.c

853e2bd2103aaa Bhanu Gollapudi           2011-02-04  413  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  414  /**
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  415   * bnx2fc_rcv - This is bnx2fc's receive function called by NET_RX_SOFTIRQ
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  416   *
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  417   * @skb:	the receive socket buffer
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  418   * @dev:	associated net device
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  419   * @ptype:	context
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  420   * @olddev:	last device
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  421   *
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  422   * This function receives the packet and builds FC frame and passes it up
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  423   */
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  424  static int bnx2fc_rcv(struct sk_buff *skb, struct net_device *dev,
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  425  		struct packet_type *ptype, struct net_device *olddev)
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  426  {
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  427  	struct fc_lport *lport;
aea71a024914e8 Bhanu Prakash Gollapudi   2011-07-26  428  	struct bnx2fc_interface *interface;
fd8f89027d816c Robert Love               2012-05-22  429  	struct fcoe_ctlr *ctlr;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  430  	struct fcoe_rcv_info *fr;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  431  	struct fcoe_percpu_s *bg;
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  432  	struct sk_buff *tmp_skb;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  433  
aea71a024914e8 Bhanu Prakash Gollapudi   2011-07-26  434  	interface = container_of(ptype, struct bnx2fc_interface,
aea71a024914e8 Bhanu Prakash Gollapudi   2011-07-26  435  				 fcoe_packet_type);
fd8f89027d816c Robert Love               2012-05-22  436  	ctlr = bnx2fc_to_ctlr(interface);
fd8f89027d816c Robert Love               2012-05-22  437  	lport = ctlr->lp;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  438  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  439  	if (unlikely(lport == NULL)) {
b2a554ff9ad5cd Bhanu Prakash Gollapudi   2011-06-27  440  		printk(KERN_ERR PFX "bnx2fc_rcv: lport is NULL\n");
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  441  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  442  	}
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  443  
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  444  	tmp_skb = skb_share_check(skb, GFP_ATOMIC);
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  445  	if (!tmp_skb)
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  446  		goto err;
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  447  
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  448  	skb = tmp_skb;
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  449  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  450  	if (unlikely(eth_hdr(skb)->h_proto != htons(ETH_P_FCOE))) {
b2a554ff9ad5cd Bhanu Prakash Gollapudi   2011-06-27  451  		printk(KERN_ERR PFX "bnx2fc_rcv: Wrong FC type frame\n");
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  452  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  453  	}
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  454  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  455  	/*
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  456  	 * Check for minimum frame length, and make sure required FCoE
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  457  	 * and FC headers are pulled into the linear data area.
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  458  	 */
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  459  	if (unlikely((skb->len < FCOE_MIN_FRAME) ||
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  460  	    !pskb_may_pull(skb, FCOE_HEADER_LEN)))
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  461  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  462  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  463  	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  464  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  465  	fr = fcoe_dev_from_skb(skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  466  	fr->fr_dev = lport;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  467  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  468  	bg = &bnx2fc_global;
fc05ab74b78a9e Neil Horman               2012-03-09  469  	spin_lock(&bg->fcoe_rx_list.lock);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  470  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  471  	__skb_queue_tail(&bg->fcoe_rx_list, skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  472  	if (bg->fcoe_rx_list.qlen == 1)
4b9bc86d5a999e Sebastian Andrzej Siewior 2016-04-12  473  		wake_up_process(bg->kthread);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  474  
fc05ab74b78a9e Neil Horman               2012-03-09  475  	spin_unlock(&bg->fcoe_rx_list.lock);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  476  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  477  	return 0;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  478  err:
853e2bd2103aaa Bhanu Gollapudi           2011-02-04 @479  	kfree_skb(skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  480  	return -1;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  481  }
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  482  

:::::: The code at line 479 was first introduced by commit
:::::: 853e2bd2103aaa91d1ba1c0b57ba17628d836f03 [SCSI] bnx2fc: Broadcom FCoE offload driver

:::::: TO: Bhanu Gollapudi <bprakash@broadcom.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

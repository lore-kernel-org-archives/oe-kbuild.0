Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF41C4A09
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740232; cv=none; b=GWpmzRbhRLLQknqCnx2/fNsKAY3WJ8lQChaqj0LdX/s9GyHfi+iaTZb2jUixhsa4aBBVSopJUGHr+jhhSR7afh9Aarwl4sD1Q9xdOTZQVp9h+167VG7Rf4h4qxM6CgMcy1scKvwE0UA4wrq3mf6kSRd1Ifje7Wf8tkpWEjbSJ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740232; c=relaxed/simple;
	bh=WQpsDfJut2o66KGUrvroq00O+CZ9Nt78+OHHQOfFEtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmzynqsjMpv0os0B2Yn+Eb5y0bvalcCtc5MsTd/M789RCDY3thrrkXZK1Z2YYLfLc6qHU9PlCEZ+nKBXE7CbGHUZnJaorD6lC6ySAHC/34m3P7KkOvMN0g4TFa4UJFVqr0U7+mHA4LMdiC7jHSyeR8sUYsi0DsrQWI5FJf19pxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbGb6Uy7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbGb6Uy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730740229; x=1762276229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQpsDfJut2o66KGUrvroq00O+CZ9Nt78+OHHQOfFEtg=;
  b=jbGb6Uy7CKQg5uOpRiNGZ6NPwfC0qu7zcK6ffCfnLzaCk39WeHJ9GUu0
   Pd11M8zX2LZNW9O5FBF23f0kVU5eg3j/C89rGvoCWDENbf64FozPRIdCu
   fjBCCTWtfyPMYH1VWmmZBQJURncScJIm05UQCaIlSSMuyGTpOWsuE0dIg
   O9FkZMhI1pP9DIDAKTHxST+zOrPgCcV84plfYBGrvIiukWdlNE24ez44J
   rxNOCSKyYFXgioB2dgleAqGKTG6Wm7E12eISAZJpy8dscYa9J+sTmNbpE
   EgRPf/fdH0U7SmiACRJXfeB5mPRHbdcRC6ilrtv+onC3sTpKLGU4LDSAb
   Q==;
X-CSE-ConnectionGUID: LdNsFEa2RE6Zlp5FNkUmrw==
X-CSE-MsgGUID: PenLMTQzQNm3l2QRCSus3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41039132"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="41039132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 09:10:29 -0800
X-CSE-ConnectionGUID: 4hYCrztLTJO1/mLbHxC/5g==
X-CSE-MsgGUID: hR+NGiFFQKSEvvU76ld/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="121191729"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2024 09:10:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t80au-000l3B-1R;
	Mon, 04 Nov 2024 17:10:24 +0000
Date: Tue, 5 Nov 2024 01:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_fcoe.c:445 bnx2fc_rcv() warn: missing
 unwind goto?
Message-ID: <202411050130.5HAGF9rY-lkp@intel.com>
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
TO: Wei Yongjun <weiyongjun1@huawei.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59b723cd2adbac2a34fc8e12c74ae26ae45bf230
commit: 08c94d80b2da481652fb633e79cbc41e9e326a91 scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r073-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050130.5HAGF9rY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050130.5HAGF9rY-lkp@intel.com/

smatch warnings:
drivers/scsi/bnx2fc/bnx2fc_fcoe.c:445 bnx2fc_rcv() warn: missing unwind goto?

vim +445 drivers/scsi/bnx2fc/bnx2fc_fcoe.c

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
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  432  
aea71a024914e8 Bhanu Prakash Gollapudi   2011-07-26  433  	interface = container_of(ptype, struct bnx2fc_interface,
aea71a024914e8 Bhanu Prakash Gollapudi   2011-07-26  434  				 fcoe_packet_type);
fd8f89027d816c Robert Love               2012-05-22  435  	ctlr = bnx2fc_to_ctlr(interface);
fd8f89027d816c Robert Love               2012-05-22  436  	lport = ctlr->lp;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  437  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  438  	if (unlikely(lport == NULL)) {
b2a554ff9ad5cd Bhanu Prakash Gollapudi   2011-06-27  439  		printk(KERN_ERR PFX "bnx2fc_rcv: lport is NULL\n");
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  440  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  441  	}
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  442  
08c94d80b2da48 Wei Yongjun               2022-11-14  443  	skb = skb_share_check(skb, GFP_ATOMIC);
08c94d80b2da48 Wei Yongjun               2022-11-14  444  	if (!skb)
08c94d80b2da48 Wei Yongjun               2022-11-14 @445  		return -1;
01a4cc4d0cd6a8 Maurizio Lombardi         2014-11-20  446  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  447  	if (unlikely(eth_hdr(skb)->h_proto != htons(ETH_P_FCOE))) {
b2a554ff9ad5cd Bhanu Prakash Gollapudi   2011-06-27  448  		printk(KERN_ERR PFX "bnx2fc_rcv: Wrong FC type frame\n");
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  449  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  450  	}
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  451  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  452  	/*
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  453  	 * Check for minimum frame length, and make sure required FCoE
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  454  	 * and FC headers are pulled into the linear data area.
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  455  	 */
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  456  	if (unlikely((skb->len < FCOE_MIN_FRAME) ||
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  457  	    !pskb_may_pull(skb, FCOE_HEADER_LEN)))
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  458  		goto err;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  459  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  460  	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  461  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  462  	fr = fcoe_dev_from_skb(skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  463  	fr->fr_dev = lport;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  464  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  465  	bg = &bnx2fc_global;
fc05ab74b78a9e Neil Horman               2012-03-09  466  	spin_lock(&bg->fcoe_rx_list.lock);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  467  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  468  	__skb_queue_tail(&bg->fcoe_rx_list, skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  469  	if (bg->fcoe_rx_list.qlen == 1)
4b9bc86d5a999e Sebastian Andrzej Siewior 2016-04-12  470  		wake_up_process(bg->kthread);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  471  
fc05ab74b78a9e Neil Horman               2012-03-09  472  	spin_unlock(&bg->fcoe_rx_list.lock);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  473  
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  474  	return 0;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  475  err:
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  476  	kfree_skb(skb);
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  477  	return -1;
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  478  }
853e2bd2103aaa Bhanu Gollapudi           2011-02-04  479  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

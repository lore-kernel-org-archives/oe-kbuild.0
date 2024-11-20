Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB891369B4
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Nov 2024 15:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117571; cv=none; b=ELahbdnXFnb+ZPsGlW6RlybbGkEmFtWtt0evgERvYFnb/wul84Zy3U67becYxqeX0x6lPlJoMtdxnGen7bjfNFOEy18iW/HCAd5pMt5FmutnY37+oGxbmoPieOopFZMPYIw6d9gbhy2roirR2tiJWq6HX0TmvLzmuHErtP2w98g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117571; c=relaxed/simple;
	bh=Exrivd+rW4YXbgogfNoQeAaZFt1Vph8t5cLmYlHKy4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mz5w9KdZRYAd/ptf5PdnQDoRaQTOlhop0Uq9vEmr0RwdghcxXPNY7yZA4gBTapkaKSoSz2fDmAgm1hIMrFXdmyPc2ftWrKiipIGAEbr8459oqNxSDkfG+9UvbmlGOcw+78goYAEmwuNnridFqsNZrAajVvMr9lz/1RBSRTyuxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JqMvY/OI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqMvY/OI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732117569; x=1763653569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Exrivd+rW4YXbgogfNoQeAaZFt1Vph8t5cLmYlHKy4A=;
  b=JqMvY/OIYSCW1/ksTPe9OXaK7hxNXiOOXFIJWHQdBSOBnzFNBIeA7zv+
   2WmfFN/U18GTl5MgGR4TnaX2n4Iq5hOBJUVzBmfKwMEvQb6hxwDNgWmdo
   D5dFBYkLo7YPEzhD+69onaK6ycRpVZdEHohA91GX5TOv5r2sVO/yrQKJk
   m+RmFXjdmFRut8jGv5el6gOmcKBamPKyycCjQW9+MkSwyLAIOUUWTiekp
   /l9Ih4kNfmbbbEZwgNvQajhUl03TA9E2E1OJxNj8JCeigaAzR488xKQa3
   D3kjwkJsmXy+AvjFn5KG1wfY6b1AuTfHdPKVAMZNZvbWxrshx2nnW5aze
   w==;
X-CSE-ConnectionGUID: hEmM/koSRUa1QioiQSW/cA==
X-CSE-MsgGUID: SEf416rnRLmgjUqJGTmERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32116725"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="32116725"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 07:46:07 -0800
X-CSE-ConnectionGUID: APVPLO+dQl6iD4rnjpXFlw==
X-CSE-MsgGUID: W1m1ikmVR5eKzFEPWg10Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; 
   d="scan'208";a="127497849"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2024 07:46:06 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDmu3-0000yT-2c;
	Wed, 20 Nov 2024 15:46:03 +0000
Date: Wed, 20 Nov 2024 23:46:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/bnx2fc/bnx2fc_fcoe.c:445 bnx2fc_rcv() warn: missing
 unwind goto?
Message-ID: <202411202311.CqB0Eprn-lkp@intel.com>
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
head:   bf9aa14fc523d2763fc9a10672a709224e8fcaf4
commit: 08c94d80b2da481652fb633e79cbc41e9e326a91 scsi: bnx2fc: Fix skb double free in bnx2fc_rcv()
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20241120 (https://download.01.org/0day-ci/archive/20241120/202411202311.CqB0Eprn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411202311.CqB0Eprn-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3A17C2
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743308321; cv=none; b=hPQHL0LZjTceFyAI8xmIzeZ646eRRNf7t80Ftr37omem/xHW/DxPg7V4wIH+A3md5hIdQ8EDD+yr3XCvVbnIwSl9DMpe/iynVyVEpN8TMwJDz/0O5PLgeSmxkZLCreSYmnFVwSkbh7Jz+Yu96HG1PhULqyjgCs5p8CCiLcV6ZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743308321; c=relaxed/simple;
	bh=OWxnEQCFsddD7ibZ4WDcRHXh5ZWl1vOTa/WCGgI8Xew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3Asr3AmKg9hvd30/vpKsefy0IQvMQdzSbdtE341wMertCzvbodmc25uwD+efuYYwn9YuaVjk0OI71SABYIaU3p4E7K3UhRnJiDyjrh7lMMayBmd/0aE53AL2xQhP8R+e9Z97ldk8rNViakN9NFSPofWA6k+HI4u+JHot/vsrO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORdBzatr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORdBzatr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743308320; x=1774844320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWxnEQCFsddD7ibZ4WDcRHXh5ZWl1vOTa/WCGgI8Xew=;
  b=ORdBzatrSg81hai+iO0NMOEw8PcN6w7h6WK6SaH1oNOJxegoYWA6QZJa
   R8TxAp+i/MXWxDnz0SXxVewvkpBw7/E7G7PUpbTnV/Z35oF1Gng5wotf7
   2fIeau6Y3ualT9uH5Zam5G0pxAv28W+ppFv559UM1Tp/ED3jPUwMq2z+D
   rw06+1HB/llhRT+hJdd01HPlXTbBvGiqH9SGkqQSComq2q3QqWOyVYOCK
   CCbbIRc1I8WQC5az0y6CdDN1nr5mtNFDHWQ+CWsczirKHCXB4dHdoBMJd
   B8dLsVEY/sQ61Huz5AotX2nZddX8lmqrfKM0g4KCjQ9ZzYzJ6/tJmVI8Z
   Q==;
X-CSE-ConnectionGUID: OX6n17PSQQiwIA0Go3aM6Q==
X-CSE-MsgGUID: Pl6KN1LrRkyet0kO0qrZgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="54828172"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="54828172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 21:18:40 -0700
X-CSE-ConnectionGUID: I2GpboqHRAO1/ty57ag0nA==
X-CSE-MsgGUID: OOAZHHApTZe0TA9N/ME8Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="126250068"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2025 21:18:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyk83-0008VK-2B;
	Sun, 30 Mar 2025 04:18:35 +0000
Date: Sun, 30 Mar 2025 12:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/chelsio/cxgb4/l2t.c:570 t4_l2t_update() warn:
 inconsistent returns 'bh'.
Message-ID: <202503301230.erUyI3bB-lkp@intel.com>
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
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: b5f463486b212c56d837c2592d87de7fb4833662 s390: Support PREEMPT_DYNAMIC
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301230.erUyI3bB-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503301230.erUyI3bB-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/chelsio/cxgb4/l2t.c:570 t4_l2t_update() warn: inconsistent returns 'bh'.
drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c:142 cxgb4_clip_get() warn: inconsistent returns '&ctbl->lock'.
drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c:188 cxgb4_clip_release() warn: inconsistent returns '&ctbl->lock'.
drivers/net/ethernet/chelsio/cxgb4/clip_tbl.c:188 cxgb4_clip_release() warn: inconsistent returns 'bh'.

vim +/bh +570 drivers/net/ethernet/chelsio/cxgb4/l2t.c

dcf7b6f5bdeaa1 drivers/net/ethernet/chelsio/cxgb4/l2t.c Kumar Sanghvi        2013-12-18  504  
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  505  /*
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  506   * Called when the host's neighbor layer makes a change to some entry that is
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  507   * loaded into the HW L2 table.
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  508   */
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  509  void t4_l2t_update(struct adapter *adap, struct neighbour *neigh)
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  510  {
01ccdf126ca5f9 drivers/net/ethernet/chelsio/cxgb4/l2t.c Alexey Dobriyan      2017-09-23  511  	unsigned int addr_len = neigh->tbl->key_len;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  512  	u32 *addr = (u32 *) neigh->primary_key;
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  513  	int hash, ifidx = neigh->dev->ifindex;
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  514  	struct sk_buff_head *arpq = NULL;
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  515  	struct l2t_data *d = adap->l2t;
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  516  	struct l2t_entry *e;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  517  
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  518  	hash = addr_hash(d, addr, addr_len, ifidx);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  519  	read_lock_bh(&d->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  520  	for (e = d->l2tab[hash].first; e; e = e->next)
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  521  		if (!addreq(e, addr) && e->ifindex == ifidx) {
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  522  			spin_lock(&e->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  523  			if (atomic_read(&e->refcnt))
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  524  				goto found;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  525  			spin_unlock(&e->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  526  			break;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  527  		}
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  528  	read_unlock_bh(&d->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  529  	return;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  530  
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  531   found:
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  532  	read_unlock(&d->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  533  
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  534  	if (neigh != e->neigh)
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  535  		neigh_replace(e, neigh);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  536  
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  537  	if (e->state == L2T_STATE_RESOLVING) {
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  538  		if (neigh->nud_state & NUD_FAILED) {
749cb5fe48bb29 drivers/net/ethernet/chelsio/cxgb4/l2t.c Hariprasad Shenai    2015-12-17  539  			arpq = &e->arpq;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  540  		} else if ((neigh->nud_state & (NUD_CONNECTED | NUD_STALE)) &&
749cb5fe48bb29 drivers/net/ethernet/chelsio/cxgb4/l2t.c Hariprasad Shenai    2015-12-17  541  			   !skb_queue_empty(&e->arpq)) {
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  542  			write_l2e(adap, e, 1);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  543  		}
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  544  	} else {
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  545  		e->state = neigh->nud_state & NUD_CONNECTED ?
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  546  			L2T_STATE_VALID : L2T_STATE_STALE;
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  547  		if (memcmp(e->dmac, neigh->ha, sizeof(e->dmac)))
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  548  			write_l2e(adap, e, 0);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  549  	}
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  550  
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  551  	if (arpq) {
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  552  		struct sk_buff *skb;
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  553  
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  554  		/* Called when address resolution fails for an L2T
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  555  		 * entry to handle packets on the arpq head. If a
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  556  		 * packet specifies a failure handler it is invoked,
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  557  		 * otherwise the packet is sent to the device.
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  558  		 */
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  559  		while ((skb = __skb_dequeue(&e->arpq)) != NULL) {
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  560  			const struct l2t_skb_cb *cb = L2T_SKB_CB(skb);
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  561  
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  562  			spin_unlock(&e->lock);
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  563  			if (cb->arp_err_handler)
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  564  				cb->arp_err_handler(cb->handle, skb);
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  565  			else
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  566  				t4_ofld_send(adap, skb);
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  567  			spin_lock(&e->lock);
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  568  		}
11d8cd5c9f3b46 drivers/net/ethernet/chelsio/cxgb4/l2t.c Rahul Lakkireddy     2020-06-24  569  	}
749cb5fe48bb29 drivers/net/ethernet/chelsio/cxgb4/l2t.c Hariprasad Shenai    2015-12-17 @570  	spin_unlock_bh(&e->lock);
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  571  }
625ba2c2eed763 drivers/net/cxgb4/l2t.c                  Dimitris Michailidis 2010-04-01  572  

:::::: The code at line 570 was first introduced by commit
:::::: 749cb5fe48bb29f55f2cdde4d76183340e11547e cxgb4: Replace arpq_head/arpq_tail with SKB double link-list code

:::::: TO: Hariprasad Shenai <hariprasad@chelsio.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

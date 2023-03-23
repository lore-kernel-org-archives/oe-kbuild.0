Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD7944E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579446; x=1711115446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAliOP6lWpFnLuUBO9/0CvX2/iwiTRXpTReY+xH74Uk=;
  b=ltmyKQ3x47tBnrZGB8Na00h/6HQefhUEqibabfkJikyuXFYwVVFa2Cxy
   XFOnqhQmmgwJN50yXbro9rSVVKaDzcxsqC6sZoLAAwFQfv0P0+EXDm816
   xdVfjfPVmnMhoGkeex4mLqsCDp3S2z4uK41b951S5mqinQFM+JjGlqa+q
   FgFGRLBNGv2n941j48na+cQTjLFWFpa/kcfYWKwrBSnF9+utjBceHZMgJ
   H8qkJA7QpIYJQdkW/Y6RzggsL8/sDGgucx8SdW+HVHyTSZoDj3dqf4yzT
   zUcep7LvBDg9SdPuw4rbBqqxcgIfXAEvRh0G988dJW7n/eWekcvE2DrQp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341041870"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341041870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746716512"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="746716512"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:36:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfL7D-000EPI-1Y;
	Thu, 23 Mar 2023 13:36:27 +0000
Date: Thu, 23 Mar 2023 21:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
Message-ID: <202303232106.UkMR3FEX-lkp@intel.com>
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
In-Reply-To: <20230318214953.36834-1-u9012063@gmail.com>
References: <20230318214953.36834-1-u9012063@gmail.com>
TO: William Tu <u9012063@gmail.com>

Hi William,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3-Add-XDP-support/20230319-055034
patch link:    https://lore.kernel.org/r/20230318214953.36834-1-u9012063%40gmail.com
patch subject: [PATCH RFC v18 net-next] vmxnet3: Add XDP support.
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-m031-20230321 (https://download.01.org/0day-ci/archive/20230323/202303232106.UkMR3FEX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303232106.UkMR3FEX-lkp@intel.com/

smatch warnings:
drivers/net/vmxnet3/vmxnet3_xdp.c:362 vmxnet3_process_xdp_small() warn: variable dereferenced before check 'skb_xdp_pass' (see line 361)
drivers/net/vmxnet3/vmxnet3_xdp.c:406 vmxnet3_process_xdp() warn: variable dereferenced before check 'skb_xdp_pass' (see line 405)

vim +/skb_xdp_pass +362 drivers/net/vmxnet3/vmxnet3_xdp.c

089db7a8620943 William Tu 2023-03-18  324  
089db7a8620943 William Tu 2023-03-18  325  /* Handle packets from DataRing. */
089db7a8620943 William Tu 2023-03-18  326  int
089db7a8620943 William Tu 2023-03-18  327  vmxnet3_process_xdp_small(struct vmxnet3_adapter *adapter,
089db7a8620943 William Tu 2023-03-18  328  			  struct vmxnet3_rx_queue *rq,
089db7a8620943 William Tu 2023-03-18  329  			  void *data, int len,
089db7a8620943 William Tu 2023-03-18  330  			  struct sk_buff **skb_xdp_pass)
089db7a8620943 William Tu 2023-03-18  331  {
089db7a8620943 William Tu 2023-03-18  332  	struct bpf_prog *xdp_prog;
089db7a8620943 William Tu 2023-03-18  333  	struct xdp_buff xdp;
089db7a8620943 William Tu 2023-03-18  334  	struct page *page;
089db7a8620943 William Tu 2023-03-18  335  	int act;
089db7a8620943 William Tu 2023-03-18  336  
089db7a8620943 William Tu 2023-03-18  337  	page = page_pool_alloc_pages(rq->page_pool, GFP_ATOMIC);
089db7a8620943 William Tu 2023-03-18  338  	if (unlikely(!page)) {
089db7a8620943 William Tu 2023-03-18  339  		rq->stats.rx_buf_alloc_failure++;
089db7a8620943 William Tu 2023-03-18  340  		return XDP_DROP;
089db7a8620943 William Tu 2023-03-18  341  	}
089db7a8620943 William Tu 2023-03-18  342  
089db7a8620943 William Tu 2023-03-18  343  	xdp_init_buff(&xdp, PAGE_SIZE, &rq->xdp_rxq);
089db7a8620943 William Tu 2023-03-18  344  	xdp_prepare_buff(&xdp, page_address(page), rq->page_pool->p.offset,
089db7a8620943 William Tu 2023-03-18  345  			 len, false);
089db7a8620943 William Tu 2023-03-18  346  	xdp_buff_clear_frags_flag(&xdp);
089db7a8620943 William Tu 2023-03-18  347  
089db7a8620943 William Tu 2023-03-18  348  	/* Must copy the data because it's at dataring. */
089db7a8620943 William Tu 2023-03-18  349  	memcpy(xdp.data, data, len);
089db7a8620943 William Tu 2023-03-18  350  
089db7a8620943 William Tu 2023-03-18  351  	rcu_read_lock();
089db7a8620943 William Tu 2023-03-18  352  	xdp_prog = rcu_dereference(rq->adapter->xdp_bpf_prog);
089db7a8620943 William Tu 2023-03-18  353  	if (!xdp_prog) {
089db7a8620943 William Tu 2023-03-18  354  		act = XDP_PASS;
089db7a8620943 William Tu 2023-03-18  355  		goto out_skb;
089db7a8620943 William Tu 2023-03-18  356  	}
089db7a8620943 William Tu 2023-03-18  357  	act = vmxnet3_run_xdp(rq, &xdp, xdp_prog);
089db7a8620943 William Tu 2023-03-18  358  
089db7a8620943 William Tu 2023-03-18  359  	if (act == XDP_PASS) {
089db7a8620943 William Tu 2023-03-18  360  out_skb:
089db7a8620943 William Tu 2023-03-18 @361  		*skb_xdp_pass = vmxnet3_build_skb(rq, page, &xdp);
089db7a8620943 William Tu 2023-03-18 @362  		if (!skb_xdp_pass)
089db7a8620943 William Tu 2023-03-18  363  			return XDP_DROP;
089db7a8620943 William Tu 2023-03-18  364  	}
089db7a8620943 William Tu 2023-03-18  365  
089db7a8620943 William Tu 2023-03-18  366  	/* No need to refill. */
089db7a8620943 William Tu 2023-03-18  367  	return act;
089db7a8620943 William Tu 2023-03-18  368  }
089db7a8620943 William Tu 2023-03-18  369  
089db7a8620943 William Tu 2023-03-18  370  int
089db7a8620943 William Tu 2023-03-18  371  vmxnet3_process_xdp(struct vmxnet3_adapter *adapter,
089db7a8620943 William Tu 2023-03-18  372  		    struct vmxnet3_rx_queue *rq,
089db7a8620943 William Tu 2023-03-18  373  		    struct Vmxnet3_RxCompDesc *rcd,
089db7a8620943 William Tu 2023-03-18  374  		    struct vmxnet3_rx_buf_info *rbi,
089db7a8620943 William Tu 2023-03-18  375  		    struct Vmxnet3_RxDesc *rxd,
089db7a8620943 William Tu 2023-03-18  376  		    struct sk_buff **skb_xdp_pass)
089db7a8620943 William Tu 2023-03-18  377  {
089db7a8620943 William Tu 2023-03-18  378  	struct bpf_prog *xdp_prog;
089db7a8620943 William Tu 2023-03-18  379  	dma_addr_t new_dma_addr;
089db7a8620943 William Tu 2023-03-18  380  	struct xdp_buff xdp;
089db7a8620943 William Tu 2023-03-18  381  	struct page *page;
089db7a8620943 William Tu 2023-03-18  382  	void *new_data;
089db7a8620943 William Tu 2023-03-18  383  	int act;
089db7a8620943 William Tu 2023-03-18  384  
089db7a8620943 William Tu 2023-03-18  385  	page = rbi->page;
089db7a8620943 William Tu 2023-03-18  386  	dma_sync_single_for_cpu(&adapter->pdev->dev,
089db7a8620943 William Tu 2023-03-18  387  				page_pool_get_dma_addr(page) +
089db7a8620943 William Tu 2023-03-18  388  				rq->page_pool->p.offset, rcd->len,
089db7a8620943 William Tu 2023-03-18  389  				page_pool_get_dma_dir(rq->page_pool));
089db7a8620943 William Tu 2023-03-18  390  
089db7a8620943 William Tu 2023-03-18  391  	xdp_init_buff(&xdp, rbi->len, &rq->xdp_rxq);
089db7a8620943 William Tu 2023-03-18  392  	xdp_prepare_buff(&xdp, page_address(page), rq->page_pool->p.offset,
089db7a8620943 William Tu 2023-03-18  393  			 rcd->len, false);
089db7a8620943 William Tu 2023-03-18  394  	xdp_buff_clear_frags_flag(&xdp);
089db7a8620943 William Tu 2023-03-18  395  
089db7a8620943 William Tu 2023-03-18  396  	xdp_prog = rcu_dereference(rq->adapter->xdp_bpf_prog);
089db7a8620943 William Tu 2023-03-18  397  	if (!xdp_prog) {
089db7a8620943 William Tu 2023-03-18  398  		act = XDP_PASS;
089db7a8620943 William Tu 2023-03-18  399  		goto out_skb;
089db7a8620943 William Tu 2023-03-18  400  	}
089db7a8620943 William Tu 2023-03-18  401  	act = vmxnet3_run_xdp(rq, &xdp, xdp_prog);
089db7a8620943 William Tu 2023-03-18  402  
089db7a8620943 William Tu 2023-03-18  403  	if (act == XDP_PASS) {
089db7a8620943 William Tu 2023-03-18  404  out_skb:
089db7a8620943 William Tu 2023-03-18 @405  		*skb_xdp_pass = vmxnet3_build_skb(rq, page, &xdp);
089db7a8620943 William Tu 2023-03-18 @406  		if (!skb_xdp_pass)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045715BD
	for <oe-kbuild@lists.linux.dev>; Mon,  8 May 2023 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683557320; x=1715093320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFDT9fN9F5k7konfAwKgn5jrfPSf0FktPFiSFwQNfvo=;
  b=oG339QtGcxNSe+7pbXr4Q4BaBbUHV42FuSI1+csw1GjbpVoVVmgmc3L8
   +uq8jEdFQIvXbMwgY4+bLpXtBKaOpHfWgT6RpD3sC1zSlXT9GjZj7ykZi
   EG7sxO5hGp/ZHvxB2Sx2SOFCJ4nycAqVzOBXoNro8dtPou+Ycmn2KWV5M
   9vnz7Fj1RHSXbcGV5NBmQcCSWpG/5c4nFO7rYSxigLF9RoHO1fBy3KMUq
   2ts2AD4NnzwytWgTko+7apnQGqx/yjV8uvc2FGracnIBZ5SQ4YnrtonkD
   NgZKQSVqB+qKYf+GWmBGQBRoCp3bSsQ1WAEToHiYUVwPOTWDGL1OEB+01
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412924682"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="412924682"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698552256"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698552256"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 07:48:35 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pw2AE-0001Gv-0h;
	Mon, 08 May 2023 14:48:34 +0000
Date: Mon, 8 May 2023 22:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:276
 ngbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not
 released on lines: 276.
Message-ID: <202305082231.nXDuDBAD-lkp@intel.com>
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
TO: Mengyuan Lou <mengyuanlou@net-swift.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac9a78681b921877518763ba0e89202254349d1b
commit: e7956139a6cf9a39bcddaabbda1b2e684a42fc57 net: ngbe: Add irqs request flow
date:   3 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-m041-20230428 (https://download.01.org/0day-ci/archive/20230508/202305082231.nXDuDBAD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305082231.nXDuDBAD-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:276 ngbe_request_msix_irqs() warn: 'entry->vector' from request_irq() not released on lines: 276.

vim +276 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c

e7956139a6cf9a Mengyuan Lou 2023-02-03  226  
e7956139a6cf9a Mengyuan Lou 2023-02-03  227  /**
e7956139a6cf9a Mengyuan Lou 2023-02-03  228   * ngbe_request_msix_irqs - Initialize MSI-X interrupts
e7956139a6cf9a Mengyuan Lou 2023-02-03  229   * @wx: board private structure
e7956139a6cf9a Mengyuan Lou 2023-02-03  230   *
e7956139a6cf9a Mengyuan Lou 2023-02-03  231   * ngbe_request_msix_irqs allocates MSI-X vectors and requests
e7956139a6cf9a Mengyuan Lou 2023-02-03  232   * interrupts from the kernel.
e7956139a6cf9a Mengyuan Lou 2023-02-03  233   **/
e7956139a6cf9a Mengyuan Lou 2023-02-03  234  static int ngbe_request_msix_irqs(struct wx *wx)
e7956139a6cf9a Mengyuan Lou 2023-02-03  235  {
e7956139a6cf9a Mengyuan Lou 2023-02-03  236  	struct net_device *netdev = wx->netdev;
e7956139a6cf9a Mengyuan Lou 2023-02-03  237  	int vector, err;
e7956139a6cf9a Mengyuan Lou 2023-02-03  238  
e7956139a6cf9a Mengyuan Lou 2023-02-03  239  	for (vector = 0; vector < wx->num_q_vectors; vector++) {
e7956139a6cf9a Mengyuan Lou 2023-02-03  240  		struct wx_q_vector *q_vector = wx->q_vector[vector];
e7956139a6cf9a Mengyuan Lou 2023-02-03  241  		struct msix_entry *entry = &wx->msix_entries[vector];
e7956139a6cf9a Mengyuan Lou 2023-02-03  242  
e7956139a6cf9a Mengyuan Lou 2023-02-03  243  		if (q_vector->tx.ring && q_vector->rx.ring)
e7956139a6cf9a Mengyuan Lou 2023-02-03  244  			snprintf(q_vector->name, sizeof(q_vector->name) - 1,
e7956139a6cf9a Mengyuan Lou 2023-02-03  245  				 "%s-TxRx-%d", netdev->name, entry->entry);
e7956139a6cf9a Mengyuan Lou 2023-02-03  246  		else
e7956139a6cf9a Mengyuan Lou 2023-02-03  247  			/* skip this unused q_vector */
e7956139a6cf9a Mengyuan Lou 2023-02-03  248  			continue;
e7956139a6cf9a Mengyuan Lou 2023-02-03  249  
e7956139a6cf9a Mengyuan Lou 2023-02-03  250  		err = request_irq(entry->vector, wx_msix_clean_rings, 0,
e7956139a6cf9a Mengyuan Lou 2023-02-03  251  				  q_vector->name, q_vector);
e7956139a6cf9a Mengyuan Lou 2023-02-03  252  		if (err) {
e7956139a6cf9a Mengyuan Lou 2023-02-03  253  			wx_err(wx, "request_irq failed for MSIX interrupt %s Error: %d\n",
e7956139a6cf9a Mengyuan Lou 2023-02-03  254  			       q_vector->name, err);
e7956139a6cf9a Mengyuan Lou 2023-02-03  255  			goto free_queue_irqs;
e7956139a6cf9a Mengyuan Lou 2023-02-03  256  		}
e7956139a6cf9a Mengyuan Lou 2023-02-03  257  	}
e7956139a6cf9a Mengyuan Lou 2023-02-03  258  
e7956139a6cf9a Mengyuan Lou 2023-02-03  259  	err = request_irq(wx->msix_entries[vector].vector,
e7956139a6cf9a Mengyuan Lou 2023-02-03  260  			  ngbe_msix_other, 0, netdev->name, wx);
e7956139a6cf9a Mengyuan Lou 2023-02-03  261  
e7956139a6cf9a Mengyuan Lou 2023-02-03  262  	if (err) {
e7956139a6cf9a Mengyuan Lou 2023-02-03  263  		wx_err(wx, "request_irq for msix_other failed: %d\n", err);
e7956139a6cf9a Mengyuan Lou 2023-02-03  264  		goto free_queue_irqs;
e7956139a6cf9a Mengyuan Lou 2023-02-03  265  	}
e7956139a6cf9a Mengyuan Lou 2023-02-03  266  
e7956139a6cf9a Mengyuan Lou 2023-02-03  267  	return 0;
e7956139a6cf9a Mengyuan Lou 2023-02-03  268  
e7956139a6cf9a Mengyuan Lou 2023-02-03  269  free_queue_irqs:
e7956139a6cf9a Mengyuan Lou 2023-02-03  270  	while (vector) {
e7956139a6cf9a Mengyuan Lou 2023-02-03  271  		vector--;
e7956139a6cf9a Mengyuan Lou 2023-02-03  272  		free_irq(wx->msix_entries[vector].vector,
e7956139a6cf9a Mengyuan Lou 2023-02-03  273  			 wx->q_vector[vector]);
e7956139a6cf9a Mengyuan Lou 2023-02-03  274  	}
e7956139a6cf9a Mengyuan Lou 2023-02-03  275  	wx_reset_interrupt_capability(wx);
e7956139a6cf9a Mengyuan Lou 2023-02-03 @276  	return err;
e7956139a6cf9a Mengyuan Lou 2023-02-03  277  }
e7956139a6cf9a Mengyuan Lou 2023-02-03  278  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

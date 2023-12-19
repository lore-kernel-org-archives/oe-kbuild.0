Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBEB40BE4
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nqa6hx5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703030072; x=1734566072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ryi2JbNnT/U5hBzMXRVTJocZ9s8XQkiCNK80XuD0c0=;
  b=Nqa6hx5HLdf7yfmA4yqD9p/OUmobIgCsZL9/RZ/ofNTZUFH55rn6C9+1
   FD6wfUuQGpX3H3wDNG12+G3IbM9vtObFqoTeoUN7RNjXrq/AYbWP4iSYn
   YRybGnyhtz78GIkhqKWeyZ2MbeeUJG68xONijv3NIBA/T29EE1jUZmL8o
   OmSUtcR9f+fxwmBIhCHxAI0bMO9uGnhT3dPULxl6FOwqhBE8UhoKx/NEA
   jpwoH5iJU+ZIl6tBbK4POz4wF8jwWaKMsjVYgjHpCaJ62A8AWEfWIdYKo
   UJSppJD4jKlboeugmmHzDcIn01yHkXeQRdG1/bfDHY9JZ2w3zjzsxAxwS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="375888315"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="375888315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 15:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="24369299"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2023 15:54:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFjuu-000664-0W;
	Tue, 19 Dec 2023 23:54:28 +0000
Date: Wed, 20 Dec 2023 07:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/5] net: ethernet: altera: rename functions and their
 prototypes
Message-ID: <202312200739.79WGCuyb-lkp@intel.com>
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
In-Reply-To: <20231213071112.18242-6-deepakx.nagaraju@intel.com>
References: <20231213071112.18242-6-deepakx.nagaraju@intel.com>
TO: deepakx.nagaraju@intel.com
TO: joyce.ooi@intel.com
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: davem@davemloft.net
CC: edumazet@google.com
CC: kuba@kernel.org
CC: pabeni@redhat.com
CC: Nagaraju DeepakX <deepakx.nagaraju@intel.com>
CC: Andy Schevchenko <andriy.schevchenko@linux.intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.7-rc6 next-20231219]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/deepakx-nagaraju-intel-com/net-ethernet-altera-remove-unneeded-assignments/20231213-151600
base:   net/main
patch link:    https://lore.kernel.org/r/20231213071112.18242-6-deepakx.nagaraju%40intel.com
patch subject: [PATCH 5/5] net: ethernet: altera: rename functions and their prototypes
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: m68k-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231220/202312200739.79WGCuyb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312200739.79WGCuyb-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/altera/altera_tse_main.c:266 alloc_init_skbufs() warn: double check that we're allocating correct size: 24 vs 164

Old smatch warnings:
drivers/net/ethernet/altera/altera_tse_main.c:271 alloc_init_skbufs() warn: double check that we're allocating correct size: 24 vs 164
drivers/net/ethernet/altera/altera_tse_main.c:988 tse_open() warn: 'priv->tx_irq' from request_irq() not released on lines: 988.

vim +266 drivers/net/ethernet/altera/altera_tse_main.c

bbd2190ce96d8f Vince Bridgers   2014-03-17  256  
bbd2190ce96d8f Vince Bridgers   2014-03-17  257  static int alloc_init_skbufs(struct altera_tse_private *priv)
bbd2190ce96d8f Vince Bridgers   2014-03-17  258  {
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  259  	struct altera_dma_private *dma = &priv->dma_priv;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  260  	unsigned int rx_descs = dma->rx_ring_size;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  261  	unsigned int tx_descs = dma->tx_ring_size;
bbd2190ce96d8f Vince Bridgers   2014-03-17  262  	int ret = -ENOMEM;
bbd2190ce96d8f Vince Bridgers   2014-03-17  263  	int i;
bbd2190ce96d8f Vince Bridgers   2014-03-17  264  
bbd2190ce96d8f Vince Bridgers   2014-03-17  265  	/* Create Rx ring buffer */
ad6f888f174e6a Nagaraju DeepakX 2023-12-13 @266  	dma->rx_ring = kcalloc(rx_descs, sizeof(struct altera_dma_private), GFP_KERNEL);
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  267  	if (!dma->rx_ring)
bbd2190ce96d8f Vince Bridgers   2014-03-17  268  		goto err_rx_ring;
bbd2190ce96d8f Vince Bridgers   2014-03-17  269  
bbd2190ce96d8f Vince Bridgers   2014-03-17  270  	/* Create Tx ring buffer */
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  271  	dma->tx_ring = kcalloc(tx_descs, sizeof(struct altera_dma_private), GFP_KERNEL);
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  272  	if (!dma->tx_ring)
bbd2190ce96d8f Vince Bridgers   2014-03-17  273  		goto err_tx_ring;
bbd2190ce96d8f Vince Bridgers   2014-03-17  274  
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  275  	dma->tx_cons = 0;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  276  	dma->tx_prod = 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  277  
bbd2190ce96d8f Vince Bridgers   2014-03-17  278  	/* Init Rx ring */
bbd2190ce96d8f Vince Bridgers   2014-03-17  279  	for (i = 0; i < rx_descs; i++) {
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  280  		ret = tse_init_rx_buffer(priv, &priv->dma_priv.rx_ring[i], dma->rx_dma_buf_sz);
bbd2190ce96d8f Vince Bridgers   2014-03-17  281  		if (ret)
bbd2190ce96d8f Vince Bridgers   2014-03-17  282  			goto err_init_rx_buffers;
bbd2190ce96d8f Vince Bridgers   2014-03-17  283  	}
bbd2190ce96d8f Vince Bridgers   2014-03-17  284  
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  285  	dma->rx_cons = 0;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  286  	dma->rx_prod = 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  287  
bbd2190ce96d8f Vince Bridgers   2014-03-17  288  	return 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  289  err_init_rx_buffers:
bbd2190ce96d8f Vince Bridgers   2014-03-17  290  	while (--i >= 0)
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  291  		tse_free_rx_buffer(priv, &priv->dma_priv.rx_ring[i]);
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  292  	kfree(dma->tx_ring);
bbd2190ce96d8f Vince Bridgers   2014-03-17  293  err_tx_ring:
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  294  	kfree(dma->rx_ring);
bbd2190ce96d8f Vince Bridgers   2014-03-17  295  err_rx_ring:
bbd2190ce96d8f Vince Bridgers   2014-03-17  296  	return ret;
bbd2190ce96d8f Vince Bridgers   2014-03-17  297  }
bbd2190ce96d8f Vince Bridgers   2014-03-17  298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

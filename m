Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A9EBB
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705934342; cv=none; b=aColZTUqGXTB3CPewZTen5JsowupcxMQiv1zqvY2szWPXOY4EfnX3oQekrG1bMnCWzq+PiBjmpc1q8brNOnwdFep18HyIlnSbS4+4KD4SKN5H+mT1gbYkbavcBPvO89feou9tz04No+99P9w6+EJON6RO+U7eCeKCjXQxTONgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705934342; c=relaxed/simple;
	bh=syDylwp5KIIM7ACCTDZQJL1yTU6QalIy+g2rE60bLF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DmcbGvf1XGJDMCz6oiv0aLJtBxWH+AFt4gTHjK1+I2Zn4+GvVfDeFJC1jiycKPSMxTq/eki9sQ+vhw6dOY93+YxKXlU+LnSen8NZt1QYVxsXYusD8lRDrM9lHicTzijozSdQOiPf6EuaY3ooav3275TMn32pPF/JxdSeIr1DboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdDd9M8r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdDd9M8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705934339; x=1737470339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syDylwp5KIIM7ACCTDZQJL1yTU6QalIy+g2rE60bLF4=;
  b=gdDd9M8rkid5hCgb1xOyg+MtrTtWBlh+ksGuPM4v7zYMA7CTnUCyo1Qc
   eVnmo2TcD8JPZx48toeXFUg32M/hXCF/j+NMPLZ3BlOBON3CrmClUhTSN
   2+Hpcc8dQadU5jfg1lDZFfx93coBM/RX/hpz4yGKnS7byHsOGYwEEOhwF
   8Mk5YnpfuIxOvByCF8b2VKOa6QffgD0oyAu8QSQ59SK152tqk6BK5fekj
   9eQINjOYfdQU8PBO/HsPI13Rf9RMv+6gTB9Jr10LRN+cLgo2Aycc+FlIy
   UeSx+4KH+v8+AGDVZVdTaCIFkBouRPpXWghHVDnFSkzibwo6m/BKTEq4A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1111464"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1111464"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:38:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="904871677"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904871677"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2024 06:38:57 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRvRv-0006gc-0A;
	Mon, 22 Jan 2024 14:38:55 +0000
Date: Mon, 22 Jan 2024 22:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/dw-edma/dw-hdma-v0-core.c:244:8-33: duplicated argument
 to & or |
Message-ID: <202401222216.43KOoXst-lkp@intel.com>
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
TO: Cai Huoqing <cai.huoqing@linux.dev>
CC: Vinod Koul <vkoul@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6613476e225e090cc9aad49be7fa504e290dd33d
commit: e74c39573d35e9ac441090ff8183aa3dc2540649 dmaengine: dw-edma: Add support for native HDMA
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r062-20240117 (https://download.01.org/0day-ci/archive/20240122/202401222216.43KOoXst-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401222216.43KOoXst-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/dw-edma/dw-hdma-v0-core.c:244:8-33: duplicated argument to & or |

vim +244 drivers/dma/dw-edma/dw-hdma-v0-core.c

e74c39573d35e9 Cai Huoqing 2023-05-20  229  
e74c39573d35e9 Cai Huoqing 2023-05-20  230  static void dw_hdma_v0_core_start(struct dw_edma_chunk *chunk, bool first)
e74c39573d35e9 Cai Huoqing 2023-05-20  231  {
e74c39573d35e9 Cai Huoqing 2023-05-20  232  	struct dw_edma_chan *chan = chunk->chan;
e74c39573d35e9 Cai Huoqing 2023-05-20  233  	struct dw_edma *dw = chan->dw;
e74c39573d35e9 Cai Huoqing 2023-05-20  234  	u32 tmp;
e74c39573d35e9 Cai Huoqing 2023-05-20  235  
e74c39573d35e9 Cai Huoqing 2023-05-20  236  	dw_hdma_v0_core_write_chunk(chunk);
e74c39573d35e9 Cai Huoqing 2023-05-20  237  
e74c39573d35e9 Cai Huoqing 2023-05-20  238  	if (first) {
e74c39573d35e9 Cai Huoqing 2023-05-20  239  		/* Enable engine */
e74c39573d35e9 Cai Huoqing 2023-05-20  240  		SET_CH_32(dw, chan->dir, chan->id, ch_en, BIT(0));
e74c39573d35e9 Cai Huoqing 2023-05-20  241  		/* Interrupt enable&unmask - done, abort */
e74c39573d35e9 Cai Huoqing 2023-05-20  242  		tmp = GET_CH_32(dw, chan->dir, chan->id, int_setup) |
e74c39573d35e9 Cai Huoqing 2023-05-20  243  		      HDMA_V0_STOP_INT_MASK | HDMA_V0_ABORT_INT_MASK |
e74c39573d35e9 Cai Huoqing 2023-05-20 @244  		      HDMA_V0_LOCAL_STOP_INT_EN | HDMA_V0_LOCAL_STOP_INT_EN;
e74c39573d35e9 Cai Huoqing 2023-05-20  245  		SET_CH_32(dw, chan->dir, chan->id, int_setup, tmp);
e74c39573d35e9 Cai Huoqing 2023-05-20  246  		/* Channel control */
e74c39573d35e9 Cai Huoqing 2023-05-20  247  		SET_CH_32(dw, chan->dir, chan->id, control1, HDMA_V0_LINKLIST_EN);
e74c39573d35e9 Cai Huoqing 2023-05-20  248  		/* Linked list */
e74c39573d35e9 Cai Huoqing 2023-05-20  249  		/* llp is not aligned on 64bit -> keep 32bit accesses */
e74c39573d35e9 Cai Huoqing 2023-05-20  250  		SET_CH_32(dw, chan->dir, chan->id, llp.lsb,
e74c39573d35e9 Cai Huoqing 2023-05-20  251  			  lower_32_bits(chunk->ll_region.paddr));
e74c39573d35e9 Cai Huoqing 2023-05-20  252  		SET_CH_32(dw, chan->dir, chan->id, llp.msb,
e74c39573d35e9 Cai Huoqing 2023-05-20  253  			  upper_32_bits(chunk->ll_region.paddr));
e74c39573d35e9 Cai Huoqing 2023-05-20  254  	}
e74c39573d35e9 Cai Huoqing 2023-05-20  255  	/* Set consumer cycle */
e74c39573d35e9 Cai Huoqing 2023-05-20  256  	SET_CH_32(dw, chan->dir, chan->id, cycle_sync,
e74c39573d35e9 Cai Huoqing 2023-05-20  257  		  HDMA_V0_CONSUMER_CYCLE_STAT | HDMA_V0_CONSUMER_CYCLE_BIT);
e74c39573d35e9 Cai Huoqing 2023-05-20  258  	/* Doorbell */
e74c39573d35e9 Cai Huoqing 2023-05-20  259  	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
e74c39573d35e9 Cai Huoqing 2023-05-20  260  }
e74c39573d35e9 Cai Huoqing 2023-05-20  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

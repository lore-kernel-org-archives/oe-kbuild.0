Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0F2288F7
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Jul 2025 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913544; cv=none; b=HdYmkxH8jmN+YgTGpm1oS3mQ4yHKrpu/nejuihelBKPkDGOhlIadn9hxiaGX8ck9nuSoVXQP+2UgKdftA3wCAlVUVvD50j8BUcb1E+ZNVsVGo8YnXlDlHTouXlTsvLzeeqfUV0tsF9HJEUaoeL3VvhqhhkOEPxs2JDyRUHNEkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913544; c=relaxed/simple;
	bh=xQt9XmngRKoh0ZygYO3sZGLoegsgAQ1zf0JY0B2+HeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUx6jYrMlpnGYtYzeIJyanvII8KKrBCj/mDGqI3w6QO9rPjAUrqZ35gz8Oz1uyW/XaxMyc/30t9fugZTnnkrBdCp0V6ebh0n6TDEvOcFknkR0khYIPqI0MJvVBmTuqiiWeC4CloGzpZoGAOU6TKyDETT6xJYy84ef0e2EGqQ8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sm2LhYPv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sm2LhYPv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753913542; x=1785449542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQt9XmngRKoh0ZygYO3sZGLoegsgAQ1zf0JY0B2+HeE=;
  b=Sm2LhYPvlbfHS0AUX/83508HQSVUdEHGfaI39cmbBYyVq9pOwgQ6cmZd
   Y+X7vCtcXCHNAS3o6WS6sXs71bPSv3ivpjrNtKAHwuK4PbE55Z651E7zX
   n18mPVSsKefqA/c9LFeSw6HwoN7z9770w+Wdtam/HWn34iutX4Alw1OsG
   gu6reR7borPHgyo1N/16PicLprNGdut78mgSP7sllLUoQFdneCcIuzQia
   uwaT5iyf7FUCEtQm+03dMiIg0mWau49xzD3DAS6I6UCiPjuI6POzVSzeH
   uU+BXGCU5p9BurhBA+yibIlnSk43NqgJfxtcvPuEnBDLcAsW1FrZATpoh
   Q==;
X-CSE-ConnectionGUID: Ptfs3qR7TnCJFtDMpx3vxA==
X-CSE-MsgGUID: rQEeGWEGSuC2NauzqGpJvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60044001"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="60044001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 15:12:21 -0700
X-CSE-ConnectionGUID: W0JFZZDnRHy6/tLte0q5HQ==
X-CSE-MsgGUID: L4TNyPP5QASRZLBEeUlTSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="186790897"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 15:12:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhF21-0003BI-0D;
	Wed, 30 Jul 2025 22:12:17 +0000
Date: Thu, 31 Jul 2025 06:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: lgm-dma: Added HDMA software mode TX
 function.
Message-ID: <202507310524.0JLftLAM-lkp@intel.com>
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
In-Reply-To: <20250730024547.3160871-4-yzhu@maxlinear.com>
References: <20250730024547.3160871-4-yzhu@maxlinear.com>
TO: Zhu Yixin <yzhu@maxlinear.com>
TO: dmaengine@vger.kernel.org
TO: vkoul@kernel.org
CC: jchng@maxlinear.com
CC: sureshnagaraj@maxlinear.com
CC: Zhu Yixin <yzhu@maxlinear.com>

Hi Zhu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.16 next-20250730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Yixin/dmaengine-lgm-dma-Correct-ORRC-MAX-counter-value/20250730-105748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250730024547.3160871-4-yzhu%40maxlinear.com
patch subject: [PATCH 4/5] dmaengine: lgm-dma: Added HDMA software mode TX function.
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310524.0JLftLAM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507310524.0JLftLAM-lkp@intel.com/

smatch warnings:
drivers/dma/lgm/lgm-dma.c:763 update_client_configs() error: uninitialized symbol 'chan_id'.

vim +/chan_id +763 drivers/dma/lgm/lgm-dma.c

32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  730  
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  731  static int
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  732  update_client_configs(struct of_dma *ofdma, struct of_phandle_args *spec)
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  733  {
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  734  	struct ldma_dev *d = ofdma->of_dma_data;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  735  	int i, chan_id, port_id, desc_cnt, burst;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  736  	struct ldma_chan *c;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  737  	struct ldma_port *p;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  738  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  739  	port_id  = -1;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  740  	desc_cnt = -1;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  741  	burst    = -1;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  742  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  743  	for (i = spec->args_count - 1; i >= 0; i--) {
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  744  		switch (i) {
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  745  		case DMA_ARG_BURST_SZ:
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  746  			burst = spec->args[i];
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  747  			break;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  748  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  749  		case DMA_ARG_PORT_ID:
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  750  			port_id = spec->args[i];
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  751  			break;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  752  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  753  		case DMA_ARG_DESC_CNT:
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  754  			desc_cnt = spec->args[i];
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  755  			break;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  756  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  757  		case DMA_ARG_CHAN_ID:
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  758  			chan_id = spec->args[i];
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  759  			break;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  760  		}
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  761  	}
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  762  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30 @763  	if (chan_id >= d->chan_nrs || chan_id < 0)
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  764  		return -1;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  765  
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  766  	c = &d->chans[chan_id];
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  767  	if (!ldma_chan_is_hw_desc(c) && desc_cnt > 0)
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  768  		c->desc_cnt = desc_cnt;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  769  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  770  	if (port_id < 0 || burst < 0 || port_id > d->port_nrs)
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  771  		return chan_id;
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  772  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  773  	p = &d->ports[port_id];
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  774  	c->port = p;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  775  
71e55b5b80fb51 Zhu Yixin                   2025-07-30  776  	update_burst_len(c, p, burst);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  777  
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  778  	ldma_port_cfg(p);
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  779  
7dc2f78b8862a3 Zhu Yixin                   2025-07-30  780  	return chan_id;
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  781  }
32d31c79a1a4fb Amireddy Mallikarjuna reddy 2020-12-03  782  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

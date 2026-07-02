Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D5538734E
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782973598; cv=none; b=T/Uz1Nw4N7QTmzIpCTgvmAeI95l8qi8KjVAh+etE0M9ypAbpAPtKsRvDDUyuj0T1vk4qaVGWI5qtq7wgc6GowoImv/hiaD5NgdXyV/bG8x+wSn4r244Ey/jjw4180RfWbp5lAX+/Jyp4rvCm21dEOLp4s1bISOaIzSoAQIixKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782973598; c=relaxed/simple;
	bh=myQZX5WOxc7D67fxCDPF6+XaYN1f5DzGk+qUB3I6m6E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pD+k57iMguvmcgXOC4twYBpVH1WQJguqsfwgADrQ8Ga5NsyQklDU/AMx69XBlQYNRwND/5QyGjxAeqx+fp/y48FQFd7RX2qApWZW9LTDFmu4DOGc1RmD486chMRM/eg8G7PjqimBXhako+ltTTYlE9oOUp0GQzGb9xq0B2nd60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROOeRCjq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROOeRCjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782973596; x=1814509596;
  h=date:from:to:cc:subject:message-id;
  bh=myQZX5WOxc7D67fxCDPF6+XaYN1f5DzGk+qUB3I6m6E=;
  b=ROOeRCjq00D6xcPqDwNY+nTAvQRktUoydty77a9CCb7utQLBTCWQeKto
   Yx7+AUplzdOGqZT3z8j/hCAFx9pifaRynVs2EVVuVVphuKp1PydY9ZLv6
   O497+8JQIEbB7kZq7NAsUH+UnYcH/588jOY0u2V8J+swxR5aw8FjBhmSy
   31bBP/IMv27Sf0sJxWTYxyzTXdLyip6lGLHMEJWEqS6m7UQao7T4WDupj
   JebAFTRKKDLKLUHTis9AAIDGwQmRN23JnPjWfLl+uydL+kMdTgVhhpIgn
   U7EVU8w/g+eJ3mhqTqTsJvdnlSlyaSTwyw3Hs0JC4NIw1F1WSVCEzT0tP
   w==;
X-CSE-ConnectionGUID: jggWbXhPRGmo+kbjEhB/TA==
X-CSE-MsgGUID: yTlKWDGzQMKlsTDhH29coQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83493175"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83493175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 23:26:33 -0700
X-CSE-ConnectionGUID: ZujZpIabQr+QFfrqDqKzyw==
X-CSE-MsgGUID: 3IvxUTM/QdGgwBgPio5CaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="250113468"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 23:26:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfAsX-00000000A5n-3Dpl;
	Thu, 02 Jul 2026 06:26:29 +0000
Date: Thu, 02 Jul 2026 14:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/loongson/loongson1-apb-dma.c:458
 ls1x_dma_tx_status() warn: iterator used outside loop: 'lli'
Message-ID: <202607021416.o9orxwfy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Keguang Zhang <keguang.zhang@gmail.com>
CC: Huacai Chen <chenhuacai@loongson.cn>

Hi Binbin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: ffee2dc04e7e06534aaa4fd51ef89645b809b6b8 dmaengine: loongson: New directory for Loongson DMA controllers drivers
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: sparc64-randconfig-r072-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021416.o9orxwfy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ffee2dc04e7e ("dmaengine: loongson: New directory for Loongson DMA controllers drivers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021416.o9orxwfy-lkp@intel.com/

smatch warnings:
drivers/dma/loongson/loongson1-apb-dma.c:458 ls1x_dma_tx_status() warn: iterator used outside loop: 'lli'

vim +/lli +458 drivers/dma/loongson/loongson1-apb-dma.c

e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  422  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  423  static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  424  					  dma_cookie_t cookie,
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  425  					  struct dma_tx_state *state)
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  426  {
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  427  	struct ls1x_dma_chan *chan = to_ls1x_dma_chan(dchan);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  428  	struct virt_dma_desc *vd;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  429  	enum dma_status status;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  430  	size_t bytes = 0;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  431  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  432  	status = dma_cookie_status(dchan, cookie, state);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  433  	if (status == DMA_COMPLETE)
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  434  		return status;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  435  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  436  	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  437  		vd = vchan_find_desc(&chan->vc, cookie);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  438  		if (vd) {
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  439  			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  440  			struct ls1x_dma_lli *lli;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  441  			dma_addr_t next_phys;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  442  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  443  			/* get the current lli */
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  444  			if (ls1x_dma_query(chan, &chan->curr_lli->phys))
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  445  				return status;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  446  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  447  			/* locate the current lli */
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  448  			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  449  			list_for_each_entry(lli, &desc->lli_list, node)
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  450  				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  451  					break;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  452  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  453  			dev_dbg(chan2dev(dchan), "current lli_phys=%pad",
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  454  				&lli->phys);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  455  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  456  			/* count the residues */
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  457  			list_for_each_entry_from(lli, &desc->lli_list, node)
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09 @458  				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  459  					 chan->bus_width;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  460  		}
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  461  	}
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  462  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  463  	dma_set_residue(state, bytes);
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  464  
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  465  	return status;
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  466  }
e06c432312148d drivers/dma/loongson1-apb-dma.c Keguang Zhang 2024-08-09  467  

:::::: The code at line 458 was first introduced by commit
:::::: e06c432312148ddb550ec55b004e32671657ea23 dmaengine: Loongson1: Add Loongson-1 APB DMA driver

:::::: TO: Keguang Zhang <keguang.zhang@gmail.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

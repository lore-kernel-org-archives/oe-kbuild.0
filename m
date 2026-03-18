Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC64594A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 23:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878340; cv=none; b=ukC/BIq+AU85YcoJcJXt257W6yuJlms4MAyLvfdvgWVWDFAvmHHfoaKGzXoSzkFQnEQSwEEk8yDIPWC2QBU0pQDE/JUWwGMVoH+9NM8nsvD47k0UyZUZOFgSwIUUhhw49jjE67nzrNENRq4jZa6Gx3tFynGn2eIFEsLwgiyYu50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878340; c=relaxed/simple;
	bh=zIixERYSUBRq3adRXAPiBWgm98/HoTGhN32vZV7rTsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R4HGFg/PUfjHF4p1g+BgmzyMZZrLyS3AW/b5uDYMrYYAmQ3awDRWJmF9Tc58eplIKPhmcmeGFzaMeoD4OWFYe+J+6ea6oAFSBkxal0HDOPqwiBvHKFFacu8xLH2lMJSjtOF/XqNE5klHvfQ+8i6nxElbZu+SboMWW5WNZm115Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZNA1dgw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZNA1dgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773878338; x=1805414338;
  h=date:from:to:cc:subject:message-id;
  bh=zIixERYSUBRq3adRXAPiBWgm98/HoTGhN32vZV7rTsg=;
  b=XZNA1dgwWMSxJBYA0/wVOO7GvjY64s+voKY676LbEt+i/exOCPN5PBLJ
   RZ6g1c971UJuFVOeZiKujF5gJ9vL6hh/l3GWRc72mXovAIyJ6HVPtQZuv
   tjSnkK+gSKK+VnChV56d6s+cTDUMH77ZderpLKqJehOCnpD8jrpnawW1N
   nLzrsrsDevf3yBEY51BHOtq+s3jxxR09Eg84a8QLyNS2vt9mahwLFk52k
   3RXCxCFNK9ntEaxVZ8UhD3Gy5yHNk9quq73cqqkzvN/3guuspSsO/bNFR
   oDfxXdPW9qXSzrvBec8dgMuIN+8sJkFso9DYg8qvI4wU+44eW0UKGyCuu
   A==;
X-CSE-ConnectionGUID: qi8DvFAzR9afV5MP3LuG5g==
X-CSE-MsgGUID: a9GAevnuQNGLoAfEhyEg2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="77555790"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="77555790"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 16:58:58 -0700
X-CSE-ConnectionGUID: RtWa2CdhReSuo85pIRL4xA==
X-CSE-MsgGUID: 57OSuVNEQyGGC6oLAlWB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227741646"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Mar 2026 16:58:57 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w30ms-0000000006V-0XL8;
	Wed, 18 Mar 2026 23:58:54 +0000
Date: Thu, 19 Mar 2026 07:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6317/7246]
 drivers/dma/loongson/loongson1-apb-dma.c:458 ls1x_dma_tx_status() warn:
 iterator used outside loop: 'lli'
Message-ID: <202603190721.mXC6Cqcj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Vinod Koul <vkoul@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>
CC: Keguang Zhang <keguang.zhang@gmail.com>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: ffee2dc04e7e06534aaa4fd51ef89645b809b6b8 [6317/7246] dmaengine: loongson: New directory for Loongson DMA controllers drivers
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r073-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190721.mXC6Cqcj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603190721.mXC6Cqcj-lkp@intel.com/

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

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A93E4C84
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859237; cv=none; b=rPqguruNIos0P9rpeYrSDtQjIoRxcDdfneMZ3/Yu701fmKEFVR8Ash2EEC2iWEswOGS62RlQrUMK6eUYFL2bOGLT30FJpI8WZWZI4c4TFA8Ti/FAjV/AGpWTcQmyX4jYO5ODu4RVW0s6s0c83k97kxNs5soljhirBy0lHqBtUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859237; c=relaxed/simple;
	bh=HqNKUdNi7W6vU9/414qvIcDSDKsy4JoCcmsrd6BuqAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D1i/Ao+/EfuZhUrUVuJITzVJ/7iJBBLsDUe+OEV0VAVoOq3JqUC7a2djIDUPy2YYOWEwaQE7G12oDg0RqrnIdEqcADAgmsav+ZvIuslK6SOlcWsbMjjzmRKbxyjkRLitMjTIegtRhA3LdIf6pNOE+jCs/8vcyIt6XDHrf5iPFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj3w/GB3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj3w/GB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773859233; x=1805395233;
  h=date:from:to:cc:subject:message-id;
  bh=HqNKUdNi7W6vU9/414qvIcDSDKsy4JoCcmsrd6BuqAc=;
  b=Yj3w/GB30BgWNtjR++Fv0Ia9Vklxr2GHxDfWEBJBAz9WKsJMVgwWWyTB
   GcL45Xu6Ezcy+CWK9spcHXJSFdCTnsnixYRZW9oSPBYFalrDTD79rid4V
   lMVXqNXFjYkUphOHoOcXEo1MhzDbqFRo8cDwnuNzB49xpj6IZ2j81Bt67
   0I6DQqXrM8fbFpf3CK5ovYcGgJZI7FhxWnoMHrMWAooyvmKDfr5hFGOcF
   wkVDOyy0lccZf3Lin/rEa8RaFfwYy62B/Y+ir/9EP3C58ZV8Pr2rr8hP/
   VtZ7/dSikc/Hi4/UEbFqolezRrixPWVYXgENBlUUKQl3YQcUzC01amAdP
   g==;
X-CSE-ConnectionGUID: talDhP+bRrObXc85Hk+PzA==
X-CSE-MsgGUID: 2WBuXhiPT2KzyJXWt5GEvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86402930"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="86402930"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 11:40:32 -0700
X-CSE-ConnectionGUID: WNwIgcssQga+tLz53m5k7Q==
X-CSE-MsgGUID: r+HR8damQo25xUJ5FVwArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247144272"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 11:40:30 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2voh-000000003Gf-3LTc;
	Wed, 18 Mar 2026 18:40:27 +0000
Date: Thu, 19 Mar 2026 02:40:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6296/7246] drivers/dma/sh/rz-dmac.c:726
 rz_dmac_chan_get_residue() warn: can 'current_desc' even be NULL?
Message-ID: <202603190250.VAmYUWk2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Long Luu <long.luu.ur@renesas.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 21323b118c16d287355e6497e1098ce1ca348bd6 [6296/7246] dmaengine: sh: rz-dmac: Add device_tx_status() callback
:::::: branch date: 2 hours ago
:::::: commit date: 32 hours ago
config: m68k-randconfig-r073-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190250.VAmYUWk2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603190250.VAmYUWk2-lkp@intel.com/

smatch warnings:
drivers/dma/sh/rz-dmac.c:726 rz_dmac_chan_get_residue() warn: can 'current_desc' even be NULL?

vim +/current_desc +726 drivers/dma/sh/rz-dmac.c

21323b118c16d2 Biju Das 2026-03-16  715  
21323b118c16d2 Biju Das 2026-03-16  716  static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
21323b118c16d2 Biju Das 2026-03-16  717  				    dma_cookie_t cookie)
21323b118c16d2 Biju Das 2026-03-16  718  {
21323b118c16d2 Biju Das 2026-03-16  719  	struct rz_dmac_desc *current_desc, *desc;
21323b118c16d2 Biju Das 2026-03-16  720  	enum dma_status status;
21323b118c16d2 Biju Das 2026-03-16  721  	u32 crla, crtb, i;
21323b118c16d2 Biju Das 2026-03-16  722  
21323b118c16d2 Biju Das 2026-03-16  723  	/* Get current processing virtual descriptor */
21323b118c16d2 Biju Das 2026-03-16  724  	current_desc = list_first_entry(&channel->ld_active,
21323b118c16d2 Biju Das 2026-03-16  725  					struct rz_dmac_desc, node);
21323b118c16d2 Biju Das 2026-03-16 @726  	if (!current_desc)
21323b118c16d2 Biju Das 2026-03-16  727  		return 0;
21323b118c16d2 Biju Das 2026-03-16  728  
21323b118c16d2 Biju Das 2026-03-16  729  	/*
21323b118c16d2 Biju Das 2026-03-16  730  	 * If the cookie corresponds to a descriptor that has been completed
21323b118c16d2 Biju Das 2026-03-16  731  	 * there is no residue. The same check has already been performed by the
21323b118c16d2 Biju Das 2026-03-16  732  	 * caller but without holding the channel lock, so the descriptor could
21323b118c16d2 Biju Das 2026-03-16  733  	 * now be complete.
21323b118c16d2 Biju Das 2026-03-16  734  	 */
21323b118c16d2 Biju Das 2026-03-16  735  	status = dma_cookie_status(&channel->vc.chan, cookie, NULL);
21323b118c16d2 Biju Das 2026-03-16  736  	if (status == DMA_COMPLETE)
21323b118c16d2 Biju Das 2026-03-16  737  		return 0;
21323b118c16d2 Biju Das 2026-03-16  738  
21323b118c16d2 Biju Das 2026-03-16  739  	/*
21323b118c16d2 Biju Das 2026-03-16  740  	 * If the cookie doesn't correspond to the currently processing virtual
21323b118c16d2 Biju Das 2026-03-16  741  	 * descriptor then the descriptor hasn't been processed yet, and the
21323b118c16d2 Biju Das 2026-03-16  742  	 * residue is equal to the full descriptor size. Also, a client driver
21323b118c16d2 Biju Das 2026-03-16  743  	 * is possible to call this function before rz_dmac_irq_handler_thread()
21323b118c16d2 Biju Das 2026-03-16  744  	 * runs. In this case, the running descriptor will be the next
21323b118c16d2 Biju Das 2026-03-16  745  	 * descriptor, and will appear in the done list. So, if the argument
21323b118c16d2 Biju Das 2026-03-16  746  	 * cookie matches the done list's cookie, we can assume the residue is
21323b118c16d2 Biju Das 2026-03-16  747  	 * zero.
21323b118c16d2 Biju Das 2026-03-16  748  	 */
21323b118c16d2 Biju Das 2026-03-16  749  	if (cookie != current_desc->vd.tx.cookie) {
21323b118c16d2 Biju Das 2026-03-16  750  		list_for_each_entry(desc, &channel->ld_free, node) {
21323b118c16d2 Biju Das 2026-03-16  751  			if (cookie == desc->vd.tx.cookie)
21323b118c16d2 Biju Das 2026-03-16  752  				return 0;
21323b118c16d2 Biju Das 2026-03-16  753  		}
21323b118c16d2 Biju Das 2026-03-16  754  
21323b118c16d2 Biju Das 2026-03-16  755  		list_for_each_entry(desc, &channel->ld_queue, node) {
21323b118c16d2 Biju Das 2026-03-16  756  			if (cookie == desc->vd.tx.cookie)
21323b118c16d2 Biju Das 2026-03-16  757  				return desc->len;
21323b118c16d2 Biju Das 2026-03-16  758  		}
21323b118c16d2 Biju Das 2026-03-16  759  
21323b118c16d2 Biju Das 2026-03-16  760  		list_for_each_entry(desc, &channel->ld_active, node) {
21323b118c16d2 Biju Das 2026-03-16  761  			if (cookie == desc->vd.tx.cookie)
21323b118c16d2 Biju Das 2026-03-16  762  				return desc->len;
21323b118c16d2 Biju Das 2026-03-16  763  		}
21323b118c16d2 Biju Das 2026-03-16  764  
21323b118c16d2 Biju Das 2026-03-16  765  		/*
21323b118c16d2 Biju Das 2026-03-16  766  		 * No descriptor found for the cookie, there's thus no residue.
21323b118c16d2 Biju Das 2026-03-16  767  		 * This shouldn't happen if the calling driver passes a correct
21323b118c16d2 Biju Das 2026-03-16  768  		 * cookie value.
21323b118c16d2 Biju Das 2026-03-16  769  		 */
21323b118c16d2 Biju Das 2026-03-16  770  		WARN(1, "No descriptor for cookie!");
21323b118c16d2 Biju Das 2026-03-16  771  		return 0;
21323b118c16d2 Biju Das 2026-03-16  772  	}
21323b118c16d2 Biju Das 2026-03-16  773  
21323b118c16d2 Biju Das 2026-03-16  774  	/*
21323b118c16d2 Biju Das 2026-03-16  775  	 * We need to read two registers. Make sure the hardware does not move
21323b118c16d2 Biju Das 2026-03-16  776  	 * to next lmdesc while reading the current lmdesc. Trying it 3 times
21323b118c16d2 Biju Das 2026-03-16  777  	 * should be enough: initial read, retry, retry for the paranoid.
21323b118c16d2 Biju Das 2026-03-16  778  	 */
21323b118c16d2 Biju Das 2026-03-16  779  	for (i = 0; i < 3; i++) {
21323b118c16d2 Biju Das 2026-03-16  780  		crla = rz_dmac_ch_readl(channel, CRLA, 1);
21323b118c16d2 Biju Das 2026-03-16  781  		crtb = rz_dmac_ch_readl(channel, CRTB, 1);
21323b118c16d2 Biju Das 2026-03-16  782  		/* Still the same? */
21323b118c16d2 Biju Das 2026-03-16  783  		if (crla == rz_dmac_ch_readl(channel, CRLA, 1))
21323b118c16d2 Biju Das 2026-03-16  784  			break;
21323b118c16d2 Biju Das 2026-03-16  785  	}
21323b118c16d2 Biju Das 2026-03-16  786  
21323b118c16d2 Biju Das 2026-03-16  787  	WARN_ONCE(i >= 3, "residue might not be continuous!");
21323b118c16d2 Biju Das 2026-03-16  788  
21323b118c16d2 Biju Das 2026-03-16  789  	/*
21323b118c16d2 Biju Das 2026-03-16  790  	 * Calculate number of bytes transferred in processing virtual descriptor.
21323b118c16d2 Biju Das 2026-03-16  791  	 * One virtual descriptor can have many lmdesc.
21323b118c16d2 Biju Das 2026-03-16  792  	 */
21323b118c16d2 Biju Das 2026-03-16  793  	return crtb + rz_dmac_calculate_residue_bytes_in_vd(channel, crla);
21323b118c16d2 Biju Das 2026-03-16  794  }
21323b118c16d2 Biju Das 2026-03-16  795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

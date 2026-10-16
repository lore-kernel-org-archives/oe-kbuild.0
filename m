Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986747CC97
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151402; cv=none; b=RxoV2g14Aw4TLg+0xuvJ/e9UlecVEkp5bBJ64gfLwGoNvBvI0TVUTSfesBggAdNDpXeMydqXK1FA+mxgPPVylqCoyAXQfHbfgiW2qZcCHzzFIqINIqjpveH+yfOSCTEcy2AGYKU1RhuG7hSZ0ck6ZL1LQlmloDjKSwMhDXsgRAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151402; c=relaxed/simple;
	bh=AKvwoWF0ObsiJUYZJfYj9PZbjeyLRc0aevXJWIr4Sco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t3RmknnkVoE0zLldv829hHkHHajE3COk+vwhIPeCfuyLzNkO0M687WOvdlczOJUtIK+q7NkrrGa3B6gST0bedDN4tz85kwPiwp8WfAyIQR/AyrPhw2HYMtqBODxOY33bf1GS6zLcsdZDMs6rOW1GmQ1cCYxjLYunh2/v/0ASKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlE7r86t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlE7r86t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792151400; x=1823687400;
  h=date:from:to:cc:subject:message-id;
  bh=AKvwoWF0ObsiJUYZJfYj9PZbjeyLRc0aevXJWIr4Sco=;
  b=AlE7r86tl8XegE8UZSsEpzjFyXFy4en2mUQ88YhXOxVWoHi+1YSn/NFy
   qgaTi9eSQHyJ0bP8CmnuCqsKyPFFVuOrpafPwpJiK/Llvyj63JTBIjYOD
   vnHTO0oJ4e/0daHmKnxtFSXdf6L7QtQ5GoXtVjUIQGmhioxln06/KlXES
   sfooLdkxOPYThE7bX67+uJIxPl9ynCfgtiuoEPGV3xFv+hSkA/1qPmv02
   Z83v5pj9X3nszpt1Z1kZcVs5E7oA6yv79tGzmAtJEcRwXqdOGzY3D3B4P
   xTkWvT4rsFdQzKIC5udtl2RdxEcOFTEaum8lJw/wuoD3xB3axGBNOXy/M
   Q==;
X-CSE-ConnectionGUID: JyiAtR/MSQi6KvmDBDG11A==
X-CSE-MsgGUID: GUS1lrOaQ02kpNoMPaS5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="1035580"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1035580"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:49:59 -0700
X-CSE-ConnectionGUID: aGdUZE3jSnSQyd2H4VlEUQ==
X-CSE-MsgGUID: vGw+egbfQyKH9kBBasyn2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1914043"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Oct 2026 04:49:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHgRf-00000000CDT-2hTR;
	Fri, 16 Oct 2026 11:49:55 +0000
Date: Fri, 16 Oct 2026 13:49:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/nic/cn20k.c:296
 cn20k_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be
 null (see line 267)
Message-ID: <202610161346.SX9ju0OQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linu Cherian <lcherian@marvell.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
commit: d322fbd1720382a37ec4d2cf3f3eda7e59439d40 octeontx2-pf: Initialize cn20k specific aura and pool contexts
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2201-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161346.SX9ju0OQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d322fbd17203 ("octeontx2-pf: Initialize cn20k specific aura and pool contexts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610161346.SX9ju0OQ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/nic/cn20k.c:296 cn20k_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be null (see line 267)
drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1416 otx2_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be null (see line 1388)

vim +296 drivers/net/ethernet/marvell/octeontx2/nic/cn20k.c

d322fbd1720382 Linu Cherian 2025-10-25  253  
d322fbd1720382 Linu Cherian 2025-10-25  254  static int cn20k_aura_aq_init(struct otx2_nic *pfvf, int aura_id,
d322fbd1720382 Linu Cherian 2025-10-25  255  			      int pool_id, int numptrs)
d322fbd1720382 Linu Cherian 2025-10-25  256  {
d322fbd1720382 Linu Cherian 2025-10-25  257  	struct npa_cn20k_aq_enq_req *aq;
d322fbd1720382 Linu Cherian 2025-10-25  258  	struct otx2_pool *pool;
d322fbd1720382 Linu Cherian 2025-10-25  259  	u8 bpid_idx;
d322fbd1720382 Linu Cherian 2025-10-25  260  	int err;
d322fbd1720382 Linu Cherian 2025-10-25  261  
d322fbd1720382 Linu Cherian 2025-10-25  262  	pool = &pfvf->qset.pool[pool_id];
d322fbd1720382 Linu Cherian 2025-10-25  263  
d322fbd1720382 Linu Cherian 2025-10-25  264  	/* Allocate memory for HW to update Aura count.
d322fbd1720382 Linu Cherian 2025-10-25  265  	 * Alloc one cache line, so that it fits all FC_STYPE modes.
d322fbd1720382 Linu Cherian 2025-10-25  266  	 */
d322fbd1720382 Linu Cherian 2025-10-25 @267  	if (!pool->fc_addr) {
d322fbd1720382 Linu Cherian 2025-10-25  268  		err = qmem_alloc(pfvf->dev, &pool->fc_addr, 1, OTX2_ALIGN);
d322fbd1720382 Linu Cherian 2025-10-25  269  		if (err)
d322fbd1720382 Linu Cherian 2025-10-25  270  			return err;
d322fbd1720382 Linu Cherian 2025-10-25  271  	}
d322fbd1720382 Linu Cherian 2025-10-25  272  
d322fbd1720382 Linu Cherian 2025-10-25  273  	/* Initialize this aura's context via AF */
d322fbd1720382 Linu Cherian 2025-10-25  274  	aq = otx2_mbox_alloc_msg_npa_cn20k_aq_enq(&pfvf->mbox);
d322fbd1720382 Linu Cherian 2025-10-25  275  	if (!aq) {
d322fbd1720382 Linu Cherian 2025-10-25  276  		/* Shared mbox memory buffer is full, flush it and retry */
d322fbd1720382 Linu Cherian 2025-10-25  277  		err = otx2_sync_mbox_msg(&pfvf->mbox);
d322fbd1720382 Linu Cherian 2025-10-25  278  		if (err)
d322fbd1720382 Linu Cherian 2025-10-25  279  			return err;
d322fbd1720382 Linu Cherian 2025-10-25  280  		aq = otx2_mbox_alloc_msg_npa_cn20k_aq_enq(&pfvf->mbox);
d322fbd1720382 Linu Cherian 2025-10-25  281  		if (!aq)
d322fbd1720382 Linu Cherian 2025-10-25  282  			return -ENOMEM;
d322fbd1720382 Linu Cherian 2025-10-25  283  	}
d322fbd1720382 Linu Cherian 2025-10-25  284  
d322fbd1720382 Linu Cherian 2025-10-25  285  	aq->aura_id = aura_id;
d322fbd1720382 Linu Cherian 2025-10-25  286  
d322fbd1720382 Linu Cherian 2025-10-25  287  	/* Will be filled by AF with correct pool context address */
d322fbd1720382 Linu Cherian 2025-10-25  288  	aq->aura.pool_addr = pool_id;
d322fbd1720382 Linu Cherian 2025-10-25  289  	aq->aura.pool_caching = 1;
d322fbd1720382 Linu Cherian 2025-10-25  290  	aq->aura.shift = ilog2(numptrs) - 8;
d322fbd1720382 Linu Cherian 2025-10-25  291  	aq->aura.count = numptrs;
d322fbd1720382 Linu Cherian 2025-10-25  292  	aq->aura.limit = numptrs;
d322fbd1720382 Linu Cherian 2025-10-25  293  	aq->aura.avg_level = 255;
d322fbd1720382 Linu Cherian 2025-10-25  294  	aq->aura.ena = 1;
d322fbd1720382 Linu Cherian 2025-10-25  295  	aq->aura.fc_ena = 1;
d322fbd1720382 Linu Cherian 2025-10-25 @296  	aq->aura.fc_addr = pool->fc_addr->iova;
d322fbd1720382 Linu Cherian 2025-10-25  297  	aq->aura.fc_hyst_bits = 0; /* Store count on all updates */
d322fbd1720382 Linu Cherian 2025-10-25  298  
d322fbd1720382 Linu Cherian 2025-10-25  299  	/* Enable backpressure for RQ aura */
d322fbd1720382 Linu Cherian 2025-10-25  300  	if (aura_id < pfvf->hw.rqpool_cnt && !is_otx2_lbkvf(pfvf->pdev)) {
d322fbd1720382 Linu Cherian 2025-10-25  301  		aq->aura.bp_ena = 0;
d322fbd1720382 Linu Cherian 2025-10-25  302  		/* If NIX1 LF is attached then specify NIX1_RX.
d322fbd1720382 Linu Cherian 2025-10-25  303  		 *
d322fbd1720382 Linu Cherian 2025-10-25  304  		 * Below NPA_AURA_S[BP_ENA] is set according to the
d322fbd1720382 Linu Cherian 2025-10-25  305  		 * NPA_BPINTF_E enumeration given as:
d322fbd1720382 Linu Cherian 2025-10-25  306  		 * 0x0 + a*0x1 where 'a' is 0 for NIX0_RX and 1 for NIX1_RX so
d322fbd1720382 Linu Cherian 2025-10-25  307  		 * NIX0_RX is 0x0 + 0*0x1 = 0
d322fbd1720382 Linu Cherian 2025-10-25  308  		 * NIX1_RX is 0x0 + 1*0x1 = 1
d322fbd1720382 Linu Cherian 2025-10-25  309  		 * But in HRM it is given that
d322fbd1720382 Linu Cherian 2025-10-25  310  		 * "NPA_AURA_S[BP_ENA](w1[33:32]) - Enable aura backpressure to
d322fbd1720382 Linu Cherian 2025-10-25  311  		 * NIX-RX based on [BP] level. One bit per NIX-RX; index
d322fbd1720382 Linu Cherian 2025-10-25  312  		 * enumerated by NPA_BPINTF_E."
d322fbd1720382 Linu Cherian 2025-10-25  313  		 */
d322fbd1720382 Linu Cherian 2025-10-25  314  		if (pfvf->nix_blkaddr == BLKADDR_NIX1)
d322fbd1720382 Linu Cherian 2025-10-25  315  			aq->aura.bp_ena = 1;
d322fbd1720382 Linu Cherian 2025-10-25  316  
d322fbd1720382 Linu Cherian 2025-10-25  317  		bpid_idx = cn20k_aura_bpid_idx(pfvf, aura_id);
d322fbd1720382 Linu Cherian 2025-10-25  318  		aq->aura.bpid = pfvf->bpid[bpid_idx];
d322fbd1720382 Linu Cherian 2025-10-25  319  
d322fbd1720382 Linu Cherian 2025-10-25  320  		/* Set backpressure level for RQ's Aura */
d322fbd1720382 Linu Cherian 2025-10-25  321  		aq->aura.bp = RQ_BP_LVL_AURA;
d322fbd1720382 Linu Cherian 2025-10-25  322  	}
d322fbd1720382 Linu Cherian 2025-10-25  323  
d322fbd1720382 Linu Cherian 2025-10-25  324  	/* Fill AQ info */
d322fbd1720382 Linu Cherian 2025-10-25  325  	aq->ctype = NPA_AQ_CTYPE_AURA;
d322fbd1720382 Linu Cherian 2025-10-25  326  	aq->op = NPA_AQ_INSTOP_INIT;
d322fbd1720382 Linu Cherian 2025-10-25  327  
d322fbd1720382 Linu Cherian 2025-10-25  328  	return 0;
d322fbd1720382 Linu Cherian 2025-10-25  329  }
d322fbd1720382 Linu Cherian 2025-10-25  330  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

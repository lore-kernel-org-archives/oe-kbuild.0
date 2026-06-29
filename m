Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916936C598
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jun 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733497; cv=none; b=dLv09avlXV6BOFYsiikwtk0TOm3BzK4OephJuu/6OYT0ff0sNXSxpiSwume32NNMdJUiZWqkB+tli8z7xttBcc9JB19lOzevIClvZL4CMXcV1b8edridJfckem/G+GoiqKCTN9PxM2+C9JzeEEy3FpNfnHvQRn+9Z/pjAz3nATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733497; c=relaxed/simple;
	bh=Qvajv/Q0brvNNDbOhr4r+mUEzFTUFFkxcnwdkt5jpLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N7fyfR1w8s+1gkmtLEgXR9J0RXbhTLIzqWNuk795GQlYCUrCqrRDr6/KdWqjEauTP44/Dvqc0FO5OyQqfCDPMD7F2SYQPM/hQ7I5VMSmN+I04FtGx4tXvLtHWLZidNZEVS6X2/Itpt5/tdY0WuadyP0rvtER9wcXx9t60Qb49OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlHxxBSf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlHxxBSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782733496; x=1814269496;
  h=date:from:to:cc:subject:message-id;
  bh=Qvajv/Q0brvNNDbOhr4r+mUEzFTUFFkxcnwdkt5jpLM=;
  b=ZlHxxBSf5/iaqESDFrTtZsPer6fE5VnosQcLIqIRQVHzj6hI5RdzW8ck
   FJxCw5U2RlUuse1RLtfpEwT/CCcqqH3muSVWm6xWhyyP5c1lUA/C4ZSLN
   N7KyCDXSuekxzs96dG6WYcSHAu1z3R/VYTTjCTNRbgd2gm4p1XHsBUg82
   VdqQtvDgeZB9uXVRVsEegjBodknFncpUlRe27Vs9kaaCGoWd5C6Wpcn2H
   BIdtB9oy/RYHe+8VXXQgHvR0rLav/zgwyaeQinKGvrSJcnJw7SSYmg1Eu
   jqS7GxXSlmdFbAs5Bno39jvFwcjb/WgCGib3POoU/2uHUxz0F9tUPpWHh
   A==;
X-CSE-ConnectionGUID: akBh2DXiQVCVxxUJ4GVZHg==
X-CSE-MsgGUID: 4ufUKn7MQeue2ogfzP8OKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83449883"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83449883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:44:51 -0700
X-CSE-ConnectionGUID: AeH29vofTqyS9WCDVrHKdA==
X-CSE-MsgGUID: V+lELF2QSV+AMIZ7gxAx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="245575621"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2026 04:44:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weAPo-000000007MF-0XDu;
	Mon, 29 Jun 2026 11:44:40 +0000
Date: Mon, 29 Jun 2026 19:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/marvell/octeontx2/nic/cn20k.c:296
 cn20k_aura_aq_init() error: we previously assumed 'pool->fc_addr' could be
 null (see line 267)
Message-ID: <202606291951.IauMitv3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Linu Cherian <lcherian@marvell.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Subbaraya Sundeep <sbhatta@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: d322fbd1720382a37ec4d2cf3f3eda7e59439d40 octeontx2-pf: Initialize cn20k specific aura and pool contexts
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r071-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291951.IauMitv3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d322fbd17203 ("octeontx2-pf: Initialize cn20k specific aura and pool contexts")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606291951.IauMitv3-lkp@intel.com/

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

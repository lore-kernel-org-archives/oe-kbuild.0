Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284D9485CC7
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179511; cv=none; b=kvGQDoXwusLCAu34rNwb8fc81GZwm7aBLi86zr1hcPoxbRf7E5ZbDEgCtCcCIFUhFm5bFCyxtVJzAm5CFwr9xQxAJGU+AUisCcLNQXz6wpz9Ww/a4JRrcNxTaQb5RL0Faifi+Mm2eEg0Lvvg9MS7neWonOMbMURz7OIUTk/D2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179511; c=relaxed/simple;
	bh=3r2ep7MyQ1xMq0JXiHOcKXeCFY8BVZMhGcRmFK2JpkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=te4GflEkOtdnYmR4rGxIvdfu+UQvvcRiobdpdR7JuE3sDtQGFQoYQShJ6LVfyeP3BRUmgJcMzn2RnSfSlRgFjVm168cUHQAyY3ku+9LoeNI0SRfY+cCrNoLpx0L17v9/g6JFl6GBV6VWgDdjccqEsl/8ev9rBOSHopduIsBa1PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSSAACHQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSSAACHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790179510; x=1821715510;
  h=date:from:to:cc:subject:message-id;
  bh=3r2ep7MyQ1xMq0JXiHOcKXeCFY8BVZMhGcRmFK2JpkQ=;
  b=dSSAACHQsgbJl1E2BfRXZCzq14iDzd7zM3ANJblECvDgEm2ZTRba1BJy
   zzlKf1IY57PJnEpVyw8fIy4/09vVsmrIkaT8s6b0TdekL+LfGGLLLR3zJ
   OKcACEyVgZGdxk7O6KfGdv55IuXLfD7CAUCzsmnv9oJCmw/3xeAhwDwJt
   RmBCFjWTw8DKc1a9PTM7y4CZPXdRxFwehQvCalcCkNRU37iC1tClutAcU
   4xMdNPn/raIs7OYX6FBCOmCqImlFBgVhT9C8eg9CNbkTWl29kDUXuphtt
   DlUXXPaiHOWG2lo5Od8vXUPWYJtRvJG6R35qgKbtRkdAwBwBtwYfsAHe2
   w==;
X-CSE-ConnectionGUID: UDedZRiqSPaSjaJsnLNN2g==
X-CSE-MsgGUID: Ak+BV4ChTge+bOCdJteMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90759368"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90759368"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 09:04:58 -0700
X-CSE-ConnectionGUID: gJDP9fMORS+cDiS0d7f03Q==
X-CSE-MsgGUID: CQomTzJbSfKa1DgDCKi3sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4779470"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 09:04:58 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9PSp-000000000jj-2mDF;
	Wed, 23 Sep 2026 16:04:55 +0000
Date: Wed, 23 Sep 2026 18:03:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn:
 can 'dev_data' even be NULL?
Message-ID: <202609231840.kAb2aFiZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
date:   1 year, 1 month ago
:::::: branch date: 23 hours ago
:::::: commit date: 1 year, 1 month ago
config: m68k-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231840.kAb2aFiZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35c5097f737a ("crypto: ti - Enable compile testing for dthev2")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609231840.kAb2aFiZ-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a466 T Pratham 2025-08-20  34  
52f641bc63a466 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a466 T Pratham 2025-08-20  36  {
52f641bc63a466 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a466 T Pratham 2025-08-20  38  
52f641bc63a466 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a466 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a466 T Pratham 2025-08-20  41  
52f641bc63a466 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a466 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a466 T Pratham 2025-08-20 @44  	if (dev_data)
52f641bc63a466 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
52f641bc63a466 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a466 T Pratham 2025-08-20  47  
52f641bc63a466 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a466 T Pratham 2025-08-20  49  }
52f641bc63a466 T Pratham 2025-08-20  50  

:::::: The code at line 44 was first introduced by commit
:::::: 52f641bc63a46657b1d72d902fcee30ab1233c7b crypto: ti - Add driver for DTHE V2 AES Engine (ECB, CBC)

:::::: TO: T Pratham <t-pratham@ti.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

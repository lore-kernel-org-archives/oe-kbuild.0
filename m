Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B5C8F0
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765666950; cv=none; b=bNxqCRSPSjaHeCyKOU97LG2A92Ll+BJiHGGdyQxUUvvwEb7EjZwIquPuyjC9/ftRSUoKOQR/LrB+vNPAKtVEQWtI8XTopLyNVNw4h6ooQcejL825BKIc64R9gv5s0rIM1tlx3KEO3kDa6O28qtQP9lmzYf2gW79E9D6qEe5pS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765666950; c=relaxed/simple;
	bh=1ZjV8MxS/gFSTNJCWl3zh2lw4bF+lZ/nljGmNYsXWRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bpBflgJ4RQiFIbNRNcc1YLQXYsChxZBwBY0PjJcuTfGSYyXeKOfBXJusmQkZQc8ey+DUokq100ZomS/WcM61NCMHNTnZ41VKJlkRpSRM4fh7gHfWde7N6DcfAcBx2kbAwGfORBrcyNklwEXqaqwqyoO5UkmSVUQL4zNhvJGZr4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSrrIdJu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSrrIdJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765666949; x=1797202949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZjV8MxS/gFSTNJCWl3zh2lw4bF+lZ/nljGmNYsXWRs=;
  b=hSrrIdJuy8mzwUkJ+21UlUmEKSqHOx1jYCpxoOAziVsK+QKILMjbKr74
   lU3zu19pA5tTNa5V3KSVNenf5iefJ2vciEKrAtdF0Ilym+JQ3Oo1FMnVG
   G5TngAsA8bFoycMMtC61rbzXKtvMgXFVi9RdzJXNY0zex2aYdcJJC2H7+
   JGKCIO2VuyA/RWigBFTT4CCnM19bKmLCb6fFwtXQfcmxbl5S3EUEtegjg
   H9JwOri6U97Eci3bGK4+ERPoVk6qycDoh80mCElvkcV5umkO2dEqCL0Lb
   SbXCJuD7ogwZdIFz1lbfAl6Ci9aYPA1XnfKzAnHTot8XO88GJttUz5cOq
   w==;
X-CSE-ConnectionGUID: Xl9U7HCVTN+JtPk2TnEBiA==
X-CSE-MsgGUID: onDxSqolT0WBYsCnDDcVmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67695232"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67695232"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:02:28 -0800
X-CSE-ConnectionGUID: T15C4IVZS4aRZ+H+2k8XVA==
X-CSE-MsgGUID: WH0mDZd4QGi83JjXjQHglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197450887"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 15:02:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYd6-000000008I5-1wgv;
	Sat, 13 Dec 2025 23:02:24 +0000
Date: Sun, 14 Dec 2025 07:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/clk/spacemit/ccu_pll.c:38 ccu_pll_lookup_best_rate() error:
 uninitialized symbol 'best_entry'.
Message-ID: <202512140712.70B2yNbo-lkp@intel.com>
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
TO: Haylen Chu <heylenay@4d2.org>
CC: Yixun Lan <dlan@gentoo.org>
CC: Alex Elder <elder@riscstar.com>
CC: Inochi Amaoto <inochiama@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 1b72c59db0add8e47fa116b21f78ed0b09a264f3 clk: spacemit: Add clock support for SpacemiT K1 SoC
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: nios2-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140712.70B2yNbo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140712.70B2yNbo-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu_pll.c:38 ccu_pll_lookup_best_rate() error: uninitialized symbol 'best_entry'.

vim +/best_entry +38 drivers/clk/spacemit/ccu_pll.c

1b72c59db0add8e Haylen Chu 2025-04-16  19  
1b72c59db0add8e Haylen Chu 2025-04-16  20  static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
1b72c59db0add8e Haylen Chu 2025-04-16  21  							       unsigned long rate)
1b72c59db0add8e Haylen Chu 2025-04-16  22  {
1b72c59db0add8e Haylen Chu 2025-04-16  23  	struct ccu_pll_config *config = &pll->config;
1b72c59db0add8e Haylen Chu 2025-04-16  24  	const struct ccu_pll_rate_tbl *best_entry;
1b72c59db0add8e Haylen Chu 2025-04-16  25  	unsigned long best_delta = ULONG_MAX;
1b72c59db0add8e Haylen Chu 2025-04-16  26  	int i;
1b72c59db0add8e Haylen Chu 2025-04-16  27  
1b72c59db0add8e Haylen Chu 2025-04-16  28  	for (i = 0; i < config->tbl_num; i++) {
1b72c59db0add8e Haylen Chu 2025-04-16  29  		const struct ccu_pll_rate_tbl *entry = &config->rate_tbl[i];
1b72c59db0add8e Haylen Chu 2025-04-16  30  		unsigned long delta = abs_diff(entry->rate, rate);
1b72c59db0add8e Haylen Chu 2025-04-16  31  
1b72c59db0add8e Haylen Chu 2025-04-16  32  		if (delta < best_delta) {
1b72c59db0add8e Haylen Chu 2025-04-16  33  			best_delta = delta;
1b72c59db0add8e Haylen Chu 2025-04-16  34  			best_entry = entry;
1b72c59db0add8e Haylen Chu 2025-04-16  35  		}
1b72c59db0add8e Haylen Chu 2025-04-16  36  	}
1b72c59db0add8e Haylen Chu 2025-04-16  37  
1b72c59db0add8e Haylen Chu 2025-04-16 @38  	return best_entry;
1b72c59db0add8e Haylen Chu 2025-04-16  39  }
1b72c59db0add8e Haylen Chu 2025-04-16  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

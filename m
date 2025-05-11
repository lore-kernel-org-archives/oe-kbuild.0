Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D501119A
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746930710; cv=none; b=j/T9YMjuXhqxwXNRUisoydWinoR/XFRpu8TsDpCW/X7xgr3LPnhB7YhXz3Gw3MeRBAdaFdfXLMi+GQKShy/Mczo+Iv84JU4MxYGP7Il94dueQQMyhj+pbLFEnlUrQU1j1xKh3JdghgyizvzTE4wVK9RPftsAfKyk2ynTnqaK4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746930710; c=relaxed/simple;
	bh=KalBtNt5k5tJD0Lv0Rj/Icg/r6XT0nFE1vXNnXLRPd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OTM41gv2uhEGDIGnGhmC42xDy2YnMhTJOcAq3oUyAth4kD8Q7Q2iGtG7JSwfb3/LrZQ3NVCjt8l/FqM+5K7S61ZDWGL3LfIa2En+9ecwZ/cE8FWmQ3mgR3BoP1cQvtKryNWPzZru2P6Q3LnTwA4qBypnFtM9O4LBuVB2xlylzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOOGqCQr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOOGqCQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746930708; x=1778466708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KalBtNt5k5tJD0Lv0Rj/Icg/r6XT0nFE1vXNnXLRPd8=;
  b=dOOGqCQrVnPmY2B7pPEDhR/juMpz9uy9+h2SMzVIVXBnrYk0a9dJE8l9
   xFCPgsaWQiU4xld2GI/NPmx/oawRdQ4b/W/2yhyELFeRD1Gk8EsPe17za
   sETTalv/y0GWUI1mn6itw1YGmvw56c7ig8Au05QTzpn8uk2ayAqCBXkT6
   L/5JqJN3jOh2ON0WhmeaxsSIgqBn7pCcF3EPE9MmCfN/AwTgH7fcw71N9
   fZZm7fo5h4eu9MBei22iec+UExFj4rwfdJPm7EiEHp0G2cdCo4vfryswg
   lsqkDqW+YttXOGJBWT1V3IxnShGynX0/Gn96Hn9qVOjIbyq2QjkCTi2Hg
   g==;
X-CSE-ConnectionGUID: 1qVsvKbaTSqS9u/lhkDhWg==
X-CSE-MsgGUID: wvV9HhbHSB2EIHYurDwnmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="48820122"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="48820122"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 19:31:48 -0700
X-CSE-ConnectionGUID: kf01rL92T3uifkbWoqbAcg==
X-CSE-MsgGUID: 4UnuPnyCS7iz/Cl12/bEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="142234877"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 May 2025 19:31:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDwTg-000DXf-25;
	Sun, 11 May 2025 02:31:44 +0000
Date: Sun, 11 May 2025 10:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3645/10031] drivers/clk/spacemit/ccu_pll.c:38
 ccu_pll_lookup_best_rate() error: uninitialized symbol 'best_entry'.
Message-ID: <202505111057.ejK2J56K-lkp@intel.com>
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
TO: Haylen Chu <heylenay@4d2.org>
CC: Yixun Lan <dlan@gentoo.org>
CC: Alex Elder <elder@riscstar.com>
CC: Inochi Amaoto <inochiama@outlook.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 1b72c59db0add8e47fa116b21f78ed0b09a264f3 [3645/10031] clk: spacemit: Add clock support for SpacemiT K1 SoC
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: microblaze-randconfig-r072-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111057.ejK2J56K-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505111057.ejK2J56K-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu_pll.c:38 ccu_pll_lookup_best_rate() error: uninitialized symbol 'best_entry'.

vim +/best_entry +38 drivers/clk/spacemit/ccu_pll.c

1b72c59db0add8 Haylen Chu 2025-04-16  19  
1b72c59db0add8 Haylen Chu 2025-04-16  20  static const struct ccu_pll_rate_tbl *ccu_pll_lookup_best_rate(struct ccu_pll *pll,
1b72c59db0add8 Haylen Chu 2025-04-16  21  							       unsigned long rate)
1b72c59db0add8 Haylen Chu 2025-04-16  22  {
1b72c59db0add8 Haylen Chu 2025-04-16  23  	struct ccu_pll_config *config = &pll->config;
1b72c59db0add8 Haylen Chu 2025-04-16  24  	const struct ccu_pll_rate_tbl *best_entry;
1b72c59db0add8 Haylen Chu 2025-04-16  25  	unsigned long best_delta = ULONG_MAX;
1b72c59db0add8 Haylen Chu 2025-04-16  26  	int i;
1b72c59db0add8 Haylen Chu 2025-04-16  27  
1b72c59db0add8 Haylen Chu 2025-04-16  28  	for (i = 0; i < config->tbl_num; i++) {
1b72c59db0add8 Haylen Chu 2025-04-16  29  		const struct ccu_pll_rate_tbl *entry = &config->rate_tbl[i];
1b72c59db0add8 Haylen Chu 2025-04-16  30  		unsigned long delta = abs_diff(entry->rate, rate);
1b72c59db0add8 Haylen Chu 2025-04-16  31  
1b72c59db0add8 Haylen Chu 2025-04-16  32  		if (delta < best_delta) {
1b72c59db0add8 Haylen Chu 2025-04-16  33  			best_delta = delta;
1b72c59db0add8 Haylen Chu 2025-04-16  34  			best_entry = entry;
1b72c59db0add8 Haylen Chu 2025-04-16  35  		}
1b72c59db0add8 Haylen Chu 2025-04-16  36  	}
1b72c59db0add8 Haylen Chu 2025-04-16  37  
1b72c59db0add8 Haylen Chu 2025-04-16 @38  	return best_entry;
1b72c59db0add8 Haylen Chu 2025-04-16  39  }
1b72c59db0add8 Haylen Chu 2025-04-16  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

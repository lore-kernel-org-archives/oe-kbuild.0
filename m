Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8F286D7D
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Aug 2025 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454383; cv=none; b=s3BKEmKwe+OCSYBghs0WCgdSt+Yy1z922+/l8/vKcCyooQ8O+YI1kmGuXdtutwkXNkPIC9BAEUfbV8MkAvO4RdnuvSNyiA6vdnuwCQ/22/bpX1AejQYTHkQfYJHPSby4Wcsl/p5NJ1ahHA/7MWuQ4yNzXU2iTuYSnHEqDfJ2QkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454383; c=relaxed/simple;
	bh=wpxWAGqRUNJQU/gn5W9fPM93K8TAC6mTLH7fNcA675s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gE5GyYO1+ESYRO8I3X/B4xaEzq0E7lc7A5B00e1grFNY+JD0uEBRgIsHmtoYlqQ/0CYix14bK2WuWAZKgeqGFXrMGKsFf2sO9ypQvS0w1NU+NTERn6NOSqnj7OsV3oLx+F6mED/lk+X15gqiZFLJu4461cOXzwASv8ZsPWTApAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftYFc8RX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftYFc8RX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756454381; x=1787990381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpxWAGqRUNJQU/gn5W9fPM93K8TAC6mTLH7fNcA675s=;
  b=ftYFc8RXsAgGxKsTX8OMjkEAkwddNbJES7Qaivz+cQJPDUJ8/l7QSuDU
   eo1eOn6Pvei7tJbvmItW38ycs662Z14rUaAmJSbd/N/zUOlkTL9GCrEEx
   g/f7C5KRhy5Yi6PIpEhCTC4/PkvFm1krHKJvPFOudgRb6pYYk3XNyHE/4
   u5TU0E1l0afW0gazAm/dzOd8x5XH6rKSnWorsW0Hg/JmX2lvP0GEItRUB
   jlLSrw8DuFrmIurfx+z7pzCbINyhzWe/eyEVJIbrGDJKNHHdSIBWambwB
   LZ9E7kySokKgHvDDAlZ8apel2vG5Ns50PeH97MpyFToGXcIcB3ZKQYDZF
   w==;
X-CSE-ConnectionGUID: nziX1ud+QF67xYusU/eN5A==
X-CSE-MsgGUID: Gau+89aUSz6sw5kT2j1omw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58588054"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58588054"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:59:40 -0700
X-CSE-ConnectionGUID: pebUwi1rS8+EEZ515fxGGA==
X-CSE-MsgGUID: f6irdRluRwWVUtaSCbzfjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="201236981"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Aug 2025 00:59:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uru1J-000UVz-0t;
	Fri, 29 Aug 2025 07:59:37 +0000
Date: Fri, 29 Aug 2025 15:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
Message-ID: <202508291556.kjNumYgR-lkp@intel.com>
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
In-Reply-To: <20250823154009.25992-11-jszhang@kernel.org>
References: <20250823154009.25992-11-jszhang@kernel.org>
TO: Jisheng Zhang <jszhang@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
CC: dmaengine@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on robh/for-next krzk-dt/for-next linus/master v6.17-rc3 next-20250829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-11-jszhang%40kernel.org
patch subject: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291556.kjNumYgR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508291556.kjNumYgR-lkp@intel.com/

smatch warnings:
drivers/dma/arm-dma350.c:387 d350_get_residue() error: uninitialized symbol 'sgcur'.

vim +/sgcur +387 drivers/dma/arm-dma350.c

5d099706449d54 Robin Murphy  2025-03-12  359  
5d099706449d54 Robin Murphy  2025-03-12  360  static u32 d350_get_residue(struct d350_chan *dch)
5d099706449d54 Robin Murphy  2025-03-12  361  {
eae79fde2ff50c Jisheng Zhang 2025-08-23  362  	u32 res, xsize, xsizehi, linkaddr, linkaddrhi, hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  363  	int i, sgcur, retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
eae79fde2ff50c Jisheng Zhang 2025-08-23  364  	struct d350_desc *desc = dch->desc;
5d099706449d54 Robin Murphy  2025-03-12  365  
5d099706449d54 Robin Murphy  2025-03-12  366  	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  367  	do {
5d099706449d54 Robin Murphy  2025-03-12  368  		xsizehi = hi_new;
5d099706449d54 Robin Murphy  2025-03-12  369  		xsize = readl_relaxed(dch->base + CH_XSIZE);
5d099706449d54 Robin Murphy  2025-03-12  370  		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  371  	} while (xsizehi != hi_new && --retries);
5d099706449d54 Robin Murphy  2025-03-12  372  
eae79fde2ff50c Jisheng Zhang 2025-08-23  373  	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  374  	do {
eae79fde2ff50c Jisheng Zhang 2025-08-23  375  		linkaddrhi = hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  376  		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
eae79fde2ff50c Jisheng Zhang 2025-08-23  377  		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  378  	} while (linkaddrhi != hi_new && --retries);
eae79fde2ff50c Jisheng Zhang 2025-08-23  379  
eae79fde2ff50c Jisheng Zhang 2025-08-23  380  	for (i = 0; i < desc->sglen; i++) {
eae79fde2ff50c Jisheng Zhang 2025-08-23  381  		if (desc->sg[i].phys == (((u64)linkaddrhi << 32) | (linkaddr & ~CH_LINKADDR_EN)))
eae79fde2ff50c Jisheng Zhang 2025-08-23  382  			sgcur = i;
eae79fde2ff50c Jisheng Zhang 2025-08-23  383  	}
eae79fde2ff50c Jisheng Zhang 2025-08-23  384  
5d099706449d54 Robin Murphy  2025-03-12  385  	res = FIELD_GET(CH_XY_DES, xsize);
5d099706449d54 Robin Murphy  2025-03-12  386  	res |= FIELD_GET(CH_XY_DES, xsizehi) << 16;
eae79fde2ff50c Jisheng Zhang 2025-08-23 @387  	res <<= desc->sg[sgcur].tsz;
eae79fde2ff50c Jisheng Zhang 2025-08-23  388  
eae79fde2ff50c Jisheng Zhang 2025-08-23  389  	for (i = sgcur + 1; i < desc->sglen; i++)
eae79fde2ff50c Jisheng Zhang 2025-08-23  390  		res += (((u32)desc->sg[i].xsizehi << 16 | desc->sg[i].xsize) << desc->sg[i].tsz);
5d099706449d54 Robin Murphy  2025-03-12  391  
eae79fde2ff50c Jisheng Zhang 2025-08-23  392  	return res;
5d099706449d54 Robin Murphy  2025-03-12  393  }
5d099706449d54 Robin Murphy  2025-03-12  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

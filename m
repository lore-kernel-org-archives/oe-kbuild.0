Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C581917FB
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Aug 2025 22:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754261669; cv=none; b=cUv9YVM3F80iNDtDDs6s40gnsVPMvWG/5t4xjMW2VOQeIKEhekv6l/YfIdnPLfzQhkZK78iPSheRip6mlB7/lWJNBfc6oA4C0NoGbErAml8Oklg5rLMN9Fuw/UIRceHNj4mkMx6ia0sciyit9HxRo2wPlRZnRvqk9fSqWrGnY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754261669; c=relaxed/simple;
	bh=9it4lxgFgJDMzBCztkzUVYT2rh4J+/TYTAYCAbg4PqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iOEipawJWPCpy/JFHVWbeEXDauxbnY/UvwWmxrLR7MN0wq2d4nvgErL+Qgjw2i4bPwlKqJtuDEW+pYKVxiMv6h/0Wu02C4jwshSjS628vF9nLuNb5CYLqkPRZGBnmIYpmfQQAoIsPYUIoQp73FGG2ZXszfCs2wIYmHgBIKHCv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKByJm4z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKByJm4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754261667; x=1785797667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9it4lxgFgJDMzBCztkzUVYT2rh4J+/TYTAYCAbg4PqY=;
  b=aKByJm4zYJaf46hq2rx3n28o6T2HDezNrtfoe2ROTm0Yckukljnv3cWQ
   iZ+0L+KTYfVPpMZC/IAiqV7CmNlzfgFqlEoFWrc7Me7X9j1v2uPCMRt6i
   B4iTdM1lPyJZTP9utqE1YmMg65Xo7kRShVTdTA5B8voV4vlT87M9nAJJk
   +4bH4nwp/L+OZTbxfLDuseQrzC7QpO9tsvRu8wsD/m+Lrl8TuqcS4FTMb
   bkdGVBlkVH1ujdud0/9hXkJ4Z16AgCExY81kj6vG47T/yr0ymIBuLpNUK
   WtUB4y6MElUTRbNxRlW2s2eyNTCnB43ltq1yqsNYmoL7fafNg/WfVA36p
   A==;
X-CSE-ConnectionGUID: jeh0Nbb1S/WVjepk74EmDA==
X-CSE-MsgGUID: gicym1utQUul+yT9hS2Lvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79071396"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79071396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 15:54:27 -0700
X-CSE-ConnectionGUID: ErNDOhCPR0OozW0AS4618Q==
X-CSE-MsgGUID: TC7XXJQgQ6q3nDvAMBpRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168260468"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Aug 2025 15:54:26 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihax-0006fE-2Z;
	Sun, 03 Aug 2025 22:54:23 +0000
Date: Mon, 4 Aug 2025 06:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 1/1] mm/userfaultfd.c:868:13-14:
 WARNING opportunity for swap()
Message-ID: <202508040656.TwUsZNm2-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c1a4113af4ffd59599729ba53e1fdc4b44429bc7
commit: ddc00d71198b5e0027c3b1f881ea90428ef321a4 [1/1] BACKPORT: userfaultfd: UFFDIO_MOVE uABI
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 3 months ago
config: x86_64-randconfig-101-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040656.TwUsZNm2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202508040656.TwUsZNm2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/userfaultfd.c:868:13-14: WARNING opportunity for swap()

vim +868 mm/userfaultfd.c

ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  856  
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  857  
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  858  void double_pt_lock(spinlock_t *ptl1,
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  859  		    spinlock_t *ptl2)
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  860  	__acquires(ptl1)
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  861  	__acquires(ptl2)
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  862  {
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  863  	spinlock_t *ptl_tmp;
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  864  
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  865  	if (ptl1 > ptl2) {
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  866  		/* exchange ptl1 and ptl2 */
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  867  		ptl_tmp = ptl1;
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06 @868  		ptl1 = ptl2;
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  869  		ptl2 = ptl_tmp;
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  870  	}
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  871  	/* lock in virtual address order to avoid lock inversion */
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  872  	spin_lock(ptl1);
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  873  	if (ptl1 != ptl2)
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  874  		spin_lock_nested(ptl2, SINGLE_DEPTH_NESTING);
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  875  	else
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  876  		__acquire(ptl2);
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  877  }
ddc00d71198b5e0 Andrea Arcangeli 2023-12-06  878  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

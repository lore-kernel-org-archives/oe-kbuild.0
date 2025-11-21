Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4015286413
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719485; cv=none; b=K9FLjSxeNqSHoLRj3Rpp4Y2fcQCKRWlVft9rf1d+tKy6e5sYUI57R2utwhmCUfW7owao7mVW3r9x272bx7m8TmxNJwYCcypwxM2ixW93NOuEcwe0nAxY+bh/13s1GOronQLkADDfOOv4WUYXLWQRUnun0muF38IccTLZjCjxEh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719485; c=relaxed/simple;
	bh=xwYKObBzgWe2quDPWm8cUgjEmkak6XojedaQnl9bflY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeIwdYCAh0v6O8WCyAVYXw5MvorHF9AgSZNeuukJqZDunT0AQZI5oBfn7Ocpa+xft+a9gkH84Rj7S6WAfkR451Xh51Nt5G5AUKbj8qywdaOIHZ85hV5Qhdl+bOEzKKKnUiKyDXGH/B2SDeC9vcKgIz5a5TERTNECzifL5WC33fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B15MUutP; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B15MUutP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763719483; x=1795255483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwYKObBzgWe2quDPWm8cUgjEmkak6XojedaQnl9bflY=;
  b=B15MUutP6GFW1YHJlqz9qxn98bmONbuUaNUPMyi41EWSPq7sEqBau4zL
   ud7oa5jwb/Szrz2IuVvFBspsud8fmviyryy+zr7JSFj95va2iMKoUpW+k
   RJhSLYiApAT0oiC4yeOfD4aVZ32nsvUXjwG+LMJKiwE/K+K383ZiFtbEH
   DJr8lJs6p2cAGdBRwBKYBXRhn31BoY0YjPVmM7pNlmWjdWC+Yw0Bv0jRJ
   eXUIzEMTsnVtVtoUHrGMEgLqwG2/rirLgETvZjERCvVsu9Vye0PB65llD
   5keZ3wBPJRwoM2uWtsS0mBPSNtCkq4jaEzNX5oYbedgyuM7vKo9EjCjnz
   A==;
X-CSE-ConnectionGUID: 0RDO2V+JSQyP5UJoqZxIWQ==
X-CSE-MsgGUID: uOHGQi5kS8qdMQxUAynDzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65742833"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65742833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:04:42 -0800
X-CSE-ConnectionGUID: e4gvbIcuQdCG3ZhMmQtFGw==
X-CSE-MsgGUID: arEK4iIDQwSXkDDYrU4tow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191444158"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Nov 2025 02:04:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMO0M-0005Bn-2A;
	Fri, 21 Nov 2025 10:04:38 +0000
Date: Fri, 21 Nov 2025 18:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] jfs: add dmapctl integrity check to prevent invalid
 operations
Message-ID: <202511211750.bjcw3Ucd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/jfs/jfs_dmap.c:150:13: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251120154413.1043174-1-yun.zhou@windriver.com>
References: <20251120154413.1043174-1-yun.zhou@windriver.com>
TO: Yun Zhou <yun.zhou@windriver.com>
TO: shaggy@kernel.org
CC: rand.sec96@gmail.com
CC: contact@arnaud-lcm.com
CC: kovalev@altlinux.org
CC: zheng.yu@northwestern.edu
CC: eadavis@qq.com
CC: yun.zhou@windriver.com
CC: jfs-discussion@lists.sourceforge.net
CC: linux-kernel@vger.kernel.org

Hi Yun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kleikamp-shaggy/jfs-next]
[also build test WARNING on linus/master v6.18-rc6 next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yun-Zhou/jfs-add-dmapctl-integrity-check-to-prevent-invalid-operations/20251121-001021
base:   https://github.com/kleikamp/linux-shaggy jfs-next
patch link:    https://lore.kernel.org/r/20251120154413.1043174-1-yun.zhou%40windriver.com
patch subject: [PATCH] jfs: add dmapctl integrity check to prevent invalid operations
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: nios2-randconfig-r123-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211750.bjcw3Ucd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211750.bjcw3Ucd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211750.bjcw3Ucd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/jfs/jfs_dmap.c:150:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/jfs/jfs_dmap.c:148:18: sparse: signed value source
   fs/jfs/jfs_dmap.c:157:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/jfs/jfs_dmap.c:156:20: sparse: signed value source
   fs/jfs/jfs_dmap.c:180:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/jfs/jfs_dmap.c:178:18: sparse: signed value source

vim +150 fs/jfs/jfs_dmap.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  135  
a522d42d8bdabf Yun Zhou       2025-11-20  136  /*
a522d42d8bdabf Yun Zhou       2025-11-20  137   * check_dmapctl - Validate integrity of a dmapctl structure
a522d42d8bdabf Yun Zhou       2025-11-20  138   * @dcp: Pointer to the dmapctl structure to check
a522d42d8bdabf Yun Zhou       2025-11-20  139   *
a522d42d8bdabf Yun Zhou       2025-11-20  140   * Return: true if valid, false if corrupted
a522d42d8bdabf Yun Zhou       2025-11-20  141   */
a522d42d8bdabf Yun Zhou       2025-11-20  142  static bool check_dmapctl(struct dmapctl *dcp)
a522d42d8bdabf Yun Zhou       2025-11-20  143  {
a522d42d8bdabf Yun Zhou       2025-11-20  144  	s8 budmin = dcp->budmin;
a522d42d8bdabf Yun Zhou       2025-11-20  145  	u32 nleafs, l2nleafs, leafidx, height;
a522d42d8bdabf Yun Zhou       2025-11-20  146  	int i;
a522d42d8bdabf Yun Zhou       2025-11-20  147  
a522d42d8bdabf Yun Zhou       2025-11-20  148  	nleafs = le32_to_cpu(dcp->nleafs);
a522d42d8bdabf Yun Zhou       2025-11-20  149  	/* Check basic field ranges */
a522d42d8bdabf Yun Zhou       2025-11-20 @150  	if (unlikely(nleafs > LPERCTL || nleafs < 0)) {
a522d42d8bdabf Yun Zhou       2025-11-20  151  		jfs_err("dmapctl: invalid nleafs %u (max %u)",
a522d42d8bdabf Yun Zhou       2025-11-20  152  			nleafs, LPERCTL);
a522d42d8bdabf Yun Zhou       2025-11-20  153  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  154  	}
a522d42d8bdabf Yun Zhou       2025-11-20  155  
a522d42d8bdabf Yun Zhou       2025-11-20  156  	l2nleafs = le32_to_cpu(dcp->l2nleafs);
a522d42d8bdabf Yun Zhou       2025-11-20  157  	if (unlikely(l2nleafs > L2LPERCTL || l2nleafs < 0)) {
a522d42d8bdabf Yun Zhou       2025-11-20  158  		jfs_err("dmapctl: invalid l2nleafs %u (max %u)",
a522d42d8bdabf Yun Zhou       2025-11-20  159  			l2nleafs, L2LPERCTL);
a522d42d8bdabf Yun Zhou       2025-11-20  160  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  161  	}
a522d42d8bdabf Yun Zhou       2025-11-20  162  
a522d42d8bdabf Yun Zhou       2025-11-20  163  	/* Verify nleafs matches l2nleafs (must be power of two) */
a522d42d8bdabf Yun Zhou       2025-11-20  164  	if (unlikely((1U << l2nleafs) != nleafs)) {
a522d42d8bdabf Yun Zhou       2025-11-20  165  		jfs_err("dmapctl: nleafs %u != 2^%u",
a522d42d8bdabf Yun Zhou       2025-11-20  166  			nleafs, l2nleafs);
a522d42d8bdabf Yun Zhou       2025-11-20  167  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  168  	}
a522d42d8bdabf Yun Zhou       2025-11-20  169  
a522d42d8bdabf Yun Zhou       2025-11-20  170  	leafidx = le32_to_cpu(dcp->leafidx);
a522d42d8bdabf Yun Zhou       2025-11-20  171  	/* Check leaf index matches expected position */
a522d42d8bdabf Yun Zhou       2025-11-20  172  	if (unlikely(leafidx != CTLLEAFIND)) {
a522d42d8bdabf Yun Zhou       2025-11-20  173  		jfs_err("dmapctl: invalid leafidx %u (expected %u)",
a522d42d8bdabf Yun Zhou       2025-11-20  174  			leafidx, CTLLEAFIND);
a522d42d8bdabf Yun Zhou       2025-11-20  175  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  176  	}
a522d42d8bdabf Yun Zhou       2025-11-20  177  
a522d42d8bdabf Yun Zhou       2025-11-20  178  	height = le32_to_cpu(dcp->height);
a522d42d8bdabf Yun Zhou       2025-11-20  179  	/* Check tree height is within valid range */
a522d42d8bdabf Yun Zhou       2025-11-20  180  	if (unlikely(height < 0 || height > (L2LPERCTL >> 1))) {
a522d42d8bdabf Yun Zhou       2025-11-20  181  		jfs_err("dmapctl: invalid height %u (max %u)",
a522d42d8bdabf Yun Zhou       2025-11-20  182  			height, L2LPERCTL >> 1);
a522d42d8bdabf Yun Zhou       2025-11-20  183  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  184  	}
a522d42d8bdabf Yun Zhou       2025-11-20  185  
a522d42d8bdabf Yun Zhou       2025-11-20  186  	/* Check budmin is valid (cannot be NOFREE for non-empty tree) */
a522d42d8bdabf Yun Zhou       2025-11-20  187  	if (budmin == NOFREE) {
a522d42d8bdabf Yun Zhou       2025-11-20  188  		if (unlikely(nleafs > 0)) {
a522d42d8bdabf Yun Zhou       2025-11-20  189  			jfs_err("dmapctl: budmin is NOFREE but nleafs %u",
a522d42d8bdabf Yun Zhou       2025-11-20  190  				nleafs);
a522d42d8bdabf Yun Zhou       2025-11-20  191  			return false;
a522d42d8bdabf Yun Zhou       2025-11-20  192  		}
a522d42d8bdabf Yun Zhou       2025-11-20  193  	} else if (unlikely(budmin < BUDMIN)) {
a522d42d8bdabf Yun Zhou       2025-11-20  194  		jfs_err("dmapctl: invalid budmin %d (min %d)",
a522d42d8bdabf Yun Zhou       2025-11-20  195  			budmin, BUDMIN);
a522d42d8bdabf Yun Zhou       2025-11-20  196  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  197  	}
a522d42d8bdabf Yun Zhou       2025-11-20  198  
a522d42d8bdabf Yun Zhou       2025-11-20  199  	/* Check leaf nodes fit within stree array */
a522d42d8bdabf Yun Zhou       2025-11-20  200  	if (unlikely(leafidx + nleafs > CTLTREESIZE)) {
a522d42d8bdabf Yun Zhou       2025-11-20  201  		jfs_err("dmapctl: leaf range exceeds stree size (end %u > %u)",
a522d42d8bdabf Yun Zhou       2025-11-20  202  			leafidx + nleafs, CTLTREESIZE);
a522d42d8bdabf Yun Zhou       2025-11-20  203  		return false;
a522d42d8bdabf Yun Zhou       2025-11-20  204  	}
a522d42d8bdabf Yun Zhou       2025-11-20  205  
a522d42d8bdabf Yun Zhou       2025-11-20  206  	/* Check leaf nodes have valid values */
a522d42d8bdabf Yun Zhou       2025-11-20  207  	for (i = leafidx; i < leafidx + nleafs; i++) {
a522d42d8bdabf Yun Zhou       2025-11-20  208  		s8 val = dcp->stree[i];
a522d42d8bdabf Yun Zhou       2025-11-20  209  		if (unlikely(val < NOFREE)) {
a522d42d8bdabf Yun Zhou       2025-11-20  210  			jfs_err("dmapctl: invalid leaf value %d at index %d",
a522d42d8bdabf Yun Zhou       2025-11-20  211  					val, i);
a522d42d8bdabf Yun Zhou       2025-11-20  212  			return false;
a522d42d8bdabf Yun Zhou       2025-11-20  213  		} else if (unlikely(val > 31)) {
a522d42d8bdabf Yun Zhou       2025-11-20  214  			jfs_err("dmapctl: leaf value %d too large at index %d", val, i);
a522d42d8bdabf Yun Zhou       2025-11-20  215  			return false;
a522d42d8bdabf Yun Zhou       2025-11-20  216  		}
a522d42d8bdabf Yun Zhou       2025-11-20  217  	}
a522d42d8bdabf Yun Zhou       2025-11-20  218  
a522d42d8bdabf Yun Zhou       2025-11-20  219  	return true;
a522d42d8bdabf Yun Zhou       2025-11-20  220  }
a522d42d8bdabf Yun Zhou       2025-11-20  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA6218EBD
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741353825; cv=none; b=n7pByENSkh4evtfSpj8DmFh89RkCVfpwkPGJJTjssTtV+zNlSjzHbtBgEOh/DKcmQm4tyiD5JPJUA0XGN9mXyeC7hX6h/rXMpYjptjcvEJz0I/QIhbYKwcrXY2+XbplNh3EcHOfBVnFC+4R5otjISy9hH7kSXLA9fronHT+ZEwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741353825; c=relaxed/simple;
	bh=cQU9lpzavjwHW26HbJi4eajUuDNk4nattxteY85KcSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ml8FjZGs/qrp89C2tIxkZEpIwVCP9IV317O5pBzRFkZt/Mce14Aej4igAAUzNl4HP4SOBqJCDDu6brIHGjlJHxy3P9YScyO9RB2s09eV8/VuPxEoSukSP96b1vxDPncWLw+6Uiq8m0BPtwcg318jWEw+gs/HbVl8ggdg/rbWHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bZK20HHM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bZK20HHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741353823; x=1772889823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQU9lpzavjwHW26HbJi4eajUuDNk4nattxteY85KcSY=;
  b=bZK20HHMOmqGSnR4pWrlNcc1D2y0Hmd55JD/SLbDhxeJK9tHdt/YCd7H
   0GJMDXYZ0JAX6/E8lLQMoa1oIdTJReDNGrU5Dtr4NQla5yB7JWXoHBwnJ
   0w2p8FB0Pqj98HxlB75f6QPtUAdBDOjpOWRSVeXWQ6xpOFxEBlKR2vbjr
   Z5h6/ywLiZNFZoCmzhKuJPhLYGCxr2dMI5ekvhPaW80ceo8c23GaFgMWX
   XnTRdkKCzJxguefFyqEpZfnLI1e4heZ63og75CBBPcR0IzPhIY6C7cbUc
   3wDUnOaig8rZsGiEyERNjPQwcBBObqpVuqi6Wh7noxk4dInr0la5RV/ea
   Q==;
X-CSE-ConnectionGUID: u+fktVF+QK2Xcc2cRwFZlw==
X-CSE-MsgGUID: fyjahMp4TJm1heoAVEf4VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52608761"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52608761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 05:23:41 -0800
X-CSE-ConnectionGUID: 1m73zEHQTra5+8GztUT87Q==
X-CSE-MsgGUID: GkNqqIdqRHO6MUf/nwIN0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119317842"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2025 05:23:39 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqXft-0000W3-0k;
	Fri, 07 Mar 2025 13:23:37 +0000
Date: Fri, 7 Mar 2025 21:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] xfs: remove unnecessary checks for __GFP_NOFAIL
 allocation.
Message-ID: <202503072035.d6QqiZWT-lkp@intel.com>
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
In-Reply-To: <20250228082622.2638686-2-sunjunchao2870@gmail.com>
References: <20250228082622.2638686-2-sunjunchao2870@gmail.com>
TO: Julian Sun <sunjunchao2870@gmail.com>
TO: linux-xfs@vger.kernel.org
CC: cem@kernel.org
CC: djwong@kernel.org
CC: Julian Sun <sunjunchao2870@gmail.com>

Hi Julian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julian-Sun/xfs-remove-unnecessary-checks-for-__GFP_NOFAIL-allocation/20250228-162815
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20250228082622.2638686-2-sunjunchao2870%40gmail.com
patch subject: [PATCH 1/2] xfs: remove unnecessary checks for __GFP_NOFAIL allocation.
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: sh-randconfig-r073-20250307 (https://download.01.org/0day-ci/archive/20250307/202503072035.d6QqiZWT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503072035.d6QqiZWT-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_mru_cache.c:360 xfs_mru_cache_create() warn: variable dereferenced before check 'mru' (see line 338)

Old smatch warnings:
fs/xfs/xfs_mru_cache.c:272 _xfs_mru_cache_reap() warn: can 'mru' even be NULL?

vim +/mru +360 fs/xfs/xfs_mru_cache.c

2a82b8be8a8dac David Chinner     2007-07-11  307  
2a82b8be8a8dac David Chinner     2007-07-11  308  /*
2a82b8be8a8dac David Chinner     2007-07-11  309   * To initialise a struct xfs_mru_cache pointer, call xfs_mru_cache_create()
2a82b8be8a8dac David Chinner     2007-07-11  310   * with the address of the pointer, a lifetime value in milliseconds, a group
2a82b8be8a8dac David Chinner     2007-07-11  311   * count and a free function to use when deleting elements.  This function
2a82b8be8a8dac David Chinner     2007-07-11  312   * returns 0 if the initialisation was successful.
2a82b8be8a8dac David Chinner     2007-07-11  313   */
2a82b8be8a8dac David Chinner     2007-07-11  314  int
2a82b8be8a8dac David Chinner     2007-07-11  315  xfs_mru_cache_create(
22328d712dd7fd Christoph Hellwig 2014-04-23  316  	struct xfs_mru_cache	**mrup,
7fcd3efa1e9ebe Christoph Hellwig 2018-04-09  317  	void			*data,
2a82b8be8a8dac David Chinner     2007-07-11  318  	unsigned int		lifetime_ms,
2a82b8be8a8dac David Chinner     2007-07-11  319  	unsigned int		grp_count,
2a82b8be8a8dac David Chinner     2007-07-11  320  	xfs_mru_cache_free_func_t free_func)
2a82b8be8a8dac David Chinner     2007-07-11  321  {
22328d712dd7fd Christoph Hellwig 2014-04-23  322  	struct xfs_mru_cache	*mru = NULL;
2a82b8be8a8dac David Chinner     2007-07-11  323  	int			err = 0, grp;
2a82b8be8a8dac David Chinner     2007-07-11  324  	unsigned int		grp_time;
2a82b8be8a8dac David Chinner     2007-07-11  325  
2a82b8be8a8dac David Chinner     2007-07-11  326  	if (mrup)
2a82b8be8a8dac David Chinner     2007-07-11  327  		*mrup = NULL;
2a82b8be8a8dac David Chinner     2007-07-11  328  
2a82b8be8a8dac David Chinner     2007-07-11  329  	if (!mrup || !grp_count || !lifetime_ms || !free_func)
2451337dd04390 Dave Chinner      2014-06-25  330  		return -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  331  
2a82b8be8a8dac David Chinner     2007-07-11  332  	if (!(grp_time = msecs_to_jiffies(lifetime_ms) / grp_count))
2451337dd04390 Dave Chinner      2014-06-25  333  		return -EINVAL;
2a82b8be8a8dac David Chinner     2007-07-11  334  
10634530f7ba94 Dave Chinner      2024-01-16  335  	mru = kzalloc(sizeof(*mru), GFP_KERNEL | __GFP_NOFAIL);
2a82b8be8a8dac David Chinner     2007-07-11  336  
2a82b8be8a8dac David Chinner     2007-07-11  337  	/* An extra list is needed to avoid reaping up to a grp_time early. */
2a82b8be8a8dac David Chinner     2007-07-11 @338  	mru->grp_count = grp_count + 1;
10634530f7ba94 Dave Chinner      2024-01-16  339  	mru->lists = kzalloc(mru->grp_count * sizeof(*mru->lists),
10634530f7ba94 Dave Chinner      2024-01-16  340  				GFP_KERNEL | __GFP_NOFAIL);
2a82b8be8a8dac David Chinner     2007-07-11  341  
2a82b8be8a8dac David Chinner     2007-07-11  342  	for (grp = 0; grp < mru->grp_count; grp++)
2a82b8be8a8dac David Chinner     2007-07-11  343  		INIT_LIST_HEAD(mru->lists + grp);
2a82b8be8a8dac David Chinner     2007-07-11  344  
2a82b8be8a8dac David Chinner     2007-07-11  345  	/*
2a82b8be8a8dac David Chinner     2007-07-11  346  	 * We use GFP_KERNEL radix tree preload and do inserts under a
2a82b8be8a8dac David Chinner     2007-07-11  347  	 * spinlock so GFP_ATOMIC is appropriate for the radix tree itself.
2a82b8be8a8dac David Chinner     2007-07-11  348  	 */
2a82b8be8a8dac David Chinner     2007-07-11  349  	INIT_RADIX_TREE(&mru->store, GFP_ATOMIC);
2a82b8be8a8dac David Chinner     2007-07-11  350  	INIT_LIST_HEAD(&mru->reap_list);
007c61c68640ea Eric Sandeen      2007-10-11  351  	spin_lock_init(&mru->lock);
2a82b8be8a8dac David Chinner     2007-07-11  352  	INIT_DELAYED_WORK(&mru->work, _xfs_mru_cache_reap);
2a82b8be8a8dac David Chinner     2007-07-11  353  
2a82b8be8a8dac David Chinner     2007-07-11  354  	mru->grp_time  = grp_time;
2a82b8be8a8dac David Chinner     2007-07-11  355  	mru->free_func = free_func;
7fcd3efa1e9ebe Christoph Hellwig 2018-04-09  356  	mru->data = data;
2a82b8be8a8dac David Chinner     2007-07-11  357  	*mrup = mru;
2a82b8be8a8dac David Chinner     2007-07-11  358  
2a82b8be8a8dac David Chinner     2007-07-11  359  exit:
2a82b8be8a8dac David Chinner     2007-07-11 @360  	if (err && mru && mru->lists)
d4c75a1b40cd03 Dave Chinner      2024-01-16  361  		kfree(mru->lists);
2a82b8be8a8dac David Chinner     2007-07-11  362  	if (err && mru)
d4c75a1b40cd03 Dave Chinner      2024-01-16  363  		kfree(mru);
2a82b8be8a8dac David Chinner     2007-07-11  364  
2a82b8be8a8dac David Chinner     2007-07-11  365  	return err;
2a82b8be8a8dac David Chinner     2007-07-11  366  }
2a82b8be8a8dac David Chinner     2007-07-11  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

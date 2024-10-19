Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52050137E
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729366439; cv=none; b=Sw0U4ExWdmnqkNWZ/efI773WLKR8G2IT2D3wvwaLyxzfsOsjIa217E/aNxlQtkaCwVIe8H57wvmDUYd6hBPbPsVn0NBs7oUsAjKrjaark5b7wq1Zc6OiroP7w+r59j9AZ/FMNn1sTpLBbenY5rVIh3vIWki5OeyynlDdT2AGBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729366439; c=relaxed/simple;
	bh=z5L2Kz1+8R6O+TuG3sH5ZYGshyVl20wQTVyqgTPKg6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syq/Ph1f+BD2AteTZ5b6YDva3mjT+Wfg0IDfdDgz12+lPtZIpLATvkMJ4Tx0OJVERJyJQH8uAAXy/44vfi1UNI7W3E3BvxQlW/yztimdcK3MHTa6Kh1MlXUAPll3x/ew4M/6h7mfeZfj6SBp40ELmR5H/NOaucIp7Fkzj+9/gIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkke6q8K; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkke6q8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729366437; x=1760902437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z5L2Kz1+8R6O+TuG3sH5ZYGshyVl20wQTVyqgTPKg6k=;
  b=kkke6q8KZql99t+V2kXtji0vDTYt9PIgbGnQtZrPEyUK5BYYDfwCrU9M
   eilqgU07o59ktl67DF3hJa9xlMxG1gyRWpZxoV2rVT60h/WWcukWUcnxB
   /I/BF1aufgxxcKfD6W/ed2gEvgIcTPt6nwVcgcoz8gN+5wK/yrIYKpG2V
   JIXgMbVU50p7cHsuquzgU2lZCkZoFvXgaNHAeqmK57t0W879gj+SE7eYG
   Y1aaQQ4lcEMUfSmczKRJ2zryVlqdAKaScDFMOF/DMTPQNK5m0phkyfdKe
   mU/hjZd6j9o9tJ8turn6DzDD0DrL4bSzlN5l64R5YTmUqS3/ZaOhtTYEw
   Q==;
X-CSE-ConnectionGUID: 7GuVBxrNQsKenpm0LyS/hQ==
X-CSE-MsgGUID: z5AZFNDySVOv41pKdF1fHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28307321"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="28307321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 12:33:56 -0700
X-CSE-ConnectionGUID: bBrYbgneTkWEKAjSB5Hu6g==
X-CSE-MsgGUID: HqgSixsSQImxwgkdOjqZdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83722351"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2024 12:33:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2FCz-000PTm-1G;
	Sat, 19 Oct 2024 19:33:53 +0000
Date: Sun, 20 Oct 2024 03:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_iter.c:2834 __bch2_trans_kmalloc() warn:
 inconsistent returns 'trans'.
Message-ID: <202410200334.rvg7vR93-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9197b73fd7bb263084a95d1c578b7ee0ad54dfb3
commit: 78367aaa5af322b64d44a3a3354f4c75c499fef0 bcachefs: bch2_trans_kmalloc no longer allocates memory with btree locks held
date:   12 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20241015 (https://download.01.org/0day-ci/archive/20241020/202410200334.rvg7vR93-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410200334.rvg7vR93-lkp@intel.com/

New smatch warnings:
fs/bcachefs/btree_iter.c:2834 __bch2_trans_kmalloc() warn: inconsistent returns 'trans'.

Old smatch warnings:
fs/bcachefs/btree_iter.c:2767 bch2_trans_node_iter_init() warn: inconsistent indenting

vim +/trans +2834 fs/bcachefs/btree_iter.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  2787  
14d8f26ad09d05 Kent Overstreet 2022-09-26  2788  void *__bch2_trans_kmalloc(struct btree_trans *trans, size_t size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2789  {
616928c30f5947 Kent Overstreet 2022-08-22  2790  	unsigned new_top = trans->mem_top + size;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2791  	size_t old_bytes = trans->mem_bytes;
73a117d2d8a0d9 Kent Overstreet 2021-04-15  2792  	size_t new_bytes = roundup_pow_of_two(new_top);
78367aaa5af322 Kent Overstreet 2023-05-28  2793  	int ret;
e131b6aa0a316f Kent Overstreet 2021-04-24  2794  	void *new_mem;
14d8f26ad09d05 Kent Overstreet 2022-09-26  2795  	void *p;
14d8f26ad09d05 Kent Overstreet 2022-09-26  2796  
14d8f26ad09d05 Kent Overstreet 2022-09-26  2797  	trans->mem_max = max(trans->mem_max, new_top);
e131b6aa0a316f Kent Overstreet 2021-04-24  2798  
e131b6aa0a316f Kent Overstreet 2021-04-24  2799  	WARN_ON_ONCE(new_bytes > BTREE_TRANS_MEM_MAX);
e131b6aa0a316f Kent Overstreet 2021-04-24  2800  
78367aaa5af322 Kent Overstreet 2023-05-28  2801  	new_mem = krealloc(trans->mem, new_bytes, GFP_NOWAIT|__GFP_NOWARN);
78367aaa5af322 Kent Overstreet 2023-05-28  2802  	if (unlikely(!new_mem)) {
78367aaa5af322 Kent Overstreet 2023-05-28  2803  		bch2_trans_unlock(trans);
78367aaa5af322 Kent Overstreet 2023-05-28  2804  
78367aaa5af322 Kent Overstreet 2023-05-28  2805  		new_mem = krealloc(trans->mem, new_bytes, GFP_KERNEL);
e131b6aa0a316f Kent Overstreet 2021-04-24  2806  		if (!new_mem && new_bytes <= BTREE_TRANS_MEM_MAX) {
e131b6aa0a316f Kent Overstreet 2021-04-24  2807  			new_mem = mempool_alloc(&trans->c->btree_trans_mem_pool, GFP_KERNEL);
e131b6aa0a316f Kent Overstreet 2021-04-24  2808  			new_bytes = BTREE_TRANS_MEM_MAX;
e131b6aa0a316f Kent Overstreet 2021-04-24  2809  			kfree(trans->mem);
e131b6aa0a316f Kent Overstreet 2021-04-24  2810  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2811  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2812  		if (!new_mem)
65d48e35250fe4 Kent Overstreet 2023-03-14  2813  			return ERR_PTR(-BCH_ERR_ENOMEM_trans_kmalloc);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2814  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2815  		trans->mem = new_mem;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2816  		trans->mem_bytes = new_bytes;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2817  
78367aaa5af322 Kent Overstreet 2023-05-28  2818  		ret = bch2_trans_relock(trans);
78367aaa5af322 Kent Overstreet 2023-05-28  2819  		if (ret)
78367aaa5af322 Kent Overstreet 2023-05-28  2820  			return ERR_PTR(ret);
78367aaa5af322 Kent Overstreet 2023-05-28  2821  	}
78367aaa5af322 Kent Overstreet 2023-05-28  2822  
78367aaa5af322 Kent Overstreet 2023-05-28  2823  	trans->mem = new_mem;
78367aaa5af322 Kent Overstreet 2023-05-28  2824  	trans->mem_bytes = new_bytes;
78367aaa5af322 Kent Overstreet 2023-05-28  2825  
1c7a0adf311209 Kent Overstreet 2018-07-12  2826  	if (old_bytes) {
674cfc26240b78 Kent Overstreet 2022-08-27  2827  		trace_and_count(trans->c, trans_restart_mem_realloced, trans, _RET_IP_, new_bytes);
549d173c1bd9b5 Kent Overstreet 2022-07-17  2828  		return ERR_PTR(btree_trans_restart(trans, BCH_ERR_transaction_restart_mem_realloced));
20bceecb3159bb Kent Overstreet 2019-05-15  2829  	}
20bceecb3159bb Kent Overstreet 2019-05-15  2830  
20bceecb3159bb Kent Overstreet 2019-05-15  2831  	p = trans->mem + trans->mem_top;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2832  	trans->mem_top += size;
7ed158f2949a3c Kent Overstreet 2021-06-07  2833  	memset(p, 0, size);
20bceecb3159bb Kent Overstreet 2019-05-15 @2834  	return p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2835  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  2836  

:::::: The code at line 2834 was first introduced by commit
:::::: 20bceecb3159bbe06a26fc6747457d9de02ec227 bcachefs: More work to avoid transaction restarts

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C6171E70
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201196; cv=none; b=OWpXcgz4LuI2KvB1us0Y5wRdNKaO2nOZWnT9HECh5EVYkaU+yUIk6aC25X68XNCCB72wjKLm0RnB8lBqrbMaQrwiC4+kuMy6JSzQ0uxChO/Zr1mpQLHNey86NqW1QUG57mwu7GQ0rM3OYRsqr+bdQehWMU+9wQHdk/26jOsoV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201196; c=relaxed/simple;
	bh=3PdBzjPM3o/BQf+8b267DAEhovoi/bV0Ij7tLd+07wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dUJSD1xMSyL5Wu855xCtyaAKdXDmia2/h9oy5Lw7w1MFwKY7gb7z9sk57kQJDx4U/0S5629Mwzg/zPIaqxisH61fs/ELlmtwcEQA6ngVU3WU2XhJOxa3E+V8TEn235zUA4rsU49uQ4sgSsZOTNkQymtmt8AWYlRfv/E7uFhc4Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1+tCnn5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1+tCnn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718201195; x=1749737195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PdBzjPM3o/BQf+8b267DAEhovoi/bV0Ij7tLd+07wI=;
  b=W1+tCnn5nJs0TCEsIHFcoES0ENGHNjCZL3FB8GEntrDnS+xXRQ5lK+Br
   JiSPaRKoeKJeHGFFz0+zOXAqJuK9YJZc6s77O12Lo0xyXX+GOqsp+QsJ+
   I11/AszhWDaz7/oMRdMeax/lyyGEOUmS2AaK2IF4E9JdfBQYHH0sz8ok4
   l5GTNRuJamJuxohezBkYfTmMdQiyx2wSv73WDT3h0xxY1LXWoEhVxY1io
   JGpYYolHqhJJyXnPYjHgQ6W+hnO6l/3UdGz0aJ/hqYTqOnhxHHsra694r
   +KY9R0nv74wGz+MVFdxQ1l2Oe0/COrtYh2E2YMWoqbSdQ8e56iRxRHciW
   w==;
X-CSE-ConnectionGUID: lrOaMaJlTwOPtkhGguERSw==
X-CSE-MsgGUID: sIGQzC2LSi2uo/pFv0+KNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14927121"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14927121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:05:55 -0700
X-CSE-ConnectionGUID: hzXhQs4jTVOCFAotMfXGSA==
X-CSE-MsgGUID: Zsods8g1TQCVNem6xXwQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40429644"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2024 07:05:53 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHObm-0001b4-1C;
	Wed, 12 Jun 2024 14:05:50 +0000
Date: Wed, 12 Jun 2024 22:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:slub-reservations 6/12] mm/slub.c:5551
 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns
 '&s->reserve_lock'.
Message-ID: <202406122208.joPiUJJy-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-reservations
head:   f5877f7833fc9f8a236be339ae5bbcccdde7c850
commit: 17f60c99bf92fbf1ed52e1c492f46cec91d14cd5 [6/12] mm, slub: implement per-cache reserves
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122208.joPiUJJy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406122208.joPiUJJy-lkp@intel.com/

smatch warnings:
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns '&s->reserve_lock'.
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns 'flags'.

vim +5551 mm/slub.c

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5512  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5513  void *kmem_cache_reserve_only_alloc_noprof(struct kmem_cache_reserve *reserve,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5514  					   gfp_t gfp)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5515  {
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5516  	struct kmem_cache *s = reserve->cache;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5517  	unsigned long flags;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5518  	void *obj = NULL;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5519  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5520  	spin_lock_irqsave(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5521  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5522  	if (!reserve->size && !s->reserve_surplus)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5523  		goto empty_reserve;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5524  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5525  	/*
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5526  	 * Should not happen, the kmem_cache reserve_size should be sum of all
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5527  	 * active struct kmem_cache_reserve's size and the shared surplus
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5528  	 */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5529  	if (WARN_ON_ONCE(!s->reserve_size))
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5530  		goto empty_reserve;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5531  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5532  	obj = s->reserve_freelist;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5533  	s->reserve_freelist = get_freepointer(s, obj);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5534  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5535  	s->reserve_size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5536  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5537  	if (s->size)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5538  		reserve->size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5539  	else
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5540  		s->reserve_surplus--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5541  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5542  	spin_unlock_irqrestore(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5543  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5544  	slab_post_alloc_hook(s, NULL, gfp, 1, &obj,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5545  		slab_want_init_on_alloc(gfp, s), s->object_size);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5546  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5547  	/* paired with smp_rmb() in kmem_cache_reserve_free() */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5548  	smp_wmb();
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5549  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5550  empty_reserve:
17f60c99bf92fbf Vlastimil Babka 2024-05-31 @5551  	return obj;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

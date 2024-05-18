Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ABA1EB45
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 18:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716057753; cv=none; b=bp/56VLzidp5jUpL9hFI7Q68adoaMadI0DrUf7GhipKuiANgGglN7nCLxb3RDz3yECrKEzvimUsV/1db3Ppk023zXQjpeAn6qV3zXhl7Pvp8aOVLk2dUluX5UEQJ/rMzGK8Z6zw6WZAQfmPwCuzFtkdelHktlgcBOBT6VNpm7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716057753; c=relaxed/simple;
	bh=kGleynOiUz1y3YipKX5yKa7s3bryk7b117Yd+bq8+V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JO6AXUaQ9NIL0L2yCBQilWpVQT3FT8dsl2BgMexu4etozydOs28xaSEAXmIPT414m29PT2fD08Sx7vfLbNXqFLXrfCHzqpiWmICD6rk1zJKkoUj+BE9iCAZJG9QopNq2zF0p40oHvLb8n2h674pZaFe43VZIbszJc5024qi4f4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfXOScNq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfXOScNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716057751; x=1747593751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kGleynOiUz1y3YipKX5yKa7s3bryk7b117Yd+bq8+V4=;
  b=mfXOScNqmN/CU/s0Fv2QAvuyiwBas/NFZmdK7Vg4qbyXnGqXlpWB96Ps
   q3UFQpYyyQZGN2qXaBZn78TgM39A+STxpt2meMHAylWYHxhAnbYKYr1Ov
   VcoedA/RDyVNnqyAs2iAmNQYm6ArgFQ3iISbcumSaBZRy8xK3DP35pwx1
   JjVqP5lpxNdAGykLh9N19l7LDiaPSvfGFpAVGk4KcFj6nN+/GVhT/tjRF
   M00OUIx/Tke0lzmyJWTbg8Y0UDiFiyUg1Klx3xm/Q4QtVvKHt6p6zARME
   dg6/vf7Ih1PNcznk5luXUcn+gcAvvNHICV6+flqjKRrUijbuJ84+H3BVd
   A==;
X-CSE-ConnectionGUID: /uHFELfsRPuTo1B3f/MgDQ==
X-CSE-MsgGUID: 7KkZwtV2Q4O0oCTTSB3oqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="16057982"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="16057982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 11:42:31 -0700
X-CSE-ConnectionGUID: cfK2EfDGSguWLizaQ93ycA==
X-CSE-MsgGUID: Roa5HKfsToWUIe3sRg5SZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="55337636"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 11:42:29 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8P0k-0002XM-38;
	Sat, 18 May 2024 18:42:26 +0000
Date: Sun, 19 May 2024 02:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:page_frag_cache_v5 14/14] mm/page_frag_cache.c:291
 __page_frag_alloc_va_align() error: uninitialized symbol 'remaining'.
Message-ID: <202405190246.CAWMWHpE-lkp@intel.com>
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
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v5
head:   e6543161a8d13e28e244803a755a007021b9dea7
commit: e6543161a8d13e28e244803a755a007021b9dea7 [14/14] add alloc_pg api and refactor alloc_va api
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240519/202405190246.CAWMWHpE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405190246.CAWMWHpE-lkp@intel.com/

smatch warnings:
mm/page_frag_cache.c:291 __page_frag_alloc_va_align() error: uninitialized symbol 'remaining'.

vim +/remaining +291 mm/page_frag_cache.c

8b045aa063651c Yunsheng Lin 2024-05-15  269  
616ae9b1b510e1 Yunsheng Lin 2024-05-15  270  /**
616ae9b1b510e1 Yunsheng Lin 2024-05-15  271   * __page_frag_alloc_va_align() - Alloc a page fragment with aligning
616ae9b1b510e1 Yunsheng Lin 2024-05-15  272   * requirement.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  273   * @nc: page_frag cache from which to allocate
616ae9b1b510e1 Yunsheng Lin 2024-05-15  274   * @fragsz: the requested fragment size
616ae9b1b510e1 Yunsheng Lin 2024-05-15  275   * @gfp_mask: the allocation gfp to use when cache need to be refilled
616ae9b1b510e1 Yunsheng Lin 2024-05-15  276   * @align_mask: the requested aligning requirement for the 'va'
616ae9b1b510e1 Yunsheng Lin 2024-05-15  277   *
616ae9b1b510e1 Yunsheng Lin 2024-05-15  278   * Get a page fragment from page_frag cache with aligning requirement.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  279   *
616ae9b1b510e1 Yunsheng Lin 2024-05-15  280   * Return:
616ae9b1b510e1 Yunsheng Lin 2024-05-15  281   * Return va of the page fragment, otherwise return NULL.
616ae9b1b510e1 Yunsheng Lin 2024-05-15  282   */
3ba205fc955f3f Yunsheng Lin 2024-05-15  283  void *__page_frag_alloc_va_align(struct page_frag_cache *nc,
8b045aa063651c Yunsheng Lin 2024-05-15  284  				 unsigned int fragsz, gfp_t gfp_mask,
8b045aa063651c Yunsheng Lin 2024-05-15  285  				 unsigned int align_mask)
8b045aa063651c Yunsheng Lin 2024-05-15  286  {
96b2e1c760d339 Yunsheng Lin 2024-05-15  287  	struct encoded_va *encoded_va;
96b2e1c760d339 Yunsheng Lin 2024-05-15  288  	unsigned int remaining;
8b045aa063651c Yunsheng Lin 2024-05-15  289  	struct page *page;
8b045aa063651c Yunsheng Lin 2024-05-15  290  
e6543161a8d13e Yunsheng Lin 2024-05-18 @291  	if (unlikely(fragsz > remaining)) {
96b2e1c760d339 Yunsheng Lin 2024-05-15  292  		/* fragsz is not supposed to be bigger than PAGE_SIZE as we are
96b2e1c760d339 Yunsheng Lin 2024-05-15  293  		 * allowing order 3 page allocation to fail easily under low
96b2e1c760d339 Yunsheng Lin 2024-05-15  294  		 * memory condition.
96b2e1c760d339 Yunsheng Lin 2024-05-15  295  		 */
e6543161a8d13e Yunsheng Lin 2024-05-18  296  		if (WARN_ON_ONCE(fragsz > PAGE_SIZE) ||
e6543161a8d13e Yunsheng Lin 2024-05-18  297  		    unlikely(!page_frag_cache_refill(nc, gfp_mask)))
96b2e1c760d339 Yunsheng Lin 2024-05-15  298  			return NULL;
8b045aa063651c Yunsheng Lin 2024-05-15  299  	}
8b045aa063651c Yunsheng Lin 2024-05-15  300  
e6543161a8d13e Yunsheng Lin 2024-05-18  301  	encoded_va = nc->encoded_va;
96b2e1c760d339 Yunsheng Lin 2024-05-15  302  	remaining = nc->remaining & align_mask;
96b2e1c760d339 Yunsheng Lin 2024-05-15  303  	nc->remaining = remaining - fragsz;
8b045aa063651c Yunsheng Lin 2024-05-15  304  	nc->pagecnt_bias--;
8b045aa063651c Yunsheng Lin 2024-05-15  305  
96b2e1c760d339 Yunsheng Lin 2024-05-15  306  	return encoded_page_address(encoded_va) +
96b2e1c760d339 Yunsheng Lin 2024-05-15  307  		__page_frag_cache_page_offset(encoded_va, remaining);
8b045aa063651c Yunsheng Lin 2024-05-15  308  }
3ba205fc955f3f Yunsheng Lin 2024-05-15  309  EXPORT_SYMBOL(__page_frag_alloc_va_align);
8b045aa063651c Yunsheng Lin 2024-05-15  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

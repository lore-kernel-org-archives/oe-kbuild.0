Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB82C4C98
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 01:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766625748; cv=none; b=eSAGqAgNpqWxfwoRRW74wAWm5fLL0luN0bB12aq3iyaFxUgZW3la4c3RuP20rtw7NdydJegec1FUOcWpxnH/qpLZMaEL8x6hiKn6GxQ7+3+sauGzo/0PQXWxl1463W24QcxEr+xMJ9OSJ884vF0vbMDlR/SWHwffnbJvUJDRwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766625748; c=relaxed/simple;
	bh=o8fzpMXXuaN1GLeDRzDV2Gn3YEEN0F98M39nTbnsQwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bbdjyH19yf5VHgyEZQSbD5KK+a1k35AGXfILOxEZsexfqghPh/sPMoo5ZPOZ1UfOCawqi6h1N6MqEvmLibD1hh1WuoslPWZ51y3O0hCzVeJNy0RPqwOl7U1vdFc8G9s9ne4Mkl4cSeQ0dQBjvq5hcuDbOifHSf0mwn4TZVv8hig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBFHy34m; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBFHy34m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766625747; x=1798161747;
  h=date:from:to:cc:subject:message-id;
  bh=o8fzpMXXuaN1GLeDRzDV2Gn3YEEN0F98M39nTbnsQwA=;
  b=KBFHy34mGFNFAKspPvxhLtND7ACoT6afheteOXRzM25oQdk775RWCsBX
   qademI+os09ETyoTvgyccl63XnDE1JRmAW8dKHn8mU9/sK3eTt9eaI3EH
   83ovIBgOcjGdGTo539OiTQLhSl6Z/AL5ihruyC4PY8FNfxYeum147S/dM
   gHTxZwHbXhrIOLppDIjJccgESs8T7R4Awh2u7X9YQNDbBhchHw4mlly3+
   ElmKjAStfjjV0hD8XXDBeJSQhe1UhTsecjcyAch+/ualHDg1OgFjihRH4
   jfasOk9edFmLU6I+TkS+mMlOHoJcBB3ZofKHjMJ3nZDfXZlxTmi9FaznT
   w==;
X-CSE-ConnectionGUID: yhHNQqlzTMq1sJe/i5NxVg==
X-CSE-MsgGUID: 3bwoYx03ST6NEE0eKudFPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79809918"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="79809918"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 17:22:26 -0800
X-CSE-ConnectionGUID: pKJE8Mp3S9Sc5SfA/DoM6Q==
X-CSE-MsgGUID: TE2mGY5JQE+5N336+YcW1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="237517748"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 17:22:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYa3a-000000003bV-30lV;
	Thu, 25 Dec 2025 01:22:22 +0000
Date: Thu, 25 Dec 2025 09:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 50/50]
 drivers/dma-buf/heaps/page_pool.c:116 dmabuf_page_pool_create() warn: use
 'gfp_mask' here instead of GFP_KERNEL?
Message-ID: <202512250941.CjEyjwGi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1937a62dd1dad3155e2ec8c130f263e8f74ddf32
commit: 70ad75e771d15cdf21f43548ee47bb38b4c2f564 [50/50] ANDROID: dma-heap: Make the page-pool library built-in
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 9 months ago
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251225/202512250941.CjEyjwGi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512250941.CjEyjwGi-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/page_pool.c:116 dmabuf_page_pool_create() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +116 drivers/dma-buf/heaps/page_pool.c

d3b59a75e86384 John Stultz 2020-10-02  113  
d3b59a75e86384 John Stultz 2020-10-02  114  struct dmabuf_page_pool *dmabuf_page_pool_create(gfp_t gfp_mask, unsigned int order)
d3b59a75e86384 John Stultz 2020-10-02  115  {
d3b59a75e86384 John Stultz 2020-10-02 @116  	struct dmabuf_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
d3b59a75e86384 John Stultz 2020-10-02  117  	int i;
d3b59a75e86384 John Stultz 2020-10-02  118  
d3b59a75e86384 John Stultz 2020-10-02  119  	if (!pool)
d3b59a75e86384 John Stultz 2020-10-02  120  		return NULL;
d3b59a75e86384 John Stultz 2020-10-02  121  
d3b59a75e86384 John Stultz 2020-10-02  122  	for (i = 0; i < POOL_TYPE_SIZE; i++) {
d3b59a75e86384 John Stultz 2020-10-02  123  		pool->count[i] = 0;
d3b59a75e86384 John Stultz 2020-10-02  124  		INIT_LIST_HEAD(&pool->items[i]);
d3b59a75e86384 John Stultz 2020-10-02  125  	}
d3b59a75e86384 John Stultz 2020-10-02  126  	pool->gfp_mask = gfp_mask | __GFP_COMP;
d3b59a75e86384 John Stultz 2020-10-02  127  	pool->order = order;
d3b59a75e86384 John Stultz 2020-10-02  128  	mutex_init(&pool->mutex);
d3b59a75e86384 John Stultz 2020-10-02  129  
d3b59a75e86384 John Stultz 2020-10-02  130  	mutex_lock(&pool_list_lock);
d3b59a75e86384 John Stultz 2020-10-02  131  	list_add(&pool->list, &pool_list);
d3b59a75e86384 John Stultz 2020-10-02  132  	mutex_unlock(&pool_list_lock);
d3b59a75e86384 John Stultz 2020-10-02  133  
d3b59a75e86384 John Stultz 2020-10-02  134  	return pool;
d3b59a75e86384 John Stultz 2020-10-02  135  }
d3b59a75e86384 John Stultz 2020-10-02  136  EXPORT_SYMBOL_GPL(dmabuf_page_pool_create);
d3b59a75e86384 John Stultz 2020-10-02  137  

:::::: The code at line 116 was first introduced by commit
:::::: d3b59a75e86384b6d5302159fa89446ead81e71e ANDROID: dma-buf: heaps: Add a shrinker controlled page pool

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

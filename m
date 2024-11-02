Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC9EA29
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 05:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730523743; cv=none; b=e4Pq3sT0DqSm2CHfvk8XLkYhrjSFR1JfYDTcUfky60VcHRudnmj7Jr/sKfKZU9BGVvSJBOghuReysoctb1NeljmEU7FUoXr5rHmIByPRp8/elyQTJui94nPm7ksBYmYNEFQOqyYUQOV3/Q8f8WSsM6z2fIFypQmNNMlFcwNAKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730523743; c=relaxed/simple;
	bh=09cuST9Glgg8e01ebIyJ2QggwqiyDu42UWYUjWLF84c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhSAIaIsTv1kM7A3fD9A+u7Do0Hw8sGa31+y9Tn1oKPb7X43Ax64lsTndc56bIsnY7nRuzibZHn161XrXbcj5ijA4qH8bjy+JIZx/CKjBv70bMxQYWyWNOFfHtoPmJHDH/4kBzX8FliWueM6qRqz9453Ps9VBf4ZSF3yxwWZgN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5My157u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5My157u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730523741; x=1762059741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09cuST9Glgg8e01ebIyJ2QggwqiyDu42UWYUjWLF84c=;
  b=d5My157u6pEsGmImiDgBT1Gz4BZASxlYtbZjF41SOMt1wJwaaOj5XPbk
   +WLVOHydRF+75f4VOAjE1AUzX6j8LcK5A672zas2OLKCmP9M+UoXUhFag
   zZYIxzUHsZwzp8jgaHu51bzO3Q87Hsw2DhqXN8hcQkzWc/T1U59Kk1fY2
   +ZkFoAo52Hn+jlxNeHTOL7kKSUuRen/H8HSh3cgl4Kek+aCNUC3uXvEvx
   z8sS9BT+ceRq4lViNj06rw1zoo/Ix1D5Tvj7Nf0w5EQRlWHVyPjh1prQD
   GaY0FZpeaVtIvSCDxZJjXLaLw+bjjOC4+JJnlncy0TrgXWtU724liCwOm
   Q==;
X-CSE-ConnectionGUID: BWR98FzwS4GY4/l7rTZwmw==
X-CSE-MsgGUID: 9Qtb62C7TrmglJMyInM8TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="55684081"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="55684081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 22:02:17 -0700
X-CSE-ConnectionGUID: dIVp+4vmRYWEuuEV4VzdFg==
X-CSE-MsgGUID: Z8Zj2YUYQ36j0aCkH+0QqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="82680852"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Nov 2024 22:02:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t76H8-000iRP-02;
	Sat, 02 Nov 2024 05:02:14 +0000
Date: Sat, 2 Nov 2024 13:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-kiwi-5.4 387/387]
 drivers/staging/android/ion/heaps/ion_page_pool.c:136 ion_page_pool_create()
 warn: use 'gfp_mask' here instead of GFP_KERNEL?
Message-ID: <202411021240.cjx5vtwX-lkp@intel.com>
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

Hi Sandeep,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: f1f5ca63b954de2cca0f16ad2a15948820a742da [387/387] staging: ion: Move ion heaps into their own directory
:::::: branch date: 5 days ago
:::::: commit date: 5 years ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241102/202411021240.cjx5vtwX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411021240.cjx5vtwX-lkp@intel.com/

smatch warnings:
drivers/staging/android/ion/heaps/ion_page_pool.c:136 ion_page_pool_create() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/gfp_mask +136 drivers/staging/android/ion/heaps/ion_page_pool.c

0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  133  
d92a1fabde9630 drivers/staging/android/ion/ion_page_pool.c Yisheng Xie           2018-02-12  134  struct ion_page_pool *ion_page_pool_create(gfp_t gfp_mask, unsigned int order)
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  135  {
8fb78ad6e55d84 drivers/staging/android/ion/ion_page_pool.c Ben Marsh             2016-02-01 @136  	struct ion_page_pool *pool = kmalloc(sizeof(*pool), GFP_KERNEL);
8fb78ad6e55d84 drivers/staging/android/ion/ion_page_pool.c Ben Marsh             2016-02-01  137  
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  138  	if (!pool)
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  139  		return NULL;
0fb9b815fe2010 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  140  	pool->high_count = 0;
0fb9b815fe2010 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  141  	pool->low_count = 0;
0fb9b815fe2010 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  142  	INIT_LIST_HEAD(&pool->low_items);
0fb9b815fe2010 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  143  	INIT_LIST_HEAD(&pool->high_items);
bdeb9f1c427686 drivers/staging/android/ion/ion_page_pool.c Heesub Shin           2014-05-28  144  	pool->gfp_mask = gfp_mask | __GFP_COMP;
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  145  	pool->order = order;
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  146  	mutex_init(&pool->mutex);
797a95c48c48d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  147  	plist_node_init(&pool->list, order);
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  148  
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  149  	return pool;
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  150  }
0214c7f20bf4d5 drivers/staging/android/ion/ion_page_pool.c Rebecca Schultz Zavin 2013-12-13  151  

:::::: The code at line 136 was first introduced by commit
:::::: 8fb78ad6e55d8456de9202279b8463f26b012088 Staging: Android: memory allocation style change in ion_page_pool.c

:::::: TO: Ben Marsh <bmarsh94@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

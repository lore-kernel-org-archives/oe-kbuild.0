Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C0C20334
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 04:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729312526; cv=none; b=AlmBtsEiSuTviQnU2Ux+weZPhbnTqPoNKSYYZIdRf+IGS0vjuz35cUr5qvzxEECKVFm5R7M7ruS+9zAlviveYMXhmMwI8/RTtdM/RuafUWmKzPLML1TNauLTpIY4nckcZeN8MWgorHj/9IVxe/4AFU7Ue35F0/kAnG7/LjU7mOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729312526; c=relaxed/simple;
	bh=jH4ptZjUTPElN8iGp7BXL4og1mzhLJD/XznVKHlD2+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DpZNHz4KCx3o/b4Z87kw5RK/3FWfTQ70NSIaZT652aEJ6v21fQQ3/2isYOl/WM2QEWoYlJ0D5spCwufuDlKSa285/Wm8ovTgEGr6JVz+9/5Wk7jHEq81cVMMwN77QYkhZKSfzYUtkNzqLTg/tPUyLGOzBG68/L/SclcWWqmHrTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYlBnkkl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYlBnkkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729312524; x=1760848524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jH4ptZjUTPElN8iGp7BXL4og1mzhLJD/XznVKHlD2+M=;
  b=mYlBnkklv9GUNdap5FzqIOWnNlj9E2lceBWKT0F62AdEo/dSSRrghseQ
   V/mvqPgg9yOAEOXiUstfXRtqLmJlegtCpL9j7lXXn/i2daueeUrCRMjmC
   rwlcMY9VuPecTKYHD9rWt9Y1eqYveOYt6F43XiKsouZWC2XcksGUu5h0I
   I1SAqEgiZXnwcKnsIVvoM9ggOgSZf1q0GnTu0gHkBoKqrPq+H/vjBIONL
   5Xrsxvqepe1BR4pko4BdLZKNLO6sRBYa7LnW/UNeTP3xb9Q8o+tv3cMfi
   O0C4bpn2iaso/rwi8XSVo1AJfaXQNRVGVA2J6qC7u/VocCVyWJGfmzPd6
   A==;
X-CSE-ConnectionGUID: E75iqpMORzSM/VGOoK8k9w==
X-CSE-MsgGUID: Z467cZ7XSFGfe90YOSZCKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39409344"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39409344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 21:35:24 -0700
X-CSE-ConnectionGUID: KUiSq7rmRKKM7rS6PSkzmg==
X-CSE-MsgGUID: Js8J0edZSfOiS3lHeEDjBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="109875338"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2024 21:35:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t21BP-000OhF-1X;
	Sat, 19 Oct 2024 04:35:19 +0000
Date: Sat, 19 Oct 2024 12:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent
 returns '&pool->lock'.
Message-ID: <202410191209.osrd8z9H-lkp@intel.com>
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
TO: Mike Snitzer <snitzer@kernel.org>
CC: Matthew Sakai <msakai@redhat.com>

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191209.osrd8z9H-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191209.osrd8z9H-lkp@intel.com/

smatch warnings:
drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn: inconsistent returns '&pool->lock'.

vim +976 drivers/md/dm-vdo/data-vio.c

79535a7881c0cb Matthew Sakai 2023-11-16  952  
79535a7881c0cb Matthew Sakai 2023-11-16  953  /**
79535a7881c0cb Matthew Sakai 2023-11-16  954   * vdo_launch_bio() - Acquire a data_vio from the pool, assign the bio to it, and launch it.
79535a7881c0cb Matthew Sakai 2023-11-16  955   *
79535a7881c0cb Matthew Sakai 2023-11-16  956   * This will block if data_vios or discard permits are not available.
79535a7881c0cb Matthew Sakai 2023-11-16  957   */
79535a7881c0cb Matthew Sakai 2023-11-16  958  void vdo_launch_bio(struct data_vio_pool *pool, struct bio *bio)
79535a7881c0cb Matthew Sakai 2023-11-16  959  {
79535a7881c0cb Matthew Sakai 2023-11-16  960  	struct data_vio *data_vio;
79535a7881c0cb Matthew Sakai 2023-11-16  961  
79535a7881c0cb Matthew Sakai 2023-11-16  962  	ASSERT_LOG_ONLY(!vdo_is_state_quiescent(&pool->state),
79535a7881c0cb Matthew Sakai 2023-11-16  963  			"data_vio_pool not quiescent on acquire");
79535a7881c0cb Matthew Sakai 2023-11-16  964  
79535a7881c0cb Matthew Sakai 2023-11-16  965  	bio->bi_private = (void *) jiffies;
79535a7881c0cb Matthew Sakai 2023-11-16  966  	spin_lock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16  967  	if ((bio_op(bio) == REQ_OP_DISCARD) &&
79535a7881c0cb Matthew Sakai 2023-11-16  968  	    !acquire_permit(&pool->discard_limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16  969  		return;
79535a7881c0cb Matthew Sakai 2023-11-16  970  
79535a7881c0cb Matthew Sakai 2023-11-16  971  	if (!acquire_permit(&pool->limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16  972  		return;
79535a7881c0cb Matthew Sakai 2023-11-16  973  
79535a7881c0cb Matthew Sakai 2023-11-16  974  	data_vio = get_available_data_vio(pool);
79535a7881c0cb Matthew Sakai 2023-11-16  975  	spin_unlock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16 @976  	launch_bio(pool->completion.vdo, data_vio, bio);
79535a7881c0cb Matthew Sakai 2023-11-16  977  }
79535a7881c0cb Matthew Sakai 2023-11-16  978  

:::::: The code at line 976 was first introduced by commit
:::::: 79535a7881c0cbe95063a2670d840cc950ae9282 dm vdo: add data_vio, the request object which services incoming bios

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

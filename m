Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084514BF93
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Apr 2024 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153842; cv=none; b=V9D/x/i76TlUSnJFnPn9OH+ePG7ACq8hAIzG2CPU8UcBisgJ0TY0KkDQsxvVYt9l8oIM3NLoWl7+atJnZLMY0C1M7SdLbgZBAY56S6XrumoT0aloAQS0013nbpCC3F8TxMPQQDIpjfzAX3hggDEKzqZ7XkQGO9FHk1LEmXBkVho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153842; c=relaxed/simple;
	bh=bN1HssWdUeqbKAA8jRMVZ5/k3VQM2hOF918vgHlZkSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDYF/d8crwbMXINQBcXWUkzEGW+Jzd8rVIhro/20sBfYmrKLN0qIcLaY7iFnj+3u0OYUdf0KCc+Tl09qRIpapT7myXT0FDLEQ33VbeGXkeEP41oZ3dKF4bxoT68L3H8My5Gp00juT+aLVR2CeszPpvMYqJ/iVhJR7J91/yGTbr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCuCORDM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCuCORDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712153839; x=1743689839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bN1HssWdUeqbKAA8jRMVZ5/k3VQM2hOF918vgHlZkSM=;
  b=JCuCORDMcrChGocIMfeVqE83hNPgsblUKVss8Nu2tWtfNDmI22qT0qdG
   4ok1qe75i1nKnpH+eQ+PsBOiR9HiUBxAaJMUlGR2y+4zT7/aILHQplytl
   vmNt729lkOCRTTIhQA4yBKv8/IUGouRkw0eLsLD7pQyaHwqbk/jr6VKcQ
   AK1ZnexZpghEZC1aLCRpMLOhOCiZn7c0N2qQgwA7zQyJ+SbPuDRRhsmsJ
   a6Fp1MseeOuC2D3c124nWDcZTMR/mnpo+K+AzQchcM92ssVHvoFb2wQ/N
   yP3SNfnn9E3O/+oiBpNnsl6KBsFXzkRmPpxqcHafanNjRVSli4DD1b4s5
   g==;
X-CSE-ConnectionGUID: FcURczBeTeyLHh4f6yArNQ==
X-CSE-MsgGUID: xGDXMVtEQyGvyKRyW25Ohw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10356072"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="10356072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 07:17:03 -0700
X-CSE-ConnectionGUID: PPWAI4GKRPGFuUBiYT92xQ==
X-CSE-MsgGUID: tnxokoNrSliJHNrWdAfJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="23210492"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 07:17:02 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs1QB-0002G1-2P;
	Wed, 03 Apr 2024 14:16:59 +0000
Date: Wed, 3 Apr 2024 22:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/md/dm-vdo/data-vio.c:969:2-8: preceding lock on line 966
Message-ID: <202404032212.NV7EJ2Zj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e92c1e6cd876754b64d1998ec0a01800ed954a6
commit: f36b1d3ba533d21b5b793623f05761b0297d114e dm vdo: use a proper Makefile for dm-vdo
date:   6 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-r052-20240403 (https://download.01.org/0day-ci/archive/20240403/202404032212.NV7EJ2Zj-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404032212.NV7EJ2Zj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/dm-vdo/data-vio.c:969:2-8: preceding lock on line 966
   drivers/md/dm-vdo/data-vio.c:972:2-8: preceding lock on line 966

vim +969 drivers/md/dm-vdo/data-vio.c

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
79535a7881c0cb Matthew Sakai 2023-11-16 @966  	spin_lock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16  967  	if ((bio_op(bio) == REQ_OP_DISCARD) &&
79535a7881c0cb Matthew Sakai 2023-11-16  968  	    !acquire_permit(&pool->discard_limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16 @969  		return;
79535a7881c0cb Matthew Sakai 2023-11-16  970  
79535a7881c0cb Matthew Sakai 2023-11-16  971  	if (!acquire_permit(&pool->limiter, bio))
79535a7881c0cb Matthew Sakai 2023-11-16  972  		return;
79535a7881c0cb Matthew Sakai 2023-11-16  973  
79535a7881c0cb Matthew Sakai 2023-11-16  974  	data_vio = get_available_data_vio(pool);
79535a7881c0cb Matthew Sakai 2023-11-16  975  	spin_unlock(&pool->lock);
79535a7881c0cb Matthew Sakai 2023-11-16  976  	launch_bio(pool->completion.vdo, data_vio, bio);
79535a7881c0cb Matthew Sakai 2023-11-16  977  }
79535a7881c0cb Matthew Sakai 2023-11-16  978  

:::::: The code at line 969 was first introduced by commit
:::::: 79535a7881c0cbe95063a2670d840cc950ae9282 dm vdo: add data_vio, the request object which services incoming bios

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

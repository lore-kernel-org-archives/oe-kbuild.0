Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A221CF81
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jan 2024 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705430908; cv=none; b=WuOkoWzEeLL5dARLyoxyVK3gL+1JfD3jfN7JTVh/5e0Ta8X0JDqLbUJrDTnLBq5tX2WLV6JeKZdnDa87839aHJ4lrY9Np/2FWxjKjZ08aWHQuGWCyGuZviDk67C14x2vzz5XjoWFtz6yANwlf7UY0cesLFi37A1Yg4mQYotcw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705430908; c=relaxed/simple;
	bh=CvSFY3jHvK2hrAXwNKtDZ76MKHpIZFm6elUh4p/uM1w=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=EfYeQHOaKCCaS8r1y3U5yZ45rVUmTuVLvx6OX55vPu7Ldn2IuLvgQms6qzdAOnf1rMLybeWXKKNLHj7ZPL5w9yJN2shmm3xMZNQ0dwTNO9EwXDbx3H7TQEdtbQI7hYqHCLFO7oxElxqwfSz02LcswuAjFXdh3sh/cT/p/3Jr+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dk1+PiQf; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dk1+PiQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705430907; x=1736966907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CvSFY3jHvK2hrAXwNKtDZ76MKHpIZFm6elUh4p/uM1w=;
  b=Dk1+PiQfVYJ3eStwb69gMrAsKxLcjfplk13T7Y8qivjvbQIbKg8QYc5+
   thZiIP5gEOvmD9Jp+2uxvMMEnEjKO6oMyqdjLLaaTgp+jo35RhWimPvWR
   xY+zI5dE+JmHOB/Wn3CkkgOvoCzHjMnqIMslV2QZLPWEeGdgkSk925Lki
   13z+B5q1QwaU49SKyVjI+KvHfNwQsjjHCzI2aAh7thUIhbq2DUCs3O74P
   fJuWm0/S6u9XsrdBhXaTQTi7TBTW5AbkTeV5IHkakOgmBXx7PclAZxS2Q
   pnwlOVzqhpiijGn4Y/RNQAHNQqa15rg6Kd/GnQKgaGQLjpmet1T8xikP2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="399621621"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="399621621"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 10:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="903230595"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="903230595"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2024 10:48:24 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPoU2-00015Y-1B;
	Tue, 16 Jan 2024 18:48:22 +0000
Date: Wed, 17 Jan 2024 02:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: drivers/gpu/drm/nouveau/nouveau_fence.c:546:10-29: WARNING:
 atomic_dec_and_test variation before object free at line 550.
Message-ID: <202401170216.PDGVtLON-lkp@intel.com>
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
TO: Dave Airlie <airlied@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   052d534373b7ed33712a63d5e17b2b6cdbce84fd
commit: eacabb5462717a52fccbbbba458365a4f5e61f35 nouveau: push event block/allowing out of the fence context
date:   12 days ago
:::::: branch date: 4 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-r063-20240110 (https://download.01.org/0day-ci/archive/20240117/202401170216.PDGVtLON-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7388b7422f9307dd5ae3fe3876a676d83d702daf)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401170216.PDGVtLON-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_fence.c:546:10-29: WARNING: atomic_dec_and_test variation before object free at line 550.

vim +546 drivers/gpu/drm/nouveau/nouveau_fence.c

29ba89b2371d46 Maarten Lankhorst 2014-01-09  532  
f54d1867005c33 Chris Wilson      2016-10-25  533  static bool nouveau_fence_enable_signaling(struct dma_fence *f)
29ba89b2371d46 Maarten Lankhorst 2014-01-09  534  {
29ba89b2371d46 Maarten Lankhorst 2014-01-09  535  	struct nouveau_fence *fence = from_fence(f);
29ba89b2371d46 Maarten Lankhorst 2014-01-09  536  	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
29ba89b2371d46 Maarten Lankhorst 2014-01-09  537  	bool ret;
eacabb5462717a Dave Airlie       2023-12-22  538  	bool do_work;
29ba89b2371d46 Maarten Lankhorst 2014-01-09  539  
eacabb5462717a Dave Airlie       2023-12-22  540  	if (atomic_inc_return(&fctx->notify_ref) == 0)
eacabb5462717a Dave Airlie       2023-12-22  541  		do_work = true;
29ba89b2371d46 Maarten Lankhorst 2014-01-09  542  
29ba89b2371d46 Maarten Lankhorst 2014-01-09  543  	ret = nouveau_fence_no_signaling(f);
29ba89b2371d46 Maarten Lankhorst 2014-01-09  544  	if (ret)
f54d1867005c33 Chris Wilson      2016-10-25  545  		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
eacabb5462717a Dave Airlie       2023-12-22 @546  	else if (atomic_dec_and_test(&fctx->notify_ref))
eacabb5462717a Dave Airlie       2023-12-22  547  		do_work = true;
eacabb5462717a Dave Airlie       2023-12-22  548  
eacabb5462717a Dave Airlie       2023-12-22  549  	if (do_work)
eacabb5462717a Dave Airlie       2023-12-22 @550  		schedule_work(&fctx->allow_block_work);
29ba89b2371d46 Maarten Lankhorst 2014-01-09  551  
29ba89b2371d46 Maarten Lankhorst 2014-01-09  552  	return ret;
29ba89b2371d46 Maarten Lankhorst 2014-01-09  553  }
29ba89b2371d46 Maarten Lankhorst 2014-01-09  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

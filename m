Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71117BA7
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726379558; cv=none; b=H9ONoBeRcPFqo8Mz/H/oONOJICGs2uf8tW5m1+nTbw9kYY3RrnKELykaDC4I35CqPtmGDai8OyNtQ8CfIn+ryIyydI0dTKiowK07xvbQbriEM3rxDI/H0I6nteFqnm2308BVr5IfJcASayfPWRyWxT2TNvg27RNKlq/zHPD/o5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726379558; c=relaxed/simple;
	bh=ahtCqSD52WgyRMi8ww2VsyPol/wougIkGnGAAB9YSuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5PG6r7wvKsoYdIGtAEP2myoxLYU3sMMYCUoP4KuwZ/rCISaJ9+WZ2bfT0lukUBWMDadkn9ZxtY1b1cYuYZUsD15/7/n/o2+mAOYURJgJwRDYFHkgQvwnxFQCdrUh1bJPrPFm1F6HV9EsGZxy3eC6vscaPnLxxkRfRlX/P9Iios=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/qDC8ZE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/qDC8ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726379556; x=1757915556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahtCqSD52WgyRMi8ww2VsyPol/wougIkGnGAAB9YSuA=;
  b=Y/qDC8ZEkgPe0dXye7oSg/D2OxXMz7dceBqVfLld6gGuQ1FkPzippLJs
   rBCXs13V53SSc+8uFrfkYm2CawiUdnUHBmzp68SbmMiAxP4cuKf38nqAb
   IofTGyECmeyn+hTCJe9TWAZ7Kklhtw2bNiZo0z+8Wx4XG0I7BBZTZds/O
   q+/pLam4/oS6LMGIotIYHiRmBYcpAQB4xYxo83IDOAB1D7v8bBxKZx1gh
   TADaixoECQDKEEzN8cxSXpTP05URUIBLUVUxLeR/WQny4kidzXXjCy7+L
   32vy5mMcY4S+M2/jiHEKn2cdIDWVgaD9cnzdRQCrfjnW7E3VAd8je6EXi
   g==;
X-CSE-ConnectionGUID: x9jbrKrqQpCRUzLh9iRRTw==
X-CSE-MsgGUID: oWE4CXRrSP2fbqRFQPT8ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25067068"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25067068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 22:52:36 -0700
X-CSE-ConnectionGUID: /tj/RcZeQv6RXC9vFp8Bfg==
X-CSE-MsgGUID: 3aI1ugtHTKGfHKXX7Ul8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="69052710"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2024 22:52:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spiBU-0008SC-02;
	Sun, 15 Sep 2024 05:52:32 +0000
Date: Sun, 15 Sep 2024 13:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ct.c:532:1-7: preceding lock on line 512
Message-ID: <202409151301.Esm1KMfE-lkp@intel.com>
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
TO: Matthew Auld <matthew.auld@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0babf683783ddca06551537c6781e413cfe8d27b
commit: dad33831d8d137ee28b21c3c2296463a01aa5b78 drm/xe/ct: hold fast_lock when reserving space for g2h
date:   9 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r062-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151301.Esm1KMfE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409151301.Esm1KMfE-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_ct.c:532:1-7: preceding lock on line 512

vim +532 drivers/gpu/drm/xe/xe_guc_ct.c

dd08ebf6c3525a Matthew Brost 2023-03-30  470  
dd08ebf6c3525a Matthew Brost 2023-03-30  471  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
dd08ebf6c3525a Matthew Brost 2023-03-30  472  				u32 len, u32 g2h_len, u32 num_g2h,
dd08ebf6c3525a Matthew Brost 2023-03-30  473  				struct g2h_fence *g2h_fence)
dd08ebf6c3525a Matthew Brost 2023-03-30  474  {
dd08ebf6c3525a Matthew Brost 2023-03-30  475  	int ret;
dd08ebf6c3525a Matthew Brost 2023-03-30  476  
dd08ebf6c3525a Matthew Brost 2023-03-30  477  	XE_BUG_ON(g2h_len && g2h_fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  478  	XE_BUG_ON(num_g2h && g2h_fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  479  	XE_BUG_ON(g2h_len && !num_g2h);
dd08ebf6c3525a Matthew Brost 2023-03-30  480  	XE_BUG_ON(!g2h_len && num_g2h);
dd08ebf6c3525a Matthew Brost 2023-03-30  481  	lockdep_assert_held(&ct->lock);
dd08ebf6c3525a Matthew Brost 2023-03-30  482  
a7ca8157ec7b59 Rodrigo Vivi  2023-05-16  483  	if (unlikely(ct->ctbs.h2g.info.broken)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  484  		ret = -EPIPE;
dd08ebf6c3525a Matthew Brost 2023-03-30  485  		goto out;
dd08ebf6c3525a Matthew Brost 2023-03-30  486  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  487  
dd08ebf6c3525a Matthew Brost 2023-03-30  488  	if (unlikely(!ct->enabled)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  489  		ret = -ENODEV;
dd08ebf6c3525a Matthew Brost 2023-03-30  490  		goto out;
dd08ebf6c3525a Matthew Brost 2023-03-30  491  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  492  
dd08ebf6c3525a Matthew Brost 2023-03-30  493  	if (g2h_fence) {
dd08ebf6c3525a Matthew Brost 2023-03-30  494  		g2h_len = GUC_CTB_HXG_MSG_MAX_LEN;
dd08ebf6c3525a Matthew Brost 2023-03-30  495  		num_g2h = 1;
dd08ebf6c3525a Matthew Brost 2023-03-30  496  
dd08ebf6c3525a Matthew Brost 2023-03-30  497  		if (g2h_fence_needs_alloc(g2h_fence)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  498  			void *ptr;
dd08ebf6c3525a Matthew Brost 2023-03-30  499  
dd08ebf6c3525a Matthew Brost 2023-03-30  500  			g2h_fence->seqno = (ct->fence_seqno++ & 0xffff);
dd08ebf6c3525a Matthew Brost 2023-03-30  501  			ptr = xa_store(&ct->fence_lookup,
dd08ebf6c3525a Matthew Brost 2023-03-30  502  				       g2h_fence->seqno,
dd08ebf6c3525a Matthew Brost 2023-03-30  503  				       g2h_fence, GFP_ATOMIC);
dd08ebf6c3525a Matthew Brost 2023-03-30  504  			if (IS_ERR(ptr)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  505  				ret = PTR_ERR(ptr);
dd08ebf6c3525a Matthew Brost 2023-03-30  506  				goto out;
dd08ebf6c3525a Matthew Brost 2023-03-30  507  			}
dd08ebf6c3525a Matthew Brost 2023-03-30  508  		}
dd08ebf6c3525a Matthew Brost 2023-03-30  509  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  510  
dad33831d8d137 Matthew Auld  2023-07-10  511  	if (g2h_len)
dad33831d8d137 Matthew Auld  2023-07-10 @512  		spin_lock_irq(&ct->fast_lock);
dd08ebf6c3525a Matthew Brost 2023-03-30  513  retry:
dd08ebf6c3525a Matthew Brost 2023-03-30  514  	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
dd08ebf6c3525a Matthew Brost 2023-03-30  515  	if (unlikely(ret))
dad33831d8d137 Matthew Auld  2023-07-10  516  		goto out_unlock;
dd08ebf6c3525a Matthew Brost 2023-03-30  517  
dd08ebf6c3525a Matthew Brost 2023-03-30  518  	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
dd08ebf6c3525a Matthew Brost 2023-03-30  519  			!!g2h_fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  520  	if (unlikely(ret)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  521  		if (ret == -EAGAIN)
dd08ebf6c3525a Matthew Brost 2023-03-30  522  			goto retry;
dad33831d8d137 Matthew Auld  2023-07-10  523  		goto out_unlock;
dd08ebf6c3525a Matthew Brost 2023-03-30  524  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  525  
dad33831d8d137 Matthew Auld  2023-07-10  526  	__g2h_reserve_space(ct, g2h_len, num_g2h);
dd08ebf6c3525a Matthew Brost 2023-03-30  527  	xe_guc_notify(ct_to_guc(ct));
dad33831d8d137 Matthew Auld  2023-07-10  528  out_unlock:
dad33831d8d137 Matthew Auld  2023-07-10  529  	if (g2h_len)
dad33831d8d137 Matthew Auld  2023-07-10  530  		spin_unlock_irq(&ct->fast_lock);
dd08ebf6c3525a Matthew Brost 2023-03-30  531  out:
dd08ebf6c3525a Matthew Brost 2023-03-30 @532  	return ret;
dd08ebf6c3525a Matthew Brost 2023-03-30  533  }
dd08ebf6c3525a Matthew Brost 2023-03-30  534  

:::::: The code at line 532 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

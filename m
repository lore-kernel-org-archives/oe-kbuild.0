Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FFC5DF32
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jan 2024 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194196; cv=none; b=SKShB04S58+mfenBE1hiiXh6dIEOfTPmr/UkuYClh0xZrkUJOLALnpQzpfJcssVe38SrkOfeCoqmD08p0xpeCStzVT8r5WpDLUsCFiak9MhnqX9kDdnC6ACVSqpgSBAUyiXj0uwMGebN/HOA7KTP/NVjHjN2Cr9nbQ6A2CnjSu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194196; c=relaxed/simple;
	bh=NzE8w+L23lEx5XEJeFovhXXwk5mvDOoh0jzo2jXTSRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BipE33di7Wz8B3ZyaTqfY0nCy86ql3FJc+GtO5iDW81DbswGdmU2cmdXGyPSvDJ0CT+9VJT5wREwf0QMJrcCx+aI70cuQYeG3oDKs72JB25D4mfV7wWaLz1oIc0WOwSniqwUnbHl4bt8wLXDj/aIHN1jr7V0xMIz7imEbu78Rj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mui2lEd8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mui2lEd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706194194; x=1737730194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzE8w+L23lEx5XEJeFovhXXwk5mvDOoh0jzo2jXTSRc=;
  b=mui2lEd8W0W2IpV3RCl23hquTkdnO0CT9wHwWppGmNp1oBhKLFveVSiv
   DCEcmk+b1a8kRkh0qnLwchoNVTFTa+105mfNE0XmfqmptFJPSryaLVycG
   9AUcge4yu20jRR36TYA3U4UqZQipMnIQfbl7ajoEQM8o8XlsyQNlaJ0HV
   PphuoI1WBhEk6lSmCc9hakzX+vMQsUBM0nANEYbHrELfC/qDG2f8M8xoi
   AmMeeiKmrvcQtzWxMrmKDvMplIOkvvvWnqhD2B3PfImZUzPdzgsqZ9e2y
   sFUGoTqpePp5/3PDtAYHC2PqA1V9mRVLwvSOZ8saLcfCg91ZQyPm0/usB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="2049562"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2049562"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 06:49:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2380000"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2024 06:49:52 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT138-00004y-08;
	Thu, 25 Jan 2024 14:49:50 +0000
Date: Thu, 25 Jan 2024 22:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ct.c:532:1-7: preceding lock on line 512
Message-ID: <202401252207.BCBl354p-lkp@intel.com>
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
head:   6098d87eaf31f48153c984e2adadf14762520a87
commit: dad33831d8d137ee28b21c3c2296463a01aa5b78 drm/xe/ct: hold fast_lock when reserving space for g2h
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
config: powerpc64-randconfig-r052-20240125 (https://download.01.org/0day-ci/archive/20240125/202401252207.BCBl354p-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401252207.BCBl354p-lkp@intel.com/

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

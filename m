Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5152322B
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731245346; cv=none; b=aO4C7iRaocx9t3LL8ft9m8ghnouLj6/eG+YuGSw8z2not8ABRDsBeYCvSiBhm8PxTgNGWIcOuY1gZoQ26ZITzJBsBuD3axntI+76L+gjMjHnzygAwuJA/B9PfIM0PwNbFOLcUflRSbQESQkyG+XhUWfdyyumgyPkI3mUHrDPIcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731245346; c=relaxed/simple;
	bh=zGPXn3GFVyJaMnP2biEppd74lhcsrv7SNwXUJnOx9Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=scyCtzhtOdQessrcvit3x1Gkn1Ps8YpnJrd3dCpSxRnXWK+VoVW2GyfSbgmha3agUZksYsxGVhH22FGBQFFSwFJOBzCJYtGoagyg3zoInQBOist+k1bTcZhoX4XsODneqXImL7co90EeR9o9qMIIu/by02i8DX3odr0NaBDPK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwuVhqqx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwuVhqqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731245345; x=1762781345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGPXn3GFVyJaMnP2biEppd74lhcsrv7SNwXUJnOx9Fk=;
  b=EwuVhqqxBKTvm/c5f0GGXdyMzw1HVcwHwXfV6ewevl6VGGplC2lB8tEW
   2BNNMvFRUHOWdYX2OQt0fY1/BfHCHJ+j4d9JilAfug75WgI2bu9DvyjnV
   FI68M59gcXWrRPTFyX9JoxlRmFOqbaN2V4JXNm6EZEvYeiXF8PipNrzmi
   a0+7M91WKvtYf8ci/LG1k1/hsaBhbf3t/4Xa9lkLcJFpqbP5HpVB7W+RB
   LrbnR2o9JfHE2p6uEUhwLyVnlwQcPXNwepTIHcc8qutHuCFM8sR8dnc1+
   J13WsV05hJYijDoAcohmf/uf+zrrWAnODTR7RKUZMTxWYa47CuPaDEthN
   A==;
X-CSE-ConnectionGUID: v++YBKFuRbiLi3Jg1KEf+g==
X-CSE-MsgGUID: zRWnNSZ6SmSeo+RqX4fsUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53628377"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53628377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 05:29:04 -0800
X-CSE-ConnectionGUID: TljKSBNuRvaaBwPvC4BsRA==
X-CSE-MsgGUID: 7bwQR7JQQHyKa6yVvsxhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="117365268"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2024 05:29:03 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA7zx-00009x-0v;
	Sun, 10 Nov 2024 13:29:01 +0000
Date: Sun, 10 Nov 2024 21:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ct.c:532:1-7: preceding lock on line 512
Message-ID: <202411102156.82B2ylE5-lkp@intel.com>
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
head:   de2f378f2b771b39594c04695feee86476743a69
commit: dad33831d8d137ee28b21c3c2296463a01aa5b78 drm/xe/ct: hold fast_lock when reserving space for g2h
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-104-20241110 (https://download.01.org/0day-ci/archive/20241110/202411102156.82B2ylE5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411102156.82B2ylE5-lkp@intel.com/

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

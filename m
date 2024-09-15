Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9BA41
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Sep 2024 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726361728; cv=none; b=gMEJWOA4l+jPTiPop0wdrWNqxAuL4Ww/gtYWFUh+tDscWq4DODgNoZHKXL9pgVbE4HTT7GqfNT1ZLYh497r6bUUxELuOK8+y/s5dkRY1IFpOZV1MhlhtjuGEXD5IOJ6dSlBJn7iupFFDujdpr0opm4pIVkXhy0XOzC0DEihVxjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726361728; c=relaxed/simple;
	bh=Pc/WPkKLUii4Znddom777jJtWxbqopLD6JI/hg7oPhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MO3hwYlsGn8FYuV6GxXsu09uKYZpUQXxtFfD2uqBsjxIgSEdfFJFv7QFMNHXE+bNJyPBXi+qPCk2dTNgAN/Mk+iZFMUdNqMtcGyOK8wBNF/HJ4hQqz6nfczJZ3ChIWJKcsis/iO+kxX2K+DOsMXYVqAa2NPSF0ZZ4AYXymkFNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ik8hYziQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik8hYziQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726361726; x=1757897726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pc/WPkKLUii4Znddom777jJtWxbqopLD6JI/hg7oPhw=;
  b=Ik8hYziQ/Nrl5EArGtXPwliD3FfQfTAtyJsAwB3TfRcKRYNN6gIn1kjF
   c+L7DiQGPCbXrifqIJb2TidDFNnm9iajBSE9A3iC1ExawWHyultYbpKsx
   2OAPm3XC180umd9yQdQtsNzt8rDqFxSIeuqEVG3tLc8sCxPwV4LwZXwpm
   mEM47XFPrdhPnJnRIysTx0YOKHnC+eMtC2AGLj1nyCDqd4swQ7ImlpEFa
   dvITv5fs/paGN1S7B4vnlwIEOPV6lEpgXOT2solFAEutTJBdxA7U2wob8
   RfHa+Ktt9fO07Q/o2EyX8jgB6uApB2pwqQfjpsyBker+YMGo3ZPEbLIE9
   Q==;
X-CSE-ConnectionGUID: kDjhq9FZQom0Yr2pZEao8w==
X-CSE-MsgGUID: kn2p43q2TPmL+YqHIbj2gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="35816253"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="35816253"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 17:55:26 -0700
X-CSE-ConnectionGUID: QeUF4cJSQoe6/6Ie2cIpfg==
X-CSE-MsgGUID: bH17gNNXSK+krPCiMqK/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="99177582"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Sep 2024 17:55:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spdXu-0008Hy-1d;
	Sun, 15 Sep 2024 00:55:22 +0000
Date: Sun, 15 Sep 2024 08:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH 2/7] mm/secretmem: implement mm-local kernel
 allocations
Message-ID: <202409150804.JleAe8oD-lkp@intel.com>
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
In-Reply-To: <20240911143421.85612-3-faresx@amazon.de>
References: <20240911143421.85612-3-faresx@amazon.de>
TO: Fares Mehanna <faresx@amazon.de>

Hi Fares,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to kvmarm/next akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fares-Mehanna/mseal-expose-interface-to-seal-unseal-user-memory-ranges/20240911-223945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240911143421.85612-3-faresx%40amazon.de
patch subject: [RFC PATCH 2/7] mm/secretmem: implement mm-local kernel allocations
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240915 (https://download.01.org/0day-ci/archive/20240915/202409150804.JleAe8oD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409150804.JleAe8oD-lkp@intel.com/

smatch warnings:
mm/secretmem.c:388 secretmem_release_pages() warn: can 'ctx' even be NULL?

vim +/ctx +388 mm/secretmem.c

a07a458aa48edd Fares Mehanna 2024-09-11  377  
a07a458aa48edd Fares Mehanna 2024-09-11  378  void secretmem_release_pages(struct secretmem_area *data)
a07a458aa48edd Fares Mehanna 2024-09-11  379  {
a07a458aa48edd Fares Mehanna 2024-09-11  380  	unsigned long uvaddr, bytes_length;
a07a458aa48edd Fares Mehanna 2024-09-11  381  	struct secretmem_ctx *ctx;
a07a458aa48edd Fares Mehanna 2024-09-11  382  	int rc;
a07a458aa48edd Fares Mehanna 2024-09-11  383  
a07a458aa48edd Fares Mehanna 2024-09-11  384  	if (!data || !data->ptr)
a07a458aa48edd Fares Mehanna 2024-09-11  385  		BUG();
a07a458aa48edd Fares Mehanna 2024-09-11  386  
a07a458aa48edd Fares Mehanna 2024-09-11  387  	ctx = container_of(data, struct secretmem_ctx, _area);
a07a458aa48edd Fares Mehanna 2024-09-11 @388  	if (!ctx || !ctx->_file || !ctx->_pages || !ctx->_mm)
a07a458aa48edd Fares Mehanna 2024-09-11  389  		BUG();
a07a458aa48edd Fares Mehanna 2024-09-11  390  
a07a458aa48edd Fares Mehanna 2024-09-11  391  	bytes_length = ctx->_nr_pages * PAGE_SIZE;
a07a458aa48edd Fares Mehanna 2024-09-11  392  	uvaddr = (unsigned long) data->ptr;
a07a458aa48edd Fares Mehanna 2024-09-11  393  
a07a458aa48edd Fares Mehanna 2024-09-11  394  	/*
a07a458aa48edd Fares Mehanna 2024-09-11  395  	 * Remove the mapping if mm is still in use.
a07a458aa48edd Fares Mehanna 2024-09-11  396  	 * Not secure to continue if unmapping failed.
a07a458aa48edd Fares Mehanna 2024-09-11  397  	 */
a07a458aa48edd Fares Mehanna 2024-09-11  398  	if (mmget_not_zero(ctx->_mm)) {
a07a458aa48edd Fares Mehanna 2024-09-11  399  		mmap_write_lock(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  400  		rc = do_mseal(uvaddr, uvaddr + bytes_length, false);
a07a458aa48edd Fares Mehanna 2024-09-11  401  		if (rc) {
a07a458aa48edd Fares Mehanna 2024-09-11  402  			mmap_write_unlock(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  403  			BUG();
a07a458aa48edd Fares Mehanna 2024-09-11  404  		}
a07a458aa48edd Fares Mehanna 2024-09-11  405  		rc = do_munmap(ctx->_mm, uvaddr, bytes_length, NULL);
a07a458aa48edd Fares Mehanna 2024-09-11  406  		if (rc) {
a07a458aa48edd Fares Mehanna 2024-09-11  407  			mmap_write_unlock(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  408  			BUG();
a07a458aa48edd Fares Mehanna 2024-09-11  409  		}
a07a458aa48edd Fares Mehanna 2024-09-11  410  		mmap_write_unlock(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  411  		mmput(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  412  	}
a07a458aa48edd Fares Mehanna 2024-09-11  413  
a07a458aa48edd Fares Mehanna 2024-09-11  414  	mmdrop(ctx->_mm);
a07a458aa48edd Fares Mehanna 2024-09-11  415  	unpin_user_pages(ctx->_pages, ctx->_nr_pages);
a07a458aa48edd Fares Mehanna 2024-09-11  416  	fput(ctx->_file);
a07a458aa48edd Fares Mehanna 2024-09-11  417  	kfree(ctx->_pages);
a07a458aa48edd Fares Mehanna 2024-09-11  418  
a07a458aa48edd Fares Mehanna 2024-09-11  419  	ctx->_nr_pages = 0;
a07a458aa48edd Fares Mehanna 2024-09-11  420  	ctx->_pages = NULL;
a07a458aa48edd Fares Mehanna 2024-09-11  421  	ctx->_file = NULL;
a07a458aa48edd Fares Mehanna 2024-09-11  422  	ctx->_mm = NULL;
a07a458aa48edd Fares Mehanna 2024-09-11  423  	ctx->_area.ptr = NULL;
a07a458aa48edd Fares Mehanna 2024-09-11  424  }
a07a458aa48edd Fares Mehanna 2024-09-11  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

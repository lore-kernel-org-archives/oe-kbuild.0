Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310F5D517
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729474052; cv=none; b=RtzirpEkhWqaBh7FIkYawe+4wkfWl4nfP8Gvi60vQzEbGTA764/5faFSoVq23YqJofAH12Gbt4ij3sKsWCZEHzj8VGg2UY4mK7O7f96DLE9Ixz8/mydfWGzeSlHftPtIEyljE3m915kVE2zf4UxGDA3C2ey6v6pOzlKcIu+Ju1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729474052; c=relaxed/simple;
	bh=aMipU8/xnAPui/i94woj4J5F5vY/roWJ2WsxePAAaWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHg72I2bzAATROciKD5frctD+HnlARKY7ir+HnUeRMtj3DApSzEk76HznpRqkcuig6SeVNH0QQ95VmFTANrb/+2ZtDZsFKA6sEzuZn0aERuEeCoV7Wjk3PLHglmvrHVsLQPkkcf5coeYF70ohWqfsmly/88pNiv8/v3JKJ7l2nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb3vMoec; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb3vMoec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729474050; x=1761010050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aMipU8/xnAPui/i94woj4J5F5vY/roWJ2WsxePAAaWc=;
  b=lb3vMoecByoYLDfm23R/NqeWQxPMpIbhFK+PuOuEYJOIpM4Y5jZE/Xq5
   BzRAFYny5qAhDLF1Ex2O4XysW60VCifEfMMLAQlOmXCtIyVm0bZXzEnLm
   i8FjGPdENwRBEImIfYs8P9AmbW3vc3feUCkv8ISYz5obKjoumHHeovD/d
   vs0lrUsWiTy2QOzs4/ZTrnJywYg3rR8z4ZCFNOnsOicrXN9qpWsaR8g/2
   c68Hcf4rhdyqnqUBm3/07Y8bnazPG6P21VEF6hdHHuReM3yFzI0epSr3o
   JMMVH/yhnWjS6HfF+E+13kGiKc0/yb+Pg/rjsD41L4JMBsxViN/n737b8
   A==;
X-CSE-ConnectionGUID: tFxuYO0XS6ePsnIMHZZ3mg==
X-CSE-MsgGUID: s3WQpNYvRZ+0yZoqhHnnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40332407"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="40332407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 18:27:30 -0700
X-CSE-ConnectionGUID: biDnmra/TemqDDoa/Tgmzg==
X-CSE-MsgGUID: NNI0BChDSISeZOCom/blAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="102687912"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2024 18:27:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2hCg-000QzZ-1N;
	Mon, 21 Oct 2024 01:27:26 +0000
Date: Mon, 21 Oct 2024 09:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:zcrx/next 12/19] io_uring/zcrx.c:411 io_pp_zc_init() warn:
 variable dereferenced before check 'ifq' (see line 408)
Message-ID: <202410210918.7CYUHUaU-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zcrx/next
head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
commit: bcb187b21fdb59e9ddaaf2a179a5e2044336e198 [12/19] io_uring/zcrx: implement zerocopy receive pp memory provider
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210918.7CYUHUaU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210918.7CYUHUaU-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:411 io_pp_zc_init() warn: variable dereferenced before check 'ifq' (see line 408)

vim +/ifq +411 io_uring/zcrx.c

bcb187b21fdb59 Pavel Begunkov 2023-12-08  404  
bcb187b21fdb59 Pavel Begunkov 2023-12-08  405  static int io_pp_zc_init(struct page_pool *pp)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  406  {
bcb187b21fdb59 Pavel Begunkov 2023-12-08  407  	struct io_zcrx_ifq *ifq = pp->mp_priv;
bcb187b21fdb59 Pavel Begunkov 2023-12-08 @408  	struct io_zcrx_area *area = ifq->area;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  409  	int ret;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  410  
bcb187b21fdb59 Pavel Begunkov 2023-12-08 @411  	if (!ifq)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  412  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  413  	if (pp->p.order != 0)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  414  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  415  	if (!pp->p.napi)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  416  		return -EINVAL;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  417  
bcb187b21fdb59 Pavel Begunkov 2023-12-08  418  	ret = page_pool_mp_init_paged_area(pp, &area->nia, area->pages);
bcb187b21fdb59 Pavel Begunkov 2023-12-08  419  	if (ret)
bcb187b21fdb59 Pavel Begunkov 2023-12-08  420  		return ret;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  421  
bcb187b21fdb59 Pavel Begunkov 2023-12-08  422  	percpu_ref_get(&ifq->ctx->refs);
bcb187b21fdb59 Pavel Begunkov 2023-12-08  423  	ifq->pp = pp;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  424  	return 0;
bcb187b21fdb59 Pavel Begunkov 2023-12-08  425  }
bcb187b21fdb59 Pavel Begunkov 2023-12-08  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

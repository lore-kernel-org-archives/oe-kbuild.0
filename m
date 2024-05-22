Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAD80026
	for <oe-kbuild@lists.linux.dev>; Wed, 22 May 2024 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716373910; cv=none; b=ZeqBOpCS7vVJdyamSw9rypJ0W+GVo6Znud2wMieqokte5SaEA5rq9c4gfVHy7d2fv66oG9l/XlNWiT1NdsbcGYM7VcW4MEvyclUEdWBCOBsQl+77XC7TZYvDMVx8JHGJ9gaYq/Brn6Mivz4BIhs4jUxJdFoAdRdjNExXUVLp4/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716373910; c=relaxed/simple;
	bh=QgDnAQqAB3/RZuN0YE6RfA+8iZbJs0rgmgqNC09nDR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE0qAmjTMcIrcpxJm8UPUCVik8GEfMqvUDuKYTdtrbkQF0f6B5DKjxiOVyQSUtB2IcLmx5CBdrQEOlmbiyPteM2fu5ovQJeO9et6m7grfX26qJg2dRq66U8/VzrJk2x/S+jnP5AAj5F6geUoe7GVWDZ5+Upf6WxOF1s0YXcfMzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3EsuYHb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3EsuYHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716373909; x=1747909909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgDnAQqAB3/RZuN0YE6RfA+8iZbJs0rgmgqNC09nDR8=;
  b=m3EsuYHbB8N5UAeZnjaTJzEcVIlpt6DWOcmxR94qbULp0Jtf46f9MTf2
   qCPBxM9uebJhmzROf59YdTbPAI/zA8ydQ2Oyk1ScjsmFMCiX6Iqaz3fIp
   4iI441QjMARjZ9AAzRtpmajPRvjDx/ZD3eIDEVA63F5ennZJj07kClXFZ
   eA2cAqiEQEstB0hvWYpahjQkJluW3JJqXEf8yHNnY1+9c+T9u+dHA1GN+
   mVknp2NYEvJLBQ/HqGC8O2QLQ94vwCzIHI2U36swtzIK9OIRguE/M5mxn
   ZM8yTd9aQvvueozvVo75+Lf9iHX0AjIyC0qWXCPUGpPMJvvKLwq80I4Lp
   w==;
X-CSE-ConnectionGUID: ncDuV/vBSRWmzWL9PDslug==
X-CSE-MsgGUID: SDH92EaRQOGA2JH+QAvG2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24028483"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="24028483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 03:31:49 -0700
X-CSE-ConnectionGUID: QdBUFW/NTaeNlRzaOc8lVw==
X-CSE-MsgGUID: w1I+VWWAQnCsSZ6X0E4WtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="37826673"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2024 03:31:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9jG1-0001I9-2q;
	Wed, 22 May 2024 10:31:41 +0000
Date: Wed, 22 May 2024 18:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [alobakin:idpf-libie-new 55/63] include/net/libeth/xdp.h:786
 libeth_xdp_prepare_buff() warn: potential memory corrupting cast 8 vs 4
 bytes
Message-ID: <202405221800.heDAJJ3N-lkp@intel.com>
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
TO: Alexander Lobakin <aleksander.lobakin@intel.com>

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   e0f15f92530432c10486607c676825d5dd2d35f0
commit: 7eccae4d841ad18ae05f5cda4fc1aa0b8b6bd651 [55/63] idpf: use generic functions to build xdp_buff and skb
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20240522 (https://download.01.org/0day-ci/archive/20240522/202405221800.heDAJJ3N-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405221800.heDAJJ3N-lkp@intel.com/

New smatch warnings:
include/net/libeth/xdp.h:786 libeth_xdp_prepare_buff() warn: potential memory corrupting cast 8 vs 4 bytes

Old smatch warnings:
drivers/net/ethernet/intel/idpf/idpf_txrx.c:1485 idpf_txq_group_alloc() error: uninitialized symbol 'stashes'.

vim +786 include/net/libeth/xdp.h

bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  770  
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  771  bool libeth_xdp_buff_add_frag(struct libeth_xdp_buff *xdp,
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  772  			      const struct libeth_fqe *fqe,
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  773  			      u32 len);
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  774  
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  775  static inline void libeth_xdp_prepare_buff(struct libeth_xdp_buff *xdp,
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  776  					   const struct libeth_fqe *fqe,
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  777  					   u32 len)
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  778  {
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  779  	const struct page *page = fqe->page;
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  780  
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  781  #ifdef __LIBETH_WORD_ACCESS
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  782  	static_assert(offsetofend(typeof(xdp->base), flags) -
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  783  		      offsetof(typeof(xdp->base), frame_sz) ==
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  784  		      sizeof(u64));
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  785  
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11 @786  	*(u64 *)&xdp->base.frame_sz = fqe->truesize;
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  787  #else
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  788  	xdp_init_buff(&xdp->base, fqe->truesize, xdp->base.rxq);
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  789  #endif
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  790  	xdp_prepare_buff(&xdp->base, page_address(page) + fqe->offset,
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  791  			 page->pp->p.offset, len, true);
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  792  }
bb9fb7e8c7e576 Alexander Lobakin 2023-12-11  793  

:::::: The code at line 786 was first introduced by commit
:::::: bb9fb7e8c7e576a6090288ecba2f58fd8607659a libeth: add a couple of XDP helpers (libeth_xdp)

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

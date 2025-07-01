Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB926A0E0
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Jul 2025 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397004; cv=none; b=T74a3OLx5XcRtYpbqRgsP9RuaQbfsx/Ka0/UaH/TQojY3f+/EQWVUjflVhtGkIfRvxpFXjXTzdxoB22WgNKGKIpUHY+WjMPRC42ayl44WKl7hzodPCaQVxgeZbdMgkJTOpyo9teDEVcn0nxB7DZ7DWIqyqRRhSpxeifuzNPPKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397004; c=relaxed/simple;
	bh=4A7RDOYZB7GPyH04DBQxhV3VBU68U+eGCdcS7q/4Pz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jfqm7HNBK/LaPgZnUqelWozOJmatCTyw40/udlsfASHLqfqyzh8vgwK/DZt4DjWImzLAHPCuK5Hco0CzHQ03TQUtrxsAygZvDq6ww/YqyycvOazIXES1QDLsmyOMqAAmyuur4TqvedYc0Qmp2MtamE8nW4Ige5gG1S/qlxzx69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3IZwCU3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3IZwCU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751397002; x=1782933002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4A7RDOYZB7GPyH04DBQxhV3VBU68U+eGCdcS7q/4Pz0=;
  b=N3IZwCU3QE8G6I8Yg3soIlPaoO6n2siwbEPszoUZM0uv/hu1M48i5lUK
   IVsYE/JuPUY0NpH56gyEGip/ukkszPdRKpWLAgMDZMJqUVpdgub9m1eBH
   HUul14+qYlR+RCn/6SpUd8OFAioW5WkHNqaA7WkUc2duvYg9iU6iQV2YO
   X6WFWjx/u7/7QFX4+EV9+gt+WcSHsGbXxLuBHP9SlKh52ghiZ0ixGL3sU
   AaCXZTuF+70Qg+Gc9pcUulDs1NRFN5ou97cvgAHe9T1ODzUov1mDplvHv
   XKkDvIu/sfXsi2PDxh6iwieoBh6/CpRlFduJu9UlccLMdcXpW/PpEIAhG
   w==;
X-CSE-ConnectionGUID: 41kIgJCNRIilefGxxMDlzg==
X-CSE-MsgGUID: b4i45QFFRtuJ1elmPAWd7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52791066"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52791066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 12:10:02 -0700
X-CSE-ConnectionGUID: YTuZDklUQ5mXED0qyqGZrA==
X-CSE-MsgGUID: 6HTm44wzTWe3pXzQ6+B6IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153937175"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2025 12:10:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWgMh-000aZa-0H;
	Tue, 01 Jul 2025 19:09:59 +0000
Date: Wed, 2 Jul 2025 03:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alobakin:libeth 16/17] include/net/libeth/xsk.h:205:2: error: call
 to '__compiletime_assert_1014' declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(tmo == libeth_xsktmo)
Message-ID: <202507020244.KtT0kibJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Michal Kubiak <michal.kubiak@intel.com>

tree:   https://github.com/alobakin/linux libeth
head:   6e9dca7537d9a9879ecb9ee2e0237f5b9377ca79
commit: 979d01f729c7d3ff907d5590774d613a28c53f50 [16/17] idpf: implement Rx path for AF_XDP
:::::: branch date: 3 hours ago
:::::: commit date: 28 hours ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250702/202507020244.KtT0kibJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020244.KtT0kibJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507020244.KtT0kibJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/xsk.c:4:
>> include/net/libeth/xsk.h:205:2: error: call to '__compiletime_assert_1014' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(tmo == libeth_xsktmo)
           BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:568:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:39:1: note: expanded from here
   __compiletime_assert_1014
   ^
   1 error generated.


vim +205 include/net/libeth/xsk.h

40e846d122df9b Alexander Lobakin 2025-06-12  177  
40e846d122df9b Alexander Lobakin 2025-06-12  178  /**
40e846d122df9b Alexander Lobakin 2025-06-12  179   * __libeth_xsk_xmit_fill_buf_md - internal helper to prepare XSk xmit w/meta
40e846d122df9b Alexander Lobakin 2025-06-12  180   * @xdesc: &xdp_desc from the XSk buffer pool
40e846d122df9b Alexander Lobakin 2025-06-12  181   * @sq: XDPSQ abstraction for the queue
40e846d122df9b Alexander Lobakin 2025-06-12  182   * @priv: XSk Tx metadata ops
40e846d122df9b Alexander Lobakin 2025-06-12  183   *
40e846d122df9b Alexander Lobakin 2025-06-12  184   * Same as __libeth_xsk_xmit_fill_buf(), but requests metadata pointer and
40e846d122df9b Alexander Lobakin 2025-06-12  185   * fills additional fields in &libeth_xdp_tx_desc to ask for metadata offload.
40e846d122df9b Alexander Lobakin 2025-06-12  186   *
40e846d122df9b Alexander Lobakin 2025-06-12  187   * Return: XDP Tx descriptor with the DMA, metadata request bits, and other
40e846d122df9b Alexander Lobakin 2025-06-12  188   * info to pass to the driver callback.
40e846d122df9b Alexander Lobakin 2025-06-12  189   */
40e846d122df9b Alexander Lobakin 2025-06-12  190  static __always_inline struct libeth_xdp_tx_desc
40e846d122df9b Alexander Lobakin 2025-06-12  191  __libeth_xsk_xmit_fill_buf_md(const struct xdp_desc *xdesc,
40e846d122df9b Alexander Lobakin 2025-06-12  192  			      const struct libeth_xdpsq *sq,
40e846d122df9b Alexander Lobakin 2025-06-12  193  			      u64 priv)
40e846d122df9b Alexander Lobakin 2025-06-12  194  {
40e846d122df9b Alexander Lobakin 2025-06-12  195  	const struct xsk_tx_metadata_ops *tmo = libeth_xdp_priv_to_ptr(priv);
40e846d122df9b Alexander Lobakin 2025-06-12  196  	struct libeth_xdp_tx_desc desc;
40e846d122df9b Alexander Lobakin 2025-06-12  197  	struct xdp_desc_ctx ctx;
40e846d122df9b Alexander Lobakin 2025-06-12  198  
40e846d122df9b Alexander Lobakin 2025-06-12  199  	ctx = xsk_buff_raw_get_ctx(sq->pool, xdesc->addr);
40e846d122df9b Alexander Lobakin 2025-06-12  200  	desc = (typeof(desc)){
40e846d122df9b Alexander Lobakin 2025-06-12  201  		.addr	= ctx.dma,
80bae9df2108cb Alexander Lobakin 2025-06-12  202  		__libeth_xdp_tx_len(xdesc->len),
40e846d122df9b Alexander Lobakin 2025-06-12  203  	};
40e846d122df9b Alexander Lobakin 2025-06-12  204  
40e846d122df9b Alexander Lobakin 2025-06-12 @205  	BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
40e846d122df9b Alexander Lobakin 2025-06-12  206  	tmo = tmo == libeth_xsktmo ? &__libeth_xsktmo : tmo;
40e846d122df9b Alexander Lobakin 2025-06-12  207  
40e846d122df9b Alexander Lobakin 2025-06-12  208  	xsk_tx_metadata_request(ctx.meta, tmo, &desc);
40e846d122df9b Alexander Lobakin 2025-06-12  209  
40e846d122df9b Alexander Lobakin 2025-06-12  210  	return desc;
40e846d122df9b Alexander Lobakin 2025-06-12  211  }
40e846d122df9b Alexander Lobakin 2025-06-12  212  

:::::: The code at line 205 was first introduced by commit
:::::: 40e846d122df9b299e700ec86d01ef647fc0b09f libeth: xsk: add XSk xmit functions

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

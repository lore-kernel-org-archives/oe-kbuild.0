Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0718871F
	for <oe-kbuild@lists.linux.dev>; Sat, 17 May 2025 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461614; cv=none; b=M0joDCujspLLFuYdrCOG9WQNHP+fOyq7/uuEtZbUCDR7IHEBlGLpUJXSCLNHhhIS3XekR2sbO2/+9WOuYW3jCNcgqT/VV9AvmBB0zkbZG2bbIcHavEL2rOOTjr9DfXOe52OJsBs74cJEqZA27u2dbC1lItEe2gxFF7H1uKT43/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461614; c=relaxed/simple;
	bh=he7AhR0rd0RZH5pjd2ItqbNkiI22Sh5sK0dA7R4gvkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwAkXYx5TnCIvwmDtm+KN9nJgf1EB2IZLqtq0+DJWdkbnNQG/6x/hbZwwq79uqxpozTAuc/3Jq23nR9ikGTu4dOjs5FrMmhsT77yRiT4yBcWkdgXRPzr2Fw+CTxXPdVMh5BdzfEOBjHO3HWJ7Hopq/fCm4zGNSMrlhvBW9MP2Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/Q0HmCK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Q0HmCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747461613; x=1778997613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=he7AhR0rd0RZH5pjd2ItqbNkiI22Sh5sK0dA7R4gvkM=;
  b=c/Q0HmCKEC2lVLKKOZEJXCj73xYpqtJzdsNMNGzvvdDpxqLn17vLNAyn
   yjircb5TsSX2e+11MItRNXnU3djeVaCom4Fwrbrbw+S+6DR4Xgt3Jr+xP
   HgKPGoKbDsS++fTm/4rIKJNGIddpBjWWsObHIPU3G9VUHhEghSwVjFn+Y
   I5R7N8/lPc6UAW/BPelxJsAK76fSEVJS4WzzTo70TSbs/NEEcanVg/WpB
   RDtiVM1q2xQzw/8yFuoh9E1pCmbldla1O6zHP/kKms6WBhYGVMLpG3cvU
   hpJfevjP1nBFhU9gjL2pF3X9xDLszXpf6YAhn2SSB7IDUL8odJ35INabM
   g==;
X-CSE-ConnectionGUID: 02Y2f96/QwasIa2wRR4Olg==
X-CSE-MsgGUID: Z0q4i7fFQMiOZ5epiesxdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53236654"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="53236654"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 23:00:09 -0700
X-CSE-ConnectionGUID: OxA4DlNkQlKg7rxH9Q4+4Q==
X-CSE-MsgGUID: tqjYWxybRSiAfZ3PrDMpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="143670796"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2025 23:00:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGAac-000Jxt-0F;
	Sat, 17 May 2025 06:00:06 +0000
Date: Sat, 17 May 2025 13:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [alobakin:libeth 32/33] include/net/libeth/xsk.h:205:2: error: call
 to '__compiletime_assert_1007' declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(tmo == libeth_xsktmo)
Message-ID: <202505171359.71ucLmOg-lkp@intel.com>
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
head:   0570a2423889831229451cf30b33efbd4153bed6
commit: 69526b5660f85e51c53c6d343113daba300104af [32/33] idpf: implement Rx path for AF_XDP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250517/202505171359.71ucLmOg-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171359.71ucLmOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505171359.71ucLmOg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/xsk.c:4:
>> include/net/libeth/xsk.h:205:2: error: call to '__compiletime_assert_1007' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(tmo == libeth_xsktmo)
           BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:557:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:9:1: note: expanded from here
   __compiletime_assert_1007
   ^
   1 error generated.


vim +205 include/net/libeth/xsk.h

47725bae68dca6 Alexander Lobakin 2025-04-03  177  
47725bae68dca6 Alexander Lobakin 2025-04-03  178  /**
47725bae68dca6 Alexander Lobakin 2025-04-03  179   * __libeth_xsk_xmit_fill_buf_md - internal helper to prepare XSk xmit w/meta
47725bae68dca6 Alexander Lobakin 2025-04-03  180   * @xdesc: &xdp_desc from the XSk buffer pool
47725bae68dca6 Alexander Lobakin 2025-04-03  181   * @sq: XDPSQ abstraction for the queue
47725bae68dca6 Alexander Lobakin 2025-04-03  182   * @priv: XSk Tx metadata ops
47725bae68dca6 Alexander Lobakin 2025-04-03  183   *
47725bae68dca6 Alexander Lobakin 2025-04-03  184   * Same as __libeth_xsk_xmit_fill_buf(), but requests metadata pointer and
47725bae68dca6 Alexander Lobakin 2025-04-03  185   * fills additional fields in &libeth_xdp_tx_desc to ask for metadata offload.
47725bae68dca6 Alexander Lobakin 2025-04-03  186   *
47725bae68dca6 Alexander Lobakin 2025-04-03  187   * Return: XDP Tx descriptor with the DMA, metadata request bits, and other
47725bae68dca6 Alexander Lobakin 2025-04-03  188   * info to pass to the driver callback.
47725bae68dca6 Alexander Lobakin 2025-04-03  189   */
47725bae68dca6 Alexander Lobakin 2025-04-03  190  static __always_inline struct libeth_xdp_tx_desc
47725bae68dca6 Alexander Lobakin 2025-04-03  191  __libeth_xsk_xmit_fill_buf_md(const struct xdp_desc *xdesc,
47725bae68dca6 Alexander Lobakin 2025-04-03  192  			      const struct libeth_xdpsq *sq,
47725bae68dca6 Alexander Lobakin 2025-04-03  193  			      u64 priv)
47725bae68dca6 Alexander Lobakin 2025-04-03  194  {
47725bae68dca6 Alexander Lobakin 2025-04-03  195  	const struct xsk_tx_metadata_ops *tmo = libeth_xdp_priv_to_ptr(priv);
47725bae68dca6 Alexander Lobakin 2025-04-03  196  	struct libeth_xdp_tx_desc desc;
47725bae68dca6 Alexander Lobakin 2025-04-03  197  	struct xdp_desc_ctx ctx;
47725bae68dca6 Alexander Lobakin 2025-04-03  198  
47725bae68dca6 Alexander Lobakin 2025-04-03  199  	ctx = xsk_buff_raw_get_ctx(sq->pool, xdesc->addr);
47725bae68dca6 Alexander Lobakin 2025-04-03  200  	desc = (typeof(desc)){
47725bae68dca6 Alexander Lobakin 2025-04-03  201  		.addr	= ctx.dma,
9fc8af54c03cd8 Alexander Lobakin 2025-04-03  202  		__libeth_xdp_tx_len(xdesc->len),
47725bae68dca6 Alexander Lobakin 2025-04-03  203  	};
47725bae68dca6 Alexander Lobakin 2025-04-03  204  
47725bae68dca6 Alexander Lobakin 2025-04-03 @205  	BUILD_BUG_ON(!__builtin_constant_p(tmo == libeth_xsktmo));
47725bae68dca6 Alexander Lobakin 2025-04-03  206  	tmo = tmo == libeth_xsktmo ? &__libeth_xsktmo : tmo;
47725bae68dca6 Alexander Lobakin 2025-04-03  207  
47725bae68dca6 Alexander Lobakin 2025-04-03  208  	xsk_tx_metadata_request(ctx.meta, tmo, &desc);
47725bae68dca6 Alexander Lobakin 2025-04-03  209  
47725bae68dca6 Alexander Lobakin 2025-04-03  210  	return desc;
47725bae68dca6 Alexander Lobakin 2025-04-03  211  }
47725bae68dca6 Alexander Lobakin 2025-04-03  212  

:::::: The code at line 205 was first introduced by commit
:::::: 47725bae68dca6d7fd0ffc6bf4ba098af5fb3266 libeth: xsk: add XSk xmit functions

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Alexander Lobakin <aleksander.lobakin@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB44A1552F9
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708472982; cv=none; b=m07d3Vqn6/SbzfJUwRrXsJkppE+fkZv7gMSqY2v//DrjzGwN5hDwOrkFJoNOOQqKeYj+PRMArQZsJxDrhfr1Vxgn/k1oO2NfuwzP/CZsmXvg1FSSEAcQatPxYvobJ8c4l+QtfgU9HO0FkCEzoxYwjkx4fn7WSsHbnHvsQDXVTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708472982; c=relaxed/simple;
	bh=8r7t5kxLXDY+39lI7W0yVbNFUn9eK+tOeb+7jm93Uag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrB8LaHWt6TME3CaxaiG9A+c7iFk3YTWw/lkTiggfH9xLIdCm88kcHyOr7I3CJDWuGHPDtcrBUpqFpGVaKmfP7+JkSWt26cZKk2qsyUPeS27lGJyLovd9h1UScg+BYTJGKD1okA+m+Y0x9inrmk9r9MUt3FU3gULHoAhnM3U0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3zJLbmd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3zJLbmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708472981; x=1740008981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8r7t5kxLXDY+39lI7W0yVbNFUn9eK+tOeb+7jm93Uag=;
  b=W3zJLbmdBec/XWG3VZgvxt0L0sx7C1JywzQQkPeGNaWOycTnbXxx3gAI
   0FdSjXhPwdRS1YMyhx54QZjVAl3m0Z/sd0j9HLIxbD+8U3r2cVZNg0B7C
   ea6Sw96HEyyHDDtIdEfLDNxRxLeTe4wIJ5fTtd6blEAJNPXidSTayuoj8
   zzoK2PYZOe/XlrMq+l4HXxHedgcoyWEA9XdRWZFEKAtxSpTKaiuf0UjUg
   06RyEabPWKF4b7FgdnkAjxaIThsbGIkiD7uMOviEzzsXjPq7MKST2vY+j
   XqABL3EcEgpCk5U+XaZ1o+L5MBKgm0oYTui5e/H2PpEshlzCeAOA/YQUp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2475009"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2475009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 15:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="28103285"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2024 15:49:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcZqt-0004t2-1s;
	Tue, 20 Feb 2024 23:48:58 +0000
Date: Wed, 21 Feb 2024 07:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:x86-pie-for-sev-v5 16/16] mm/zsmalloc.c:223:32: warning:
 variable length array used
Message-ID: <202402210746.N0NANSKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: mm/zsmalloc.c:223:32: warning: variable length array used [-Wvla]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   0cc3d2ea8faa59cc6406f95460e42ae5987ee35b
commit: 0cc3d2ea8faa59cc6406f95460e42ae5987ee35b [16/16] x86/startup_64: Drop global variables keeping track of LA57 state
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-121-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210746.N0NANSKS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210746.N0NANSKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402210746.N0NANSKS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:223:32: warning: variable length array used [-Wvla]
     223 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                                       ^~~~~~~~~~~~~~~
   mm/zsmalloc.c:146:59: note: expanded from macro 'ZS_SIZE_CLASSES'
     146 | #define ZS_SIZE_CLASSES (DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
     147 |                                       ZS_SIZE_CLASS_DELTA) + 1)
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c:128:52: note: expanded from macro 'ZS_MIN_ALLOC_SIZE'
     128 |         MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> OBJ_INDEX_BITS))
         |                                                           ^
   mm/zsmalloc.c:113:41: note: expanded from macro 'OBJ_INDEX_BITS'
     113 | #define OBJ_INDEX_BITS  (BITS_PER_LONG - _PFN_BITS - OBJ_TAG_BITS)
         |                                          ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/x86/include/asm/sparsemem.h:29:28: note: expanded from macro 'MAX_PHYSMEM_BITS'
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^
   mm/zsmalloc.c:122:28: note: expanded from macro 'MAX'
     122 | #define MAX(a, b) ((a) >= (b) ? (a) : (b))
         |                            ^
   include/uapi/linux/const.h:34:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      34 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   mm/zsmalloc.c:223:21: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
     223 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^
   1 warning and 1 error generated.


vim +223 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  219  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  220  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  221  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  222  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @223  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  224  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  225  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  226  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  227  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  228  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  229  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  230  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  231  	/* Compact classes */
c19b548b493455 mm/zsmalloc.c                            Qi Zheng           2023-09-11  232  	struct shrinker *shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  233  

:::::: The code at line 223 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

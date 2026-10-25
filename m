Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792930806;
	b=tUXbgJFaBtgGJKYVt/PXcjTU75D2rUKJSG9eYKU6oHZdrpah9Y40LsAp2aKAmkksMmUZ
	 23X+UI0OF7eg513o3UY2MP6/8CZU6hBTGba+jXS30wfr6Psz/H9cBwfXKl+gWwxfW3SLq
	 HF7ga2xarRBMENY/OMnFbteYM/0sis61rzT4lRURnDY5tUoFiwZ3j7VjWhMVTAJ0Q/hOi
	 2X+++4VSiKcHeyEo2xhOtOErRqOWjtH7vdiZuFl5QcTgvlVl9oryfkqJz3PmpoY9yN/Hi
	 eD2bCviyoGco5hqMDA8mizVDWGU4O1ZwdtO6iTby+8cGGi9PCOJsYBmlsZI2tdC6bTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930806;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=CI0AgK6IGwoPlP/ltHm11ZWtQACltpVptM9nkmQhVS4=;
	b=2jF9FvLIS5t7oHhjhardKDNU1iEHVX6jWVeKHH38PWGx2C0xfTORv0RSAgmLe6QycX43
	 8uhEaKsWQP7ySibKTonTh8JDZ4nNALyCUvGy3aKOAM8Jvh5OfVtTZEAWY5olHD6vPKsgG
	 p3Fod9NR1wqqDgwS/Kvix7pzdDzUyvcYLvsoAOUWyMQJ8IA9XXzsmoGy2X/mbXa5sMWlE
	 uQjAG67AjU+hgh86x2VaANmgzGnyHtOVy+IB7aw9Tl0/xNfRlhVQnGXjgheIEh4K0CU6u
	 UMWsoMrTsgula6LZhMhW3HvtJjkedQhaAKVAEZa/5UkUn32vdROoMNt4nW+IjfxOfgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ExvYusxp;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BD606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Oct 2026 12:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ExvYusxp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792930804; x=1824466804;
  h=date:from:to:cc:subject:message-id;
  bh=smOVwze9g9fGIIp/+AIlknDL1FJ7tX+6Zt21lhLsksQ=;
  b=ExvYusxp3lXU36mnkYOmnnWodvwxujnCW/KxMcikvQC/zm7KAeD6XECS
   q+naADgBdLez6pmW4/rOuQvxaJ557ObxTNu+0dkX1UXQwBy8NtFLuiy9q
   qvudaz8C5v5lmoC/WSMSeKrJwRRxI+XTxB43mef2+op+AYUKyYQkwARMl
   ryYrZDD5fjXDeVTBYG+XlUBCZfFA3qPTMsjaQbNcQFU1c28wLv+nB78C2
   DmtHTvVFDdTXgq7m2O0uxoVS/u5l+YaAncU/kVi944CWT4mZWeECQMbmW
   DD8IYfCniynAqixiiZTPvdavOj1IogmftbuOUL7WUflrE3GRBiZg8Sz8r
   g==;
X-CSE-ConnectionGUID: itC7ZvfcS4SgptIPMiMkyA==
X-CSE-MsgGUID: cn+gAjooQRiKSdadpw9F6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1624243"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1624243"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 05:20:03 -0700
X-CSE-ConnectionGUID: 7D87mSQNTGSJQaiezlfuHQ==
X-CSE-MsgGUID: zuJ2g6bMQbmgJUoLfZWElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="3924786"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Oct 2026 05:20:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKxCh-000000003hX-02ra;
	Sun, 25 Oct 2026 12:19:59 +0000
Date: Sun, 25 Oct 2026 13:19:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zab-rpdfs:rpdfs-initial 85/98] fs/rpdfs/meta.c:182:2:
 error: call to '__compiletime_assert_660' declared with 'error' attribute:
 BUILD_BUG_ON failed: PAGE_SIZE != RPDFS_BLOCK_SIZE
Message-ID: <202610251353.WSHC15XB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   8a293e5c1bf0416f4d4e116bf8693c00dbe876da
commit: 2f7d4b4295890ece08df31aa8e2d0150594c6c07 [85/98] rpdfs: update inode code
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261025/202610251353.WSHC15XB-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610251353.WSHC15XB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610251353.WSHC15XB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/rpdfs/meta.c:182:2: error: call to '__compiletime_assert_660' declared with 'error' attribute: BUILD_BUG_ON failed: PAGE_SIZE != RPDFS_BLOCK_SIZE
     182 |         BUILD_BUG_ON(PAGE_SIZE != RPDFS_BLOCK_SIZE);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:568:2: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:556:2: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:549:4: note: expanded from macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:13:1: note: expanded from here
      13 | __compiletime_assert_660
         | ^
   1 warning and 1 error generated.


vim +182 fs/rpdfs/meta.c

2658c3c902752b Zach Brown 2026-07-09  150  
2658c3c902752b Zach Brown 2026-07-09  151  /*
2658c3c902752b Zach Brown 2026-07-09  152   * Get a folio that contains the block of the described type and index.
2658c3c902752b Zach Brown 2026-07-09  153   * Modeled loosely after __filemap_get_folio, except that we have much
2658c3c902752b Zach Brown 2026-07-09  154   * less variation in callers.
2658c3c902752b Zach Brown 2026-07-09  155   *
2658c3c902752b Zach Brown 2026-07-09  156   * Generally folios are returned without the folio lock held.  Callers
2658c3c902752b Zach Brown 2026-07-09  157   * are expected to have higher level serialization of safe access to the
2658c3c902752b Zach Brown 2026-07-09  158   * block's contents.
2658c3c902752b Zach Brown 2026-07-09  159   *
2658c3c902752b Zach Brown 2026-07-09  160   * The waiting flags (_READ, _WRITE) are killable and only suitable for
2658c3c902752b Zach Brown 2026-07-09  161   * task contexts.
2658c3c902752b Zach Brown 2026-07-09  162   *
2658c3c902752b Zach Brown 2026-07-09  163   * MGF_NEW: return a locked folio that is not uptodate and whose
2658c3c902752b Zach Brown 2026-07-09  164   * contents are uninitialized.  The caller must unlock, and must either
2658c3c902752b Zach Brown 2026-07-09  165   * mark the folio in error or initialize the contents and set it
2658c3c902752b Zach Brown 2026-07-09  166   * uptodate.
2658c3c902752b Zach Brown 2026-07-09  167   *
2658c3c902752b Zach Brown 2026-07-09  168   * MGF_READ: return a folio that is uptodate.  The folio may be
2658c3c902752b Zach Brown 2026-07-09  169   * undergoing writeback.
2658c3c902752b Zach Brown 2026-07-09  170   *
2658c3c902752b Zach Brown 2026-07-09  171   * MGF_WRITE: return a locked folio that is uptodate and not under
2658c3c902752b Zach Brown 2026-07-09  172   * writeback.  The folio is returned locked so that writeback won't
2658c3c902752b Zach Brown 2026-07-09  173   * start until the caller unlocks.
2658c3c902752b Zach Brown 2026-07-09  174   */
2658c3c902752b Zach Brown 2026-07-09  175  struct folio *rpdfs_meta_get_folio(struct inode *inode, mgf_t mgf, u8 type, u64 t_index)
2658c3c902752b Zach Brown 2026-07-09  176  {
2658c3c902752b Zach Brown 2026-07-09  177  	struct address_space *mapping = shadow_mapping(inode);
2658c3c902752b Zach Brown 2026-07-09  178  	struct folio *folio;
2658c3c902752b Zach Brown 2026-07-09  179  	pgoff_t f_index;
2658c3c902752b Zach Brown 2026-07-09  180  	int ret;
2658c3c902752b Zach Brown 2026-07-09  181  
2658c3c902752b Zach Brown 2026-07-09 @182  	BUILD_BUG_ON(PAGE_SIZE != RPDFS_BLOCK_SIZE);
2658c3c902752b Zach Brown 2026-07-09  183  
2658c3c902752b Zach Brown 2026-07-09  184  	if (WARN_ON_ONCE(mgf == 0 || (mgf & MGF__INVALID)) ||
2658c3c902752b Zach Brown 2026-07-09  185  	    WARN_ON_ONCE((mgf & MGF_NEW) && (mgf & ~MGF_NEW)) ||
2658c3c902752b Zach Brown 2026-07-09  186  	    WARN_ON_ONCE((mgf & MGF_READ) && (mgf & MGF_WRITE))) {
2658c3c902752b Zach Brown 2026-07-09  187  		ret = -EINVAL;
2658c3c902752b Zach Brown 2026-07-09  188  		goto out;
2658c3c902752b Zach Brown 2026-07-09  189  	}
2658c3c902752b Zach Brown 2026-07-09  190  
2658c3c902752b Zach Brown 2026-07-09  191  	ret = folio_index_from_type(inode, type, t_index, &f_index);
2658c3c902752b Zach Brown 2026-07-09  192  	if (ret < 0) {
2658c3c902752b Zach Brown 2026-07-09  193  		folio = ERR_PTR(ret);
2658c3c902752b Zach Brown 2026-07-09  194  		goto out;
2658c3c902752b Zach Brown 2026-07-09  195  	}
2658c3c902752b Zach Brown 2026-07-09  196  
2658c3c902752b Zach Brown 2026-07-09  197  	if (mgf & MGF_NEW) {
2658c3c902752b Zach Brown 2026-07-09  198  		folio = __filemap_get_folio(mapping, f_index, FGP_LOCK|FGP_CREAT, GFP_NOFS);
2658c3c902752b Zach Brown 2026-07-09  199  		goto out;
2658c3c902752b Zach Brown 2026-07-09  200  	}
2658c3c902752b Zach Brown 2026-07-09  201  
2658c3c902752b Zach Brown 2026-07-09  202  	folio = mapping_read_folio_gfp(mapping, f_index, GFP_NOFS);
2658c3c902752b Zach Brown 2026-07-09  203  	if (IS_ERR(folio))
2658c3c902752b Zach Brown 2026-07-09  204  		goto out;
2658c3c902752b Zach Brown 2026-07-09  205  
2658c3c902752b Zach Brown 2026-07-09  206  	if (mgf & MGF_WRITE) {
2658c3c902752b Zach Brown 2026-07-09  207  		ret = folio_lock_killable(folio);
2658c3c902752b Zach Brown 2026-07-09  208  		if (ret == 0) {
2658c3c902752b Zach Brown 2026-07-09  209  			ret = folio_wait_writeback_killable(folio);
2658c3c902752b Zach Brown 2026-07-09  210  			if (ret < 0)
2658c3c902752b Zach Brown 2026-07-09  211  				folio_unlock(folio);
2658c3c902752b Zach Brown 2026-07-09  212  		}
2658c3c902752b Zach Brown 2026-07-09  213  		if (ret < 0) {
2658c3c902752b Zach Brown 2026-07-09  214  			folio_put(folio);
2658c3c902752b Zach Brown 2026-07-09  215  			folio = ERR_PTR(ret);
2658c3c902752b Zach Brown 2026-07-09  216  			goto out;
2658c3c902752b Zach Brown 2026-07-09  217  		}
2658c3c902752b Zach Brown 2026-07-09  218  	}
2658c3c902752b Zach Brown 2026-07-09  219  
2658c3c902752b Zach Brown 2026-07-09  220  out:
2658c3c902752b Zach Brown 2026-07-09  221  	if (!IS_ERR(folio))
2658c3c902752b Zach Brown 2026-07-09  222  		rpdfs_prd("mgf %x type %u index %llu "RFF, mgf, type, t_index, RFA(folio));
2658c3c902752b Zach Brown 2026-07-09  223  	else
2658c3c902752b Zach Brown 2026-07-09  224  		rpdfs_prd("mgf %x type %u index %llu ret %ld", mgf, type, t_index, PTR_ERR(folio));
2658c3c902752b Zach Brown 2026-07-09  225  
2658c3c902752b Zach Brown 2026-07-09  226  	return folio;
2658c3c902752b Zach Brown 2026-07-09  227  }
2658c3c902752b Zach Brown 2026-07-09  228  

:::::: The code at line 182 was first introduced by commit
:::::: 2658c3c902752b51b9bebb9bb36cf7dcde32d28d rpdfs: add meta code for caching metadata

:::::: TO: Zach Brown <zab@zabbo.net>
:::::: CC: Zach Brown <zab@zabbo.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

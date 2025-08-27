Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57587272E41
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 02:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756261540; cv=none; b=OtBgnDJY3LLH93JX3gkhsWE7UmvXAWQsieas51XwvomV1Di3WDKrNRfxvCl6q3PpRcLZ6+LDAuGngcDtASyYvB3AlaHTlc/sOYt7R2lcImx8up/DmqBbz+5a7XDL+baRXRIwLHdKEz48dvRYwE1uZ5EzVA9DwOfx47QM2WLj3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756261540; c=relaxed/simple;
	bh=uPwY4XdsPcHKAO0qgOlM9jD2OKqKAql7wTyq8O+Y8XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=upfn2WYVX0vJK8OqUAQz7g2x5dMznhrcFYF9n2bwKExp1psG3TqMZwLBzXH0Ydxrnd40rUysnVxy3xIpTkPtKJ17AG6sCleI/aOsFoyzaKku+0WyMycGxGlr3fFABZQjWI4af5dYvWW91HRxrwhwoKbwZ61wBLexyHHOHagVbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRhkP7WB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRhkP7WB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756261538; x=1787797538;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uPwY4XdsPcHKAO0qgOlM9jD2OKqKAql7wTyq8O+Y8XI=;
  b=hRhkP7WBSnWXSV0M+UksdC/zmAQPLRTkOw3otJEAIc+j8TOzkfDLgxl0
   UWs2pBpbVlrd8f2Dxq6eWK0wqBuK5EKCdbvAiRMoewkuyGymm20PHhoiu
   9SGjtRhzTGdi3pwkF9Uxnsueg0eRkXYBPsMmHJVL8wj6ujoEl4LT2zEYI
   n5RkQRn8FAl6BXhhJ6sV4SGjjwcJN2EmTpZRmFcoODQaW9sUYSCmf8kFC
   kEnlKoTuPKVvnL37iP1hUP4fZ/KkKu0hRujo1LAhrCtNr2DvaLv4pt67s
   3r5G7er6WRxAllbftUMOgJf5nQ0jrpcex6WQcOhs8ZRau4ePtfdD2lXCQ
   A==;
X-CSE-ConnectionGUID: OqBs13kWRjqabzdNE/tsmw==
X-CSE-MsgGUID: nKrJb156SHqoInPrQYupwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="68779155"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68779155"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 19:25:37 -0700
X-CSE-ConnectionGUID: 7FMpduEUSqu9CKwnmZFesQ==
X-CSE-MsgGUID: sMY15CE0T5uNMcpKgAubbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="206893727"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2025 19:25:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ur5qv-000Sal-2q;
	Wed, 27 Aug 2025 02:25:33 +0000
Date: Wed, 27 Aug 2025 10:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_svm.c:413 xe_svm_copy() error: uninitialized
 symbol '__vram_addr'.
Message-ID: <202508271007.hlQAB7s8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fab1beda7597fac1cecc01707d55eadb6bbe773c
commit: c5b3eb5a906c4777960050b9fece20a4722453b8 drm/xe: Add GPUSVM device memory copy vfunc functions
date:   6 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271007.hlQAB7s8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508271007.hlQAB7s8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_svm.c:413 xe_svm_copy() error: uninitialized symbol '__vram_addr'.

vim +/__vram_addr +413 drivers/gpu/drm/xe/xe_svm.c

c5b3eb5a906c477 Matthew Brost 2025-03-05  323  
c5b3eb5a906c477 Matthew Brost 2025-03-05  324  static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
c5b3eb5a906c477 Matthew Brost 2025-03-05  325  		       unsigned long npages, const enum xe_svm_copy_dir dir)
c5b3eb5a906c477 Matthew Brost 2025-03-05  326  {
c5b3eb5a906c477 Matthew Brost 2025-03-05  327  	struct xe_vram_region *vr = NULL;
c5b3eb5a906c477 Matthew Brost 2025-03-05  328  	struct xe_tile *tile;
c5b3eb5a906c477 Matthew Brost 2025-03-05  329  	struct dma_fence *fence = NULL;
c5b3eb5a906c477 Matthew Brost 2025-03-05  330  	unsigned long i;
c5b3eb5a906c477 Matthew Brost 2025-03-05  331  #define XE_VRAM_ADDR_INVALID	~0x0ull
c5b3eb5a906c477 Matthew Brost 2025-03-05  332  	u64 vram_addr = XE_VRAM_ADDR_INVALID;
c5b3eb5a906c477 Matthew Brost 2025-03-05  333  	int err = 0, pos = 0;
c5b3eb5a906c477 Matthew Brost 2025-03-05  334  	bool sram = dir == XE_SVM_COPY_TO_SRAM;
c5b3eb5a906c477 Matthew Brost 2025-03-05  335  
c5b3eb5a906c477 Matthew Brost 2025-03-05  336  	/*
c5b3eb5a906c477 Matthew Brost 2025-03-05  337  	 * This flow is complex: it locates physically contiguous device pages,
c5b3eb5a906c477 Matthew Brost 2025-03-05  338  	 * derives the starting physical address, and performs a single GPU copy
c5b3eb5a906c477 Matthew Brost 2025-03-05  339  	 * to for every 8M chunk in a DMA address array. Both device pages and
c5b3eb5a906c477 Matthew Brost 2025-03-05  340  	 * DMA addresses may be sparsely populated. If either is NULL, a copy is
c5b3eb5a906c477 Matthew Brost 2025-03-05  341  	 * triggered based on the current search state. The last GPU copy is
c5b3eb5a906c477 Matthew Brost 2025-03-05  342  	 * waited on to ensure all copies are complete.
c5b3eb5a906c477 Matthew Brost 2025-03-05  343  	 */
c5b3eb5a906c477 Matthew Brost 2025-03-05  344  
c5b3eb5a906c477 Matthew Brost 2025-03-05  345  	for (i = 0; i < npages; ++i) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  346  		struct page *spage = pages[i];
c5b3eb5a906c477 Matthew Brost 2025-03-05  347  		struct dma_fence *__fence;
c5b3eb5a906c477 Matthew Brost 2025-03-05  348  		u64 __vram_addr;
c5b3eb5a906c477 Matthew Brost 2025-03-05  349  		bool match = false, chunk, last;
c5b3eb5a906c477 Matthew Brost 2025-03-05  350  
c5b3eb5a906c477 Matthew Brost 2025-03-05  351  #define XE_MIGRATE_CHUNK_SIZE	SZ_8M
c5b3eb5a906c477 Matthew Brost 2025-03-05  352  		chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE / PAGE_SIZE);
c5b3eb5a906c477 Matthew Brost 2025-03-05  353  		last = (i + 1) == npages;
c5b3eb5a906c477 Matthew Brost 2025-03-05  354  
c5b3eb5a906c477 Matthew Brost 2025-03-05  355  		/* No CPU page and no device pages queue'd to copy */
c5b3eb5a906c477 Matthew Brost 2025-03-05  356  		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
c5b3eb5a906c477 Matthew Brost 2025-03-05  357  			continue;
c5b3eb5a906c477 Matthew Brost 2025-03-05  358  
c5b3eb5a906c477 Matthew Brost 2025-03-05  359  		if (!vr && spage) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  360  			vr = page_to_vr(spage);
c5b3eb5a906c477 Matthew Brost 2025-03-05  361  			tile = vr_to_tile(vr);
c5b3eb5a906c477 Matthew Brost 2025-03-05  362  		}
c5b3eb5a906c477 Matthew Brost 2025-03-05  363  		XE_WARN_ON(spage && page_to_vr(spage) != vr);
c5b3eb5a906c477 Matthew Brost 2025-03-05  364  
c5b3eb5a906c477 Matthew Brost 2025-03-05  365  		/*
c5b3eb5a906c477 Matthew Brost 2025-03-05  366  		 * CPU page and device page valid, capture physical address on
c5b3eb5a906c477 Matthew Brost 2025-03-05  367  		 * first device page, check if physical contiguous on subsequent
c5b3eb5a906c477 Matthew Brost 2025-03-05  368  		 * device pages.
c5b3eb5a906c477 Matthew Brost 2025-03-05  369  		 */
c5b3eb5a906c477 Matthew Brost 2025-03-05  370  		if (dma_addr[i] && spage) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  371  			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
c5b3eb5a906c477 Matthew Brost 2025-03-05  372  			if (vram_addr == XE_VRAM_ADDR_INVALID) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  373  				vram_addr = __vram_addr;
c5b3eb5a906c477 Matthew Brost 2025-03-05  374  				pos = i;
c5b3eb5a906c477 Matthew Brost 2025-03-05  375  			}
c5b3eb5a906c477 Matthew Brost 2025-03-05  376  
c5b3eb5a906c477 Matthew Brost 2025-03-05  377  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
c5b3eb5a906c477 Matthew Brost 2025-03-05  378  		}
c5b3eb5a906c477 Matthew Brost 2025-03-05  379  
c5b3eb5a906c477 Matthew Brost 2025-03-05  380  		/*
c5b3eb5a906c477 Matthew Brost 2025-03-05  381  		 * Mismatched physical address, 8M copy chunk, or last page -
c5b3eb5a906c477 Matthew Brost 2025-03-05  382  		 * trigger a copy.
c5b3eb5a906c477 Matthew Brost 2025-03-05  383  		 */
c5b3eb5a906c477 Matthew Brost 2025-03-05  384  		if (!match || chunk || last) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  385  			/*
c5b3eb5a906c477 Matthew Brost 2025-03-05  386  			 * Extra page for first copy if last page and matching
c5b3eb5a906c477 Matthew Brost 2025-03-05  387  			 * physical address.
c5b3eb5a906c477 Matthew Brost 2025-03-05  388  			 */
c5b3eb5a906c477 Matthew Brost 2025-03-05  389  			int incr = (match && last) ? 1 : 0;
c5b3eb5a906c477 Matthew Brost 2025-03-05  390  
c5b3eb5a906c477 Matthew Brost 2025-03-05  391  			if (vram_addr != XE_VRAM_ADDR_INVALID) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  392  				if (sram)
c5b3eb5a906c477 Matthew Brost 2025-03-05  393  					__fence = xe_migrate_from_vram(tile->migrate,
c5b3eb5a906c477 Matthew Brost 2025-03-05  394  								       i - pos + incr,
c5b3eb5a906c477 Matthew Brost 2025-03-05  395  								       vram_addr,
c5b3eb5a906c477 Matthew Brost 2025-03-05  396  								       dma_addr + pos);
c5b3eb5a906c477 Matthew Brost 2025-03-05  397  				else
c5b3eb5a906c477 Matthew Brost 2025-03-05  398  					__fence = xe_migrate_to_vram(tile->migrate,
c5b3eb5a906c477 Matthew Brost 2025-03-05  399  								     i - pos + incr,
c5b3eb5a906c477 Matthew Brost 2025-03-05  400  								     dma_addr + pos,
c5b3eb5a906c477 Matthew Brost 2025-03-05  401  								     vram_addr);
c5b3eb5a906c477 Matthew Brost 2025-03-05  402  				if (IS_ERR(__fence)) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  403  					err = PTR_ERR(__fence);
c5b3eb5a906c477 Matthew Brost 2025-03-05  404  					goto err_out;
c5b3eb5a906c477 Matthew Brost 2025-03-05  405  				}
c5b3eb5a906c477 Matthew Brost 2025-03-05  406  
c5b3eb5a906c477 Matthew Brost 2025-03-05  407  				dma_fence_put(fence);
c5b3eb5a906c477 Matthew Brost 2025-03-05  408  				fence = __fence;
c5b3eb5a906c477 Matthew Brost 2025-03-05  409  			}
c5b3eb5a906c477 Matthew Brost 2025-03-05  410  
c5b3eb5a906c477 Matthew Brost 2025-03-05  411  			/* Setup physical address of next device page */
c5b3eb5a906c477 Matthew Brost 2025-03-05  412  			if (dma_addr[i] && spage) {
c5b3eb5a906c477 Matthew Brost 2025-03-05 @413  				vram_addr = __vram_addr;
c5b3eb5a906c477 Matthew Brost 2025-03-05  414  				pos = i;
c5b3eb5a906c477 Matthew Brost 2025-03-05  415  			} else {
c5b3eb5a906c477 Matthew Brost 2025-03-05  416  				vram_addr = XE_VRAM_ADDR_INVALID;
c5b3eb5a906c477 Matthew Brost 2025-03-05  417  			}
c5b3eb5a906c477 Matthew Brost 2025-03-05  418  
c5b3eb5a906c477 Matthew Brost 2025-03-05  419  			/* Extra mismatched device page, copy it */
c5b3eb5a906c477 Matthew Brost 2025-03-05  420  			if (!match && last && vram_addr != XE_VRAM_ADDR_INVALID) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  421  				if (sram)
c5b3eb5a906c477 Matthew Brost 2025-03-05  422  					__fence = xe_migrate_from_vram(tile->migrate, 1,
c5b3eb5a906c477 Matthew Brost 2025-03-05  423  								       vram_addr,
c5b3eb5a906c477 Matthew Brost 2025-03-05  424  								       dma_addr + pos);
c5b3eb5a906c477 Matthew Brost 2025-03-05  425  				else
c5b3eb5a906c477 Matthew Brost 2025-03-05  426  					__fence = xe_migrate_to_vram(tile->migrate, 1,
c5b3eb5a906c477 Matthew Brost 2025-03-05  427  								     dma_addr + pos,
c5b3eb5a906c477 Matthew Brost 2025-03-05  428  								     vram_addr);
c5b3eb5a906c477 Matthew Brost 2025-03-05  429  				if (IS_ERR(__fence)) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  430  					err = PTR_ERR(__fence);
c5b3eb5a906c477 Matthew Brost 2025-03-05  431  					goto err_out;
c5b3eb5a906c477 Matthew Brost 2025-03-05  432  				}
c5b3eb5a906c477 Matthew Brost 2025-03-05  433  
c5b3eb5a906c477 Matthew Brost 2025-03-05  434  				dma_fence_put(fence);
c5b3eb5a906c477 Matthew Brost 2025-03-05  435  				fence = __fence;
c5b3eb5a906c477 Matthew Brost 2025-03-05  436  			}
c5b3eb5a906c477 Matthew Brost 2025-03-05  437  		}
c5b3eb5a906c477 Matthew Brost 2025-03-05  438  	}
c5b3eb5a906c477 Matthew Brost 2025-03-05  439  
c5b3eb5a906c477 Matthew Brost 2025-03-05  440  err_out:
c5b3eb5a906c477 Matthew Brost 2025-03-05  441  	/* Wait for all copies to complete */
c5b3eb5a906c477 Matthew Brost 2025-03-05  442  	if (fence) {
c5b3eb5a906c477 Matthew Brost 2025-03-05  443  		dma_fence_wait(fence, false);
c5b3eb5a906c477 Matthew Brost 2025-03-05  444  		dma_fence_put(fence);
c5b3eb5a906c477 Matthew Brost 2025-03-05  445  	}
c5b3eb5a906c477 Matthew Brost 2025-03-05  446  
c5b3eb5a906c477 Matthew Brost 2025-03-05  447  	return err;
c5b3eb5a906c477 Matthew Brost 2025-03-05  448  #undef XE_MIGRATE_CHUNK_SIZE
c5b3eb5a906c477 Matthew Brost 2025-03-05  449  #undef XE_VRAM_ADDR_INVALID
c5b3eb5a906c477 Matthew Brost 2025-03-05  450  }
c5b3eb5a906c477 Matthew Brost 2025-03-05  451  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

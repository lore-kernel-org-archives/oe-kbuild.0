Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD453D9DCB
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328957; cv=none; b=ZxVBTgeRlK6A2oWrGgfB1zA1OfGsQKwkZcD2BJ3t9vPRLzkOKBc+ycBk2T3z4SuVbslgD67fQXX/ysrGhMyon04mv3mImwdFJT0/rqh54eTM80AO4ARrVEH7+29xKyK8lHC/gCJnCKjgx6fYUDD7Hj67iJtogOGtLdfqhEu+ADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328957; c=relaxed/simple;
	bh=LMXyZYZyrlMAH/0Sj21JZCDqgnyQCpvjmIqso6EGldI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMRrUyNp3ngf9GVIvDgpKwLlFO6YXHeFXRtOcezgDdL22pXSUbzg32ufNb5A4AmeQdgL9wrmxF+fMRLX9KQ4KwYzHsS74h1nbVwCh0RYdVnFJHnCDu/u8IuAlv1ErMbr9jBBo7qYjI2/xk3c3hQFGxaPPJC0y0YF8tMdpkDGkBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IXgB9ZB9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IXgB9ZB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780328956; x=1811864956;
  h=date:from:to:cc:subject:message-id;
  bh=LMXyZYZyrlMAH/0Sj21JZCDqgnyQCpvjmIqso6EGldI=;
  b=IXgB9ZB906lKBal53R9pXUaSYFTijKGIKja7seuW8KGiuOF3+EHgSKX0
   EcdqABt8MAd+vuDMNYeha2YV+fCYgWcrrj4w9YmNazK3TXqRxbkOMt0XK
   1S6ZlsxTg2WqOi11bbwxZqY5BUUz5rxucZp1X+Tgg7ps3GT6CeUaDcVkN
   KhSr1G2YveQS7XREuMV/HlNdi78+F/Qi7gBObFygCApYZJ9+Yr0wOva64
   fXnmIVC7uDIlKapYnIPJm+U2zIEmGKHJSPvpcimYYvLhadzBKyfybjL2g
   goEA7zs2nD3afDSJUkTx5SWbu2N9ZqdsPM9aHbzzkYBTJUl7Mlocf8+CI
   A==;
X-CSE-ConnectionGUID: 8xuf68KgSRKGmnbGD2LBvQ==
X-CSE-MsgGUID: Gsvl8NzBQAa8t7qa/Lwb1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81150749"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81150749"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:49:15 -0700
X-CSE-ConnectionGUID: pJhEB8W+RAeEgv5nETQ9mg==
X-CSE-MsgGUID: OT0Ujw0LQbWOyfT5qawYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248704882"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jun 2026 08:49:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4t5-00000000Ajr-2uFV;
	Mon, 01 Jun 2026 15:49:11 +0000
Date: Mon, 01 Jun 2026 23:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/vma.c:2623 __mmap_region() error: we previously assumed
 'vma' could be null (see line 2616)
Message-ID: <202606012334.aYN8J33p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: c84bf6dd2b836b49bb2662668ff1692350d28236 mm: introduce new .mmap_prepare() file callback
date:   1 year, 1 month ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 1 month ago
config: sparc-randconfig-r071-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012334.aYN8J33p-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file callback")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606012334.aYN8J33p-lkp@intel.com/

smatch warnings:
mm/vma.c:2623 __mmap_region() error: we previously assumed 'vma' could be null (see line 2616)

vim +/vma +2623 mm/vma.c

c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2590  
f8d4a6cabb74f8 Lorenzo Stoakes 2025-01-02  2591  static unsigned long __mmap_region(struct file *file, unsigned long addr,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2592  		unsigned long len, vm_flags_t vm_flags, unsigned long pgoff,
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2593  		struct list_head *uf)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2594  {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2595  	struct mm_struct *mm = current->mm;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2596  	struct vm_area_struct *vma = NULL;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2597  	int error;
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2598  	bool have_mmap_prepare = file && file->f_op->mmap_prepare;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2599  	VMA_ITERATOR(vmi, mm, addr);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2600  	MMAP_STATE(map, mm, &vmi, addr, len, pgoff, vm_flags, file);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2601  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2602  	error = __mmap_prepare(&map, uf);
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2603  	if (!error && have_mmap_prepare)
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2604  		error = call_mmap_prepare(&map);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2605  	if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2606  		goto abort_munmap;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2607  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2608  	/* Attempt to merge with adjacent VMAs... */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2609  	if (map.prev || map.next) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2610  		VMG_MMAP_STATE(vmg, &map, /* vma = */ NULL);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2611  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2612  		vma = vma_merge_new_range(&vmg);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2613  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2614  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2615  	/* ...but if we can't, allocate a new VMA. */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25 @2616  	if (!vma) {
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2617  		error = __mmap_new_vma(&map, &vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2618  		if (error)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2619  			goto unacct_error;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2620  	}
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2621  
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2622  	if (have_mmap_prepare)
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09 @2623  		set_vma_user_defined_fields(vma, &map);
c84bf6dd2b836b Lorenzo Stoakes 2025-05-09  2624  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2625  	/* If flags changed, we might be able to merge, so try again. */
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2626  	if (map.retry_merge) {
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2627  		struct vm_area_struct *merged;
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2628  		VMG_MMAP_STATE(vmg, &map, vma);
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2629  
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2630  		vma_iter_config(map.vmi, map.addr, map.end);
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2631  		merged = vma_merge_existing_range(&vmg);
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2632  		if (merged)
42c4e4b20d9c46 Lorenzo Stoakes 2024-12-06  2633  			vma = merged;
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2634  	}
5ac87a885aecb3 Lorenzo Stoakes 2024-10-25  2635  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2636  	__mmap_complete(&map, vma);
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2637  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2638  	return addr;
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2639  
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2640  	/* Accounting was done by __mmap_prepare(). */
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2641  unacct_error:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2642  	if (map.charged)
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2643  		vm_unacct_memory(map.charged);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2644  abort_munmap:
0d11630cc50a62 Lorenzo Stoakes 2024-10-25  2645  	vms_abort_munmap_vmas(&map.vms, &map.mas_detach);
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2646  	return error;
52956b0d7fb92e Lorenzo Stoakes 2024-10-25  2647  }
7d344babac9984 Lorenzo Stoakes 2024-12-03  2648  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

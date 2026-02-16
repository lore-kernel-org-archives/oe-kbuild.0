Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECE72C027B
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227149; cv=none; b=Wqo36DxT1psMXxLfCWc7wgZrQmQBWCxN4e4KJ84Uo7CrjVnyNpW7NtvAjepY5Jw6GatQIgtne7KtC7hq+1Zg8ilWc+x3Jpd3HTGigNF3iSeEYdWFUqat9zLrHD7UxypWV+GkNxId5GkAnCf951ivNfTmqX2TYwly2QDr1oPzsWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227149; c=relaxed/simple;
	bh=lshu+OK+ua3PtfV+fN2BfAyg6mKTaQaJmBKrCIJxr4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cFs7AeFUEWpLnBzweIitY/9q+BCKx9SgtX9FA7kiJgJ6lkqNjiPdECaPycl+i+fcTVRs4pDEL1mLk5XaE94AODPOqTqLuI+eczor/5O49MInJEisjNzrNnfECLyKjQ9x/TDorHGCayPiY9qxYHMU+JiKny0CxJRi1W1YHljNrIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhQR51V6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhQR51V6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771227147; x=1802763147;
  h=date:from:to:cc:subject:message-id;
  bh=lshu+OK+ua3PtfV+fN2BfAyg6mKTaQaJmBKrCIJxr4g=;
  b=HhQR51V6o3dWciZBVQ5RKo30IusEurMpAY2ZyLwYN0gUbRQxfla0Ip9y
   ATJIeeAQu2oUjkKqRNWW+00qeE9qHTM6shTbnWjBZPLqDENdkTlx8zZ+u
   1BrlX3rUX44RNd0mKKt9ksDFdPa6QP4QaJRxxkTabXa4squv+Yug0Acad
   bnxqo6r9ihJBOVFxmhye28e4eFV2eGuo62cgH/kAshfOO6ub6tTC7Z9lD
   wXHveugmCQ+DFOFQ6H/0PwvWDnmHYA+3gkY55lSfRlyugk9Xo3lLLMMGw
   iXyk1KEjTEGVdJSALUsvoDjKQj1wdbhzlqBwfzFN6QHtXq2iIuYNYcFSm
   A==;
X-CSE-ConnectionGUID: rT3ymRE4RciwGmZKp6tbiA==
X-CSE-MsgGUID: QwfaBrzjTa+WWCo7bEshOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="89716231"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="89716231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 23:32:27 -0800
X-CSE-ConnectionGUID: M4+4ZXC/RjmdI7xyjFPjsg==
X-CSE-MsgGUID: L3cWU1F7R2yKgdk4aryC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="251188420"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Feb 2026 23:32:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrt5i-00000000zT2-3sTy;
	Mon, 16 Feb 2026 07:32:22 +0000
Date: Mon, 16 Feb 2026 15:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/vma.c:2623 __mmap_region() error: we previously assumed
 'vma' could be null (see line 2616)
Message-ID: <202602161545.m9DNNakq-lkp@intel.com>
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
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: c84bf6dd2b836b49bb2662668ff1692350d28236 mm: introduce new .mmap_prepare() file callback
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: um-randconfig-r071-20260215 (https://download.01.org/0day-ci/archive/20260216/202602161545.m9DNNakq-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602161545.m9DNNakq-lkp@intel.com/

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

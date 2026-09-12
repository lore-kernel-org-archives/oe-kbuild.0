Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871C33A9E2
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222968; cv=none; b=Mq1EBMFLW3Co0Hrzmj72WYf05ix+8BAAtxJDhKXlrAiMCcHgSrVps4a08MMdN+4HUO+BgkGIKRaFhw9KAcPLWnIEe4HxM2cyVQ8VgX5Bf/qk2A3m4p7RXooOIcsspfmVBQn0cd5uFVO5dC2cdil5vdcaD/bTSh7ZdUgIwAUNchA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222968; c=relaxed/simple;
	bh=pE81E6z07yPCB/GijDBHLLKQeGqf5CoGk0d0imIEVsc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uwdgPOfoqBzE9p9DS5S8km+BJ4pmxb6TtN77oJy6mhB9+aOUCrn0tux2MMXzcSEr4SOdJyotsn3sle2od60a8/O0wnyBN9MeqLAvi72nc0ukUxubjpnRxlAt4IxqSSu5leMufYnxu/0n+RABVg9fP15ov0klEXNWSM53LftaEQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FQAz0GZt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FQAz0GZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789222966; x=1820758966;
  h=date:from:to:cc:subject:message-id;
  bh=pE81E6z07yPCB/GijDBHLLKQeGqf5CoGk0d0imIEVsc=;
  b=FQAz0GZtdIHWy7RH5f9RlsGpClSnaZWcu5BirWlrulQESekm2ucOqDJT
   eaqYgM8zX3VIS+xFJhT1zfWV9u0+ZfEGfPqsGx8qnR2O+KWks5LqA0Bgf
   G2xUqmJX+wcYASvJDBYDfwX4sk2tdnN/g2FN1Eex11258Kt4g2IgxdyzJ
   ArL+2ypYYBLC9hupqAN8Oxgiw7RnbvbpA+8z4YpnX+nm1O1Jr3QMcY79l
   02H6hudRZ9JYP0sMfvJhiMIRcZMgXDG/faC3MxiA0F1n5U15lYyMZrhJE
   DBktGErXh/WYuYePMv1dwM8pWLhUtdCK3xz5FTpQ4mspktFc3J3FJlvWc
   Q==;
X-CSE-ConnectionGUID: 5PXyMmtkRpKJjRjr3X2LCw==
X-CSE-MsgGUID: rw7oBccdQeWvt/cYNJkcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="93484083"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="93484083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 07:22:45 -0700
X-CSE-ConnectionGUID: uA3AA4VmQh2/2poK+J0CpA==
X-CSE-MsgGUID: Ejmim5kyRMq8W2mUiZUHFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="268911128"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 12 Sep 2026 07:22:44 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Ocs-0000000018Z-0gdV;
	Sat, 12 Sep 2026 14:22:42 +0000
Date: Sat, 12 Sep 2026 16:22:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 381/400] mm/madvise.c:1001
 madvise_collapse() warn: variable dereferenced before check 'vma' (see line
 969)
Message-ID: <202609121604.osnEA06x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   e2e54005e20fb42d4a5e140d70a65be4a2363045
commit: 68911e99c4afb4ec69928136adfb19077c6f9b31 [381/400] mm/collapse: implement MADV_COLLAPSE in madvise.c
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-r073-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121604.osnEA06x-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609121604.osnEA06x-lkp@intel.com/

smatch warnings:
mm/madvise.c:1001 madvise_collapse() warn: variable dereferenced before check 'vma' (see line 969)

vim +/vma +1001 mm/madvise.c

68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   958) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   959) static int madvise_collapse(struct madvise_behavior *madv_behavior)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   960) {
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   961) 	struct madvise_behavior_range *range = &madv_behavior->range;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   962) 	struct vm_area_struct *vma = madv_behavior->vma;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   963) 	struct mm_struct *mm = madv_behavior->mm;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   964) 	struct collapse_control *cc;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   965) 	unsigned long hstart, hend, addr, orders;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   966) 	enum scan_result last_fail = SCAN_FAIL;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   967) 	int thps = 0;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   968) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  @969) 	BUG_ON(vma->vm_start > range->start);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   970) 	BUG_ON(vma->vm_end < range->end);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   971) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   972) 	orders = collapse_possible_orders(vma, vma->vm_flags,
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   973) 					  TVA_FORCED_COLLAPSE);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   974) 	if (!orders)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   975) 		return -EINVAL;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   976) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   977) 	hstart = ALIGN(range->start, HPAGE_PMD_SIZE);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   978) 	hend = ALIGN_DOWN(range->end, HPAGE_PMD_SIZE);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   979) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   980) 	if (hstart >= hend)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   981) 		return 0;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   982) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   983) 	cc = kmalloc_obj(*cc);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   984) 	if (!cc)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   985) 		return -ENOMEM;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   986) 	collapse_control_init(cc);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   987) 	collapse_policy_forced(&cc->policy);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   988) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   989) 	lru_add_drain_all();
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   990) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   991) 	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   992) 		struct vm_area_struct *found;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   993) 		enum scan_result result;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   994) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   995) 		/*
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   996) 		 * A collapse gives the lock up, so the VMA has to be found
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   997) 		 * again after one: it can shrink while nothing is held.  A scan
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   998) 		 * that finds nothing to collapse leaves the lock alone, so a
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10   999) 		 * range that is already collapsed walks on without relocking.
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1000) 		 */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10 @1001) 		if (!vma) {
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1002) 			cond_resched();
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1003) 			mmap_read_lock(mm);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1004) 			result = collapse_vma_revalidate(mm, addr, false, &found,
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1005) 							 cc, HPAGE_PMD_ORDER);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1006) 			if (result != SCAN_SUCCEED) {
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1007) 				last_fail = result;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1008) 				goto out_locked;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1009) 			}
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1010) 			vma = found;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1011) 			hend = min(hend, vma->vm_end & HPAGE_PMD_MASK);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1012) 			orders = collapse_possible_orders(vma, vma->vm_flags,
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1013) 							  cc->policy.tva_type);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1014) 		}
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1015) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1016) 		result = collapse_scan_pmd(vma, addr, cc, orders);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1017) 		/* Nothing to collapse here, and the lock is still ours */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1018) 		if (result != SCAN_SUCCEED)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1019) 			goto tally;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1020) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1021) 		/* The collapse takes its own locks, so give this up */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1022) 		mmap_read_unlock(mm);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1023) 		mark_mmap_lock_dropped(madv_behavior);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1024) 		vma = NULL;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1025) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1026) 		result = collapse_run_pmd(mm, addr, cc);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1027) tally:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1028) 		switch (result) {
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1029) 		case SCAN_SUCCEED:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1030) 		case SCAN_PMD_MAPPED:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1031) 			++thps;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1032) 			break;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1033) 		/* Whitelisted set of results where continuing OK */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1034) 		case SCAN_NO_PTE_TABLE:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1035) 		case SCAN_PTE_NON_PRESENT:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1036) 		case SCAN_PTE_UFFD:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1037) 		case SCAN_LACK_REFERENCED_PAGE:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1038) 		case SCAN_PAGE_NULL:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1039) 		case SCAN_PAGE_COUNT:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1040) 		case SCAN_PAGE_LOCK:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1041) 		case SCAN_PAGE_COMPOUND:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1042) 		case SCAN_PAGE_LRU:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1043) 		case SCAN_DEL_PAGE_LRU:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1044) 			last_fail = result;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1045) 			break;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1046) 		default:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1047) 			last_fail = result;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1048) 			/* Other error, exit */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1049) 			goto out;
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1050) 		}
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1051) 	}
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1052) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1053) out:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1054) 	/* Caller expects us to hold mmap_lock on return */
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1055) 	if (!vma)
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1056) 		mmap_read_lock(mm);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1057) out_locked:
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1058) 	mmap_assert_locked(mm);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1059) 	collapse_control_release(cc);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1060) 	kfree(cc);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1061) 
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1062) 	return thps == ((hend - hstart) >> HPAGE_PMD_SHIFT) ? 0
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1063) 			: madvise_collapse_errno(last_fail);
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1064) }
68911e99c4afb4 Kiryl Shutsemau (Meta  2026-09-10  1065) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

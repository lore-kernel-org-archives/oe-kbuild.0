Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0061BC4E
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128630; cv=none; b=XNKG9mpoh3ESSLo4iO95+0KZswpVdZEtZv0AD92VbC4qiPKA9tSxTIv8ZBohSFQhv+7sPEkVB7NskWC8mt8Ulo/ynMjLZYUDY/s3r8SEQBOk52WgdtdlaQ9tNFpOQVcaS/hblPX4JcHaGCzOtlhbgXDhIMAczAu9sgqpQwp+iFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128630; c=relaxed/simple;
	bh=PZF5KpWc6zld70BZM1dwgIkzlV1av1WsZlNMnwKMtHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=naplw8uv2fN2aiGl53sZSIDy9G6+L8m0Qlg3fXtNYyBgjuSr2g/8plsaQ8u107Q/BMS2TLo1AsZaOvHQxH4DFrCvlijldqTX49G0eMgbhKXtyezhFxYeFmeOJFP6D0F35pJC4+1nHQIzi/byjCI2Sz90EJwwLvSq34U1clwFvzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmuBE8X/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmuBE8X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766128628; x=1797664628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZF5KpWc6zld70BZM1dwgIkzlV1av1WsZlNMnwKMtHw=;
  b=CmuBE8X/RntdkEBZAzLPYYEDEk2CZ4pjleNALKGCndbJa7BCGwMow1IC
   pg3Ru2NejKPny0fd+Q8h5aqogZquXwpxhxDinQLvDDpWWZp+WSAoJvMIK
   /p5xZE6lRmjswtpcu8O+ROerAfbpZ9dWehgh0VD97ewD/fR9qms8MJx0r
   sGVB+ks5+YpNqCQpKIOXYB2/cmhFCTgt6Vc+i9sQrjfhwhEtGu7VrgHly
   GrUhMuGjpXo4/0vyaFvF2NOGsTCjlmYm0YTQOIo6EeCp8AdtzoUYNQxX9
   R4ncmBRbgnaJquek/Z7PqjlZESh2mcHjBuhM7YCKg1wi9hh1sOHySVwy0
   Q==;
X-CSE-ConnectionGUID: 1SYnLKjQTa2eDBsxubSXsA==
X-CSE-MsgGUID: CXcl8MppQhaJaEEwtRovIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78725741"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78725741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 23:17:03 -0800
X-CSE-ConnectionGUID: aA4WJjo9RyiuUMZQ+EMKwg==
X-CSE-MsgGUID: LbbshWarT9mw7vtWWTepVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198046773"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 23:17:01 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWUjT-000000003Cj-0ynn;
	Fri, 19 Dec 2025 07:16:59 +0000
Date: Fri, 19 Dec 2025 15:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1146/2671]
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c:178 send_tlb_inval_ppgtt() error:
 buffer overflow 'action' 7 <= 7
Message-ID: <202512191554.OfSzrFrY-lkp@intel.com>
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
TO: Brian Nguyen <brian3.nguyen@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 684965d96a918f78c3fbd3ef55444aa9cdd7c5f6 [1146/2671] drm/xe: Append page reclamation action to tlb inval
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251219/202512191554.OfSzrFrY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512191554.OfSzrFrY-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_guc_tlb_inval.c:178 send_tlb_inval_ppgtt() error: buffer overflow 'action' 7 <= 7

Old smatch warnings:
drivers/gpu/drm/xe/xe_guc_tlb_inval.c:179 send_tlb_inval_ppgtt() error: buffer overflow 'action' 7 <= 7

vim +/action +178 drivers/gpu/drm/xe/xe_guc_tlb_inval.c

db16f9d90c1d97a Matthew Brost 2025-08-26  117  
db16f9d90c1d97a Matthew Brost 2025-08-26  118  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
684965d96a918f7 Brian Nguyen  2025-12-13  119  				u64 start, u64 end, u32 asid,
684965d96a918f7 Brian Nguyen  2025-12-13  120  				struct drm_suballoc *prl_sa)
db16f9d90c1d97a Matthew Brost 2025-08-26  121  {
db16f9d90c1d97a Matthew Brost 2025-08-26  122  #define MAX_TLB_INVALIDATION_LEN	7
db16f9d90c1d97a Matthew Brost 2025-08-26  123  	struct xe_guc *guc = tlb_inval->private;
db16f9d90c1d97a Matthew Brost 2025-08-26  124  	struct xe_gt *gt = guc_to_gt(guc);
db16f9d90c1d97a Matthew Brost 2025-08-26  125  	u32 action[MAX_TLB_INVALIDATION_LEN];
db16f9d90c1d97a Matthew Brost 2025-08-26  126  	u64 length = end - start;
684965d96a918f7 Brian Nguyen  2025-12-13  127  	int len = 0, err;
db16f9d90c1d97a Matthew Brost 2025-08-26  128  
db16f9d90c1d97a Matthew Brost 2025-08-26  129  	if (guc_to_xe(guc)->info.force_execlist)
db16f9d90c1d97a Matthew Brost 2025-08-26  130  		return -ECANCELED;
db16f9d90c1d97a Matthew Brost 2025-08-26  131  
db16f9d90c1d97a Matthew Brost 2025-08-26  132  	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
684965d96a918f7 Brian Nguyen  2025-12-13  133  	action[len++] = !prl_sa ? seqno : TLB_INVALIDATION_SEQNO_INVALID;
db16f9d90c1d97a Matthew Brost 2025-08-26  134  	if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
db16f9d90c1d97a Matthew Brost 2025-08-26  135  	    length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
db16f9d90c1d97a Matthew Brost 2025-08-26  136  		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
db16f9d90c1d97a Matthew Brost 2025-08-26  137  	} else {
db16f9d90c1d97a Matthew Brost 2025-08-26  138  		u64 orig_start = start;
db16f9d90c1d97a Matthew Brost 2025-08-26  139  		u64 align;
db16f9d90c1d97a Matthew Brost 2025-08-26  140  
db16f9d90c1d97a Matthew Brost 2025-08-26  141  		if (length < SZ_4K)
db16f9d90c1d97a Matthew Brost 2025-08-26  142  			length = SZ_4K;
db16f9d90c1d97a Matthew Brost 2025-08-26  143  
db16f9d90c1d97a Matthew Brost 2025-08-26  144  		/*
db16f9d90c1d97a Matthew Brost 2025-08-26  145  		 * We need to invalidate a higher granularity if start address
db16f9d90c1d97a Matthew Brost 2025-08-26  146  		 * is not aligned to length. When start is not aligned with
db16f9d90c1d97a Matthew Brost 2025-08-26  147  		 * length we need to find the length large enough to create an
db16f9d90c1d97a Matthew Brost 2025-08-26  148  		 * address mask covering the required range.
db16f9d90c1d97a Matthew Brost 2025-08-26  149  		 */
db16f9d90c1d97a Matthew Brost 2025-08-26  150  		align = roundup_pow_of_two(length);
db16f9d90c1d97a Matthew Brost 2025-08-26  151  		start = ALIGN_DOWN(start, align);
db16f9d90c1d97a Matthew Brost 2025-08-26  152  		end = ALIGN(end, align);
db16f9d90c1d97a Matthew Brost 2025-08-26  153  		length = align;
db16f9d90c1d97a Matthew Brost 2025-08-26  154  		while (start + length < end) {
db16f9d90c1d97a Matthew Brost 2025-08-26  155  			length <<= 1;
db16f9d90c1d97a Matthew Brost 2025-08-26  156  			start = ALIGN_DOWN(orig_start, length);
db16f9d90c1d97a Matthew Brost 2025-08-26  157  		}
db16f9d90c1d97a Matthew Brost 2025-08-26  158  
db16f9d90c1d97a Matthew Brost 2025-08-26  159  		/*
db16f9d90c1d97a Matthew Brost 2025-08-26  160  		 * Minimum invalidation size for a 2MB page that the hardware
db16f9d90c1d97a Matthew Brost 2025-08-26  161  		 * expects is 16MB
db16f9d90c1d97a Matthew Brost 2025-08-26  162  		 */
db16f9d90c1d97a Matthew Brost 2025-08-26  163  		if (length >= SZ_2M) {
db16f9d90c1d97a Matthew Brost 2025-08-26  164  			length = max_t(u64, SZ_16M, length);
db16f9d90c1d97a Matthew Brost 2025-08-26  165  			start = ALIGN_DOWN(orig_start, length);
db16f9d90c1d97a Matthew Brost 2025-08-26  166  		}
db16f9d90c1d97a Matthew Brost 2025-08-26  167  
db16f9d90c1d97a Matthew Brost 2025-08-26  168  		xe_gt_assert(gt, length >= SZ_4K);
db16f9d90c1d97a Matthew Brost 2025-08-26  169  		xe_gt_assert(gt, is_power_of_2(length));
db16f9d90c1d97a Matthew Brost 2025-08-26  170  		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
db16f9d90c1d97a Matthew Brost 2025-08-26  171  						    ilog2(SZ_2M) + 1)));
db16f9d90c1d97a Matthew Brost 2025-08-26  172  		xe_gt_assert(gt, IS_ALIGNED(start, length));
db16f9d90c1d97a Matthew Brost 2025-08-26  173  
684965d96a918f7 Brian Nguyen  2025-12-13  174  		/* Flush on NULL case, Media is not required to modify flush due to no PPC so NOP */
684965d96a918f7 Brian Nguyen  2025-12-13  175  		action[len++] = MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE, !prl_sa);
db16f9d90c1d97a Matthew Brost 2025-08-26  176  		action[len++] = asid;
db16f9d90c1d97a Matthew Brost 2025-08-26  177  		action[len++] = lower_32_bits(start);
db16f9d90c1d97a Matthew Brost 2025-08-26 @178  		action[len++] = upper_32_bits(start);
db16f9d90c1d97a Matthew Brost 2025-08-26  179  		action[len++] = ilog2(length) - ilog2(SZ_4K);
db16f9d90c1d97a Matthew Brost 2025-08-26  180  	}
db16f9d90c1d97a Matthew Brost 2025-08-26  181  
db16f9d90c1d97a Matthew Brost 2025-08-26  182  	xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
db16f9d90c1d97a Matthew Brost 2025-08-26  183  
684965d96a918f7 Brian Nguyen  2025-12-13  184  	err = send_tlb_inval(guc, action, len);
684965d96a918f7 Brian Nguyen  2025-12-13  185  	if (!err && prl_sa)
684965d96a918f7 Brian Nguyen  2025-12-13  186  		err = send_page_reclaim(guc, seqno, xe_sa_bo_gpu_addr(prl_sa));
684965d96a918f7 Brian Nguyen  2025-12-13  187  	return err;
db16f9d90c1d97a Matthew Brost 2025-08-26  188  }
db16f9d90c1d97a Matthew Brost 2025-08-26  189  

:::::: The code at line 178 was first introduced by commit
:::::: db16f9d90c1d97a2b5483b4b856625875bffe860 drm/xe: Split TLB invalidation code in frontend and backend

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

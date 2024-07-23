Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8A2F32
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703434; cv=none; b=MZW9qT/xORkTvLmuJxBMrQwEbFeFNrhEcNgh7DV2iFl2iJrtXunWIwB63+cNGEXV0ABGDV+MO5yjmRMUJtBteCcKCumDmnJw2NvoCSl545SbTwwOh0K+vZACk7JMcNIxTCTlvou6Nddq2bTpmlxYeE3bpHQ/Z04VLfaSn+FvRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703434; c=relaxed/simple;
	bh=1ysLOxv7ewhY2f7fNUxuA1bqLEUDl7ew6wlFGGhNGc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3YQhQUVqxW4SsPwaiP3odxUuwuB5HWWWK1wyQxv46RXJILwHmALvdC4BFa175sF9KYSQQn91BSu9VCbvPYtvQkxM4o/VlnASNOzU2uUU8MSsycolI9jEHR/caGIbHaELNK6fKqwX6s6gM4y5i8KOKACubi5D7/6LueMJcxHOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxGm+pgY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxGm+pgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721703432; x=1753239432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ysLOxv7ewhY2f7fNUxuA1bqLEUDl7ew6wlFGGhNGc8=;
  b=TxGm+pgYWr6aeekGQXI4x6iiKrO+ta1KyPFRzMp9R2Nkfq+t9K/Czk0P
   P1GhZrCUEBKEX9jI6+fD8PvCkdHCHrjS2+lkLuzPFdtmQcvRdA3N8Mnu1
   Bm4VZCyda1ggMvlXFqfNj2x00oL2bTQBoaAuhtDS7ZZe4gxPIJYkeZeKj
   B228DHxA5yoWpEP1S9DWnbHUX4N7Pvjr+5ehhTm9mJoqm0Jlmw6/Iai75
   Ecez3NQlYCl9jvLJdvCOq9jQWryXVQL3qkYmjsVI9shkReRzsMu5MpSuN
   Ep2qMnqmIj008MmXSHCU7TpESu1g+OA9YjFM/isW2T/bdT4c+vpLdQMRq
   A==;
X-CSE-ConnectionGUID: SVc5dP/ZREq1iy9zy7nImg==
X-CSE-MsgGUID: ZdXbxgMoSR6IqwPedNMUEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30692146"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="30692146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:57:11 -0700
X-CSE-ConnectionGUID: XcJCG3H2Scu5+9SSZZydMQ==
X-CSE-MsgGUID: KYUMVoAESZylJKWydcOzOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="56376636"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2024 19:57:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW5i8-000la8-00;
	Tue, 23 Jul 2024 02:57:08 +0000
Date: Tue, 23 Jul 2024 10:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13298/13495]
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation()
 warn: variable dereferenced before check 'fence' (see line 178)
Message-ID: <202407231049.esig0Fkb-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthew Brost <matthew.brost@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dee7f101b64219f512bb2f842227bd04c14efe30
commit: 61ac035361ae555ee5a17a7667fe96afdde3d59a [13298/13495] drm/xe: Drop xe_gt_tlb_invalidation_wait
:::::: branch date: 21 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231049.esig0Fkb-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407231049.esig0Fkb-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:183 send_tlb_invalidation() warn: variable dereferenced before check 'fence' (see line 178)

Old smatch warnings:
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:204 send_tlb_invalidation() warn: variable dereferenced before check 'fence' (see line 178)

vim +/fence +183 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c

35c8a964398e1c Matthew Auld         2023-07-10  158  
fc108a8b759f52 Matthew Brost        2023-01-17  159  static int send_tlb_invalidation(struct xe_guc *guc,
332dd0116c82a7 Matthew Brost        2023-01-24  160  				 struct xe_gt_tlb_invalidation_fence *fence,
332dd0116c82a7 Matthew Brost        2023-01-24  161  				 u32 *action, int len)
a9351846d94568 Matthew Brost        2023-01-17  162  {
a9351846d94568 Matthew Brost        2023-01-17  163  	struct xe_gt *gt = guc_to_gt(guc);
501c4255c40935 Radhakrishna Sripada 2024-06-07  164  	struct xe_device *xe = gt_to_xe(gt);
a9351846d94568 Matthew Brost        2023-01-17  165  	int seqno;
a9351846d94568 Matthew Brost        2023-01-17  166  	int ret;
a9351846d94568 Matthew Brost        2023-01-17  167  
61ac035361ae55 Matthew Brost        2024-07-19  168  	xe_gt_assert(gt, fence);
61ac035361ae55 Matthew Brost        2024-07-19  169  
a9351846d94568 Matthew Brost        2023-01-17  170  	/*
a9351846d94568 Matthew Brost        2023-01-17  171  	 * XXX: The seqno algorithm relies on TLB invalidation being processed
a9351846d94568 Matthew Brost        2023-01-17  172  	 * in order which they currently are, if that changes the algorithm will
a9351846d94568 Matthew Brost        2023-01-17  173  	 * need to be updated.
a9351846d94568 Matthew Brost        2023-01-17  174  	 */
565ce72e1c2d54 Matthew Auld         2023-05-24  175  
a9351846d94568 Matthew Brost        2023-01-17  176  	mutex_lock(&guc->ct.lock);
62ad062150c2ab Matthew Brost        2023-01-17  177  	seqno = gt->tlb_invalidation.seqno;
fc108a8b759f52 Matthew Brost        2023-01-17 @178  	fence->seqno = seqno;
501c4255c40935 Radhakrishna Sripada 2024-06-07  179  	trace_xe_gt_tlb_invalidation_fence_send(xe, fence);
a9351846d94568 Matthew Brost        2023-01-17  180  	action[1] = seqno;
332dd0116c82a7 Matthew Brost        2023-01-24  181  	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
a9351846d94568 Matthew Brost        2023-01-17  182  				    G2H_LEN_DW_TLB_INVALIDATE, 1);
38224c00d9c284 Matthew Brost        2023-01-24 @183  	if (!ret && fence) {
35c8a964398e1c Matthew Auld         2023-07-10  184  		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
35c8a964398e1c Matthew Auld         2023-07-10  185  		/*
35c8a964398e1c Matthew Auld         2023-07-10  186  		 * We haven't actually published the TLB fence as per
35c8a964398e1c Matthew Auld         2023-07-10  187  		 * pending_fences, but in theory our seqno could have already
35c8a964398e1c Matthew Auld         2023-07-10  188  		 * been written as we acquired the pending_lock. In such a case
35c8a964398e1c Matthew Auld         2023-07-10  189  		 * we can just go ahead and signal the fence here.
35c8a964398e1c Matthew Auld         2023-07-10  190  		 */
35c8a964398e1c Matthew Auld         2023-07-10  191  		if (tlb_invalidation_seqno_past(gt, seqno)) {
501c4255c40935 Radhakrishna Sripada 2024-06-07  192  			__invalidation_fence_signal(xe, fence);
35c8a964398e1c Matthew Auld         2023-07-10  193  		} else {
38224c00d9c284 Matthew Brost        2023-01-24  194  			fence->invalidation_time = ktime_get();
35c8a964398e1c Matthew Auld         2023-07-10  195  			list_add_tail(&fence->link,
35c8a964398e1c Matthew Auld         2023-07-10  196  				      &gt->tlb_invalidation.pending_fences);
35c8a964398e1c Matthew Auld         2023-07-10  197  
35c8a964398e1c Matthew Auld         2023-07-10  198  			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
38224c00d9c284 Matthew Brost        2023-01-24  199  				queue_delayed_work(system_wq,
38224c00d9c284 Matthew Brost        2023-01-24  200  						   &gt->tlb_invalidation.fence_tdr,
eb523ec3826988 Nirmoy Das           2024-06-28  201  						   tlb_timeout_jiffies(gt));
38224c00d9c284 Matthew Brost        2023-01-24  202  		}
35c8a964398e1c Matthew Auld         2023-07-10  203  		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
35c8a964398e1c Matthew Auld         2023-07-10  204  	} else if (ret < 0 && fence) {
501c4255c40935 Radhakrishna Sripada 2024-06-07  205  		__invalidation_fence_signal(xe, fence);
35c8a964398e1c Matthew Auld         2023-07-10  206  	}
4803f6e26f1678 Matthew Auld         2023-07-10  207  	if (!ret) {
4803f6e26f1678 Matthew Auld         2023-07-10  208  		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
4803f6e26f1678 Matthew Auld         2023-07-10  209  			TLB_INVALIDATION_SEQNO_MAX;
4803f6e26f1678 Matthew Auld         2023-07-10  210  		if (!gt->tlb_invalidation.seqno)
4803f6e26f1678 Matthew Auld         2023-07-10  211  			gt->tlb_invalidation.seqno = 1;
4803f6e26f1678 Matthew Auld         2023-07-10  212  	}
a9351846d94568 Matthew Brost        2023-01-17  213  	mutex_unlock(&guc->ct.lock);
a9351846d94568 Matthew Brost        2023-01-17  214  
a9351846d94568 Matthew Brost        2023-01-17  215  	return ret;
a9351846d94568 Matthew Brost        2023-01-17  216  }
a9351846d94568 Matthew Brost        2023-01-17  217  

:::::: The code at line 183 was first introduced by commit
:::::: 38224c00d9c284030d60be83571e5f1bd5fc79c6 drm/xe: Add TDR for invalidation fence timeout cleanup

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

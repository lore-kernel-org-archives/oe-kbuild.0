Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8140A29
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710045837; cv=none; b=XnNG+Jq4x7RqwvkHaHRBeG7lQGofbFKHI/2nq5QxkzMFIyifaUbTXvhOCh7PXMumZfTMv2b158z9lzYF3AcamK7zei/gWApWbvosdMj9NWkKgGqQ/XdA5JzjwcoVfaDx1vMe5ODzar3Aye3EpVxELxBxC8tsBA6IYPWsiir++i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710045837; c=relaxed/simple;
	bh=qxMcSCTY4IAYVSqT+WQBKjcX0ncXXZkNg3Z78l6+mjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUF1R9ncvTqwQSK+Iv6VuoLYna9f64pF8R9TtGpjh6HwjTFRrwR/yj3xE5ZpvEkdnxJlTIvIybk0C+wN5XrSfaua3ANw4vvu/kkTE0K9q7+U2izQ/rAZoOgIA4TWSIc6JnUb2OAzXL+Gk8qYPHhgoQlzxaVufYBXRunZxa+NzsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KO7wH6RC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KO7wH6RC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710045835; x=1741581835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxMcSCTY4IAYVSqT+WQBKjcX0ncXXZkNg3Z78l6+mjg=;
  b=KO7wH6RCiaOKqT+EMpTsoSQCUDEjEz3gZ+KNebmW+K0seGTrJneV3rP8
   5mJfooXLsYiqDEENHnakVmw2x1sBKLJ9xOv7rFo3PuSE2Cs20YrNKSCkZ
   npO5lojDcD+wPzMkFwc/lNBanFHmmSpoFEdsv9zUZOPHJ+4fq2ivW6p3T
   431+RSoEFiULH6k5lqmgPAmfREe5zJIxrtua5MbzqHOY9ySB8ie4jCc7k
   gw6vgQYJ7GkDXY1tjr2A6AjCVT4ZBX/vXq6qXLcmjU5OwnJ+tkFIooniK
   1lMwcx1Zl9N28RJCdjHgwAH12vvuUjN79LreJuIytAHzofQkWulTxkW4F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4614900"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="4614900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 20:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="48299668"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Mar 2024 20:43:53 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjB2M-0007vj-1H;
	Sun, 10 Mar 2024 04:43:50 +0000
Date: Sun, 10 Mar 2024 12:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_migrate.c:1157:1-7: preceding lock on line 1097
Message-ID: <202403101220.D7bsaBHO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   005f6f34bd47eaa61d939a2727fc648e687b84c1
commit: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-102-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101220.D7bsaBHO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403101220.D7bsaBHO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_migrate.c:1157:1-7: preceding lock on line 1097

vim +1157 drivers/gpu/drm/xe/xe_migrate.c

dd08ebf6c3525a Matthew Brost 2023-03-30   976  
dd08ebf6c3525a Matthew Brost 2023-03-30   977  struct dma_fence *
dd08ebf6c3525a Matthew Brost 2023-03-30   978  xe_migrate_update_pgtables(struct xe_migrate *m,
dd08ebf6c3525a Matthew Brost 2023-03-30   979  			   struct xe_vm *vm,
dd08ebf6c3525a Matthew Brost 2023-03-30   980  			   struct xe_bo *bo,
dd08ebf6c3525a Matthew Brost 2023-03-30   981  			   struct xe_engine *eng,
dd08ebf6c3525a Matthew Brost 2023-03-30   982  			   const struct xe_vm_pgtable_update *updates,
dd08ebf6c3525a Matthew Brost 2023-03-30   983  			   u32 num_updates,
dd08ebf6c3525a Matthew Brost 2023-03-30   984  			   struct xe_sync_entry *syncs, u32 num_syncs,
dd08ebf6c3525a Matthew Brost 2023-03-30   985  			   struct xe_migrate_pt_update *pt_update)
dd08ebf6c3525a Matthew Brost 2023-03-30   986  {
dd08ebf6c3525a Matthew Brost 2023-03-30   987  	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
dd08ebf6c3525a Matthew Brost 2023-03-30   988  	struct xe_gt *gt = m->gt;
dd08ebf6c3525a Matthew Brost 2023-03-30   989  	struct xe_device *xe = gt_to_xe(gt);
dd08ebf6c3525a Matthew Brost 2023-03-30   990  	struct xe_sched_job *job;
dd08ebf6c3525a Matthew Brost 2023-03-30   991  	struct dma_fence *fence;
dd08ebf6c3525a Matthew Brost 2023-03-30   992  	struct drm_suballoc *sa_bo = NULL;
dd08ebf6c3525a Matthew Brost 2023-03-30   993  	struct xe_vma *vma = pt_update->vma;
dd08ebf6c3525a Matthew Brost 2023-03-30   994  	struct xe_bb *bb;
dd08ebf6c3525a Matthew Brost 2023-03-30   995  	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
dd08ebf6c3525a Matthew Brost 2023-03-30   996  	u64 addr;
dd08ebf6c3525a Matthew Brost 2023-03-30   997  	int err = 0;
dd08ebf6c3525a Matthew Brost 2023-03-30   998  	bool usm = !eng && xe->info.supports_usm;
dd08ebf6c3525a Matthew Brost 2023-03-30   999  	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
dd08ebf6c3525a Matthew Brost 2023-03-30  1000  
dd08ebf6c3525a Matthew Brost 2023-03-30  1001  	/* Use the CPU if no in syncs and engine is idle */
dd08ebf6c3525a Matthew Brost 2023-03-30  1002  	if (no_in_syncs(syncs, num_syncs) && engine_is_idle(eng)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1003  		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
dd08ebf6c3525a Matthew Brost 2023-03-30  1004  							num_updates,
dd08ebf6c3525a Matthew Brost 2023-03-30  1005  							first_munmap_rebind,
dd08ebf6c3525a Matthew Brost 2023-03-30  1006  							pt_update);
dd08ebf6c3525a Matthew Brost 2023-03-30  1007  		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
dd08ebf6c3525a Matthew Brost 2023-03-30  1008  			return fence;
dd08ebf6c3525a Matthew Brost 2023-03-30  1009  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1010  
dd08ebf6c3525a Matthew Brost 2023-03-30  1011  	/* fixed + PTE entries */
dd08ebf6c3525a Matthew Brost 2023-03-30  1012  	if (IS_DGFX(xe))
dd08ebf6c3525a Matthew Brost 2023-03-30  1013  		batch_size = 2;
dd08ebf6c3525a Matthew Brost 2023-03-30  1014  	else
dd08ebf6c3525a Matthew Brost 2023-03-30  1015  		batch_size = 6 + num_updates * 2;
dd08ebf6c3525a Matthew Brost 2023-03-30  1016  
dd08ebf6c3525a Matthew Brost 2023-03-30  1017  	for (i = 0; i < num_updates; i++) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1018  		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, 0x1ff);
dd08ebf6c3525a Matthew Brost 2023-03-30  1019  
dd08ebf6c3525a Matthew Brost 2023-03-30  1020  		/* align noop + MI_STORE_DATA_IMM cmd prefix */
dd08ebf6c3525a Matthew Brost 2023-03-30  1021  		batch_size += 4 * num_cmds + updates[i].qwords * 2;
dd08ebf6c3525a Matthew Brost 2023-03-30  1022  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1023  
dd08ebf6c3525a Matthew Brost 2023-03-30  1024  	/*
dd08ebf6c3525a Matthew Brost 2023-03-30  1025  	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
dd08ebf6c3525a Matthew Brost 2023-03-30  1026  	 *
dd08ebf6c3525a Matthew Brost 2023-03-30  1027  	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
dd08ebf6c3525a Matthew Brost 2023-03-30  1028  	 * Should be reasonably bound..
dd08ebf6c3525a Matthew Brost 2023-03-30  1029  	 */
dd08ebf6c3525a Matthew Brost 2023-03-30  1030  	XE_BUG_ON(batch_size >= SZ_128K);
dd08ebf6c3525a Matthew Brost 2023-03-30  1031  
dd08ebf6c3525a Matthew Brost 2023-03-30  1032  	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
dd08ebf6c3525a Matthew Brost 2023-03-30  1033  	if (IS_ERR(bb))
dd08ebf6c3525a Matthew Brost 2023-03-30  1034  		return ERR_CAST(bb);
dd08ebf6c3525a Matthew Brost 2023-03-30  1035  
dd08ebf6c3525a Matthew Brost 2023-03-30  1036  	/* For sysmem PTE's, need to map them in our hole.. */
dd08ebf6c3525a Matthew Brost 2023-03-30  1037  	if (!IS_DGFX(xe)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1038  		ppgtt_ofs = NUM_KERNEL_PDE - 1;
dd08ebf6c3525a Matthew Brost 2023-03-30  1039  		if (eng) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1040  			XE_BUG_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
dd08ebf6c3525a Matthew Brost 2023-03-30  1041  
dd08ebf6c3525a Matthew Brost 2023-03-30  1042  			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
dd08ebf6c3525a Matthew Brost 2023-03-30  1043  						 GFP_KERNEL, true, 0);
dd08ebf6c3525a Matthew Brost 2023-03-30  1044  			if (IS_ERR(sa_bo)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1045  				err = PTR_ERR(sa_bo);
dd08ebf6c3525a Matthew Brost 2023-03-30  1046  				goto err;
dd08ebf6c3525a Matthew Brost 2023-03-30  1047  			}
dd08ebf6c3525a Matthew Brost 2023-03-30  1048  
dd08ebf6c3525a Matthew Brost 2023-03-30  1049  			ppgtt_ofs = NUM_KERNEL_PDE +
dd08ebf6c3525a Matthew Brost 2023-03-30  1050  				(drm_suballoc_soffset(sa_bo) /
dd08ebf6c3525a Matthew Brost 2023-03-30  1051  				 NUM_VMUSA_UNIT_PER_PAGE);
dd08ebf6c3525a Matthew Brost 2023-03-30  1052  			page_ofs = (drm_suballoc_soffset(sa_bo) %
dd08ebf6c3525a Matthew Brost 2023-03-30  1053  				    NUM_VMUSA_UNIT_PER_PAGE) *
dd08ebf6c3525a Matthew Brost 2023-03-30  1054  				VM_SA_UPDATE_UNIT_SIZE;
dd08ebf6c3525a Matthew Brost 2023-03-30  1055  		}
dd08ebf6c3525a Matthew Brost 2023-03-30  1056  
dd08ebf6c3525a Matthew Brost 2023-03-30  1057  		/* Preemption is enabled again by the ring ops. */
dd08ebf6c3525a Matthew Brost 2023-03-30  1058  		emit_arb_clear(bb);
dd08ebf6c3525a Matthew Brost 2023-03-30  1059  
dd08ebf6c3525a Matthew Brost 2023-03-30  1060  		/* Map our PT's to gtt */
dd08ebf6c3525a Matthew Brost 2023-03-30  1061  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
dd08ebf6c3525a Matthew Brost 2023-03-30  1062  			(num_updates * 2 + 1);
dd08ebf6c3525a Matthew Brost 2023-03-30  1063  		bb->cs[bb->len++] = ppgtt_ofs * GEN8_PAGE_SIZE + page_ofs;
dd08ebf6c3525a Matthew Brost 2023-03-30  1064  		bb->cs[bb->len++] = 0; /* upper_32_bits */
dd08ebf6c3525a Matthew Brost 2023-03-30  1065  
dd08ebf6c3525a Matthew Brost 2023-03-30  1066  		for (i = 0; i < num_updates; i++) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1067  			struct xe_bo *pt_bo = updates[i].pt_bo;
dd08ebf6c3525a Matthew Brost 2023-03-30  1068  
dd08ebf6c3525a Matthew Brost 2023-03-30  1069  			BUG_ON(pt_bo->size != SZ_4K);
dd08ebf6c3525a Matthew Brost 2023-03-30  1070  
dd08ebf6c3525a Matthew Brost 2023-03-30  1071  			addr = gen8_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB,
dd08ebf6c3525a Matthew Brost 2023-03-30  1072  					       0, 0);
dd08ebf6c3525a Matthew Brost 2023-03-30  1073  			bb->cs[bb->len++] = lower_32_bits(addr);
dd08ebf6c3525a Matthew Brost 2023-03-30  1074  			bb->cs[bb->len++] = upper_32_bits(addr);
dd08ebf6c3525a Matthew Brost 2023-03-30  1075  		}
dd08ebf6c3525a Matthew Brost 2023-03-30  1076  
dd08ebf6c3525a Matthew Brost 2023-03-30  1077  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
dd08ebf6c3525a Matthew Brost 2023-03-30  1078  		update_idx = bb->len;
dd08ebf6c3525a Matthew Brost 2023-03-30  1079  
dd08ebf6c3525a Matthew Brost 2023-03-30  1080  		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
dd08ebf6c3525a Matthew Brost 2023-03-30  1081  			(page_ofs / sizeof(u64)) * GEN8_PAGE_SIZE;
dd08ebf6c3525a Matthew Brost 2023-03-30  1082  		for (i = 0; i < num_updates; i++)
dd08ebf6c3525a Matthew Brost 2023-03-30  1083  			write_pgtable(m->gt, bb, addr + i * GEN8_PAGE_SIZE,
dd08ebf6c3525a Matthew Brost 2023-03-30  1084  				      &updates[i], pt_update);
dd08ebf6c3525a Matthew Brost 2023-03-30  1085  	} else {
dd08ebf6c3525a Matthew Brost 2023-03-30  1086  		/* phys pages, no preamble required */
dd08ebf6c3525a Matthew Brost 2023-03-30  1087  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
dd08ebf6c3525a Matthew Brost 2023-03-30  1088  		update_idx = bb->len;
dd08ebf6c3525a Matthew Brost 2023-03-30  1089  
dd08ebf6c3525a Matthew Brost 2023-03-30  1090  		/* Preemption is enabled again by the ring ops. */
dd08ebf6c3525a Matthew Brost 2023-03-30  1091  		emit_arb_clear(bb);
dd08ebf6c3525a Matthew Brost 2023-03-30  1092  		for (i = 0; i < num_updates; i++)
dd08ebf6c3525a Matthew Brost 2023-03-30  1093  			write_pgtable(m->gt, bb, 0, &updates[i], pt_update);
dd08ebf6c3525a Matthew Brost 2023-03-30  1094  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1095  
dd08ebf6c3525a Matthew Brost 2023-03-30  1096  	if (!eng)
dd08ebf6c3525a Matthew Brost 2023-03-30 @1097  		mutex_lock(&m->job_mutex);
dd08ebf6c3525a Matthew Brost 2023-03-30  1098  
dd08ebf6c3525a Matthew Brost 2023-03-30  1099  	job = xe_bb_create_migration_job(eng ?: m->eng, bb,
dd08ebf6c3525a Matthew Brost 2023-03-30  1100  					 xe_migrate_batch_base(m, usm),
dd08ebf6c3525a Matthew Brost 2023-03-30  1101  					 update_idx);
dd08ebf6c3525a Matthew Brost 2023-03-30  1102  	if (IS_ERR(job)) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1103  		err = PTR_ERR(job);
dd08ebf6c3525a Matthew Brost 2023-03-30  1104  		goto err_bb;
dd08ebf6c3525a Matthew Brost 2023-03-30  1105  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1106  
dd08ebf6c3525a Matthew Brost 2023-03-30  1107  	/* Wait on BO move */
dd08ebf6c3525a Matthew Brost 2023-03-30  1108  	if (bo) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1109  		err = job_add_deps(job, bo->ttm.base.resv,
dd08ebf6c3525a Matthew Brost 2023-03-30  1110  				   DMA_RESV_USAGE_KERNEL);
dd08ebf6c3525a Matthew Brost 2023-03-30  1111  		if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1112  			goto err_job;
dd08ebf6c3525a Matthew Brost 2023-03-30  1113  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1114  
dd08ebf6c3525a Matthew Brost 2023-03-30  1115  	/*
dd08ebf6c3525a Matthew Brost 2023-03-30  1116  	 * Munmap style VM unbind, need to wait for all jobs to be complete /
dd08ebf6c3525a Matthew Brost 2023-03-30  1117  	 * trigger preempts before moving forward
dd08ebf6c3525a Matthew Brost 2023-03-30  1118  	 */
dd08ebf6c3525a Matthew Brost 2023-03-30  1119  	if (first_munmap_rebind) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1120  		err = job_add_deps(job, &vm->resv,
dd08ebf6c3525a Matthew Brost 2023-03-30  1121  				   DMA_RESV_USAGE_BOOKKEEP);
dd08ebf6c3525a Matthew Brost 2023-03-30  1122  		if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1123  			goto err_job;
dd08ebf6c3525a Matthew Brost 2023-03-30  1124  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1125  
dd08ebf6c3525a Matthew Brost 2023-03-30  1126  	for (i = 0; !err && i < num_syncs; i++)
dd08ebf6c3525a Matthew Brost 2023-03-30  1127  		err = xe_sync_entry_add_deps(&syncs[i], job);
dd08ebf6c3525a Matthew Brost 2023-03-30  1128  
dd08ebf6c3525a Matthew Brost 2023-03-30  1129  	if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1130  		goto err_job;
dd08ebf6c3525a Matthew Brost 2023-03-30  1131  
dd08ebf6c3525a Matthew Brost 2023-03-30  1132  	if (ops->pre_commit) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1133  		err = ops->pre_commit(pt_update);
dd08ebf6c3525a Matthew Brost 2023-03-30  1134  		if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1135  			goto err_job;
dd08ebf6c3525a Matthew Brost 2023-03-30  1136  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1137  	xe_sched_job_arm(job);
dd08ebf6c3525a Matthew Brost 2023-03-30  1138  	fence = dma_fence_get(&job->drm.s_fence->finished);
dd08ebf6c3525a Matthew Brost 2023-03-30  1139  	xe_sched_job_push(job);
dd08ebf6c3525a Matthew Brost 2023-03-30  1140  
dd08ebf6c3525a Matthew Brost 2023-03-30  1141  	if (!eng)
dd08ebf6c3525a Matthew Brost 2023-03-30  1142  		mutex_unlock(&m->job_mutex);
dd08ebf6c3525a Matthew Brost 2023-03-30  1143  
dd08ebf6c3525a Matthew Brost 2023-03-30  1144  	xe_bb_free(bb, fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  1145  	drm_suballoc_free(sa_bo, fence);
dd08ebf6c3525a Matthew Brost 2023-03-30  1146  
dd08ebf6c3525a Matthew Brost 2023-03-30  1147  	return fence;
dd08ebf6c3525a Matthew Brost 2023-03-30  1148  
dd08ebf6c3525a Matthew Brost 2023-03-30  1149  err_job:
dd08ebf6c3525a Matthew Brost 2023-03-30  1150  	xe_sched_job_put(job);
dd08ebf6c3525a Matthew Brost 2023-03-30  1151  err_bb:
dd08ebf6c3525a Matthew Brost 2023-03-30  1152  	if (!eng)
dd08ebf6c3525a Matthew Brost 2023-03-30  1153  		mutex_unlock(&m->job_mutex);
dd08ebf6c3525a Matthew Brost 2023-03-30  1154  	xe_bb_free(bb, NULL);
dd08ebf6c3525a Matthew Brost 2023-03-30  1155  err:
dd08ebf6c3525a Matthew Brost 2023-03-30  1156  	drm_suballoc_free(sa_bo, NULL);
dd08ebf6c3525a Matthew Brost 2023-03-30 @1157  	return ERR_PTR(err);
dd08ebf6c3525a Matthew Brost 2023-03-30  1158  }
dd08ebf6c3525a Matthew Brost 2023-03-30  1159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

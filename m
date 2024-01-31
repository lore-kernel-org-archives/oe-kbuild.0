Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD578685
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691754; cv=none; b=fMt+eEJ7xzDkmoeu4NWVJsIVzfb0KwAd81qR37/yKvzFV/4lykzmRP5bkcGMuU1qVoT6/uJxrayeSVZ6ekzPWK23wN15g2O8Xb5lPupkfOT/vvEfTRqA6TxOHur70SYsdwik7tDp0jKWgfI65REVuWqUUXbIcDlIK0N5E+ibql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691754; c=relaxed/simple;
	bh=IXp4bSIyj1ag+ZjVbxllF/mCsJV/EmkcsR7rZ3B3jHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O70BYf6zDwkBPbAwwyk6JEhDJQ56o6bfGOUlX+B55js34GgsbLDO/fiXQ648u5VlmVLDiqqMK6rLpEiMYU/sJidtBKi8N7NNQ5fYNyQ4YVgHWJJlNWuSybTg7dKxeZT8LmAz7K051tY3m7NhALAnoVfvTzhxvOEqbeSbhVwz2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M14ADWab; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M14ADWab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706691752; x=1738227752;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IXp4bSIyj1ag+ZjVbxllF/mCsJV/EmkcsR7rZ3B3jHM=;
  b=M14ADWabv5gF2Hj0xRMOyW3m0AXYwLFj6BOrDjAguhV8L9JMlfEzQiv1
   g55aJo/ZEAKe5pAfangF3r6qhn9qv+kbR7oD0SJKqDp0kI7JluCdroqdw
   k9OeqMAxUe9d8hmiFjgxAKqoGEpER6HwNH2TOoLNqY1lBg1BqXzoLoDGM
   2ZhEY5XcAl8K6NQ/RY82MIj0B7rxzM3iQinvxzRq3MiG2IO4tYLgCRBMS
   YzxQWE5U6FRPIP6oMogfcUQ6wRTKT6gs3OUNQSX1ux8BEoyMLvHiiVCVo
   TM2puczsj8ZVOpLIwK9YxN5JyTEOEEuYxClA7g924lhAgF361RrQPiKRl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10641619"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10641619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="22720033"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2024 01:02:29 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV6UA-0001ME-2X;
	Wed, 31 Jan 2024 09:02:24 +0000
Date: Wed, 31 Jan 2024 17:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/5] drm/xe: store bind time pat index to xe_bo
Message-ID: <202401311604.1pLlAxeK-lkp@intel.com>
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
In-Reply-To: <20240126210807.320671-4-juhapekka.heikkila@gmail.com>
References: <20240126210807.320671-4-juhapekka.heikkila@gmail.com>
TO: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org

Hi Juha-Pekka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.8-rc2 next-20240131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juha-Pekka-Heikkila/drm-xe-pat-annotate-pat-index-table-with-compression-information/20240127-091231
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240126210807.320671-4-juhapekka.heikkila%40gmail.com
patch subject: [PATCH 3/5] drm/xe: store bind time pat index to xe_bo
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc-randconfig-r081-20240128 (https://download.01.org/0day-ci/archive/20240131/202401311604.1pLlAxeK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401311604.1pLlAxeK-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:1265 __xe_pt_bind_vma() warn: possible memory leak of 'ifence'
drivers/gpu/drm/xe/xe_pt.c:1265 __xe_pt_bind_vma() warn: possible memory leak of 'rfence'
drivers/gpu/drm/xe/xe_pt.c:1305 __xe_pt_bind_vma() error: we previously assumed 'bo' could be null (see line 1262)

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:605 xe_pt_stage_bind() warn: variable dereferenced before check 'vma' (see line 584)
drivers/gpu/drm/xe/xe_pt.c:615 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 585)

vim +/ifence +1265 drivers/gpu/drm/xe/xe_pt.c

fd84041d094ce8 Matthew Brost       2023-07-19  1169  
dd08ebf6c3525a Matthew Brost       2023-03-30  1170  /**
dd08ebf6c3525a Matthew Brost       2023-03-30  1171   * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
dd08ebf6c3525a Matthew Brost       2023-03-30  1172   * address range.
876611c2b75689 Matt Roper          2023-06-01  1173   * @tile: The tile to bind for.
dd08ebf6c3525a Matthew Brost       2023-03-30  1174   * @vma: The vma to bind.
9b9529ce379a08 Francois Dugast     2023-07-31  1175   * @q: The exec_queue with which to do pipelined page-table updates.
dd08ebf6c3525a Matthew Brost       2023-03-30  1176   * @syncs: Entries to sync on before binding the built tree to the live vm tree.
dd08ebf6c3525a Matthew Brost       2023-03-30  1177   * @num_syncs: Number of @sync entries.
dd08ebf6c3525a Matthew Brost       2023-03-30  1178   * @rebind: Whether we're rebinding this vma to the same address range without
dd08ebf6c3525a Matthew Brost       2023-03-30  1179   * an unbind in-between.
dd08ebf6c3525a Matthew Brost       2023-03-30  1180   *
dd08ebf6c3525a Matthew Brost       2023-03-30  1181   * This function builds a page-table tree (see xe_pt_stage_bind() for more
dd08ebf6c3525a Matthew Brost       2023-03-30  1182   * information on page-table building), and the xe_vm_pgtable_update entries
dd08ebf6c3525a Matthew Brost       2023-03-30  1183   * abstracting the operations needed to attach it to the main vm tree. It
dd08ebf6c3525a Matthew Brost       2023-03-30  1184   * then takes the relevant locks and updates the metadata side of the main
dd08ebf6c3525a Matthew Brost       2023-03-30  1185   * vm tree and submits the operations for pipelined attachment of the
dd08ebf6c3525a Matthew Brost       2023-03-30  1186   * gpu page-table to the vm main tree, (which can be done either by the
dd08ebf6c3525a Matthew Brost       2023-03-30  1187   * cpu and the GPU).
dd08ebf6c3525a Matthew Brost       2023-03-30  1188   *
dd08ebf6c3525a Matthew Brost       2023-03-30  1189   * Return: A valid dma-fence representing the pipelined attachment operation
dd08ebf6c3525a Matthew Brost       2023-03-30  1190   * on success, an error pointer on error.
dd08ebf6c3525a Matthew Brost       2023-03-30  1191   */
dd08ebf6c3525a Matthew Brost       2023-03-30  1192  struct dma_fence *
9b9529ce379a08 Francois Dugast     2023-07-31  1193  __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
dd08ebf6c3525a Matthew Brost       2023-03-30  1194  		 struct xe_sync_entry *syncs, u32 num_syncs,
dd08ebf6c3525a Matthew Brost       2023-03-30  1195  		 bool rebind)
dd08ebf6c3525a Matthew Brost       2023-03-30  1196  {
dd08ebf6c3525a Matthew Brost       2023-03-30  1197  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
dd08ebf6c3525a Matthew Brost       2023-03-30  1198  	struct xe_pt_migrate_pt_update bind_pt_update = {
dd08ebf6c3525a Matthew Brost       2023-03-30  1199  		.base = {
dd08ebf6c3525a Matthew Brost       2023-03-30  1200  			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
dd08ebf6c3525a Matthew Brost       2023-03-30  1201  			.vma = vma,
fd84041d094ce8 Matthew Brost       2023-07-19  1202  			.tile_id = tile->id,
dd08ebf6c3525a Matthew Brost       2023-03-30  1203  		},
dd08ebf6c3525a Matthew Brost       2023-03-30  1204  		.bind = true,
dd08ebf6c3525a Matthew Brost       2023-03-30  1205  	};
21ed3327e388c2 Matthew Brost       2023-06-22  1206  	struct xe_vm *vm = xe_vma_vm(vma);
dd08ebf6c3525a Matthew Brost       2023-03-30  1207  	u32 num_entries;
dd08ebf6c3525a Matthew Brost       2023-03-30  1208  	struct dma_fence *fence;
5387e865d90e92 Matthew Brost       2023-01-27  1209  	struct invalidation_fence *ifence = NULL;
fd84041d094ce8 Matthew Brost       2023-07-19  1210  	struct xe_range_fence *rfence;
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1211  	struct xe_bo *bo = xe_vma_bo(vma);
dd08ebf6c3525a Matthew Brost       2023-03-30  1212  	int err;
dd08ebf6c3525a Matthew Brost       2023-03-30  1213  
dd08ebf6c3525a Matthew Brost       2023-03-30  1214  	bind_pt_update.locked = false;
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1215  	xe_bo_assert_held(bo);
dd08ebf6c3525a Matthew Brost       2023-03-30  1216  	xe_vm_assert_held(vm);
dd08ebf6c3525a Matthew Brost       2023-03-30  1217  
21ed3327e388c2 Matthew Brost       2023-06-22  1218  	vm_dbg(&xe_vma_vm(vma)->xe->drm,
dd08ebf6c3525a Matthew Brost       2023-03-30  1219  	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
0e1a234618a86c Paulo Zanoni        2023-09-29  1220  	       xe_vma_start(vma), xe_vma_end(vma), q);
dd08ebf6c3525a Matthew Brost       2023-03-30  1221  
876611c2b75689 Matt Roper          2023-06-01  1222  	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
dd08ebf6c3525a Matthew Brost       2023-03-30  1223  	if (err)
dd08ebf6c3525a Matthew Brost       2023-03-30  1224  		goto err;
c73acc1eeba5e3 Francois Dugast     2023-09-12  1225  	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
dd08ebf6c3525a Matthew Brost       2023-03-30  1226  
876611c2b75689 Matt Roper          2023-06-01  1227  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
fd84041d094ce8 Matthew Brost       2023-07-19  1228  	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
fd84041d094ce8 Matthew Brost       2023-07-19  1229  				   num_entries);
dd08ebf6c3525a Matthew Brost       2023-03-30  1230  
85dbfe47d07cdd Thomas Hellström    2023-06-05  1231  	/*
85dbfe47d07cdd Thomas Hellström    2023-06-05  1232  	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
85dbfe47d07cdd Thomas Hellström    2023-06-05  1233  	 * cached PTEs point to freed memory. on LR vms this is done
85dbfe47d07cdd Thomas Hellström    2023-06-05  1234  	 * automatically when the context is re-enabled by the rebind worker,
85dbfe47d07cdd Thomas Hellström    2023-06-05  1235  	 * or in fault mode it was invalidated on PTE zapping.
85dbfe47d07cdd Thomas Hellström    2023-06-05  1236  	 *
85dbfe47d07cdd Thomas Hellström    2023-06-05  1237  	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
85dbfe47d07cdd Thomas Hellström    2023-06-05  1238  	 * PTE is already cached in the TLB so it needs to be invalidated.
85dbfe47d07cdd Thomas Hellström    2023-06-05  1239  	 * on !LR VMs this is done in the ring ops preceding a batch, but on
85dbfe47d07cdd Thomas Hellström    2023-06-05  1240  	 * non-faulting LR, in particular on user-space batch buffer chaining,
85dbfe47d07cdd Thomas Hellström    2023-06-05  1241  	 * it needs to be done here.
85dbfe47d07cdd Thomas Hellström    2023-06-05  1242  	 */
fdb6a05383fab3 Thomas Hellström    2023-11-27  1243  	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
06951c2ee72df2 Thomas Hellström    2023-12-09  1244  	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
5387e865d90e92 Matthew Brost       2023-01-27  1245  		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
5387e865d90e92 Matthew Brost       2023-01-27  1246  		if (!ifence)
5387e865d90e92 Matthew Brost       2023-01-27  1247  			return ERR_PTR(-ENOMEM);
5387e865d90e92 Matthew Brost       2023-01-27  1248  	}
5387e865d90e92 Matthew Brost       2023-01-27  1249  
fd84041d094ce8 Matthew Brost       2023-07-19  1250  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
fd84041d094ce8 Matthew Brost       2023-07-19  1251  	if (!rfence) {
fd84041d094ce8 Matthew Brost       2023-07-19  1252  		kfree(ifence);
fd84041d094ce8 Matthew Brost       2023-07-19  1253  		return ERR_PTR(-ENOMEM);
fd84041d094ce8 Matthew Brost       2023-07-19  1254  	}
fd84041d094ce8 Matthew Brost       2023-07-19  1255  
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1256  	/*
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1257  	 * BO which has XE_BO_SCANOUT_BIT set and was pinned as framebuffer
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1258  	 * before with different PAT index cannot be bound with different PAT
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1259  	 * index. This is to prevent switching CCS on/off from framebuffers
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1260  	 * on the fly.
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1261  	 */
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26 @1262  	if (bo) {
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1263  		if (bo->flags & XE_BO_SCANOUT_BIT && bo->pat_index_scanout &&
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1264  		    bo->pat_index_scanout != vma->pat_index)
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26 @1265  			return ERR_PTR(-EINVAL);
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1266  
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1267  		bo->pat_index = vma->pat_index;
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1268  	}
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1269  
08dea7674533cf Matt Roper          2023-06-01  1270  	fence = xe_migrate_update_pgtables(tile->migrate,
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1271  					   vm, bo, q,
dd08ebf6c3525a Matthew Brost       2023-03-30  1272  					   entries, num_entries,
dd08ebf6c3525a Matthew Brost       2023-03-30  1273  					   syncs, num_syncs,
dd08ebf6c3525a Matthew Brost       2023-03-30  1274  					   &bind_pt_update.base);
dd08ebf6c3525a Matthew Brost       2023-03-30  1275  	if (!IS_ERR(fence)) {
b06d47be7c8316 Matthew Brost       2023-07-07  1276  		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
dd08ebf6c3525a Matthew Brost       2023-03-30  1277  		LLIST_HEAD(deferred);
fd84041d094ce8 Matthew Brost       2023-07-19  1278  		int err;
fd84041d094ce8 Matthew Brost       2023-07-19  1279  
fd84041d094ce8 Matthew Brost       2023-07-19  1280  		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
fd84041d094ce8 Matthew Brost       2023-07-19  1281  					    &xe_range_fence_kfree_ops,
fd84041d094ce8 Matthew Brost       2023-07-19  1282  					    bind_pt_update.base.start,
fd84041d094ce8 Matthew Brost       2023-07-19  1283  					    bind_pt_update.base.last, fence);
fd84041d094ce8 Matthew Brost       2023-07-19  1284  		if (err)
fd84041d094ce8 Matthew Brost       2023-07-19  1285  			dma_fence_wait(fence, false);
dd08ebf6c3525a Matthew Brost       2023-03-30  1286  
5387e865d90e92 Matthew Brost       2023-01-27  1287  		/* TLB invalidation must be done before signaling rebind */
85dbfe47d07cdd Thomas Hellström    2023-06-05  1288  		if (ifence) {
f6929e80cdf540 Matt Roper          2023-06-01  1289  			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
5387e865d90e92 Matthew Brost       2023-01-27  1290  							  vma);
5387e865d90e92 Matthew Brost       2023-01-27  1291  			if (err) {
5387e865d90e92 Matthew Brost       2023-01-27  1292  				dma_fence_put(fence);
5387e865d90e92 Matthew Brost       2023-01-27  1293  				kfree(ifence);
5387e865d90e92 Matthew Brost       2023-01-27  1294  				return ERR_PTR(err);
5387e865d90e92 Matthew Brost       2023-01-27  1295  			}
5387e865d90e92 Matthew Brost       2023-01-27  1296  			fence = &ifence->base.base;
5387e865d90e92 Matthew Brost       2023-01-27  1297  		}
5387e865d90e92 Matthew Brost       2023-01-27  1298  
dd08ebf6c3525a Matthew Brost       2023-03-30  1299  		/* add shared fence now for pagetable delayed destroy */
b06d47be7c8316 Matthew Brost       2023-07-07  1300  		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
b06d47be7c8316 Matthew Brost       2023-07-07  1301  				   last_munmap_rebind ?
dd08ebf6c3525a Matthew Brost       2023-03-30  1302  				   DMA_RESV_USAGE_KERNEL :
dd08ebf6c3525a Matthew Brost       2023-03-30  1303  				   DMA_RESV_USAGE_BOOKKEEP);
dd08ebf6c3525a Matthew Brost       2023-03-30  1304  
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26 @1305  		if (!xe_vma_has_no_bo(vma) && !bo->vm)
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1306  			dma_resv_add_fence(bo->ttm.base.resv, fence,
dd08ebf6c3525a Matthew Brost       2023-03-30  1307  					   DMA_RESV_USAGE_BOOKKEEP);
dd08ebf6c3525a Matthew Brost       2023-03-30  1308  		xe_pt_commit_bind(vma, entries, num_entries, rebind,
dd08ebf6c3525a Matthew Brost       2023-03-30  1309  				  bind_pt_update.locked ? &deferred : NULL);
dd08ebf6c3525a Matthew Brost       2023-03-30  1310  
dd08ebf6c3525a Matthew Brost       2023-03-30  1311  		/* This vma is live (again?) now */
876611c2b75689 Matt Roper          2023-06-01  1312  		vma->tile_present |= BIT(tile->id);
dd08ebf6c3525a Matthew Brost       2023-03-30  1313  
dd08ebf6c3525a Matthew Brost       2023-03-30  1314  		if (bind_pt_update.locked) {
dd08ebf6c3525a Matthew Brost       2023-03-30  1315  			vma->userptr.initial_bind = true;
dd08ebf6c3525a Matthew Brost       2023-03-30  1316  			up_read(&vm->userptr.notifier_lock);
dd08ebf6c3525a Matthew Brost       2023-03-30  1317  			xe_bo_put_commit(&deferred);
dd08ebf6c3525a Matthew Brost       2023-03-30  1318  		}
b06d47be7c8316 Matthew Brost       2023-07-07  1319  		if (!rebind && last_munmap_rebind &&
fdb6a05383fab3 Thomas Hellström    2023-11-27  1320  		    xe_vm_in_preempt_fence_mode(vm))
342206b7cc064b Matthew Brost       2023-07-26  1321  			xe_vm_queue_rebind_worker(vm);
dd08ebf6c3525a Matthew Brost       2023-03-30  1322  	} else {
fd84041d094ce8 Matthew Brost       2023-07-19  1323  		kfree(rfence);
5387e865d90e92 Matthew Brost       2023-01-27  1324  		kfree(ifence);
dd08ebf6c3525a Matthew Brost       2023-03-30  1325  		if (bind_pt_update.locked)
dd08ebf6c3525a Matthew Brost       2023-03-30  1326  			up_read(&vm->userptr.notifier_lock);
dd08ebf6c3525a Matthew Brost       2023-03-30  1327  		xe_pt_abort_bind(vma, entries, num_entries);
dd08ebf6c3525a Matthew Brost       2023-03-30  1328  	}
dd08ebf6c3525a Matthew Brost       2023-03-30  1329  
dd08ebf6c3525a Matthew Brost       2023-03-30  1330  	return fence;
dd08ebf6c3525a Matthew Brost       2023-03-30  1331  
dd08ebf6c3525a Matthew Brost       2023-03-30  1332  err:
dd08ebf6c3525a Matthew Brost       2023-03-30  1333  	return ERR_PTR(err);
dd08ebf6c3525a Matthew Brost       2023-03-30  1334  }
dd08ebf6c3525a Matthew Brost       2023-03-30  1335  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

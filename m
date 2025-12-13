Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E4A274FCB
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594918; cv=none; b=IcpP2fvQ3cr4RkMVd78DlvmtVE94c666bRBCuWkE9KA7VAjRCn/iVJhud/8G7ZBqMm3t73o5wa7r+Z2O3lijCwn01iiWiuJCjULbLk/Rf8495Gn0w00yCVaDhAxr3rgdvGLlLe0b14KzjEKXcEUrR+WItfXHfZk9cj554Dwo/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594918; c=relaxed/simple;
	bh=Sh6se8dvIVdHM5pXRjBzDxFoe/nkmCDHoTgSke2Pp98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e8QYa1/K2gTPGGSpWazvf3b11dU8a/v6sT7RtJnrunLEqCj4O7ecCBOaovJKQs0ROV4lnE0UmIstrgH/a1gSAGzW4N8wj2fF2fsoFRF2CdViBRDmrPxY/tnT4GDe9ck1VvjJYc9XFuv3Fp9WWNDX6hAqZzKHIUo5FAZJbNRogTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fm1SsY7N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fm1SsY7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765594917; x=1797130917;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Sh6se8dvIVdHM5pXRjBzDxFoe/nkmCDHoTgSke2Pp98=;
  b=fm1SsY7NZC9RMiA/hjMPPwLpPyWEXQTj6QgjrHjunFusP3/GQ4OnNTzI
   DLB/zsJkeSXOaDGGNedKd6lkjXDgBaBPKFDPtSYEePyp3G8H3cKA1Zlop
   Vp2ARP90vQGJnTURB7b0qmBYGLyIRovMqaVLlNmC28CCBAD+8L6uO8jVs
   uWox50Wee/kuIeDhWw2GCcb9vsQiuchBfDvT7Fotig2EAqfIjxFqTK/p3
   WVxKqk+Eo+W864EKevVQWNwGCj/4G52FIxxG/RGHXXzw1qXJBYPx8XFP7
   FI1ql0ZK63TWfc8iYqO9gjdYw8iYh5tZ+bq4DHdRG494pufuUgT2Kai9k
   g==;
X-CSE-ConnectionGUID: eOQphnm9SuK7DUNcDTHwLA==
X-CSE-MsgGUID: XJeoMSI+RdG/qPQPrGMO+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71445180"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71445180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:01:55 -0800
X-CSE-ConnectionGUID: FXGKnWmNSGOUe/A+YWSiJg==
X-CSE-MsgGUID: 8bzKE1r1S2GI6CTiwm/vog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196524488"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 19:01:53 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFtH-000000006yJ-0V4K;
	Sat, 13 Dec 2025 03:01:51 +0000
Date: Sat, 13 Dec 2025 11:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_exec_queue.c:679 xe_exec_queue_create_ioctl()
 warn: missing unwind goto?
Message-ID: <202512131037.EJtXDIvf-lkp@intel.com>
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
TO: Harry Austen <hpausten@protonmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: aa18d5769fcafe645a3ba01a9a69dde4f8dc8cc3 drm/xe: Allow dropping kunit dependency as built-in
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: um-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131037.EJtXDIvf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131037.EJtXDIvf-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_exec_queue.c:679 xe_exec_queue_create_ioctl() warn: missing unwind goto?

Old smatch warnings:
drivers/gpu/drm/xe/xe_exec_queue.c:559 calc_validate_logical_mask() error: uninitialized symbol 'gt_id'.
drivers/gpu/drm/xe/xe_exec_queue.c:560 calc_validate_logical_mask() error: uninitialized symbol 'class'.
drivers/gpu/drm/xe/xe_exec_queue.c:572 calc_validate_logical_mask() error: uninitialized symbol 'prev_mask'.
drivers/gpu/drm/xe/xe_exec_queue.c:643 xe_exec_queue_create_ioctl() warn: address of NULL pointer 'q'

vim +679 drivers/gpu/drm/xe/xe_exec_queue.c

dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  580  
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  581  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  582  			       struct drm_file *file)
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  583  {
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  584  	struct xe_device *xe = to_xe_device(dev);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  585  	struct xe_file *xef = to_xe_file(file);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  586  	struct drm_xe_exec_queue_create *args = data;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  587  	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  588  	struct drm_xe_engine_class_instance __user *user_eci =
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  589  		u64_to_user_ptr(args->instances);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  590  	struct xe_hw_engine *hwe;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  591  	struct xe_vm *vm;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  592  	struct xe_tile *tile;
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  593  	struct xe_exec_queue *q = NULL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  594  	u32 logical_mask;
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  595  	u32 flags = 0;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  596  	u32 id;
7f38e1e1063e1b drivers/gpu/drm/xe/xe_engine.c     Paulo Zanoni       2023-06-26  597  	u32 len;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  598  	int err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  599  
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  600  	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  601  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  602  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  603  
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  604  	len = args->width * args->num_placements;
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  605  	if (XE_IOCTL_DBG(xe, !len || len > XE_HW_ENGINE_MAX_INSTANCE))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  606  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  607  
aef87a5fdb5117 drivers/gpu/drm/xe/xe_exec_queue.c Harish Chegondi    2025-05-01  608  	err = copy_from_user(eci, user_eci,
aef87a5fdb5117 drivers/gpu/drm/xe/xe_exec_queue.c Harish Chegondi    2025-05-01  609  			     sizeof(struct drm_xe_engine_class_instance) * len);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  610  	if (XE_IOCTL_DBG(xe, err))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  611  		return -EFAULT;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  612  
2a6d871bd97722 drivers/gpu/drm/xe/xe_engine.c     Matt Roper         2023-07-24  613  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  614  		return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  615  
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  616  	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  617  		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  618  
d3d767396a02fa drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-12-15  619  	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  620  		if (XE_IOCTL_DBG(xe, args->width != 1) ||
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  621  		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  622  		    XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-04-10  623  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  624  
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  625  		for_each_tile(tile, xe, id) {
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  626  			struct xe_exec_queue *new;
6aa26f6eb829fb drivers/gpu/drm/xe/xe_engine.c     Matthew Auld       2023-07-26  627  
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  628  			flags |= EXEC_QUEUE_FLAG_VM;
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  629  			if (id)
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  630  				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty        2024-01-10  631  
852856e3b6f679 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2024-08-15  632  			new = xe_exec_queue_create_bind(xe, tile, flags,
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty        2024-01-10  633  							args->extensions);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  634  			if (IS_ERR(new)) {
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  635  				err = PTR_ERR(new);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  636  				if (q)
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  637  					goto put_exec_queue;
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-04-10  638  				return err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  639  			}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  640  			if (id == 0)
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  641  				q = new;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  642  			else
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  643  				list_add_tail(&new->multi_gt_list,
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  644  					      &q->multi_gt_link);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  645  		}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  646  	} else {
a1e5b6d83e03d6 drivers/gpu/drm/xe/xe_exec_queue.c Matt Roper         2025-02-18  647  		logical_mask = calc_validate_logical_mask(xe, eci,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  648  							  args->width,
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  649  							  args->num_placements);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  650  		if (XE_IOCTL_DBG(xe, !logical_mask))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-04-10  651  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  652  
6f20fc09936e78 drivers/gpu/drm/xe/xe_exec_queue.c Dominik Grzegorzek 2024-07-29  653  		hwe = xe_hw_engine_lookup(xe, eci[0]);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  654  		if (XE_IOCTL_DBG(xe, !hwe))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-04-10  655  			return -EINVAL;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  656  
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  657  		vm = xe_vm_lookup(xef, args->vm_id);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  658  		if (XE_IOCTL_DBG(xe, !vm))
67f2f0d7371709 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-04-10  659  			return -ENOENT;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  660  
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  661  		err = down_read_interruptible(&vm->lock);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  662  		if (err) {
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  663  			xe_vm_put(vm);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  664  			return err;
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  665  		}
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  666  
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  667  		if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  668  			up_read(&vm->lock);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  669  			xe_vm_put(vm);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  670  			return -ENOENT;
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  671  		}
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  672  
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  673  		q = xe_exec_queue_create(xe, vm, logical_mask,
5488bec96bccbd drivers/gpu/drm/xe/xe_exec_queue.c Tejas Upadhyay     2025-02-28  674  					 args->width, hwe, flags,
25ce7c5063b335 drivers/gpu/drm/xe/xe_exec_queue.c Brian Welty        2024-01-10  675  					 args->extensions);
9d858b69b0cfb5 drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-06-22  676  		up_read(&vm->lock);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  677  		xe_vm_put(vm);
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  678  		if (IS_ERR(q))
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31 @679  			return PTR_ERR(q);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  680  
fdb6a05383fab3 drivers/gpu/drm/xe/xe_exec_queue.c Thomas Hellström   2023-11-27  681  		if (xe_vm_in_preempt_fence_mode(vm)) {
731e46c0322816 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-06-13  682  			q->lr.context = dma_fence_context_alloc(1);
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  683  
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  684  			err = xe_vm_add_compute_exec_queue(vm, q);
b8c1ba831e6750 drivers/gpu/drm/xe/xe_engine.c     Francois Dugast    2023-07-17  685  			if (XE_IOCTL_DBG(xe, err))
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  686  				goto put_exec_queue;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  687  		}
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  688  
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  689  		if (q->vm && q->hwe->hw_engine_group) {
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  690  			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  691  			if (err)
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  692  				goto put_exec_queue;
7970cb36966c9b drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2024-08-09  693  		}
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  694  	}
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  695  
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld       2024-09-25  696  	q->xef = xe_file_get(xef);
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld       2024-09-25  697  
16536582ddbebd drivers/gpu/drm/xe/xe_exec_queue.c Matthew Auld       2024-09-25  698  	/* user id alloc must always be last in ioctl to prevent UAF */
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  699  	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  700  	if (err)
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  701  		goto kill_exec_queue;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  702  
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  703  	args->exec_queue_id = id;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  704  
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  705  	return 0;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  706  
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  707  kill_exec_queue:
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  708  	xe_exec_queue_kill(q);
e05c6c97746307 drivers/gpu/drm/xe/xe_exec_queue.c Matthew Brost      2023-09-20  709  put_exec_queue:
9b9529ce379a08 drivers/gpu/drm/xe/xe_exec_queue.c Francois Dugast    2023-07-31  710  	xe_exec_queue_put(q);
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  711  	return err;
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  712  }
dd08ebf6c3525a drivers/gpu/drm/xe/xe_engine.c     Matthew Brost      2023-03-30  713  

:::::: The code at line 679 was first introduced by commit
:::::: 9b9529ce379a08e68d65231497dd6bad94281902 drm/xe: Rename engine to exec_queue

:::::: TO: Francois Dugast <francois.dugast@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

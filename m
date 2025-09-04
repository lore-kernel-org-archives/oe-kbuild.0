Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B90280309
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Sep 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019067; cv=none; b=QyYsixoiZJTxchxYwlSmOa6UTYhWJW/vnYTBsDp78JoAZTIzeGHWi56PMmEp02xEiOtfOIR0FZCLCoRB8VJ2HuEJqGxZgn5KDC+v577AjGSK7axo6Fr4OG8xKB5W3H8VgAxYnSDiWdtO21r8/8Ymadv+oLOKtNp3dDe6v4nK5KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019067; c=relaxed/simple;
	bh=ME0QOzZ260Uv011NCcwq4O1e4k3t5+Gl7yoqMnlwum4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KNqXdIaw17pIk+H48HamDPLwaKsXINyyeK7A4AoOEF1RhhsbmrngMNQmvkheBMET0uN/NdbDQgo0OwaXbK4efqYnQvyAosRBGi9DwP7eIuouO3kyGInWcW6WPS0u44e9x38XmlaRUrWamaEzjdAnergJoPOFnr4IRMUfkut1fCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sr3M7G+7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sr3M7G+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757019066; x=1788555066;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ME0QOzZ260Uv011NCcwq4O1e4k3t5+Gl7yoqMnlwum4=;
  b=Sr3M7G+71iW5bLfh+B8e0x3BjYdhwM0aimgBvOQPpdHC6h3iZkIx9S7H
   1ND0YFMIzLC5rXEr5ef8+vDlNv/SRdu3parv+Pm3gQSH5khlDTQr83OX/
   CLxCYzqg4kqpdTTZOmQHMSp0q69p2j+qEOb34O3WF8WVj2yV9Sp5TPhPR
   eSykWKrVa/1qCGZxxSHu+PCegoVWn6iOgs4l3ELc2COQeo2s/r8CjwF54
   8RRw7/iyUh0e6jxN48J4vvnbg2SIobdXsjhgmld+6hLStVlK8/cDvsEwe
   9r4fI/YAdbZu8N+h1IHkSx3i0rLwGNyU6b0Esewi0szN2jcfl6jVNW+Zj
   Q==;
X-CSE-ConnectionGUID: m0zpx3eASlKScut8fVSeMQ==
X-CSE-MsgGUID: 61sU39RSS0K8qnxa8RhSDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76827026"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="76827026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 13:51:05 -0700
X-CSE-ConnectionGUID: Lp36oEa5QYi56SUo6N765g==
X-CSE-MsgGUID: Tx69S+cCSDeTO530XugnDQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2025 13:51:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuGuo-0005uN-0o;
	Thu, 04 Sep 2025 20:50:49 +0000
Date: Fri, 5 Sep 2025 04:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5322/6355]
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:1082 amdgpu_gem_op_ioctl() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202509050449.1xgTfyZU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Francis <David.Francis@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ac65880ebca1b68495bd8704263b26c050ac010
commit: 4d82724f7f2b847eb0454b1aab5450545b39abd4 [5322/6355] drm/amdgpu: Add mapping info option for GEM_OP ioctl
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250904 (https://download.01.org/0day-ci/archive/20250905/202509050449.1xgTfyZU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509050449.1xgTfyZU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:1082 amdgpu_gem_op_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:139 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 124)
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:1165 amdgpu_gem_list_handles_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

vim +1082 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

d38ceaf99ed015 Alex Deucher                   2015-04-20   950  
d38ceaf99ed015 Alex Deucher                   2015-04-20   951  int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
d38ceaf99ed015 Alex Deucher                   2015-04-20   952  			struct drm_file *filp)
d38ceaf99ed015 Alex Deucher                   2015-04-20   953  {
d38ceaf99ed015 Alex Deucher                   2015-04-20   954  	struct drm_amdgpu_gem_op *args = data;
d38ceaf99ed015 Alex Deucher                   2015-04-20   955  	struct drm_gem_object *gobj;
b4ae4fe6cdbbfe shaoyunl                       2019-03-26   956  	struct amdgpu_vm_bo_base *base;
d38ceaf99ed015 Alex Deucher                   2015-04-20   957  	struct amdgpu_bo *robj;
4d82724f7f2b84 David Francis                  2025-06-16   958  	struct drm_exec exec;
4d82724f7f2b84 David Francis                  2025-06-16   959  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
d38ceaf99ed015 Alex Deucher                   2015-04-20   960  	int r;
d38ceaf99ed015 Alex Deucher                   2015-04-20   961  
4d82724f7f2b84 David Francis                  2025-06-16   962  	if (args->padding)
4d82724f7f2b84 David Francis                  2025-06-16   963  		return -EINVAL;
4d82724f7f2b84 David Francis                  2025-06-16   964  
a8ad0bd84f9860 Chris Wilson                   2016-05-09   965  	gobj = drm_gem_object_lookup(filp, args->handle);
30953c4d000b67 Srinivasan Shanmugam           2023-07-21   966  	if (!gobj)
d38ceaf99ed015 Alex Deucher                   2015-04-20   967  		return -ENOENT;
30953c4d000b67 Srinivasan Shanmugam           2023-07-21   968  
d38ceaf99ed015 Alex Deucher                   2015-04-20   969  	robj = gem_to_amdgpu_bo(gobj);
d38ceaf99ed015 Alex Deucher                   2015-04-20   970  
4d82724f7f2b84 David Francis                  2025-06-16   971  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
4d82724f7f2b84 David Francis                  2025-06-16   972  			  DRM_EXEC_IGNORE_DUPLICATES, 0);
4d82724f7f2b84 David Francis                  2025-06-16   973  	drm_exec_until_all_locked(&exec) {
4d82724f7f2b84 David Francis                  2025-06-16   974  		r = drm_exec_lock_obj(&exec, gobj);
4d82724f7f2b84 David Francis                  2025-06-16   975  		drm_exec_retry_on_contention(&exec);
4d82724f7f2b84 David Francis                  2025-06-16   976  		if (r)
4d82724f7f2b84 David Francis                  2025-06-16   977  			goto out_exec;
4d82724f7f2b84 David Francis                  2025-06-16   978  
4d82724f7f2b84 David Francis                  2025-06-16   979  		if (args->op == AMDGPU_GEM_OP_GET_MAPPING_INFO) {
4d82724f7f2b84 David Francis                  2025-06-16   980  			r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 0);
4d82724f7f2b84 David Francis                  2025-06-16   981  			drm_exec_retry_on_contention(&exec);
4d82724f7f2b84 David Francis                  2025-06-16   982  			if (r)
4d82724f7f2b84 David Francis                  2025-06-16   983  				goto out_exec;
4d82724f7f2b84 David Francis                  2025-06-16   984  		}
4d82724f7f2b84 David Francis                  2025-06-16   985  	}
d38ceaf99ed015 Alex Deucher                   2015-04-20   986  
d38ceaf99ed015 Alex Deucher                   2015-04-20   987  	switch (args->op) {
d38ceaf99ed015 Alex Deucher                   2015-04-20   988  	case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: {
d38ceaf99ed015 Alex Deucher                   2015-04-20   989  		struct drm_amdgpu_gem_create_in info;
7ecc245a8ce32f Christian König                2017-07-26   990  		void __user *out = u64_to_user_ptr(args->value);
d38ceaf99ed015 Alex Deucher                   2015-04-20   991  
c105de2828e139 Gerd Hoffmann                  2019-08-05   992  		info.bo_size = robj->tbo.base.size;
c777dc9e793342 Christian König                2021-02-05   993  		info.alignment = robj->tbo.page_alignment << PAGE_SHIFT;
6d7d9c5aa212d0 Kent Russell                   2017-08-08   994  		info.domains = robj->preferred_domains;
d38ceaf99ed015 Alex Deucher                   2015-04-20   995  		info.domain_flags = robj->flags;
4d82724f7f2b84 David Francis                  2025-06-16   996  		drm_exec_fini(&exec);
d38ceaf99ed015 Alex Deucher                   2015-04-20   997  		if (copy_to_user(out, &info, sizeof(info)))
d38ceaf99ed015 Alex Deucher                   2015-04-20   998  			r = -EFAULT;
d38ceaf99ed015 Alex Deucher                   2015-04-20   999  		break;
d38ceaf99ed015 Alex Deucher                   2015-04-20  1000  	}
d8f65a2376268d Marek Olšák                    2015-05-27  1001  	case AMDGPU_GEM_OP_SET_PLACEMENT:
4948e6c7fb2a88 Thomas Zimmermann              2025-06-25  1002  		if (drm_gem_is_imported(&robj->tbo.base) &&
8c505bdc9c8b95 Christian König                2021-06-09  1003  		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  1004  			r = -EINVAL;
4d82724f7f2b84 David Francis                  2025-06-16  1005  			goto out_exec;
803d89ade4ede1 Christopher James Halse Rogers 2017-04-03  1006  		}
cc325d19134756 Christian König                2016-02-08  1007  		if (amdgpu_ttm_tt_get_usermm(robj->tbo.ttm)) {
d38ceaf99ed015 Alex Deucher                   2015-04-20  1008  			r = -EPERM;
4d82724f7f2b84 David Francis                  2025-06-16  1009  			goto out_exec;
d38ceaf99ed015 Alex Deucher                   2015-04-20  1010  		}
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1011  		for (base = robj->vm_bo; base; base = base->next)
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1012  			if (amdgpu_xgmi_same_hive(amdgpu_ttm_adev(robj->tbo.bdev),
391629bdfcb901 Nirmoy Das                     2021-06-15  1013  				amdgpu_ttm_adev(base->vm->root.bo->tbo.bdev))) {
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1014  				r = -EINVAL;
4d82724f7f2b84 David Francis                  2025-06-16  1015  				goto out_exec;
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1016  			}
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1017  
b4ae4fe6cdbbfe shaoyunl                       2019-03-26  1018  
6d7d9c5aa212d0 Kent Russell                   2017-08-08  1019  		robj->preferred_domains = args->value & (AMDGPU_GEM_DOMAIN_VRAM |
d38ceaf99ed015 Alex Deucher                   2015-04-20  1020  							AMDGPU_GEM_DOMAIN_GTT |
d38ceaf99ed015 Alex Deucher                   2015-04-20  1021  							AMDGPU_GEM_DOMAIN_CPU);
6d7d9c5aa212d0 Kent Russell                   2017-08-08  1022  		robj->allowed_domains = robj->preferred_domains;
1ea863fd736eed Christian König                2015-12-18  1023  		if (robj->allowed_domains == AMDGPU_GEM_DOMAIN_VRAM)
1ea863fd736eed Christian König                2015-12-18  1024  			robj->allowed_domains |= AMDGPU_GEM_DOMAIN_GTT;
1ea863fd736eed Christian König                2015-12-18  1025  
e1eb899b45781b Christian König                2017-08-25  1026  		if (robj->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
a541a6e865ecd8 Yunxiang Li                    2024-12-19  1027  			amdgpu_vm_bo_invalidate(robj, true);
4d82724f7f2b84 David Francis                  2025-06-16  1028  		drm_exec_fini(&exec);
4d82724f7f2b84 David Francis                  2025-06-16  1029  		break;
4d82724f7f2b84 David Francis                  2025-06-16  1030  	case AMDGPU_GEM_OP_GET_MAPPING_INFO: {
4d82724f7f2b84 David Francis                  2025-06-16  1031  		struct amdgpu_bo_va *bo_va = amdgpu_vm_bo_find(&fpriv->vm, robj);
4d82724f7f2b84 David Francis                  2025-06-16  1032  		struct drm_amdgpu_gem_vm_entry *vm_entries;
4d82724f7f2b84 David Francis                  2025-06-16  1033  		struct amdgpu_bo_va_mapping *mapping;
4d82724f7f2b84 David Francis                  2025-06-16  1034  		int num_mappings = 0;
4d82724f7f2b84 David Francis                  2025-06-16  1035  		/*
4d82724f7f2b84 David Francis                  2025-06-16  1036  		 * num_entries is set as an input to the size of the user-allocated array of
4d82724f7f2b84 David Francis                  2025-06-16  1037  		 * drm_amdgpu_gem_vm_entry stored at args->value.
4d82724f7f2b84 David Francis                  2025-06-16  1038  		 * num_entries is sent back as output as the number of mappings the bo has.
4d82724f7f2b84 David Francis                  2025-06-16  1039  		 * If that number is larger than the size of the array, the ioctl must
4d82724f7f2b84 David Francis                  2025-06-16  1040  		 * be retried.
4d82724f7f2b84 David Francis                  2025-06-16  1041  		 */
4d82724f7f2b84 David Francis                  2025-06-16  1042  		vm_entries = kvcalloc(args->num_entries, sizeof(*vm_entries), GFP_KERNEL);
4d82724f7f2b84 David Francis                  2025-06-16  1043  		if (!vm_entries)
4d82724f7f2b84 David Francis                  2025-06-16  1044  			return -ENOMEM;
e1eb899b45781b Christian König                2017-08-25  1045  
4d82724f7f2b84 David Francis                  2025-06-16  1046  		amdgpu_vm_bo_va_for_each_valid_mapping(bo_va, mapping) {
4d82724f7f2b84 David Francis                  2025-06-16  1047  			if (num_mappings < args->num_entries) {
4d82724f7f2b84 David Francis                  2025-06-16  1048  				vm_entries[num_mappings].addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
4d82724f7f2b84 David Francis                  2025-06-16  1049  				vm_entries[num_mappings].size = (mapping->last - mapping->start + 1) * AMDGPU_GPU_PAGE_SIZE;
4d82724f7f2b84 David Francis                  2025-06-16  1050  				vm_entries[num_mappings].offset = mapping->offset;
4d82724f7f2b84 David Francis                  2025-06-16  1051  				vm_entries[num_mappings].flags = mapping->flags;
4d82724f7f2b84 David Francis                  2025-06-16  1052  			}
4d82724f7f2b84 David Francis                  2025-06-16  1053  			num_mappings += 1;
4d82724f7f2b84 David Francis                  2025-06-16  1054  		}
4d82724f7f2b84 David Francis                  2025-06-16  1055  
4d82724f7f2b84 David Francis                  2025-06-16  1056  		amdgpu_vm_bo_va_for_each_invalid_mapping(bo_va, mapping) {
4d82724f7f2b84 David Francis                  2025-06-16  1057  			if (num_mappings < args->num_entries) {
4d82724f7f2b84 David Francis                  2025-06-16  1058  				vm_entries[num_mappings].addr = mapping->start * AMDGPU_GPU_PAGE_SIZE;
4d82724f7f2b84 David Francis                  2025-06-16  1059  				vm_entries[num_mappings].size = (mapping->last - mapping->start + 1) * AMDGPU_GPU_PAGE_SIZE;
4d82724f7f2b84 David Francis                  2025-06-16  1060  				vm_entries[num_mappings].offset = mapping->offset;
4d82724f7f2b84 David Francis                  2025-06-16  1061  				vm_entries[num_mappings].flags = mapping->flags;
4d82724f7f2b84 David Francis                  2025-06-16  1062  			}
4d82724f7f2b84 David Francis                  2025-06-16  1063  			num_mappings += 1;
4d82724f7f2b84 David Francis                  2025-06-16  1064  		}
4d82724f7f2b84 David Francis                  2025-06-16  1065  
4d82724f7f2b84 David Francis                  2025-06-16  1066  		drm_exec_fini(&exec);
4d82724f7f2b84 David Francis                  2025-06-16  1067  
4d82724f7f2b84 David Francis                  2025-06-16  1068  		if (num_mappings > 0 && num_mappings <= args->num_entries)
4d82724f7f2b84 David Francis                  2025-06-16  1069  			r = copy_to_user(u64_to_user_ptr(args->value), vm_entries, num_mappings * sizeof(*vm_entries));
4d82724f7f2b84 David Francis                  2025-06-16  1070  
4d82724f7f2b84 David Francis                  2025-06-16  1071  		args->num_entries = num_mappings;
4d82724f7f2b84 David Francis                  2025-06-16  1072  
4d82724f7f2b84 David Francis                  2025-06-16  1073  		kvfree(vm_entries);
d38ceaf99ed015 Alex Deucher                   2015-04-20  1074  		break;
4d82724f7f2b84 David Francis                  2025-06-16  1075  	}
d38ceaf99ed015 Alex Deucher                   2015-04-20  1076  	default:
4d82724f7f2b84 David Francis                  2025-06-16  1077  		drm_exec_fini(&exec);
d38ceaf99ed015 Alex Deucher                   2015-04-20  1078  		r = -EINVAL;
d38ceaf99ed015 Alex Deucher                   2015-04-20  1079  	}
d38ceaf99ed015 Alex Deucher                   2015-04-20  1080  
4d82724f7f2b84 David Francis                  2025-06-16  1081  	drm_gem_object_put(gobj);
4d82724f7f2b84 David Francis                  2025-06-16 @1082  	return r;
4d82724f7f2b84 David Francis                  2025-06-16  1083  out_exec:
4d82724f7f2b84 David Francis                  2025-06-16  1084  	drm_exec_fini(&exec);
e07ddb0ce7cde6 Emil Velikov                   2020-05-15  1085  	drm_gem_object_put(gobj);
d38ceaf99ed015 Alex Deucher                   2015-04-20  1086  	return r;
d38ceaf99ed015 Alex Deucher                   2015-04-20  1087  }
d38ceaf99ed015 Alex Deucher                   2015-04-20  1088  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

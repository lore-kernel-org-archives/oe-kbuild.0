Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AAA3491EA
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761138490; cv=none; b=agP1D3JcI0sUzymbZ6HY0FZ+stRVYQiQLk4cGvy5WNH86BcB0bgTVXisBfRPQYzGFe8cUt/t1QX0JO0ZZIXnvBbJHSONOioXHsAa0FFo+DM/NJZBF6aVnBZOwRiblw9nuOnH3Kd7wZ99Jbbr00ICtdvnN8x9br0f0NviikuwEMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761138490; c=relaxed/simple;
	bh=nGMS3xEmjiXq6jX3IUk7670rEvpdkouLwX1vO2ahDFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgBhbeCLk5p6vtstMmiUl9C0PNRRvCPd1apVhiODAge4SK4Bd8tZttTA0+8mJnVi8psrIFeF+a+aT0GLXai9vObyJpKJmtzrG+7F3Bop1VsG6V3YsR6GXYq3D9wzaWXKGRcZmAUwBWPU/PyWUtLosY8ZlFc0eo72Ixyx5y4EITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm3MokN9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm3MokN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761138488; x=1792674488;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nGMS3xEmjiXq6jX3IUk7670rEvpdkouLwX1vO2ahDFo=;
  b=Zm3MokN9waJmlw3BjSw5egM5dOi7+b7UzDXBLxZpxOtYqGoguHgBre61
   24uyWhOVUzcvOiPVxTABaYeafp4UeCgtAxDNtm+lecR8pymdq1bcpPF0z
   1QRhk+OlKunaaHs+zXm18rr6b2/vFUMTeFziZ178K/ZN6XDtjuD7vHbF8
   L2ewX9sUYb8Mjmv2G3TIVKp4OitmmJ/+N+kc484TXU+ZiRTFabVwFwH33
   JgwActDUx46ZFuXvVDa/TJw55wVCpfDdXUJ4rG0OuX5d185GSntYUmCk2
   rCR2e4emjbprgRyMrvns8h0VIvr5KJEBdqKscH4PCvqvVF3MxG9n/Lf7g
   A==;
X-CSE-ConnectionGUID: 0MesbuHqSxWiXRp6FPFJUg==
X-CSE-MsgGUID: 8mH/s0m+RIiKgpwblXLvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63324300"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="63324300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 06:08:08 -0700
X-CSE-ConnectionGUID: Gu+pyR3tQ6C1Oy/g4J/CYA==
X-CSE-MsgGUID: 47ZdVOsuTRyNbW0ZEyJRKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214512351"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Oct 2025 06:08:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBYZP-000CNd-22;
	Wed, 22 Oct 2025 13:08:03 +0000
Date: Wed, 22 Oct 2025 21:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1102/3483]
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003 amdgpu_cs_parser_bos() warn:
 inconsistent returns '&p->bo_list->bo_list_mutex'.
Message-ID: <202510222101.dxkptxL9-lkp@intel.com>
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
TO: Sunil Khatri <sunil.khatri@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian König" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: e095b55155ef69a8ae0eb114a7fd2a381c012f33 [1102/3483] drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages
:::::: branch date: 10 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222101.dxkptxL9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510222101.dxkptxL9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003 amdgpu_cs_parser_bos() warn: inconsistent returns '&p->bo_list->bo_list_mutex'.

vim +1003 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

9a02ece43ee49ef Christian König   2018-08-17   854  
d4e8ad908b20953 Christian König   2022-09-08   855  static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
d4e8ad908b20953 Christian König   2022-09-08   856  				union drm_amdgpu_cs *cs)
d4e8ad908b20953 Christian König   2022-09-08   857  {
d4e8ad908b20953 Christian König   2022-09-08   858  	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
ca6c1e210aa7d76 Christian König   2022-04-16   859  	struct ttm_operation_ctx ctx = { true, false };
d4e8ad908b20953 Christian König   2022-09-08   860  	struct amdgpu_vm *vm = &fpriv->vm;
d4e8ad908b20953 Christian König   2022-09-08   861  	struct amdgpu_bo_list_entry *e;
ca6c1e210aa7d76 Christian König   2022-04-16   862  	struct drm_gem_object *obj;
ca6c1e210aa7d76 Christian König   2022-04-16   863  	unsigned long index;
4624459c84d71e0 Christian König   2022-03-02   864  	unsigned int i;
d4e8ad908b20953 Christian König   2022-09-08   865  	int r;
d4e8ad908b20953 Christian König   2022-09-08   866  
d4e8ad908b20953 Christian König   2022-09-08   867  	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
d4e8ad908b20953 Christian König   2022-09-08   868  	if (cs->in.bo_list_handle) {
d4e8ad908b20953 Christian König   2022-09-08   869  		if (p->bo_list)
d4e8ad908b20953 Christian König   2022-09-08   870  			return -EINVAL;
d38ceaf99ed015f Alex Deucher      2015-04-20   871  
d4e8ad908b20953 Christian König   2022-09-08   872  		r = amdgpu_bo_list_get(fpriv, cs->in.bo_list_handle,
d4e8ad908b20953 Christian König   2022-09-08   873  				       &p->bo_list);
bbca24d0a3c1119 Maíra Canal       2022-08-15   874  		if (r)
d38ceaf99ed015f Alex Deucher      2015-04-20   875  			return r;
d4e8ad908b20953 Christian König   2022-09-08   876  	} else if (!p->bo_list) {
d4e8ad908b20953 Christian König   2022-09-08   877  		/* Create a empty bo_list when no handle is provided */
d4e8ad908b20953 Christian König   2022-09-08   878  		r = amdgpu_bo_list_create(p->adev, p->filp, NULL, 0,
d4e8ad908b20953 Christian König   2022-09-08   879  					  &p->bo_list);
bbca24d0a3c1119 Maíra Canal       2022-08-15   880  		if (r)
91e1a5207edec9e Christian König   2015-07-06   881  			return r;
d38ceaf99ed015f Alex Deucher      2015-04-20   882  	}
b495bd3a54e732e Christian König   2015-09-10   883  
d4e8ad908b20953 Christian König   2022-09-08   884  	mutex_lock(&p->bo_list->bo_list_mutex);
d5884513a31df07 Christian König   2017-09-08   885  
d4e8ad908b20953 Christian König   2022-09-08   886  	/* Get userptr backing pages. If pages are updated after registered
d4e8ad908b20953 Christian König   2022-09-08   887  	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
d4e8ad908b20953 Christian König   2022-09-08   888  	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
d4e8ad908b20953 Christian König   2022-09-08   889  	 */
d4e8ad908b20953 Christian König   2022-09-08   890  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
d4e8ad908b20953 Christian König   2022-09-08   891  		bool userpage_invalidated = false;
ca6c1e210aa7d76 Christian König   2022-04-16   892  		struct amdgpu_bo *bo = e->bo;
ad864d243826ced Andrey Grodzovsky 2017-10-10   893  
e095b55155ef69a Sunil Khatri      2025-09-24   894  		e->range = kzalloc(sizeof(*e->range), GFP_KERNEL);
e095b55155ef69a Sunil Khatri      2025-09-24   895  		if (unlikely(!e->range))
e095b55155ef69a Sunil Khatri      2025-09-24   896  			return -ENOMEM;
e095b55155ef69a Sunil Khatri      2025-09-24   897  
e095b55155ef69a Sunil Khatri      2025-09-24   898  		r = amdgpu_ttm_tt_get_user_pages(bo, e->range);
c5b3cc417b0260a Sunil Khatri      2025-09-17   899  		if (r)
d4e8ad908b20953 Christian König   2022-09-08   900  			goto out_free_user_pages;
d38ceaf99ed015f Alex Deucher      2015-04-20   901  
d4e8ad908b20953 Christian König   2022-09-08   902  		for (i = 0; i < bo->tbo.ttm->num_pages; i++) {
c5b3cc417b0260a Sunil Khatri      2025-09-17   903  			if (bo->tbo.ttm->pages[i] != hmm_pfn_to_page(e->range->hmm_pfns[i])) {
d4e8ad908b20953 Christian König   2022-09-08   904  				userpage_invalidated = true;
d4e8ad908b20953 Christian König   2022-09-08   905  				break;
d4e8ad908b20953 Christian König   2022-09-08   906  			}
d4e8ad908b20953 Christian König   2022-09-08   907  		}
d4e8ad908b20953 Christian König   2022-09-08   908  		e->user_invalidated = userpage_invalidated;
9a79588c42bf89c Christian König   2016-06-22   909  	}
9a79588c42bf89c Christian König   2016-06-22   910  
ca6c1e210aa7d76 Christian König   2022-04-16   911  	drm_exec_until_all_locked(&p->exec) {
ca6c1e210aa7d76 Christian König   2022-04-16   912  		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
ca6c1e210aa7d76 Christian König   2022-04-16   913  		drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d76 Christian König   2022-04-16   914  		if (unlikely(r))
d4e8ad908b20953 Christian König   2022-09-08   915  			goto out_free_user_pages;
d38ceaf99ed015f Alex Deucher      2015-04-20   916  
d4e8ad908b20953 Christian König   2022-09-08   917  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
ca6c1e210aa7d76 Christian König   2022-04-16   918  			/* One fence for TTM and one for each CS job */
ca6c1e210aa7d76 Christian König   2022-04-16   919  			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
ca6c1e210aa7d76 Christian König   2022-04-16   920  						 1 + p->gang_size);
ca6c1e210aa7d76 Christian König   2022-04-16   921  			drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d76 Christian König   2022-04-16   922  			if (unlikely(r))
ca6c1e210aa7d76 Christian König   2022-04-16   923  				goto out_free_user_pages;
d38ceaf99ed015f Alex Deucher      2015-04-20   924  
ca6c1e210aa7d76 Christian König   2022-04-16   925  			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
ca6c1e210aa7d76 Christian König   2022-04-16   926  		}
ca6c1e210aa7d76 Christian König   2022-04-16   927  
ca6c1e210aa7d76 Christian König   2022-04-16   928  		if (p->uf_bo) {
ca6c1e210aa7d76 Christian König   2022-04-16   929  			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
ca6c1e210aa7d76 Christian König   2022-04-16   930  						 1 + p->gang_size);
ca6c1e210aa7d76 Christian König   2022-04-16   931  			drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d76 Christian König   2022-04-16   932  			if (unlikely(r))
ca6c1e210aa7d76 Christian König   2022-04-16   933  				goto out_free_user_pages;
ca6c1e210aa7d76 Christian König   2022-04-16   934  		}
ca6c1e210aa7d76 Christian König   2022-04-16   935  	}
ca6c1e210aa7d76 Christian König   2022-04-16   936  
ca6c1e210aa7d76 Christian König   2022-04-16   937  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d76 Christian König   2022-04-16   938  		struct mm_struct *usermm;
ca6c1e210aa7d76 Christian König   2022-04-16   939  
ca6c1e210aa7d76 Christian König   2022-04-16   940  		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
ca6c1e210aa7d76 Christian König   2022-04-16   941  		if (usermm && usermm != current->mm) {
ca6c1e210aa7d76 Christian König   2022-04-16   942  			r = -EPERM;
ca6c1e210aa7d76 Christian König   2022-04-16   943  			goto out_free_user_pages;
ca6c1e210aa7d76 Christian König   2022-04-16   944  		}
ca6c1e210aa7d76 Christian König   2022-04-16   945  
ca6c1e210aa7d76 Christian König   2022-04-16   946  		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
c5b3cc417b0260a Sunil Khatri      2025-09-17   947  		    e->user_invalidated) {
ca6c1e210aa7d76 Christian König   2022-04-16   948  			amdgpu_bo_placement_from_domain(e->bo,
ca6c1e210aa7d76 Christian König   2022-04-16   949  							AMDGPU_GEM_DOMAIN_CPU);
ca6c1e210aa7d76 Christian König   2022-04-16   950  			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
ca6c1e210aa7d76 Christian König   2022-04-16   951  					    &ctx);
ca6c1e210aa7d76 Christian König   2022-04-16   952  			if (r)
ca6c1e210aa7d76 Christian König   2022-04-16   953  				goto out_free_user_pages;
ca6c1e210aa7d76 Christian König   2022-04-16   954  
ca6c1e210aa7d76 Christian König   2022-04-16   955  			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
c5b3cc417b0260a Sunil Khatri      2025-09-17   956  						     e->range);
ca6c1e210aa7d76 Christian König   2022-04-16   957  		}
d4e8ad908b20953 Christian König   2022-09-08   958  	}
d38ceaf99ed015f Alex Deucher      2015-04-20   959  
d4e8ad908b20953 Christian König   2022-09-08   960  	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
d4e8ad908b20953 Christian König   2022-09-08   961  					  &p->bytes_moved_vis_threshold);
d4e8ad908b20953 Christian König   2022-09-08   962  	p->bytes_moved = 0;
d4e8ad908b20953 Christian König   2022-09-08   963  	p->bytes_moved_vis = 0;
9a1b3af10d6268a Monk Liu          2017-03-08   964  
50661eb1a2c88c0 Felix Kuehling    2024-01-03   965  	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
d4e8ad908b20953 Christian König   2022-09-08   966  			       amdgpu_cs_bo_validate, p);
d4e8ad908b20953 Christian König   2022-09-08   967  	if (r) {
cc51bbc7d7a7ff6 Mario Limonciello 2025-07-15   968  		drm_err(adev_to_drm(p->adev), "amdgpu_vm_validate() failed.\n");
ca6c1e210aa7d76 Christian König   2022-04-16   969  		goto out_free_user_pages;
65333e4429c60b8 Monk Liu          2017-03-27   970  	}
9a1b3af10d6268a Monk Liu          2017-03-08   971  
ca6c1e210aa7d76 Christian König   2022-04-16   972  	drm_exec_for_each_locked_object(&p->exec, index, obj) {
ca6c1e210aa7d76 Christian König   2022-04-16   973  		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
ca6c1e210aa7d76 Christian König   2022-04-16   974  		if (unlikely(r))
ca6c1e210aa7d76 Christian König   2022-04-16   975  			goto out_free_user_pages;
ca6c1e210aa7d76 Christian König   2022-04-16   976  	}
b07c60c0652c497 Christian König   2016-01-31   977  
ca6c1e210aa7d76 Christian König   2022-04-16   978  	if (p->uf_bo) {
ca6c1e210aa7d76 Christian König   2022-04-16   979  		r = amdgpu_ttm_alloc_gart(&p->uf_bo->tbo);
ca6c1e210aa7d76 Christian König   2022-04-16   980  		if (unlikely(r))
ca6c1e210aa7d76 Christian König   2022-04-16   981  			goto out_free_user_pages;
4953b6b22ab9d7f Christian König   2022-09-13   982  
ca6c1e210aa7d76 Christian König   2022-04-16   983  		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
d38ceaf99ed015f Alex Deucher      2015-04-20   984  	}
d38ceaf99ed015f Alex Deucher      2015-04-20   985  
4953b6b22ab9d7f Christian König   2022-09-13   986  	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
4953b6b22ab9d7f Christian König   2022-09-13   987  				     p->bytes_moved_vis);
4624459c84d71e0 Christian König   2022-03-02   988  
4624459c84d71e0 Christian König   2022-03-02   989  	for (i = 0; i < p->gang_size; ++i)
4624459c84d71e0 Christian König   2022-03-02   990  		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
4624459c84d71e0 Christian König   2022-03-02   991  					 p->bo_list->gws_obj,
4624459c84d71e0 Christian König   2022-03-02   992  					 p->bo_list->oa_obj);
4953b6b22ab9d7f Christian König   2022-09-13   993  	return 0;
4953b6b22ab9d7f Christian König   2022-09-13   994  
d4e8ad908b20953 Christian König   2022-09-08   995  out_free_user_pages:
d4e8ad908b20953 Christian König   2022-09-08   996  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d76 Christian König   2022-04-16   997  		struct amdgpu_bo *bo = e->bo;
d38ceaf99ed015f Alex Deucher      2015-04-20   998  
fec8fdb54e8f74d Christian König   2022-11-10   999  		amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
fec8fdb54e8f74d Christian König   2022-11-10  1000  		e->range = NULL;
d4e8ad908b20953 Christian König   2022-09-08  1001  	}
c70e2166967dc4e Philip Yang       2022-11-03  1002  	mutex_unlock(&p->bo_list->bo_list_mutex);
d4e8ad908b20953 Christian König   2022-09-08 @1003  	return r;
d38ceaf99ed015f Alex Deucher      2015-04-20  1004  }
d38ceaf99ed015f Alex Deucher      2015-04-20  1005  

:::::: The code at line 1003 was first introduced by commit
:::::: d4e8ad908b2095388a300b19d76b78c170052a8a drm/amdgpu: reorder CS code

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

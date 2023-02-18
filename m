Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504612117
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Feb 2023 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676729585; x=1708265585;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DMDH0J0oLluCdOvQImk17M2Dmk0A0p+LEEPK9uPM+VM=;
  b=cPBzOqlB7lBHSo7xhM8a/EWYzWj6hoZzUob/Kc1O9rgF/bUGO6iJvu2l
   2mfllXekUJAv45nWx2HaMUn7h9av3g4viSgLQlC5MlVbyR7mjyIXtkCXf
   HtzejzEQsdxzviER6Q1sznom8hLPbqChNY6Ze8rSM9vpm6D1csJt/EGWK
   vRjJy3hNGCgmYsqYnw5aKuG6yUt61yw+b7ER14rQYbxplj8CCYufK3JmQ
   ChfTqxxXHvIqp1hbSLN/W6zkKdoAmS0dNUUiGilNezRs+aQCAzonMQhQK
   aRfyoMjNIumw0WwOrnI0K++meld/C6AtTTNG++w+m8DV0wQbvMrSMl4ll
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="333532919"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="333532919"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 06:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="672913875"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="672913875"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2023 06:13:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTNxW-000CSH-1H;
	Sat, 18 Feb 2023 14:13:02 +0000
Date: Sat, 18 Feb 2023 22:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-5.10 85/86]
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:651:1-7: preceding lock on line 522
Message-ID: <202302182210.zxIwsVVk-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   90ba6e681ca4926149748fbd8d81d0a4de12cc4e
commit: 4b9049fb1c3734ea2adff0450ed52f540138964f [85/86] BACKPORT: UPSTREAM: drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: alpha-randconfig-c034-20230217 (https://download.01.org/0day-ci/archive/20230218/202302182210.zxIwsVVk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302182210.zxIwsVVk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:651:1-7: preceding lock on line 522

vim +651 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

d38ceaf99ed015 Alex Deucher      2015-04-20  490  
2a7d9bdabec218 Christian König   2015-12-18  491  static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
2a7d9bdabec218 Christian König   2015-12-18  492  				union drm_amdgpu_cs *cs)
d38ceaf99ed015 Alex Deucher      2015-04-20  493  {
d38ceaf99ed015 Alex Deucher      2015-04-20  494  	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
4a102ad4ba0daf Christian König   2018-07-30  495  	struct amdgpu_vm *vm = &fpriv->vm;
2f568dbd6b944c Christian König   2016-02-23  496  	struct amdgpu_bo_list_entry *e;
a5b750583eb4af Christian König   2015-09-03  497  	struct list_head duplicates;
01d98506eca24f Emily Deng        2018-05-30  498  	struct amdgpu_bo *gds;
01d98506eca24f Emily Deng        2018-05-30  499  	struct amdgpu_bo *gws;
01d98506eca24f Emily Deng        2018-05-30  500  	struct amdgpu_bo *oa;
636ce25c30010a Christian König   2015-12-18  501  	int r;
d38ceaf99ed015 Alex Deucher      2015-04-20  502  
2a7d9bdabec218 Christian König   2015-12-18  503  	INIT_LIST_HEAD(&p->validated);
2a7d9bdabec218 Christian König   2015-12-18  504  
964d0fbf6301d3 Andrey Grodzovsky 2018-07-06  505  	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
0cb7c1f03bfb39 Christian König   2018-07-30  506  	if (cs->in.bo_list_handle) {
0cb7c1f03bfb39 Christian König   2018-07-30  507  		if (p->bo_list)
0cb7c1f03bfb39 Christian König   2018-07-30  508  			return -EINVAL;
964d0fbf6301d3 Andrey Grodzovsky 2018-07-06  509  
52c054caf83012 Christian König   2018-07-27  510  		r = amdgpu_bo_list_get(fpriv, cs->in.bo_list_handle,
52c054caf83012 Christian König   2018-07-27  511  				       &p->bo_list);
52c054caf83012 Christian König   2018-07-27  512  		if (r)
52c054caf83012 Christian König   2018-07-27  513  			return r;
4a102ad4ba0daf Christian König   2018-07-30  514  	} else if (!p->bo_list) {
4a102ad4ba0daf Christian König   2018-07-30  515  		/* Create a empty bo_list when no handle is provided */
4a102ad4ba0daf Christian König   2018-07-30  516  		r = amdgpu_bo_list_create(p->adev, p->filp, NULL, 0,
4a102ad4ba0daf Christian König   2018-07-30  517  					  &p->bo_list);
4a102ad4ba0daf Christian König   2018-07-30  518  		if (r)
4a102ad4ba0daf Christian König   2018-07-30  519  			return r;
52c054caf83012 Christian König   2018-07-27  520  	}
52c054caf83012 Christian König   2018-07-27  521  
4b9049fb1c3734 Jasber Chen       2023-02-14 @522  	mutex_lock(&p->bo_list->bo_list_mutex);
4b9049fb1c3734 Jasber Chen       2023-02-14  523  
07daa8a0784e30 Christian König   2018-09-24  524  	/* One for TTM and one for the CS job */
049aca4363d8af Christian König   2018-09-19  525  	amdgpu_bo_list_for_each_entry(e, p->bo_list)
07daa8a0784e30 Christian König   2018-09-24  526  		e->tv.num_shared = 2;
049aca4363d8af Christian König   2018-09-19  527  
636ce25c30010a Christian König   2015-12-18  528  	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
840d51445f1527 monk.liu          2015-04-27  529  
3c0eea6c35d932 Christian König   2015-12-11  530  	INIT_LIST_HEAD(&duplicates);
56467ebfb25483 Christian König   2015-12-11  531  	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
d38ceaf99ed015 Alex Deucher      2015-04-20  532  
e83dfe4d869358 Christian König   2018-09-10  533  	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
91acbeb68ab10c Christian König   2015-12-14  534  		list_add(&p->uf_entry.tv.head, &p->validated);
91acbeb68ab10c Christian König   2015-12-14  535  
899fbde1464639 Philip Yang       2018-12-13  536  	/* Get userptr backing pages. If pages are updated after registered
899fbde1464639 Philip Yang       2018-12-13  537  	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
899fbde1464639 Philip Yang       2018-12-13  538  	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
899fbde1464639 Philip Yang       2018-12-13  539  	 */
39f7f69a6054bb Christian König   2018-07-30  540  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
e83dfe4d869358 Christian König   2018-09-10  541  		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
899fbde1464639 Philip Yang       2018-12-13  542  		bool userpage_invalidated = false;
899fbde1464639 Philip Yang       2018-12-13  543  		int i;
2f568dbd6b944c Christian König   2016-02-23  544  
899fbde1464639 Philip Yang       2018-12-13  545  		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
2098105ec65cb3 Michal Hocko      2017-05-17  546  					sizeof(struct page *),
2098105ec65cb3 Michal Hocko      2017-05-17  547  					GFP_KERNEL | __GFP_ZERO);
2f568dbd6b944c Christian König   2016-02-23  548  		if (!e->user_pages) {
be4e6489be6399 Chen Li           2021-03-03  549  			DRM_ERROR("kvmalloc_array failure\n");
4b9049fb1c3734 Jasber Chen       2023-02-14  550  			mutex_unlock(&p->bo_list->bo_list_mutex);
899fbde1464639 Philip Yang       2018-12-13  551  			return -ENOMEM;
2f568dbd6b944c Christian König   2016-02-23  552  		}
2f568dbd6b944c Christian König   2016-02-23  553  
e5eaa7cc0c0359 Philip Yang       2019-07-02  554  		r = amdgpu_ttm_tt_get_user_pages(bo, e->user_pages);
2f568dbd6b944c Christian König   2016-02-23  555  		if (r) {
2098105ec65cb3 Michal Hocko      2017-05-17  556  			kvfree(e->user_pages);
2f568dbd6b944c Christian König   2016-02-23  557  			e->user_pages = NULL;
4b9049fb1c3734 Jasber Chen       2023-02-14  558  			mutex_unlock(&p->bo_list->bo_list_mutex);
899fbde1464639 Philip Yang       2018-12-13  559  			return r;
899fbde1464639 Philip Yang       2018-12-13  560  		}
899fbde1464639 Philip Yang       2018-12-13  561  
899fbde1464639 Philip Yang       2018-12-13  562  		for (i = 0; i < bo->tbo.ttm->num_pages; i++) {
899fbde1464639 Philip Yang       2018-12-13  563  			if (bo->tbo.ttm->pages[i] != e->user_pages[i]) {
899fbde1464639 Philip Yang       2018-12-13  564  				userpage_invalidated = true;
899fbde1464639 Philip Yang       2018-12-13  565  				break;
2f568dbd6b944c Christian König   2016-02-23  566  			}
2f568dbd6b944c Christian König   2016-02-23  567  		}
899fbde1464639 Philip Yang       2018-12-13  568  		e->user_invalidated = userpage_invalidated;
899fbde1464639 Philip Yang       2018-12-13  569  	}
2f568dbd6b944c Christian König   2016-02-23  570  
899fbde1464639 Philip Yang       2018-12-13  571  	r = ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
9165fb879f62a7 Christian König   2019-09-19  572  				   &duplicates);
899fbde1464639 Philip Yang       2018-12-13  573  	if (unlikely(r != 0)) {
899fbde1464639 Philip Yang       2018-12-13  574  		if (r != -ERESTARTSYS)
899fbde1464639 Philip Yang       2018-12-13  575  			DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
4b9049fb1c3734 Jasber Chen       2023-02-14  576  		mutex_unlock(&p->bo_list->bo_list_mutex);
899fbde1464639 Philip Yang       2018-12-13  577  		goto out;
2f568dbd6b944c Christian König   2016-02-23  578  	}
a5b750583eb4af Christian König   2015-09-03  579  
84db666496bccc Christian König   2021-06-09  580  	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
84db666496bccc Christian König   2021-06-09  581  		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
84db666496bccc Christian König   2021-06-09  582  
84db666496bccc Christian König   2021-06-09  583  		e->bo_va = amdgpu_vm_bo_find(vm, bo);
84db666496bccc Christian König   2021-06-09  584  
84db666496bccc Christian König   2021-06-09  585  		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
84db666496bccc Christian König   2021-06-09  586  			e->chain = dma_fence_chain_alloc();
84db666496bccc Christian König   2021-06-09  587  			if (!e->chain) {
84db666496bccc Christian König   2021-06-09  588  				r = -ENOMEM;
84db666496bccc Christian König   2021-06-09  589  				goto error_validate;
84db666496bccc Christian König   2021-06-09  590  			}
84db666496bccc Christian König   2021-06-09  591  		}
84db666496bccc Christian König   2021-06-09  592  	}
84db666496bccc Christian König   2021-06-09  593  
00f06b246a3056 John Brooks       2017-06-27  594  	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
00f06b246a3056 John Brooks       2017-06-27  595  					  &p->bytes_moved_vis_threshold);
f69f90a113f283 Christian König   2015-12-21  596  	p->bytes_moved = 0;
00f06b246a3056 John Brooks       2017-06-27  597  	p->bytes_moved_vis = 0;
f69f90a113f283 Christian König   2015-12-21  598  
f7da30d979d4c6 Christian König   2016-09-28  599  	r = amdgpu_vm_validate_pt_bos(p->adev, &fpriv->vm,
bc6a6726c3c5ce Nirmoy Das        2021-05-25  600  				      amdgpu_cs_bo_validate, p);
f7da30d979d4c6 Christian König   2016-09-28  601  	if (r) {
f7da30d979d4c6 Christian König   2016-09-28  602  		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
f7da30d979d4c6 Christian König   2016-09-28  603  		goto error_validate;
f7da30d979d4c6 Christian König   2016-09-28  604  	}
f7da30d979d4c6 Christian König   2016-09-28  605  
f69f90a113f283 Christian König   2015-12-21  606  	r = amdgpu_cs_list_validate(p, &duplicates);
a3e7738d577162 Christian König   2019-05-17  607  	if (r)
a5b750583eb4af Christian König   2015-09-03  608  		goto error_validate;
a5b750583eb4af Christian König   2015-09-03  609  
f69f90a113f283 Christian König   2015-12-21  610  	r = amdgpu_cs_list_validate(p, &p->validated);
a3e7738d577162 Christian König   2019-05-17  611  	if (r)
a8480309df2aa8 Christian König   2016-01-05  612  		goto error_validate;
a8480309df2aa8 Christian König   2016-01-05  613  
00f06b246a3056 John Brooks       2017-06-27  614  	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
00f06b246a3056 John Brooks       2017-06-27  615  				     p->bytes_moved_vis);
01d98506eca24f Emily Deng        2018-05-30  616  
01d98506eca24f Emily Deng        2018-05-30  617  	gds = p->bo_list->gds_obj;
01d98506eca24f Emily Deng        2018-05-30  618  	gws = p->bo_list->gws_obj;
01d98506eca24f Emily Deng        2018-05-30  619  	oa = p->bo_list->oa_obj;
a8480309df2aa8 Christian König   2016-01-05  620  
d88bf583bd06ee Christian König   2016-05-06  621  	if (gds) {
77a2faa55c1a49 Christian König   2018-09-14  622  		p->job->gds_base = amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
77a2faa55c1a49 Christian König   2018-09-14  623  		p->job->gds_size = amdgpu_bo_size(gds) >> PAGE_SHIFT;
d88bf583bd06ee Christian König   2016-05-06  624  	}
d88bf583bd06ee Christian König   2016-05-06  625  	if (gws) {
77a2faa55c1a49 Christian König   2018-09-14  626  		p->job->gws_base = amdgpu_bo_gpu_offset(gws) >> PAGE_SHIFT;
77a2faa55c1a49 Christian König   2018-09-14  627  		p->job->gws_size = amdgpu_bo_size(gws) >> PAGE_SHIFT;
d88bf583bd06ee Christian König   2016-05-06  628  	}
d88bf583bd06ee Christian König   2016-05-06  629  	if (oa) {
77a2faa55c1a49 Christian König   2018-09-14  630  		p->job->oa_base = amdgpu_bo_gpu_offset(oa) >> PAGE_SHIFT;
77a2faa55c1a49 Christian König   2018-09-14  631  		p->job->oa_size = amdgpu_bo_size(oa) >> PAGE_SHIFT;
d88bf583bd06ee Christian König   2016-05-06  632  	}
a5b750583eb4af Christian König   2015-09-03  633  
e83dfe4d869358 Christian König   2018-09-10  634  	if (!r && p->uf_entry.tv.bo) {
e83dfe4d869358 Christian König   2018-09-10  635  		struct amdgpu_bo *uf = ttm_to_amdgpu_bo(p->uf_entry.tv.bo);
c855e25090cdaf Christian König   2016-09-05  636  
c5835bbb119599 Christian König   2017-10-27  637  		r = amdgpu_ttm_alloc_gart(&uf->tbo);
c855e25090cdaf Christian König   2016-09-05  638  		p->job->uf_addr += amdgpu_bo_gpu_offset(uf);
c855e25090cdaf Christian König   2016-09-05  639  	}
b5f5acbc87052e Christian König   2016-06-29  640  
a5b750583eb4af Christian König   2015-09-03  641  error_validate:
84db666496bccc Christian König   2021-06-09  642  	if (r) {
84db666496bccc Christian König   2021-06-09  643  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
84db666496bccc Christian König   2021-06-09  644  			dma_fence_chain_free(e->chain);
84db666496bccc Christian König   2021-06-09  645  			e->chain = NULL;
84db666496bccc Christian König   2021-06-09  646  		}
a5b750583eb4af Christian König   2015-09-03  647  		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
4b9049fb1c3734 Jasber Chen       2023-02-14  648  		mutex_unlock(&p->bo_list->bo_list_mutex);
84db666496bccc Christian König   2021-06-09  649  	}
899fbde1464639 Philip Yang       2018-12-13  650  out:
d38ceaf99ed015 Alex Deucher      2015-04-20 @651  	return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  652  }
d38ceaf99ed015 Alex Deucher      2015-04-20  653  

:::::: The code at line 651 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

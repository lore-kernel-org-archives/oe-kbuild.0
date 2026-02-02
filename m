Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAD30B521
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770062585; cv=none; b=OWF8ME442+BKJfc8FIthBy7XfkX8sSwJ2JGmJVnfW0a/F1dmyOxsH4wwRRG7tRz9WmR9r/c8t64OO7qzZTIymr531UB2H37PCnNuGBv+0qjNE0gAeCOAMi2Va7XzNZ7YiGQ/MaZvVB/MOsYspySeMsA4JX6umhODd+9mw33vvxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770062585; c=relaxed/simple;
	bh=beSF1ghm/k/d7sn97ZIunuVmMGK6yUo+MZWszgLbW5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTzuIEXxAkDS3W3OP8Z8x0z8xX3UPMkRbByL0HnOP32g1250Q74zhaIEqSjBJv9eTF3r2C6vm8d/pn0wlXpF/DCQuRUFAua/3BtdBpxCFPLpHMSyZoDm47quLfgfu1BG7xoBcCEN32g5wEuc6OyrH+1jYgcAjDzMMyEqhpEmM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGfbvU9r; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGfbvU9r"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee0291921so46623605e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Feb 2026 12:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770062581; x=1770667381; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcQYqRCcN1yqD7owjOy2nXZGx7IMFXVRkBXg6zDJMq4=;
        b=QGfbvU9r9jRzSP8/J75nIpt1OmhBhqnmmgivBNGjXj7nXDIdm3ny769vo0+UsQ5j/p
         nDxmh2mOQ/F/4cj06jvrcDwzHXSwlTnpjuidOVMzg5xE7VVBPBIOjZyLd3aFSo9+rHu7
         ntWkY8MuQ23oj2uPoZjsbWL4v7p5qOzrhVjgHYEmiBQhbaISf95GIYs0g2RxzvKoSePS
         +5flW/R+yC3rzx9hToZDG7ZkJWCUSNjxfuDdcYd0G/4Q3UTtrabMPHtp3fvmG3SfY/3V
         BG6tWsi5a3aj22Rm5RqCD5mT6g/1bKfcnH1NrpzuEp2YpV2DCs36WUr6cTLVxwKPGqj8
         tGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770062581; x=1770667381;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gcQYqRCcN1yqD7owjOy2nXZGx7IMFXVRkBXg6zDJMq4=;
        b=tp/ZB+X4AXLOLeIU6/9Xk7MnbTuuOi8X1m3te3Tlxjab1YtVHfl+4jcdeJp4hxVOJS
         dydLyehYTuSODYESA4qZ3uymvW4Dfe8Dz3ZU75k1PyCxq5IRvi7b4fP1BxaTtmicUF4v
         hqqVQhqPw3tAGsGlbpWq3cUmPtG+yoLm+aQt9ybxG5YI2CYfrnYvDELw6G8bpG4+rz3J
         a2bP31Ia3UCoPzAdmoHvqXu3u0tdFS9KWellYcx9HV4tPS8wiDTAUNHVejM17bufkiMU
         aXtMxXl47fSOIh1Rhw+IUFA9fsOjTZvH5UWFqOroeMQDtzQ7ye2WYtiT7zNFtkF1adCt
         O1lQ==
X-Gm-Message-State: AOJu0YwjmTbX6uP1t16aIP7KAMRGKJbopuvWpx9QfPmKXnpHrez4pgwK
	di51MT0H0WmCS3K/oqDZkzBCDqRF+cZTsugstr7mHchkIa91L0nl1o8U0ZKKdb+Amuj3E+7d2bL
	ucLGW41Q=
X-Gm-Gg: AZuq6aIZVB7x5LLzCcTuVnudyl5U6Gtp/9qK5dKk7eFcwmU8r14q2MIr5SZGQMFyGjy
	OSqIyo6ZeiihFs9lhaEpdkzLm9vA7pO4gzd/YEAP8vtgLTV061K66lipRvucjnU0/0iOGGA8msO
	dI6hQrfm1JqpW8LdQJw6hHuh6wRxC+N5MLoru340Kbx98ARrhrypvaDx+uej1ToKRUrewvbMU/c
	l1SNFwykk5PzRUKMxhjbOBSyAgdvNttDmUnMv6ddP44we8oMuz2vUPnkPAn5N77XRsLXmUR/nQ5
	X3XX1JE2eWCmOt62HEEMtqT0UJ9iffS8d7JE7B8tvNrdT7KehufQlz8IyARObJhapXeQuxdcQDU
	xLqrBBZzGMBpUCgosCQRr6zOpNFS9sdVwJGl5UIvZzN4DHPrZNFrBCUsK74q/rnLFgfGZmNfEep
	ln48xlBvmzT4TMxbrGtIYfulQpFTA=
X-Received: by 2002:a05:600c:1d0b:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-482db49414bmr165819945e9.1.1770062581316;
        Mon, 02 Feb 2026 12:03:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830513352csm10844965e9.10.2026.02.02.12.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:03:00 -0800 (PST)
Date: Mon, 2 Feb 2026 23:02:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sunil Khatri <sunil.khatri@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003 amdgpu_cs_parser_bos()
 warn: inconsistent returns '&p->bo_list->bo_list_mutex'.
Message-ID: <202602030017.7E0xShmH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260202200258.eFMDAoqU63BQRGnJYYNH7ChLb_aOHN-8Oz8iueoXBKU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   18f7fcd5e69a04df57b563360b88be72471d6b62
commit: e095b55155ef69a8ae0eb114a7fd2a381c012f33 drm/amdgpu: use user provided hmm_range buffer in amdgpu_ttm_tt_get_user_pages
config: s390-randconfig-r072-20260202 (https://download.01.org/0day-ci/archive/20260203/202602030017.7E0xShmH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602030017.7E0xShmH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1003 amdgpu_cs_parser_bos() warn: inconsistent returns '&p->bo_list->bo_list_mutex'.

vim +1003 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

d4e8ad908b2095 Christian König   2022-09-08   855  static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
d4e8ad908b2095 Christian König   2022-09-08   856  				union drm_amdgpu_cs *cs)
d4e8ad908b2095 Christian König   2022-09-08   857  {
d4e8ad908b2095 Christian König   2022-09-08   858  	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
ca6c1e210aa7d7 Christian König   2022-04-16   859  	struct ttm_operation_ctx ctx = { true, false };
d4e8ad908b2095 Christian König   2022-09-08   860  	struct amdgpu_vm *vm = &fpriv->vm;
d4e8ad908b2095 Christian König   2022-09-08   861  	struct amdgpu_bo_list_entry *e;
ca6c1e210aa7d7 Christian König   2022-04-16   862  	struct drm_gem_object *obj;
ca6c1e210aa7d7 Christian König   2022-04-16   863  	unsigned long index;
4624459c84d71e Christian König   2022-03-02   864  	unsigned int i;
d4e8ad908b2095 Christian König   2022-09-08   865  	int r;
d4e8ad908b2095 Christian König   2022-09-08   866  
d4e8ad908b2095 Christian König   2022-09-08   867  	/* p->bo_list could already be assigned if AMDGPU_CHUNK_ID_BO_HANDLES is present */
d4e8ad908b2095 Christian König   2022-09-08   868  	if (cs->in.bo_list_handle) {
d4e8ad908b2095 Christian König   2022-09-08   869  		if (p->bo_list)
d4e8ad908b2095 Christian König   2022-09-08   870  			return -EINVAL;
d38ceaf99ed015 Alex Deucher      2015-04-20   871  
d4e8ad908b2095 Christian König   2022-09-08   872  		r = amdgpu_bo_list_get(fpriv, cs->in.bo_list_handle,
d4e8ad908b2095 Christian König   2022-09-08   873  				       &p->bo_list);
bbca24d0a3c111 Maíra Canal       2022-08-15   874  		if (r)
d38ceaf99ed015 Alex Deucher      2015-04-20   875  			return r;
d4e8ad908b2095 Christian König   2022-09-08   876  	} else if (!p->bo_list) {
d4e8ad908b2095 Christian König   2022-09-08   877  		/* Create a empty bo_list when no handle is provided */
d4e8ad908b2095 Christian König   2022-09-08   878  		r = amdgpu_bo_list_create(p->adev, p->filp, NULL, 0,
d4e8ad908b2095 Christian König   2022-09-08   879  					  &p->bo_list);
bbca24d0a3c111 Maíra Canal       2022-08-15   880  		if (r)
91e1a5207edec9 Christian König   2015-07-06   881  			return r;
d38ceaf99ed015 Alex Deucher      2015-04-20   882  	}
b495bd3a54e732 Christian König   2015-09-10   883  
d4e8ad908b2095 Christian König   2022-09-08   884  	mutex_lock(&p->bo_list->bo_list_mutex);
d5884513a31df0 Christian König   2017-09-08   885  
d4e8ad908b2095 Christian König   2022-09-08   886  	/* Get userptr backing pages. If pages are updated after registered
d4e8ad908b2095 Christian König   2022-09-08   887  	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
d4e8ad908b2095 Christian König   2022-09-08   888  	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
d4e8ad908b2095 Christian König   2022-09-08   889  	 */
d4e8ad908b2095 Christian König   2022-09-08   890  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
d4e8ad908b2095 Christian König   2022-09-08   891  		bool userpage_invalidated = false;
ca6c1e210aa7d7 Christian König   2022-04-16   892  		struct amdgpu_bo *bo = e->bo;
ad864d243826ce Andrey Grodzovsky 2017-10-10   893  
e095b55155ef69 Sunil Khatri      2025-09-24   894  		e->range = kzalloc(sizeof(*e->range), GFP_KERNEL);
e095b55155ef69 Sunil Khatri      2025-09-24   895  		if (unlikely(!e->range))
e095b55155ef69 Sunil Khatri      2025-09-24   896  			return -ENOMEM;

Need to cleanup and unlock before returning.

e095b55155ef69 Sunil Khatri      2025-09-24   897  
e095b55155ef69 Sunil Khatri      2025-09-24   898  		r = amdgpu_ttm_tt_get_user_pages(bo, e->range);
c5b3cc417b0260 Sunil Khatri      2025-09-17   899  		if (r)
d4e8ad908b2095 Christian König   2022-09-08   900  			goto out_free_user_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   901  
d4e8ad908b2095 Christian König   2022-09-08   902  		for (i = 0; i < bo->tbo.ttm->num_pages; i++) {
c5b3cc417b0260 Sunil Khatri      2025-09-17   903  			if (bo->tbo.ttm->pages[i] != hmm_pfn_to_page(e->range->hmm_pfns[i])) {
d4e8ad908b2095 Christian König   2022-09-08   904  				userpage_invalidated = true;
d4e8ad908b2095 Christian König   2022-09-08   905  				break;
d4e8ad908b2095 Christian König   2022-09-08   906  			}
d4e8ad908b2095 Christian König   2022-09-08   907  		}
d4e8ad908b2095 Christian König   2022-09-08   908  		e->user_invalidated = userpage_invalidated;
9a79588c42bf89 Christian König   2016-06-22   909  	}
9a79588c42bf89 Christian König   2016-06-22   910  
ca6c1e210aa7d7 Christian König   2022-04-16   911  	drm_exec_until_all_locked(&p->exec) {
ca6c1e210aa7d7 Christian König   2022-04-16   912  		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
ca6c1e210aa7d7 Christian König   2022-04-16   913  		drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d7 Christian König   2022-04-16   914  		if (unlikely(r))
d4e8ad908b2095 Christian König   2022-09-08   915  			goto out_free_user_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   916  
d4e8ad908b2095 Christian König   2022-09-08   917  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian König   2022-04-16   918  			/* One fence for TTM and one for each CS job */
ca6c1e210aa7d7 Christian König   2022-04-16   919  			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
ca6c1e210aa7d7 Christian König   2022-04-16   920  						 1 + p->gang_size);
ca6c1e210aa7d7 Christian König   2022-04-16   921  			drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d7 Christian König   2022-04-16   922  			if (unlikely(r))
ca6c1e210aa7d7 Christian König   2022-04-16   923  				goto out_free_user_pages;
d38ceaf99ed015 Alex Deucher      2015-04-20   924  
ca6c1e210aa7d7 Christian König   2022-04-16   925  			e->bo_va = amdgpu_vm_bo_find(vm, e->bo);
ca6c1e210aa7d7 Christian König   2022-04-16   926  		}
ca6c1e210aa7d7 Christian König   2022-04-16   927  
ca6c1e210aa7d7 Christian König   2022-04-16   928  		if (p->uf_bo) {
ca6c1e210aa7d7 Christian König   2022-04-16   929  			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
ca6c1e210aa7d7 Christian König   2022-04-16   930  						 1 + p->gang_size);
ca6c1e210aa7d7 Christian König   2022-04-16   931  			drm_exec_retry_on_contention(&p->exec);
ca6c1e210aa7d7 Christian König   2022-04-16   932  			if (unlikely(r))
ca6c1e210aa7d7 Christian König   2022-04-16   933  				goto out_free_user_pages;
ca6c1e210aa7d7 Christian König   2022-04-16   934  		}
ca6c1e210aa7d7 Christian König   2022-04-16   935  	}
ca6c1e210aa7d7 Christian König   2022-04-16   936  
ca6c1e210aa7d7 Christian König   2022-04-16   937  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian König   2022-04-16   938  		struct mm_struct *usermm;
ca6c1e210aa7d7 Christian König   2022-04-16   939  
ca6c1e210aa7d7 Christian König   2022-04-16   940  		usermm = amdgpu_ttm_tt_get_usermm(e->bo->tbo.ttm);
ca6c1e210aa7d7 Christian König   2022-04-16   941  		if (usermm && usermm != current->mm) {
ca6c1e210aa7d7 Christian König   2022-04-16   942  			r = -EPERM;
ca6c1e210aa7d7 Christian König   2022-04-16   943  			goto out_free_user_pages;
ca6c1e210aa7d7 Christian König   2022-04-16   944  		}
ca6c1e210aa7d7 Christian König   2022-04-16   945  
ca6c1e210aa7d7 Christian König   2022-04-16   946  		if (amdgpu_ttm_tt_is_userptr(e->bo->tbo.ttm) &&
c5b3cc417b0260 Sunil Khatri      2025-09-17   947  		    e->user_invalidated) {
ca6c1e210aa7d7 Christian König   2022-04-16   948  			amdgpu_bo_placement_from_domain(e->bo,
ca6c1e210aa7d7 Christian König   2022-04-16   949  							AMDGPU_GEM_DOMAIN_CPU);
ca6c1e210aa7d7 Christian König   2022-04-16   950  			r = ttm_bo_validate(&e->bo->tbo, &e->bo->placement,
ca6c1e210aa7d7 Christian König   2022-04-16   951  					    &ctx);
ca6c1e210aa7d7 Christian König   2022-04-16   952  			if (r)
ca6c1e210aa7d7 Christian König   2022-04-16   953  				goto out_free_user_pages;
ca6c1e210aa7d7 Christian König   2022-04-16   954  
ca6c1e210aa7d7 Christian König   2022-04-16   955  			amdgpu_ttm_tt_set_user_pages(e->bo->tbo.ttm,
c5b3cc417b0260 Sunil Khatri      2025-09-17   956  						     e->range);
ca6c1e210aa7d7 Christian König   2022-04-16   957  		}
d4e8ad908b2095 Christian König   2022-09-08   958  	}
d38ceaf99ed015 Alex Deucher      2015-04-20   959  
d4e8ad908b2095 Christian König   2022-09-08   960  	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
d4e8ad908b2095 Christian König   2022-09-08   961  					  &p->bytes_moved_vis_threshold);
d4e8ad908b2095 Christian König   2022-09-08   962  	p->bytes_moved = 0;
d4e8ad908b2095 Christian König   2022-09-08   963  	p->bytes_moved_vis = 0;
9a1b3af10d6268 Monk Liu          2017-03-08   964  
50661eb1a2c88c Felix Kuehling    2024-01-03   965  	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
d4e8ad908b2095 Christian König   2022-09-08   966  			       amdgpu_cs_bo_validate, p);
d4e8ad908b2095 Christian König   2022-09-08   967  	if (r) {
cc51bbc7d7a7ff Mario Limonciello 2025-07-15   968  		drm_err(adev_to_drm(p->adev), "amdgpu_vm_validate() failed.\n");
ca6c1e210aa7d7 Christian König   2022-04-16   969  		goto out_free_user_pages;
65333e4429c60b Monk Liu          2017-03-27   970  	}
9a1b3af10d6268 Monk Liu          2017-03-08   971  
ca6c1e210aa7d7 Christian König   2022-04-16   972  	drm_exec_for_each_locked_object(&p->exec, index, obj) {
ca6c1e210aa7d7 Christian König   2022-04-16   973  		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
ca6c1e210aa7d7 Christian König   2022-04-16   974  		if (unlikely(r))
ca6c1e210aa7d7 Christian König   2022-04-16   975  			goto out_free_user_pages;
ca6c1e210aa7d7 Christian König   2022-04-16   976  	}
b07c60c0652c49 Christian König   2016-01-31   977  
ca6c1e210aa7d7 Christian König   2022-04-16   978  	if (p->uf_bo) {
ca6c1e210aa7d7 Christian König   2022-04-16   979  		r = amdgpu_ttm_alloc_gart(&p->uf_bo->tbo);
ca6c1e210aa7d7 Christian König   2022-04-16   980  		if (unlikely(r))
ca6c1e210aa7d7 Christian König   2022-04-16   981  			goto out_free_user_pages;
4953b6b22ab9d7 Christian König   2022-09-13   982  
ca6c1e210aa7d7 Christian König   2022-04-16   983  		p->gang_leader->uf_addr += amdgpu_bo_gpu_offset(p->uf_bo);
d38ceaf99ed015 Alex Deucher      2015-04-20   984  	}
d38ceaf99ed015 Alex Deucher      2015-04-20   985  
4953b6b22ab9d7 Christian König   2022-09-13   986  	amdgpu_cs_report_moved_bytes(p->adev, p->bytes_moved,
4953b6b22ab9d7 Christian König   2022-09-13   987  				     p->bytes_moved_vis);
4624459c84d71e Christian König   2022-03-02   988  
4624459c84d71e Christian König   2022-03-02   989  	for (i = 0; i < p->gang_size; ++i)
4624459c84d71e Christian König   2022-03-02   990  		amdgpu_job_set_resources(p->jobs[i], p->bo_list->gds_obj,
4624459c84d71e Christian König   2022-03-02   991  					 p->bo_list->gws_obj,
4624459c84d71e Christian König   2022-03-02   992  					 p->bo_list->oa_obj);
4953b6b22ab9d7 Christian König   2022-09-13   993  	return 0;
4953b6b22ab9d7 Christian König   2022-09-13   994  
d4e8ad908b2095 Christian König   2022-09-08   995  out_free_user_pages:
d4e8ad908b2095 Christian König   2022-09-08   996  	amdgpu_bo_list_for_each_userptr_entry(e, p->bo_list) {
ca6c1e210aa7d7 Christian König   2022-04-16   997  		struct amdgpu_bo *bo = e->bo;
d38ceaf99ed015 Alex Deucher      2015-04-20   998  
fec8fdb54e8f74 Christian König   2022-11-10   999  		amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm, e->range);
fec8fdb54e8f74 Christian König   2022-11-10  1000  		e->range = NULL;
d4e8ad908b2095 Christian König   2022-09-08  1001  	}
c70e2166967dc4 Philip Yang       2022-11-03  1002  	mutex_unlock(&p->bo_list->bo_list_mutex);
d4e8ad908b2095 Christian König   2022-09-08 @1003  	return r;
d38ceaf99ed015 Alex Deucher      2015-04-20  1004  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


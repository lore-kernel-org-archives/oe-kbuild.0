Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB0F664C8
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692257; cv=none; b=nNe1TE74hwCCJ/b/vex/fymVEliamPdHPkC3+1HPd0Yj+848hvkPljCRY9ukCxKso3ZZqpgC+Fwa92kdQozpu4i4F+AnghmJFuPcfD2wErP7qCHuoDM/2gT3hT15u2NqU32H0SOUry0PvZAbQCbUlcPL9984LB6QW1ozHLhnLFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692257; c=relaxed/simple;
	bh=LX+IIDw7LAWxvzbdHRWfw0B+C+XVU5E1Yjznbf7sIWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ROvf8JG7bqy42YdY6WE/iV17fCT6HS9VwJFpk6uJ+vOkMn6bwTV9FEUC5soUiLB2KpnsM09AC/rYwtnCm2i6J8sn1TjqRufYbP3etBK89INrp9NQfItOUaZs0Z8GieQEl9z0wMRZCbbf0TyO48ZbQYNSz6GoRuyp3pPoHpeLB2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSzG71qI; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSzG71qI"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d0600551e8so16400791fa.0
        for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 01:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706692253; x=1707297053; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cgExCvRH14FXNOEX2q+ieKqRx3LRFYlOhTkoQIbaOMI=;
        b=FSzG71qIxigkeD7NoDZIhVjuUi4uyebK41YCl8I9IppUlBUyTNESaMjAs9d8OzZxiU
         1cZxjmoRO4CDPl9RNzb8aNfF5X8dTvgI9SEvWg0In+ChNPtOd17Mow1JasrHXbvBQXRc
         d1+ZPsLRRDyrbDI350lNCjIm0Im9cEBARCO4UgJNm5W8l3q3FGNcPH3p8TsjcAY9d0Qe
         INuFLjqj/SGVgx4jlILnJJKjOFKy/J7QWRyFGFn7+EVrLy+RLEXfTcopjPLCsqWbWpIj
         fEfsxrKvL72cxV25Q/6U/zK3hCbA2vMJbxCI2nM3Lsf8Qe/oY+SZbgRpBJ5uNUEc0Mj/
         OudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692253; x=1707297053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgExCvRH14FXNOEX2q+ieKqRx3LRFYlOhTkoQIbaOMI=;
        b=LL403v0mgmgmFhUT1MVwKgHAJTP/OZX3iLAGRHfEBZ2Jxl5bZ4btMVJp7/2/nhRYWN
         O9I0SjuScgWuOA2PQX5AtsxesyTbo0gskI40fgK+VfhfU9PiYYq6sH9ZCs9IqF8cmxDb
         L0WtIsn74UONl3V/PUlpT9He9aO4HxqTNcILcWYbOtMkxlzwDlePx3g0SockhdY1JSo9
         6r8cyR55fEXoknzveXGAfdtlN9wef5nzsCTZRfATIzbO0Ct2hc6UR0rQIWrXC57Y1Z6g
         O4Oy0mabpxnRxTNMnnxzMRipRe42592Q9Ag4Q12QAmjmO4IW4DFRVueH0Fu+PQX9XIQ1
         zAPg==
X-Gm-Message-State: AOJu0Yxt3vVRV2L8zJqtg2YZY9aKRAyTw8omRd5D7bI54FmulqEmAreq
	banjX3W8Sxo0v3/XwgoHixa0lez8EIBbu27xCQeZe3VC8GAQlyaB59T4RuOLcBA2GOWfiL5pUro
	g
X-Google-Smtp-Source: AGHT+IEKxu+DvVmX2V+Ho9agy9CO6Vfuk9+x4uHjd6xbnu8GyTrj4nTMdMO7EM1EZ0B6gV7SKSOWQg==
X-Received: by 2002:a05:651c:b1e:b0:2d0:6c48:95af with SMTP id b30-20020a05651c0b1e00b002d06c4895afmr401928ljr.50.1706692252705;
        Wed, 31 Jan 2024 01:10:52 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040ef718cf81sm978022wmo.28.2024.01.31.01.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 01:10:52 -0800 (PST)
Date: Wed, 31 Jan 2024 12:10:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/5] drm/xe: store bind time pat index to xe_bo
Message-ID: <7ae75ca8-cc58-4baa-abf3-0caaa4513f34@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240126210807.320671-4-juhapekka.heikkila@gmail.com>

Hi Juha-Pekka,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juha-Pekka-Heikkila/drm-xe-pat-annotate-pat-index-table-with-compression-information/20240127-091231
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240126210807.320671-4-juhapekka.heikkila%40gmail.com
patch subject: [PATCH 3/5] drm/xe: store bind time pat index to xe_bo
config: sparc-randconfig-r081-20240128 (https://download.01.org/0day-ci/archive/20240131/202401311604.1pLlAxeK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401311604.1pLlAxeK-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:1265 __xe_pt_bind_vma() warn: possible memory leak of 'ifence'
drivers/gpu/drm/xe/xe_pt.c:1265 __xe_pt_bind_vma() warn: possible memory leak of 'rfence'

vim +/ifence +1265 drivers/gpu/drm/xe/xe_pt.c

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

Smatch wants a kfree(ifence) and kfree(rfence) before the return.

6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1266  
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1267  		bo->pat_index = vma->pat_index;
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1268  	}
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1269  
08dea7674533cf Matt Roper          2023-06-01  1270  	fence = xe_migrate_update_pgtables(tile->migrate,
6fb884b76bd164 Juha-Pekka Heikkila 2024-01-26  1271  					   vm, bo, q,
dd08ebf6c3525a Matthew Brost       2023-03-30  1272  					   entries, num_entries,
dd08ebf6c3525a Matthew Brost       2023-03-30  1273  					   syncs, num_syncs,
dd08ebf6c3525a Matthew Brost       2023-03-30  1274  					   &bind_pt_update.base);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


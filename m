Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5E2F4A04
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268611; cv=none; b=Lxit69A/C+cMW/w6coXiu6yhqR+1vNGnKuRtYhIobFNT0j5H5Olappe2x1PhOThizTQmO+KxGPqNo0/aZDVhS0dKWEUPPPiHbIFE6eYMOCQSAcKK9Y//QLZYEQqWwVoqKMD3G8Rbo2Fvszma4ePPs+Onr2jDQQYeHJhLq5YTLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268611; c=relaxed/simple;
	bh=iR0oVXfz7Iow4fJX6WtwuDZi5nG3RYfFBpjZGL9zp5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cyq0CxOQibm2ZJlX/yLVILSXIvujj9d2qrKYeXFs3sewWALwdmabgGMgZ0boaJb6YbUs+ixKyF47O63M74/fgq4oddpPZuzVl74CbIyP3LmFRwDw0LZPN0bk3xFYPFR9X5ubaHubt3Bkca9i4BuuD45tkURuVbMTNEawNYmwF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0cq1U6E; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0cq1U6E"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60402c94319so4303384eaf.1
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 10:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268608; x=1750873408; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vNQd+s4c7fZ/c1u+NR4VFA1VDON+kx4gKdQrhwnx4oE=;
        b=W0cq1U6ENFhfXCesYMABCegB0Q9rhSnFNMXTtKm3Hn+eB2knbtT5ppzYUWEr8TJ3tM
         pT2vWjifoPcimUGC9Xi66HrfQ6MsYBzonm3Bw+3NI/Kk1XiCuZz0M1qbgC7DKDKJDWuZ
         6cgOc4c61sN6ZPcxT3FtgcGq2JcXqZVr9MW+nhlFoF/kOiSdtvqR0OGNo5F3AaRtixt6
         xfaXD90wP0XJAEi0W8Vc6DlcFIK4T0Mbaln+oGOqvJFLAncSSOMUBI2UWa5qyrcB+tTL
         l27OUbDEPH8Otn72ECW9R42xV3pcE1k56/NC+eTNwEQb57sSpZbJm9YGlm0dAto7EG9O
         zY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268608; x=1750873408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNQd+s4c7fZ/c1u+NR4VFA1VDON+kx4gKdQrhwnx4oE=;
        b=h+9E8DjLuZsxLhO83D7bKSKrWgUgdYqTUJ3wMxcpPDZbgyovYb0EnP5gOkAC9oR5TF
         ieA78PdS7k4OffBZgotPB24KdZ64zM3R6YMS7PCLFvHhoq3UbI1Dc9nxRg+z+3jM7UAE
         O6n4g8isoMQQYEj0UbS5dOwlvwA20jl1fh66AlrM1iG7MeGb5j5hhIHQ8N38rRvpFWpM
         NUiN5hP7/f/lgJkT+KM1KRHwoK+3MxR1tq6qIqtvBmodYDjT89/560pzGnvEhO/Ljr9M
         U6I4i1FpJFOzclsufMhaWBT0sPAbkZAexXclTjTiNZfaJgEhFMrjjEvIsj4Rf1xzlzx0
         ngPQ==
X-Gm-Message-State: AOJu0YyUrR7x5RMxbqPIT9OdCNfrl8uI3YIcDJGNNG+/417RuC50NNWZ
	WQQGJBLaqth4FiNl39RGYsZFMvxcy6nDXULYrKHYfnx9Rh7UiNBsLDcPOPyx5xSu7LM8tLo6LSo
	TCeDT
X-Gm-Gg: ASbGncsVFaeUZZCXz7q8+G94qdQ+6+BM9byIFSqKkx8mJlFj/X4kQ6Te5LAPN/xjrul
	vKHdtUQw7iEVDM3c7fAS9lY+dekPoURLdUeSCjK0siLshvO5fsrWMIb9gJ4hoRjYHkZz2sejMiG
	ohi2FnWD9axxm7r+O0ekbcXvSehh3Clp+8Wii74+m98lBKlBnxwwZnuvSkoDX0IPbpEuKZkHn4M
	b6j5hSYHImgz7IGS5W2IbmCLYRJol46KlbMhExL3hlLFnbZgWaCgyk2TjPa2wjbQYoWPN0/AJzo
	isCb145qhrx58jHI/oQfdC6k4Nhgxh1fpDdQIKMpHGP2ZgKjAiH2uqPbtm/v5X+oAubmNQ==
X-Google-Smtp-Source: AGHT+IGs9y4YrLtKzq6Kz0kcquCWy6Yh0zVB81lvYnZESWbuJcIsS2VOc4LPbw1BHhsB9ZG3W8MT8A==
X-Received: by 2002:a05:6820:627:b0:60b:cd81:9079 with SMTP id 006d021491bc7-61110f10f38mr10142367eaf.5.1750268607871;
        Wed, 18 Jun 2025 10:43:27 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108ebd993sm1496207eaf.21.2025.06.18.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:43:27 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:43:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org, airlied@gmail.com,
	Matthew Brost <matthew.brost@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict()
 using the guarded LRU iteration
Message-ID: <4c7a6891-3925-428d-8df8-6576abd63eb3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613151824.178650-4-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Use-a-struct-for-the-common-part-of-struct-ttm_lru_walk-and-struct-ttm_bo_lru_cursor/20250613-232106
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613151824.178650-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 3/3] drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded LRU iteration
config: i386-randconfig-141-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141727.FtEuY8xN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506141727.FtEuY8xN-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_util.c:975 __ttm_bo_lru_cursor_next() error: uninitialized symbol 'ret'.

vim +/ret +975 drivers/gpu/drm/ttm/ttm_bo_util.c

f3bcfd04a52fb1 Thomas Hellström 2025-03-05  927  static struct ttm_buffer_object *
a9654c8f32d9f4 Thomas Hellström 2025-06-13  928  __ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs, bool first)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  929  {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  930  	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  931  	struct ttm_resource *res = NULL;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  932  	struct ttm_buffer_object *bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  933  	struct ttm_lru_walk_arg *arg = curs->arg;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  934  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  935  	ttm_bo_lru_cursor_cleanup_bo(curs);
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  936  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  937  	spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  938  	for (;;) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  939  		int mem_type, ret;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  940  		bool bo_locked = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  941  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  942  		if (first) {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  943  			res = ttm_resource_manager_first(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  944  			first = false;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  945  		} else {
a9654c8f32d9f4 Thomas Hellström 2025-06-13  946  			res = ttm_resource_manager_next(&curs->res_curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  947  		}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  948  		if (!res)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  949  			break;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  950  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  951  		bo = res->bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  952  		if (ttm_lru_walk_trylock(arg, bo, &curs->needs_unlock))
a9654c8f32d9f4 Thomas Hellström 2025-06-13  953  			bo_locked = true;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  954  		else if (!arg->ticket || arg->ctx->no_wait_gpu || arg->trylock_only)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  955  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  956  
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  957  		if (!ttm_bo_get_unless_zero(bo)) {
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  958  			if (curs->needs_unlock)
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  959  				dma_resv_unlock(bo->base.resv);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  960  			continue;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  961  		}
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  962  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  963  		mem_type = res->mem_type;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  964  		spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  965  		if (!bo_locked)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  966  			ret = ttm_lru_walk_ticketlock(arg, bo, &curs->needs_unlock);

ret is uninitialized on else path

a9654c8f32d9f4 Thomas Hellström 2025-06-13  967  		/*
a9654c8f32d9f4 Thomas Hellström 2025-06-13  968  		 * Note that in between the release of the lru lock and the
a9654c8f32d9f4 Thomas Hellström 2025-06-13  969  		 * ticketlock, the bo may have switched resource,
a9654c8f32d9f4 Thomas Hellström 2025-06-13  970  		 * and also memory type, since the resource may have been
a9654c8f32d9f4 Thomas Hellström 2025-06-13  971  		 * freed and allocated again with a different memory type.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  972  		 * In that case, just skip it.
a9654c8f32d9f4 Thomas Hellström 2025-06-13  973  		 */
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  974  		curs->bo = bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13 @975  		if (!ret && bo->resource && bo->resource->mem_type == mem_type)
                                                                    ^^^^
warning

f3bcfd04a52fb1 Thomas Hellström 2025-03-05  976  			return bo;
a9654c8f32d9f4 Thomas Hellström 2025-06-13  977  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  978  		ttm_bo_lru_cursor_cleanup_bo(curs);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  979  		if (ret)
a9654c8f32d9f4 Thomas Hellström 2025-06-13  980  			return ERR_PTR(ret);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  981  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  982  		spin_lock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  983  	}
a9654c8f32d9f4 Thomas Hellström 2025-06-13  984  
a9654c8f32d9f4 Thomas Hellström 2025-06-13  985  	spin_unlock(lru_lock);
a9654c8f32d9f4 Thomas Hellström 2025-06-13  986  	return res ? bo : NULL;
f3bcfd04a52fb1 Thomas Hellström 2025-03-05  987  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


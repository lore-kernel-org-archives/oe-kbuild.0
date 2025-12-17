Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E31382D32
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981724; cv=none; b=iyY1T+VomCGrbwwJbaalyc0FeuOk8nAO+it3nFibBpib0t1DKII+XnAEfUDpUGnvsnlva7WyMfNWbJDy6me9c6Yby4FNyjr5vBhEwZrotwuKNhrmpHL3UmDbC9IK7f83b61TkIRjrCkTUFYpaq0vdlIuIx0TEN/eqaW1dDoW2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981724; c=relaxed/simple;
	bh=J6NSUzD2V2k2/q+qqNzY1IFQg+Meq4nswaVLTHkSkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gyxs8+ZOZ/CEmdR+5RSJmYxKZ6wkzV8WA5/okw4iniVEPGqGhsq+ZWr9zzQdQLqi1JMJi/LAFP5oxqUMuWNH8E1a8aNJxNAio/DiK7cmyG7YSig4k98BDd7a+0Bvz8BfmZ98djiD8pupo5G2dHa1KysQ71Ijtsp32ggi7cTAdAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oDXQKqFG; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oDXQKqFG"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so44512785e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765981721; x=1766586521; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHx7DZEBmfQLYTq+RgL+Ee4so8rfbbSfi7WOO0Gbr+4=;
        b=oDXQKqFG5E/h3XEA7237hYZw8LuNmrliQdO+yN0iVTk8xctqKMF9IMF8G7fJJ4n+mp
         DSPzfrpx7Ly6mEwaeQD6MaMPefq9zCJwqjch5AteTKvpx5IE6TDRcQBi0q7PJ3c7xJ40
         CTNqhDr8pdzcsziUNVZNFhrQE2F1cphvRfIoqHRv0BleRDcfxqWQmqoJivld4/X6jSCq
         KJf55xLWgSJ9CxlIHMLynuLExxuXBLKXrIaljTaFIyCGPjZuOTE2Hm1o10qa/sf9AtGD
         KQ/f1zPohl4TmQazLpsbu7q/QYk9usP/qBn9MowaDwcJ5ObWkyWjSRBrQvQMfp+ZvyWi
         MNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981721; x=1766586521;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHx7DZEBmfQLYTq+RgL+Ee4so8rfbbSfi7WOO0Gbr+4=;
        b=RoeErhnfSyzApqzPdaluNhVDwiPXzjgwWZyyU+Jb+GrC4fEi0Kan/59ajvMGNrWH0P
         logebZ+nuV2D566OIC1Ege8fNaz2bZ8OjeICAITJzlEzBzqPA6nlAznbwrae1ToyIBaO
         aDv66BYYM/AVAzm96U7Y0omL9YfsZWurLw8/59GYXrLoCyjgqhaxRrqO9q4JzSp1TmbO
         yGp2DQ9SLpN6XPE2OYa2aPvwBYj7QsU+VmsrmlCJ9GxBw5UvF4nMG1zHbNLbqMaH85dJ
         ssbqX8HpdeglgPyoF9D8fcu1l5lYPt/teFn7zWGJGLbQLcyBAogMm/R2GsqyHSsGhfyS
         GDEQ==
X-Gm-Message-State: AOJu0YyKjfLGa4bNESscTnCohrLBJ8zBTNqZAdHEs2tFVitg9i91MlMr
	QSVEaeWSLq2lqS3fU8R5vZ3NdKNNTwXw64P9mt32pmmOrEPzOmfBD3M1o9Usa9Cyhq0W1AIuY0j
	1BTB6w1w=
X-Gm-Gg: AY/fxX4g4UEWLpKuIhcdLxxTa1lsaEb/+LRT2LVjMImURTLYVa360rb+xW9ujoalyPl
	NqULf8hfJYs7VBJNGytsBz6xRPE9u2lknmWkXgxvQ8pwuDSBzON+qpLSlGZhfupsXuLk50OuRY7
	6Z5G3Bi+eaBO3UpYie/22RkWS3mwlBNXo3xHvH/AFD61BmZvawPE5FIjPLcwuz5Orl0Tnl8kIta
	cdLsE2GnQEwT2/oMPwkynMW46SurWyyPrOf959NJa3ytO5ktcOycQQm3g5k9JdJhVV71xT2KLhk
	U5JTDF57uLIeFPf3n0DQR2f5/sROCbW9HbpMPx7GeeeMKYbrexnKrHVBaUo3nIZYtnUxaxD42Wy
	yMaqCWjyFmKJiI44UUl1o5nv+R8IovClLvR2tTrAqAhSp663/A+q0iueZ1lpxcdgd7rEvgY0q6U
	445SgTjkweoYzUrIo9
X-Google-Smtp-Source: AGHT+IG+XNDdLvIHjDWrz7xBYNWynyjVwkhnneYUAaXVF1orqrHeVdrqwUGfJiVZQRW2LglRzOTRBQ==
X-Received: by 2002:a05:600c:5286:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47bd60152abmr72370455e9.11.1765981720725;
        Wed, 17 Dec 2025 06:28:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeedcsm5059934f8f.31.2025.12.17.06.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:28:40 -0800 (PST)
Date: Wed, 17 Dec 2025 17:28:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arvind Yadav <arvind.yadav@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100
 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be
 null (see line 85)
Message-ID: <202512131704.dhYp30j8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251217142837.Pdm6hY-Rf17G5pOtTppYAoNAG8xWe_o50KacjIKRgfY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 70773bef4e091ff6d2a91e3dfb4f29013eb81f1f drm/amdgpu: update userqueue BOs and PDs
config: s390-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131704.dhYp30j8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131704.dhYp30j8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:100 amdgpu_gem_update_bo_mapping() error: we previously assumed 'bo_va' could be null (see line 85)

vim +/bo_va +100 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

70773bef4e091f Arvind Yadav 2024-09-25   76  static void
70773bef4e091f Arvind Yadav 2024-09-25   77  amdgpu_gem_update_bo_mapping(struct drm_file *filp,
70773bef4e091f Arvind Yadav 2024-09-25   78  			     struct amdgpu_bo_va *bo_va,
70773bef4e091f Arvind Yadav 2024-09-25   79  			     uint32_t operation,
70773bef4e091f Arvind Yadav 2024-09-25   80  			     uint64_t point,
70773bef4e091f Arvind Yadav 2024-09-25   81  			     struct dma_fence *fence,
70773bef4e091f Arvind Yadav 2024-09-25   82  			     struct drm_syncobj *syncobj,
70773bef4e091f Arvind Yadav 2024-09-25   83  			     struct dma_fence_chain *chain)
70773bef4e091f Arvind Yadav 2024-09-25   84  {
70773bef4e091f Arvind Yadav 2024-09-25  @85  	struct amdgpu_bo *bo = bo_va ? bo_va->base.bo : NULL;

bo_va can be NULL.

70773bef4e091f Arvind Yadav 2024-09-25   86  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
70773bef4e091f Arvind Yadav 2024-09-25   87  	struct amdgpu_vm *vm = &fpriv->vm;
70773bef4e091f Arvind Yadav 2024-09-25   88  	struct dma_fence *last_update;
70773bef4e091f Arvind Yadav 2024-09-25   89  
70773bef4e091f Arvind Yadav 2024-09-25   90  	if (!syncobj)
70773bef4e091f Arvind Yadav 2024-09-25   91  		return;
70773bef4e091f Arvind Yadav 2024-09-25   92  
70773bef4e091f Arvind Yadav 2024-09-25   93  	/* Find the last update fence */
70773bef4e091f Arvind Yadav 2024-09-25   94  	switch (operation) {
70773bef4e091f Arvind Yadav 2024-09-25   95  	case AMDGPU_VA_OP_MAP:
70773bef4e091f Arvind Yadav 2024-09-25   96  	case AMDGPU_VA_OP_REPLACE:
70773bef4e091f Arvind Yadav 2024-09-25   97  		if (bo && (bo->tbo.base.resv == vm->root.bo->tbo.base.resv))
70773bef4e091f Arvind Yadav 2024-09-25   98  			last_update = vm->last_update;
70773bef4e091f Arvind Yadav 2024-09-25   99  		else
70773bef4e091f Arvind Yadav 2024-09-25 @100  			last_update = bo_va->last_pt_update;

Unchecked dereference.  If "bo" is non-NULL we would know that
bo_va is also non-NULL, but the fact that bo is possibly NULL makes us
even more suspicious of bo_va.

I reported this before and never got a response.
https://lore.kernel.org/all/7074cf24-b136-44fc-a86d-4394d62c5242@stanley.mountain/

70773bef4e091f Arvind Yadav 2024-09-25  101  		break;
70773bef4e091f Arvind Yadav 2024-09-25  102  	case AMDGPU_VA_OP_UNMAP:
70773bef4e091f Arvind Yadav 2024-09-25  103  	case AMDGPU_VA_OP_CLEAR:
70773bef4e091f Arvind Yadav 2024-09-25  104  		last_update = fence;
70773bef4e091f Arvind Yadav 2024-09-25  105  		break;
70773bef4e091f Arvind Yadav 2024-09-25  106  	default:
70773bef4e091f Arvind Yadav 2024-09-25  107  		return;
70773bef4e091f Arvind Yadav 2024-09-25  108  	}
70773bef4e091f Arvind Yadav 2024-09-25  109  
70773bef4e091f Arvind Yadav 2024-09-25  110  	/* Add fence to timeline */
70773bef4e091f Arvind Yadav 2024-09-25  111  	if (!point)
70773bef4e091f Arvind Yadav 2024-09-25  112  		drm_syncobj_replace_fence(syncobj, last_update);
70773bef4e091f Arvind Yadav 2024-09-25  113  	else
70773bef4e091f Arvind Yadav 2024-09-25  114  		drm_syncobj_add_point(syncobj, chain, last_update, point);
70773bef4e091f Arvind Yadav 2024-09-25  115  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


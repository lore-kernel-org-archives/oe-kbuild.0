Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72AC313290
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767604715; cv=none; b=fqlrCmip9zjGwdTN2O2vCf5W498GYbFxJHjKfkiMmftw4HHyWTthC5XgolYahXqge8FrWwgQrCRAekTF6R6Qkl1Da2WIb/OCA731rRGKM2cMreKXiyxOtDQXw+twrj3Sj89uc1EQyNxVfW7OvFiVPGPlr4Jg26nxJ1YLmpSlr4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767604715; c=relaxed/simple;
	bh=uDGBeze7Qp/kTrEFdck8KJs8Ay1ByYEFrUBaR72pN2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri7onrZkjvzikvezsidNgJkpxdLOD24GAUKw+OceoPvxkgySOa8Y8UJ4KaIFVrEffHCHYTTtkwVWnnlA4hB99hevAVCIjoukQYMQpxpcyObuKuA1gmTqhWNDwlfwy6f8gaD9nFELvUrSeUuWQEBmxIMcn2myOVq5k7Qv0A7hvUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cH7o6ReV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cH7o6ReV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso6682835e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767604712; x=1768209512; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KtNuc23wxF7JVUYShxjAtkJq7LIq3vf9Fgku4TAxklw=;
        b=cH7o6ReVlMdTEKrcQwZF08JgKNEwjyetubX4KqU+FxABnHt09BRsDZ+/7sfKeXOe72
         vixfTi13qdUnbfKlxFWduCgOHNkyyYGjLnuZV12rf8p6FDU2bb6QjMjqn3/mkHZvcNBM
         MCpV9izgNTTS6j2Q02Gr4H0rF8EDtOyZx/k64giThdKmFcfHUM55vFsz7rAYi0Gd4Rac
         HqpB+UZTI6bYkBv5BMIh0/a0kxWU/i6dbKbKs7xzuwLf/RSKZpto0ddZ+uQdqBA6uYSG
         R76aSzkxItUqJuw9g8KcxeWV0lOmkclSzAF9/RGhK+bfvU2BbFHvW1UGghVanRk1020Z
         Xixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767604712; x=1768209512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtNuc23wxF7JVUYShxjAtkJq7LIq3vf9Fgku4TAxklw=;
        b=uYNwpdaPPut7G99bN7mLMchZ9HBmDG7oInYv0/aVNVPZaXqR7Lu79ofpQ921Xz1wEb
         yprQUD1G8o/6XBfNuqxzs7K9tFm9OTm+yDE5KvcwSTfHvdoAoZZw+bLz/lAMBgU78bcb
         zE2fSSjkqqmgVu38dlKZC3095VSeyET0MRZB5LZLPvUkrXcMw0rtElFOHXX5gQjCsdj0
         59MR/zwdQ4R6lbaLrOksj9fC7DyLtRvZEHopVg5wwkf+9/ztJ5g7pu1KuJcrDTCbTqxG
         tvsPkNULZy8pp3CnjBrJweg7SpdcuK8wxczu9hSaQZxwWk2ZNe4c2Ynw2RFrTvZ+jGAE
         vRXg==
X-Gm-Message-State: AOJu0YzGP9BwksKSMNcf2nXKNXUreBJnUJzWvTmnMe/2j7/MlxvA1oXF
	fnQCN4LMe8cpVvVegBsPWnyWfPgSahTqiEScPPf6LwJc4FCsRVo4Qvv/X6aJrRpFgbhn+o4UIEF
	dCRO/
X-Gm-Gg: AY/fxX65p2h83f5b3QI4rfSJjWqGN8QAFkUl7vot+oEqDkt/AX5cXflvGCj6Zv/xW0g
	WlLsItXrroSTXFxSRnxVoHEoLIgpt17Lc7/rnoXnnA7ZIAV85bzZoa1MCXRmyysU8gXPZX3+NL4
	ql6jVRHH4F41F3oLlCylA2dmfmSDN4jzaONy5E5ujEuT+3cR5RAAl0OJ+6Bk58fQkFgBU+2vRlb
	Etm4E5y8VY9To3uqcXivI0uW+r1BNhpHlmpJsyCLaKj6LicY3HxWymjGDOq3vpfzp2/KSsaiN6M
	XKTTFJmPYk/5Rt6pdhJRqQ2mJ6SZhUFA6T8zBJfMJjXi33t7bkRDSL6c3D8Nxgf7wA2AgefNJDR
	ZynU1L8sr5FDJzvbcQrA0iuP3b1D4AjeFiLKk/HdKbQZ8Wm3YIBJn/TNJDM6+abbajJVgb3RbqL
	YX5fZEayZZTAq784Tq
X-Google-Smtp-Source: AGHT+IHqgw6Mxl8sTdZ16+AchffquZvGMldLB07kEoKTUCIorvTuAsMEk24dXkoHkEOyG+JY9d7W7A==
X-Received: by 2002:a05:600c:46cb:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-47d6ba829c1mr95907355e9.8.1767604711605;
        Mon, 05 Jan 2026 01:18:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba30531sm57512165e9.1.2026.01.05.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:18:31 -0800 (PST)
Date: Mon, 5 Jan 2026 12:18:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 547/2671]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640
 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with
 state->initialized unset from line: 631
Message-ID: <aVuB5C1yvi-SE7hG@stanley.mountain>
References: <202512210334.ZRd8j65a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202512210334.ZRd8j65a-lkp@intel.com>

I have fixed this false positive.

https://github.com/error27/smatch/commit/d19c7ae6466cf1a0d54fb873e3089b03163a98a3

regards,
dan carpenter

On Sun, Dec 21, 2025 at 03:16:15AM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Philipp Stanner <phasta@kernel.org>
> CC: "Christian König" <christian.koenig@amd.com>
> CC: Felix Kuehling <felix.kuehling@amd.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> commit: 06bc18e0def7d926265480faa555bf0b67a35a90 [547/2671] amd/amdkfd: Use dma_fence_check_and_signal()
> :::::: branch date: 2 days ago
> :::::: commit date: 2 weeks ago
> config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210334.ZRd8j65a-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202512210334.ZRd8j65a-lkp@intel.com/
> 
> New smatch warnings:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:640 kfd_procfs_add_sysfs_counters() warn: Calling kobject_put|get with state->initialized unset from line: 631
> 
> Old smatch warnings:
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:594 kfd_procfs_add_sysfs_stats() warn: Calling kobject_put|get with state->initialized unset from line: 582
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:887 kfd_create_process() warn: Calling kobject_put|get with state->initialized unset from line: 877
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1999 signal_eviction_fence() warn: signedness bug returning '(-22)'
> 
> vim +640 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c
> 
> 4327bed2ff8e3d Philip Cox  2020-06-30  608  
> 751580b3ff9ac6 Philip Yang 2021-06-16  609  static void kfd_procfs_add_sysfs_counters(struct kfd_process *p)
> 751580b3ff9ac6 Philip Yang 2021-06-16  610  {
> 751580b3ff9ac6 Philip Yang 2021-06-16  611  	int ret = 0;
> 751580b3ff9ac6 Philip Yang 2021-06-16  612  	int i;
> 751580b3ff9ac6 Philip Yang 2021-06-16  613  	char counters_dir_filename[MAX_SYSFS_FILENAME_LEN];
> 751580b3ff9ac6 Philip Yang 2021-06-16  614  
> 751580b3ff9ac6 Philip Yang 2021-06-16  615  	if (!p || !p->kobj)
> 751580b3ff9ac6 Philip Yang 2021-06-16  616  		return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  617  
> 751580b3ff9ac6 Philip Yang 2021-06-16  618  	/*
> 751580b3ff9ac6 Philip Yang 2021-06-16  619  	 * Create sysfs files for each GPU which supports SVM
> 751580b3ff9ac6 Philip Yang 2021-06-16  620  	 * - proc/<pid>/counters_<gpuid>/
> 751580b3ff9ac6 Philip Yang 2021-06-16  621  	 * - proc/<pid>/counters_<gpuid>/faults
> 751580b3ff9ac6 Philip Yang 2021-06-16  622  	 * - proc/<pid>/counters_<gpuid>/page_in
> 751580b3ff9ac6 Philip Yang 2021-06-16  623  	 * - proc/<pid>/counters_<gpuid>/page_out
> 751580b3ff9ac6 Philip Yang 2021-06-16  624  	 */
> 751580b3ff9ac6 Philip Yang 2021-06-16  625  	for_each_set_bit(i, p->svms.bitmap_supported, p->n_pdds) {
> 751580b3ff9ac6 Philip Yang 2021-06-16  626  		struct kfd_process_device *pdd = p->pdds[i];
> 751580b3ff9ac6 Philip Yang 2021-06-16  627  		struct kobject *kobj_counters;
> 751580b3ff9ac6 Philip Yang 2021-06-16  628  
> 751580b3ff9ac6 Philip Yang 2021-06-16  629  		snprintf(counters_dir_filename, MAX_SYSFS_FILENAME_LEN,
> 751580b3ff9ac6 Philip Yang 2021-06-16  630  			"counters_%u", pdd->dev->id);
> 751580b3ff9ac6 Philip Yang 2021-06-16  631  		kobj_counters = kfd_alloc_struct(kobj_counters);
> 751580b3ff9ac6 Philip Yang 2021-06-16  632  		if (!kobj_counters)
> 751580b3ff9ac6 Philip Yang 2021-06-16  633  			return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  634  
> 751580b3ff9ac6 Philip Yang 2021-06-16  635  		ret = kobject_init_and_add(kobj_counters, &sysfs_counters_type,
> 751580b3ff9ac6 Philip Yang 2021-06-16  636  					   p->kobj, counters_dir_filename);
> 751580b3ff9ac6 Philip Yang 2021-06-16  637  		if (ret) {
> 751580b3ff9ac6 Philip Yang 2021-06-16  638  			pr_warn("Creating KFD proc/%s folder failed",
> 751580b3ff9ac6 Philip Yang 2021-06-16  639  				counters_dir_filename);
> 751580b3ff9ac6 Philip Yang 2021-06-16 @640  			kobject_put(kobj_counters);
> 751580b3ff9ac6 Philip Yang 2021-06-16  641  			return;
> 751580b3ff9ac6 Philip Yang 2021-06-16  642  		}
> 751580b3ff9ac6 Philip Yang 2021-06-16  643  
> 751580b3ff9ac6 Philip Yang 2021-06-16  644  		pdd->kobj_counters = kobj_counters;
> 751580b3ff9ac6 Philip Yang 2021-06-16  645  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_faults,
> 751580b3ff9ac6 Philip Yang 2021-06-16  646  				      "faults");
> 751580b3ff9ac6 Philip Yang 2021-06-16  647  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_in,
> 751580b3ff9ac6 Philip Yang 2021-06-16  648  				      "page_in");
> 751580b3ff9ac6 Philip Yang 2021-06-16  649  		kfd_sysfs_create_file(kobj_counters, &pdd->attr_page_out,
> 751580b3ff9ac6 Philip Yang 2021-06-16  650  				      "page_out");
> 751580b3ff9ac6 Philip Yang 2021-06-16  651  	}
> 751580b3ff9ac6 Philip Yang 2021-06-16  652  }
> 4327bed2ff8e3d Philip Cox  2020-06-30  653  
> 
> :::::: The code at line 640 was first introduced by commit
> :::::: 751580b3ff9ac6bf39da8586e132dbebee2409ef drm/amdkfd: add sysfs counters for vm fault and migration
> 
> :::::: TO: Philip Yang <Philip.Yang@amd.com>
> :::::: CC: Alex Deucher <alexander.deucher@amd.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

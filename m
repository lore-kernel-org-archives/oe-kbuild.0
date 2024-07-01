Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB716CD3B
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jul 2024 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719848515; cv=none; b=WadbfSpmTEzIfmDHDFwH9XhYod63739GjAyaatlfgUZhlHQtaaAqIyq0p9+uyMRTy/NOt4/50frcFl5Yock9/1FA6Gks3gD+XwjlWvkwfs5NQbrBleVskzjVvu79EP5q2aObzAdEFvRkFUVCgOZhVwYMVreV7mJW2u7wBhqkHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719848515; c=relaxed/simple;
	bh=dAZtxyryjHx+ok3FVSLXoyOpY2xOhNBc0xl7cnK1dj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sr68Yh0gnUSRuez5rVZiWppgCQkWwrB9KMabep9C9bCi71gK/5e4lDCiyXCRf49IwuX5r9nYg8iiAggzYczcyukV5ZzqGgABeVxk8GShz31QZjPliIwIsNGOb3E9coR9Vq26nLWmltGL9mxtA5uaisj0AKQzWtU3IQ75cGg44To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWjRp8ui; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWjRp8ui"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f8ffe1b65dso1378097a34.0
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Jul 2024 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719848512; x=1720453312; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcRgdb1N1Ixh8Rt0DgQuUj8sKC1k52f8CssF6eYhWFw=;
        b=DWjRp8uiW8e+s4WhEA98mvXn5gsHqqR/MQxa+XY2ISKvgW44YSsMX5L3x2IDVbRovY
         2TaTAsKTwDnIVIo3gx5whPPjvLvpgaO6bZuJmiwInJpNSTBEKmyr77EFsKCCKk+kdXZP
         1U3QBjoK7HyVj+QdgRVXmwra5vzbjcxfAguS5Exn/rYcl+4n8zk9bX7OIbp7RVoUuo3R
         4aa83lwXDEX0JokelGU0Sk86WAKJcVrMMnJTfa7CFnS4cq3PcKLR1KVbzg/sfYrN2SBi
         +gZoPuQ9lPzMhb3KLCa68bdIPOQvDgPgUxM/JSvl3ugASyWNxY+lF8+yIFzEgXPrhnSw
         CEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848512; x=1720453312;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcRgdb1N1Ixh8Rt0DgQuUj8sKC1k52f8CssF6eYhWFw=;
        b=ELP5G+sBW8x2u9DBpMDfLvEvVD3vRk2u5zol0FzEom/GRPJMs265pcAHjyvzOaPJid
         kJwwLyIEBhmjpTQk0qHATBzrHPp08e/0ahHsE9t+BhHUCPEjVueBOUnHKXzbsNI6ehKT
         0GZqq8peUzelROeASv0EmID5auO0o56zIs+6f4JpbE38MGhr5dsqvZRdSBsLLqrrU0f7
         z1EBRzjnfzjdCOZ1KlIIiTIFLz+SlESdu++OLFLaDY9uWNrkHuSSZiyqcI67fvbWke2z
         +9ye4yf+yd+hZ/69+RT1dnJyts9Rp5RBOPh9h68A691r9gnrUO8CbvohqFNq1qf6tSW3
         gGuQ==
X-Gm-Message-State: AOJu0Yylfw/j9UYEHdMJFEecPkxYh3OkEa85xiFXBXGLIvYjLIkWW/Ec
	E7DNzS24CoOeWYoqZsywNnFvDTMY+efV923NHkexrBMKnp+tJaI6Ncf+APrIVXVk4xuQp4fGIAz
	p
X-Google-Smtp-Source: AGHT+IF4xwTQAAIF+HTSMFVlghXvKZ890wJoqnsgyX6S0YI1F4fPpKVuYEQzS+5iSMs676vt/yqaqQ==
X-Received: by 2002:a05:6830:111:b0:700:d567:531c with SMTP id 46e09a7af769-701faad3827mr4547333a34.10.1719848512330;
        Mon, 01 Jul 2024 08:41:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e8c6:2364:637f:c70e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20a00sm1278976a34.63.2024.07.01.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 08:41:51 -0700 (PDT)
Date: Mon, 1 Jul 2024 17:41:50 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Honggyu Kim <honggyu.kim@sk.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hyeongtak Ji <hyeongtak.ji@sk.com>, SeongJae Park <sj@kernel.org>
Subject: [linux-next:master 6602/7397] mm/damon/paddr.c:360
 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.
Message-ID: <1d0db7b1-74eb-4582-be17-e7dbce3e36bb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62c97045b8f720c2eac807a5f38e26c9ed512371
commit: 5311c0a2eee34fd8f4e17382a5f653b95a940ca5 [6602/7397] mm/damon/paddr: introduce DAMOS_MIGRATE_COLD action for demotion
config: um-randconfig-r071-20240623 (https://download.01.org/0day-ci/archive/20240625/202406251102.GE07hqfQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406251102.GE07hqfQ-lkp@intel.com/

smatch warnings:
mm/damon/paddr.c:360 __damon_pa_migrate_folio_list() error: uninitialized symbol 'nr_succeeded'.

vim +/nr_succeeded +360 mm/damon/paddr.c

5311c0a2eee34f Honggyu Kim   2024-06-14  331  static unsigned int __damon_pa_migrate_folio_list(
5311c0a2eee34f Honggyu Kim   2024-06-14  332  		struct list_head *migrate_folios, struct pglist_data *pgdat,
5311c0a2eee34f Honggyu Kim   2024-06-14  333  		int target_nid)
5311c0a2eee34f Honggyu Kim   2024-06-14  334  {
5311c0a2eee34f Honggyu Kim   2024-06-14  335  	unsigned int nr_succeeded;
5311c0a2eee34f Honggyu Kim   2024-06-14  336  	nodemask_t allowed_mask = NODE_MASK_NONE;
5311c0a2eee34f Honggyu Kim   2024-06-14  337  	struct migration_target_control mtc = {
5311c0a2eee34f Honggyu Kim   2024-06-14  338  		/*
5311c0a2eee34f Honggyu Kim   2024-06-14  339  		 * Allocate from 'node', or fail quickly and quietly.
5311c0a2eee34f Honggyu Kim   2024-06-14  340  		 * When this happens, 'page' will likely just be discarded
5311c0a2eee34f Honggyu Kim   2024-06-14  341  		 * instead of migrated.
5311c0a2eee34f Honggyu Kim   2024-06-14  342  		 */
5311c0a2eee34f Honggyu Kim   2024-06-14  343  		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
5311c0a2eee34f Honggyu Kim   2024-06-14  344  			__GFP_NOWARN | __GFP_NOMEMALLOC | GFP_NOWAIT,
5311c0a2eee34f Honggyu Kim   2024-06-14  345  		.nid = target_nid,
5311c0a2eee34f Honggyu Kim   2024-06-14  346  		.nmask = &allowed_mask
5311c0a2eee34f Honggyu Kim   2024-06-14  347  	};
5311c0a2eee34f Honggyu Kim   2024-06-14  348  
5311c0a2eee34f Honggyu Kim   2024-06-14  349  	if (pgdat->node_id == target_nid || target_nid == NUMA_NO_NODE)
5311c0a2eee34f Honggyu Kim   2024-06-14  350  		return 0;
5311c0a2eee34f Honggyu Kim   2024-06-14  351  
5311c0a2eee34f Honggyu Kim   2024-06-14  352  	if (list_empty(migrate_folios))
5311c0a2eee34f Honggyu Kim   2024-06-14  353  		return 0;
5311c0a2eee34f Honggyu Kim   2024-06-14  354  
5311c0a2eee34f Honggyu Kim   2024-06-14  355  	/* Migration ignores all cpuset and mempolicy settings */
5311c0a2eee34f Honggyu Kim   2024-06-14  356  	migrate_pages(migrate_folios, alloc_migrate_folio, NULL,
5311c0a2eee34f Honggyu Kim   2024-06-14  357  		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DAMON,
5311c0a2eee34f Honggyu Kim   2024-06-14  358  		      &nr_succeeded);
5311c0a2eee34f Honggyu Kim   2024-06-14  359  
5311c0a2eee34f Honggyu Kim   2024-06-14 @360  	return nr_succeeded;

This can be compiled with CONFIG_MIGRATION disabled so migrate_pages()
is a no-op that returns -ENOSYS.

5311c0a2eee34f Honggyu Kim   2024-06-14  361  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


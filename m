Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D68130C0F4;
	Thu, 18 Sep 2025 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206172; cv=none; b=o/NWDu2BQayoq2o1s1qTtjhXPQ9kJ0niR8Smq4BqIN7pJXgzmFWmvoAhjveUtZv3Qvlio6oWUHNbz2qtzxBQFfIUKaeQ6fNXcZL6GjorlmAHLXVr3FlMRW6z0oXPIZXQ8B6F5EgsdxhbilLXxEjGtE2adC3ZpB4eK7MQP0eyRqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206172; c=relaxed/simple;
	bh=CTNMvPRVVdTJZ62ondPqPeX95pchnkkbEQHOIieDosA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=le22tIG0AyzhtUczWAf8VbVeUdFtW4U2ckP0wQLy2e7S0RaWCOMCtTnc8OCwkkrYCLIxsRpKIvfeNe9ZZ/t8q30YZHsMNFLHMvwmKnczWK420ceH1/xWxUqSRQVWIXgZw8XPuaI1KMOBec6WSiExb5UQGDQn8N/1EMK+bQRQ5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+p8w2r5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+p8w2r5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758206170; x=1789742170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CTNMvPRVVdTJZ62ondPqPeX95pchnkkbEQHOIieDosA=;
  b=W+p8w2r5NGZXP64+7bL1ilRLZVurPWAevfi6d34Xx0U3Bqhpeg0F8bTy
   2o40d9HU97Pp0i5GkkFmWbzz5E610LGtQGi6Aa6R459ZmHr1KAoYA/iL2
   3TAiebbFSh39fQS2nbeLs+kwux75pwLB+KbYC7siyVX6WKd2ptd2ycOJe
   4+RVUN964caAoNDAfr/aHpCF9ewcgwTbi4hPbVjCICYpyWzT3AxOejJjM
   BIPGXT8JmMVLDuZr++ivdo1MoVqVIfXArpl2ngtjnwTnnQrD0t9k1t3VK
   iA0H+NeHmMdSJ0qWNAunCXKj03kAcG8EYf7FcvPJT1WigAwH2GczH/Dta
   Q==;
X-CSE-ConnectionGUID: 1P2V+E5KRhy+KdN5caAQXg==
X-CSE-MsgGUID: L4hb1d1hSfmvrok+dRUKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="78139388"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="78139388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 07:36:08 -0700
X-CSE-ConnectionGUID: 7Zx872TpTq+NTy5wOjnlXw==
X-CSE-MsgGUID: UhVMGBPhTO+u3O7BWxiVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="206511172"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.228]) ([10.245.244.228])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 07:36:07 -0700
Message-ID: <663f03f7-0781-4801-b0d4-36317bb2caac@intel.com>
Date: Thu, 18 Sep 2025 15:36:04 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5624/10189] drivers/gpu/drm/drm_gpusvm.c:1388
 drm_gpusvm_get_pages() error: uninitialized symbol 'dpagemap'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Matthew Brost <matthew.brost@intel.com>
References: <202509181916.GbnDEpv2-lkp@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <202509181916.GbnDEpv2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2025 15:11, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> commit: 9e978741488261e117bb50e5dfcf8e4080990958 [5624/10189] drm/xe/userptr: replace xe_hmm with gpusvm
> config: x86_64-randconfig-161-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181916.GbnDEpv2-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509181916.GbnDEpv2-lkp@intel.com/
> 
> New smatch warnings:
> drivers/gpu/drm/drm_gpusvm.c:1388 drm_gpusvm_get_pages() error: uninitialized symbol 'dpagemap'.
> 
> vim +/dpagemap +1388 drivers/gpu/drm/drm_gpusvm.c
> 
> 83f706ecbde1dfd Matthew Auld          2025-08-28  1258  int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> 6364afd532bcabf Matthew Auld          2025-08-28  1259  			 struct drm_gpusvm_pages *svm_pages,
> 6364afd532bcabf Matthew Auld          2025-08-28  1260  			 struct mm_struct *mm,
> 6364afd532bcabf Matthew Auld          2025-08-28  1261  			 struct mmu_interval_notifier *notifier,
> 83f706ecbde1dfd Matthew Auld          2025-08-28  1262  			 unsigned long pages_start, unsigned long pages_end,
> 99624bdff867079 Matthew Brost         2025-03-05  1263  			 const struct drm_gpusvm_ctx *ctx)
> 99624bdff867079 Matthew Brost         2025-03-05  1264  {
> 99624bdff867079 Matthew Brost         2025-03-05  1265  	struct hmm_range hmm_range = {
> 99624bdff867079 Matthew Brost         2025-03-05  1266  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> 99624bdff867079 Matthew Brost         2025-03-05  1267  			HMM_PFN_REQ_WRITE),
> 99624bdff867079 Matthew Brost         2025-03-05  1268  		.notifier = notifier,
> 6364afd532bcabf Matthew Auld          2025-08-28  1269  		.start = pages_start,
> 6364afd532bcabf Matthew Auld          2025-08-28  1270  		.end = pages_end,
> 99624bdff867079 Matthew Brost         2025-03-05  1271  		.dev_private_owner = gpusvm->device_private_page_owner,
> 99624bdff867079 Matthew Brost         2025-03-05  1272  	};
> f86ad0ed620cb3c Matthew Brost         2025-06-19  1273  	void *zdd;
> 99624bdff867079 Matthew Brost         2025-03-05  1274  	unsigned long timeout =
> 99624bdff867079 Matthew Brost         2025-03-05  1275  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> 99624bdff867079 Matthew Brost         2025-03-05  1276  	unsigned long i, j;
> 6364afd532bcabf Matthew Auld          2025-08-28  1277  	unsigned long npages = npages_in_range(pages_start, pages_end);
> 99624bdff867079 Matthew Brost         2025-03-05  1278  	unsigned long num_dma_mapped;
> 99624bdff867079 Matthew Brost         2025-03-05  1279  	unsigned int order = 0;
> 99624bdff867079 Matthew Brost         2025-03-05  1280  	unsigned long *pfns;
> 99624bdff867079 Matthew Brost         2025-03-05  1281  	int err = 0;
> 99624bdff867079 Matthew Brost         2025-03-05  1282  	struct dev_pagemap *pagemap;
> 99624bdff867079 Matthew Brost         2025-03-05  1283  	struct drm_pagemap *dpagemap;
> f70da6f99d4f40c Matthew Auld          2025-08-28  1284  	struct drm_gpusvm_pages_flags flags;
> ad70e289ed4b1f8 Matthew Auld          2025-08-28  1285  	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
> ad70e289ed4b1f8 Matthew Auld          2025-08-28  1286  							   DMA_BIDIRECTIONAL;
> 99624bdff867079 Matthew Brost         2025-03-05  1287
> 99624bdff867079 Matthew Brost         2025-03-05  1288  retry:
> 99624bdff867079 Matthew Brost         2025-03-05  1289  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> 6364afd532bcabf Matthew Auld          2025-08-28  1290  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
> 99624bdff867079 Matthew Brost         2025-03-05  1291  		goto set_seqno;
> 99624bdff867079 Matthew Brost         2025-03-05  1292
> 99624bdff867079 Matthew Brost         2025-03-05  1293  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> 99624bdff867079 Matthew Brost         2025-03-05  1294  	if (!pfns)
> 99624bdff867079 Matthew Brost         2025-03-05  1295  		return -ENOMEM;
> 99624bdff867079 Matthew Brost         2025-03-05  1296
> 99624bdff867079 Matthew Brost         2025-03-05  1297  	if (!mmget_not_zero(mm)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1298  		err = -EFAULT;
> 99624bdff867079 Matthew Brost         2025-03-05  1299  		goto err_free;
> 99624bdff867079 Matthew Brost         2025-03-05  1300  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1301
> 99624bdff867079 Matthew Brost         2025-03-05  1302  	hmm_range.hmm_pfns = pfns;
> 99624bdff867079 Matthew Brost         2025-03-05  1303  	while (true) {
> 99624bdff867079 Matthew Brost         2025-03-05  1304  		mmap_read_lock(mm);
> 99624bdff867079 Matthew Brost         2025-03-05  1305  		err = hmm_range_fault(&hmm_range);
> 99624bdff867079 Matthew Brost         2025-03-05  1306  		mmap_read_unlock(mm);
> 99624bdff867079 Matthew Brost         2025-03-05  1307
> 99624bdff867079 Matthew Brost         2025-03-05  1308  		if (err == -EBUSY) {
> 99624bdff867079 Matthew Brost         2025-03-05  1309  			if (time_after(jiffies, timeout))
> 99624bdff867079 Matthew Brost         2025-03-05  1310  				break;
> 99624bdff867079 Matthew Brost         2025-03-05  1311
> 99624bdff867079 Matthew Brost         2025-03-05  1312  			hmm_range.notifier_seq =
> 99624bdff867079 Matthew Brost         2025-03-05  1313  				mmu_interval_read_begin(notifier);
> 99624bdff867079 Matthew Brost         2025-03-05  1314  			continue;
> 99624bdff867079 Matthew Brost         2025-03-05  1315  		}
> 99624bdff867079 Matthew Brost         2025-03-05  1316  		break;
> 99624bdff867079 Matthew Brost         2025-03-05  1317  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1318  	mmput(mm);
> 99624bdff867079 Matthew Brost         2025-03-05  1319  	if (err)
> 99624bdff867079 Matthew Brost         2025-03-05  1320  		goto err_free;
> 99624bdff867079 Matthew Brost         2025-03-05  1321
> 99624bdff867079 Matthew Brost         2025-03-05  1322  map_pages:
> 99624bdff867079 Matthew Brost         2025-03-05  1323  	/*
> 99624bdff867079 Matthew Brost         2025-03-05  1324  	 * Perform all dma mappings under the notifier lock to not
> 99624bdff867079 Matthew Brost         2025-03-05  1325  	 * access freed pages. A notifier will either block on
> 99624bdff867079 Matthew Brost         2025-03-05  1326  	 * the notifier lock or unmap dma.
> 99624bdff867079 Matthew Brost         2025-03-05  1327  	 */
> 99624bdff867079 Matthew Brost         2025-03-05  1328  	drm_gpusvm_notifier_lock(gpusvm);
> 99624bdff867079 Matthew Brost         2025-03-05  1329
> f70da6f99d4f40c Matthew Auld          2025-08-28  1330  	flags.__flags = svm_pages->flags.__flags;
> a9ac0fa455b050d Matthew Brost         2025-05-12  1331  	if (flags.unmapped) {
> 99624bdff867079 Matthew Brost         2025-03-05  1332  		drm_gpusvm_notifier_unlock(gpusvm);
> 99624bdff867079 Matthew Brost         2025-03-05  1333  		err = -EFAULT;
> 99624bdff867079 Matthew Brost         2025-03-05  1334  		goto err_free;
> 99624bdff867079 Matthew Brost         2025-03-05  1335  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1336
> 99624bdff867079 Matthew Brost         2025-03-05  1337  	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1338  		drm_gpusvm_notifier_unlock(gpusvm);
> 99624bdff867079 Matthew Brost         2025-03-05  1339  		kvfree(pfns);
> 99624bdff867079 Matthew Brost         2025-03-05  1340  		goto retry;
> 99624bdff867079 Matthew Brost         2025-03-05  1341  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1342
> f70da6f99d4f40c Matthew Auld          2025-08-28  1343  	if (!svm_pages->dma_addr) {
> 99624bdff867079 Matthew Brost         2025-03-05  1344  		/* Unlock and restart mapping to allocate memory. */
> 99624bdff867079 Matthew Brost         2025-03-05  1345  		drm_gpusvm_notifier_unlock(gpusvm);
> f70da6f99d4f40c Matthew Auld          2025-08-28  1346  		svm_pages->dma_addr =
> f70da6f99d4f40c Matthew Auld          2025-08-28  1347  			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
> f70da6f99d4f40c Matthew Auld          2025-08-28  1348  		if (!svm_pages->dma_addr) {
> 99624bdff867079 Matthew Brost         2025-03-05  1349  			err = -ENOMEM;
> 99624bdff867079 Matthew Brost         2025-03-05  1350  			goto err_free;
> 99624bdff867079 Matthew Brost         2025-03-05  1351  		}
> 99624bdff867079 Matthew Brost         2025-03-05  1352  		goto map_pages;
> 99624bdff867079 Matthew Brost         2025-03-05  1353  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1354
> 99624bdff867079 Matthew Brost         2025-03-05  1355  	zdd = NULL;
> f86ad0ed620cb3c Matthew Brost         2025-06-19  1356  	pagemap = NULL;
> 99624bdff867079 Matthew Brost         2025-03-05  1357  	num_dma_mapped = 0;
> 99624bdff867079 Matthew Brost         2025-03-05  1358  	for (i = 0, j = 0; i < npages; ++j) {
> 99624bdff867079 Matthew Brost         2025-03-05  1359  		struct page *page = hmm_pfn_to_page(pfns[i]);
> 99624bdff867079 Matthew Brost         2025-03-05  1360
> c50729c68aaf936 Matthew Auld          2025-08-28  1361  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
> 99624bdff867079 Matthew Brost         2025-03-05  1362  		if (is_device_private_page(page) ||
> 99624bdff867079 Matthew Brost         2025-03-05  1363  		    is_device_coherent_page(page)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1364  			if (zdd != page->zone_device_data && i > 0) {
> 99624bdff867079 Matthew Brost         2025-03-05  1365  				err = -EOPNOTSUPP;
> 99624bdff867079 Matthew Brost         2025-03-05  1366  				goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1367  			}
> 99624bdff867079 Matthew Brost         2025-03-05  1368  			zdd = page->zone_device_data;
> eb0ece16027f822 Linus Torvalds        2025-04-01  1369  			if (pagemap != page_pgmap(page)) {
> 
> If CONFIG_ZONE_DEVICE is disabled page_pgmap() will return NULL

AFAICT if CONFIG_ZONE_DEVICE is disabled then is_device_private_page and 
is_device_coherent_page must also return false, so I don't think we can 
reach here?


> 
> 99624bdff867079 Matthew Brost         2025-03-05  1370  				if (i > 0) {
> 99624bdff867079 Matthew Brost         2025-03-05  1371  					err = -EOPNOTSUPP;
> 99624bdff867079 Matthew Brost         2025-03-05  1372  					goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1373  				}
> 99624bdff867079 Matthew Brost         2025-03-05  1374
> eb0ece16027f822 Linus Torvalds        2025-04-01  1375  				pagemap = page_pgmap(page);
> f86ad0ed620cb3c Matthew Brost         2025-06-19  1376  				dpagemap = drm_pagemap_page_to_dpagemap(page);
> 99624bdff867079 Matthew Brost         2025-03-05  1377  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1378  					/*
> 99624bdff867079 Matthew Brost         2025-03-05  1379  					 * Raced. This is not supposed to happen
> 99624bdff867079 Matthew Brost         2025-03-05  1380  					 * since hmm_range_fault() should've migrated
> 99624bdff867079 Matthew Brost         2025-03-05  1381  					 * this page to system.
> 99624bdff867079 Matthew Brost         2025-03-05  1382  					 */
> 99624bdff867079 Matthew Brost         2025-03-05  1383  					err = -EAGAIN;
> 99624bdff867079 Matthew Brost         2025-03-05  1384  					goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1385  				}
> 99624bdff867079 Matthew Brost         2025-03-05  1386  			}
> f70da6f99d4f40c Matthew Auld          2025-08-28  1387  			svm_pages->dma_addr[j] =
> 99624bdff867079 Matthew Brost         2025-03-05 @1388  				dpagemap->ops->device_map(dpagemap,
>                                                                                          ^^^^^^^^^^^^^^^
> Unchecked dereference
> 
> 99624bdff867079 Matthew Brost         2025-03-05  1389  							  gpusvm->drm->dev,
> 99624bdff867079 Matthew Brost         2025-03-05  1390  							  page, order,
> ad70e289ed4b1f8 Matthew Auld          2025-08-28  1391  							  dma_dir);
> 99624bdff867079 Matthew Brost         2025-03-05  1392  			if (dma_mapping_error(gpusvm->drm->dev,
> f70da6f99d4f40c Matthew Auld          2025-08-28  1393  					      svm_pages->dma_addr[j].addr)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1394  				err = -EFAULT;
> 99624bdff867079 Matthew Brost         2025-03-05  1395  				goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1396  			}
> 99624bdff867079 Matthew Brost         2025-03-05  1397  		} else {
> 99624bdff867079 Matthew Brost         2025-03-05  1398  			dma_addr_t addr;
> 99624bdff867079 Matthew Brost         2025-03-05  1399
> f86ad0ed620cb3c Matthew Brost         2025-06-19  1400  			if (is_zone_device_page(page) || pagemap) {
>                                                                                                                   ^^^^^^^
> Checked too late.
> 
> 99624bdff867079 Matthew Brost         2025-03-05  1401  				err = -EOPNOTSUPP;
> 99624bdff867079 Matthew Brost         2025-03-05  1402  				goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1403  			}
> 99624bdff867079 Matthew Brost         2025-03-05  1404
> 8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1405  			if (ctx->devmem_only) {
> 8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1406  				err = -EFAULT;
> 8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1407  				goto err_unmap;
> 8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1408  			}
> 8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1409
> 99624bdff867079 Matthew Brost         2025-03-05  1410  			addr = dma_map_page(gpusvm->drm->dev,
> 99624bdff867079 Matthew Brost         2025-03-05  1411  					    page, 0,
> 99624bdff867079 Matthew Brost         2025-03-05  1412  					    PAGE_SIZE << order,
> ad70e289ed4b1f8 Matthew Auld          2025-08-28  1413  					    dma_dir);
> 99624bdff867079 Matthew Brost         2025-03-05  1414  			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
> 99624bdff867079 Matthew Brost         2025-03-05  1415  				err = -EFAULT;
> 99624bdff867079 Matthew Brost         2025-03-05  1416  				goto err_unmap;
> 99624bdff867079 Matthew Brost         2025-03-05  1417  			}
> 99624bdff867079 Matthew Brost         2025-03-05  1418
> f70da6f99d4f40c Matthew Auld          2025-08-28  1419  			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
> 99624bdff867079 Matthew Brost         2025-03-05  1420  				(addr, DRM_INTERCONNECT_SYSTEM, order,
> ad70e289ed4b1f8 Matthew Auld          2025-08-28  1421  				 dma_dir);
> 99624bdff867079 Matthew Brost         2025-03-05  1422  		}
> 99624bdff867079 Matthew Brost         2025-03-05  1423  		i += 1 << order;
> 99624bdff867079 Matthew Brost         2025-03-05  1424  		num_dma_mapped = i;
> a9ac0fa455b050d Matthew Brost         2025-05-12  1425  		flags.has_dma_mapping = true;
> 99624bdff867079 Matthew Brost         2025-03-05  1426  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1427
> f86ad0ed620cb3c Matthew Brost         2025-06-19  1428  	if (pagemap) {
>                                                                      ^^^^^^^
> Again.
> 
> a9ac0fa455b050d Matthew Brost         2025-05-12  1429  		flags.has_devmem_pages = true;
> f70da6f99d4f40c Matthew Auld          2025-08-28  1430  		svm_pages->dpagemap = dpagemap;
> 99624bdff867079 Matthew Brost         2025-03-05  1431  	}
> 99624bdff867079 Matthew Brost         2025-03-05  1432
> a9ac0fa455b050d Matthew Brost         2025-05-12  1433  	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
> f70da6f99d4f40c Matthew Auld          2025-08-28  1434  	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
> a9ac0fa455b050d Matthew Brost         2025-05-12  1435
> 99624bdff867079 Matthew Brost         2025-03-05  1436  	drm_gpusvm_notifier_unlock(gpusvm);
> 99624bdff867079 Matthew Brost         2025-03-05  1437  	kvfree(pfns);
> 99624bdff867079 Matthew Brost         2025-03-05  1438  set_seqno:
> f70da6f99d4f40c Matthew Auld          2025-08-28  1439  	svm_pages->notifier_seq = hmm_range.notifier_seq;
> 99624bdff867079 Matthew Brost         2025-03-05  1440
> 99624bdff867079 Matthew Brost         2025-03-05  1441  	return 0;
> 99624bdff867079 Matthew Brost         2025-03-05  1442
> 99624bdff867079 Matthew Brost         2025-03-05  1443  err_unmap:
> 6364afd532bcabf Matthew Auld          2025-08-28  1444  	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
> 99624bdff867079 Matthew Brost         2025-03-05  1445  	drm_gpusvm_notifier_unlock(gpusvm);
> 99624bdff867079 Matthew Brost         2025-03-05  1446  err_free:
> 99624bdff867079 Matthew Brost         2025-03-05  1447  	kvfree(pfns);
> 99624bdff867079 Matthew Brost         2025-03-05  1448  	if (err == -EAGAIN)
> 99624bdff867079 Matthew Brost         2025-03-05  1449  		goto retry;
> 99624bdff867079 Matthew Brost         2025-03-05  1450  	return err;
> 99624bdff867079 Matthew Brost         2025-03-05  1451  }
> 


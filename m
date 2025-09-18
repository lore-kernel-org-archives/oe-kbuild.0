Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56645305E38
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196321; cv=none; b=fIe1roGzW4QwbY8RmjwgZFvw7Wb9lrdzwQYsQyCIQCyPfPZ0GclcQVTZnlkVlfTBewgMVrD2QykaGKOoMVIxOfYkADBVJqbX5HTEPiwD4jW8FRCER8s6H2u7iO4QW7GmR37m5VEt5QnGcfwTlF3i0LPYCRcY/ZmYwqq7ErgTQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196321; c=relaxed/simple;
	bh=AYbQH5mhcKFhuQf2OC8PWXVDJDLmI3t+mssdLAEbiL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhBOESJp0YwPDZDRryM+7B9i0T8Mo5FQVO3MXwtKGK108WTHE7h0AkfOtPLVddyQFrWjdtOC9ePBC0+KflagAWvmIXOPys6mZ6BNouB8tqHOemFZzZ3c671ZiSWivnOb8JUwYAQT5SmJEKNGkR6JONrhes7QfjEmwAHRxLB5/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jy3gvDbA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jy3gvDbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758196318; x=1789732318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYbQH5mhcKFhuQf2OC8PWXVDJDLmI3t+mssdLAEbiL4=;
  b=jy3gvDbAtYrqHwJqPa7klTrDsSSvkB1RW76PFlhNd9wnsLMVf0KH1f0K
   XfEN91rDqJMkvX5CwLSu9cnGVNU4KiBzRQG4ZlXRcalU/CF7GjZsC57OR
   L+6fytXFav6TUTPtyh7gT0xg7lcAO96YOx0+/8aOK9qnWB/VnpIzR2sUK
   MCJCKeE8gd8py/0dqw4e6+DyDi/kgzXHIAY2GNY0vBh7GK/s1C5Nlyw9c
   L+EXqMTiMv439Ohbx/OjmjaYzyMdHBjp1e7nd/Hd5bYWnBVIWryDbQeFA
   yqbiFuUtqAA9Z9Dryv/hoGcrMCMzC35mFSYREpMw6Ela8D2ZVl99wfK5P
   g==;
X-CSE-ConnectionGUID: G30ntzPZQfyopq0tANfx1A==
X-CSE-MsgGUID: Kz8GXjPmSo6CGkDe5e2kKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60454908"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="60454908"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 04:51:57 -0700
X-CSE-ConnectionGUID: wUAsHlglTBCxJzOdJoAIBQ==
X-CSE-MsgGUID: jYb5teypRIGmgUM4VciD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="206471606"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2025 04:51:56 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzDB4-0003D7-1B;
	Thu, 18 Sep 2025 11:51:54 +0000
Date: Thu, 18 Sep 2025 19:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5624/10189] drivers/gpu/drm/drm_gpusvm.c:1388
 drm_gpusvm_get_pages() error: uninitialized symbol 'dpagemap'.
Message-ID: <202509181916.GbnDEpv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matthew Auld <matthew.auld@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
commit: 9e978741488261e117bb50e5dfcf8e4080990958 [5624/10189] drm/xe/userptr: replace xe_hmm with gpusvm
:::::: branch date: 22 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181916.GbnDEpv2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509181916.GbnDEpv2-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:1388 drm_gpusvm_get_pages() error: uninitialized symbol 'dpagemap'.

Old smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:794 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'end'.
drivers/gpu/drm/drm_gpusvm.c:794 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'start'.

vim +/dpagemap +1388 drivers/gpu/drm/drm_gpusvm.c

99624bdff867079 Matthew Brost         2025-03-05  1242  
99624bdff867079 Matthew Brost         2025-03-05  1243  /**
6364afd532bcabf Matthew Auld          2025-08-28  1244   * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
99624bdff867079 Matthew Brost         2025-03-05  1245   * @gpusvm: Pointer to the GPU SVM structure
6364afd532bcabf Matthew Auld          2025-08-28  1246   * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
6364afd532bcabf Matthew Auld          2025-08-28  1247   * @mm: The mm corresponding to the CPU range
6364afd532bcabf Matthew Auld          2025-08-28  1248   * @notifier: The corresponding notifier for the given CPU range
6364afd532bcabf Matthew Auld          2025-08-28  1249   * @pages_start: Start CPU address for the pages
6364afd532bcabf Matthew Auld          2025-08-28  1250   * @pages_end: End CPU address for the pages (exclusive)
99624bdff867079 Matthew Brost         2025-03-05  1251   * @ctx: GPU SVM context
99624bdff867079 Matthew Brost         2025-03-05  1252   *
6364afd532bcabf Matthew Auld          2025-08-28  1253   * This function gets and maps pages for CPU range and ensures they are
6364afd532bcabf Matthew Auld          2025-08-28  1254   * mapped for DMA access.
99624bdff867079 Matthew Brost         2025-03-05  1255   *
99624bdff867079 Matthew Brost         2025-03-05  1256   * Return: 0 on success, negative error code on failure.
99624bdff867079 Matthew Brost         2025-03-05  1257   */
83f706ecbde1dfd Matthew Auld          2025-08-28  1258  int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
6364afd532bcabf Matthew Auld          2025-08-28  1259  			 struct drm_gpusvm_pages *svm_pages,
6364afd532bcabf Matthew Auld          2025-08-28  1260  			 struct mm_struct *mm,
6364afd532bcabf Matthew Auld          2025-08-28  1261  			 struct mmu_interval_notifier *notifier,
83f706ecbde1dfd Matthew Auld          2025-08-28  1262  			 unsigned long pages_start, unsigned long pages_end,
99624bdff867079 Matthew Brost         2025-03-05  1263  			 const struct drm_gpusvm_ctx *ctx)
99624bdff867079 Matthew Brost         2025-03-05  1264  {
99624bdff867079 Matthew Brost         2025-03-05  1265  	struct hmm_range hmm_range = {
99624bdff867079 Matthew Brost         2025-03-05  1266  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
99624bdff867079 Matthew Brost         2025-03-05  1267  			HMM_PFN_REQ_WRITE),
99624bdff867079 Matthew Brost         2025-03-05  1268  		.notifier = notifier,
6364afd532bcabf Matthew Auld          2025-08-28  1269  		.start = pages_start,
6364afd532bcabf Matthew Auld          2025-08-28  1270  		.end = pages_end,
99624bdff867079 Matthew Brost         2025-03-05  1271  		.dev_private_owner = gpusvm->device_private_page_owner,
99624bdff867079 Matthew Brost         2025-03-05  1272  	};
f86ad0ed620cb3c Matthew Brost         2025-06-19  1273  	void *zdd;
99624bdff867079 Matthew Brost         2025-03-05  1274  	unsigned long timeout =
99624bdff867079 Matthew Brost         2025-03-05  1275  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
99624bdff867079 Matthew Brost         2025-03-05  1276  	unsigned long i, j;
6364afd532bcabf Matthew Auld          2025-08-28  1277  	unsigned long npages = npages_in_range(pages_start, pages_end);
99624bdff867079 Matthew Brost         2025-03-05  1278  	unsigned long num_dma_mapped;
99624bdff867079 Matthew Brost         2025-03-05  1279  	unsigned int order = 0;
99624bdff867079 Matthew Brost         2025-03-05  1280  	unsigned long *pfns;
99624bdff867079 Matthew Brost         2025-03-05  1281  	int err = 0;
99624bdff867079 Matthew Brost         2025-03-05  1282  	struct dev_pagemap *pagemap;
99624bdff867079 Matthew Brost         2025-03-05  1283  	struct drm_pagemap *dpagemap;
f70da6f99d4f40c Matthew Auld          2025-08-28  1284  	struct drm_gpusvm_pages_flags flags;
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1285  	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1286  							   DMA_BIDIRECTIONAL;
99624bdff867079 Matthew Brost         2025-03-05  1287  
99624bdff867079 Matthew Brost         2025-03-05  1288  retry:
99624bdff867079 Matthew Brost         2025-03-05  1289  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
6364afd532bcabf Matthew Auld          2025-08-28  1290  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
99624bdff867079 Matthew Brost         2025-03-05  1291  		goto set_seqno;
99624bdff867079 Matthew Brost         2025-03-05  1292  
99624bdff867079 Matthew Brost         2025-03-05  1293  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
99624bdff867079 Matthew Brost         2025-03-05  1294  	if (!pfns)
99624bdff867079 Matthew Brost         2025-03-05  1295  		return -ENOMEM;
99624bdff867079 Matthew Brost         2025-03-05  1296  
99624bdff867079 Matthew Brost         2025-03-05  1297  	if (!mmget_not_zero(mm)) {
99624bdff867079 Matthew Brost         2025-03-05  1298  		err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1299  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1300  	}
99624bdff867079 Matthew Brost         2025-03-05  1301  
99624bdff867079 Matthew Brost         2025-03-05  1302  	hmm_range.hmm_pfns = pfns;
99624bdff867079 Matthew Brost         2025-03-05  1303  	while (true) {
99624bdff867079 Matthew Brost         2025-03-05  1304  		mmap_read_lock(mm);
99624bdff867079 Matthew Brost         2025-03-05  1305  		err = hmm_range_fault(&hmm_range);
99624bdff867079 Matthew Brost         2025-03-05  1306  		mmap_read_unlock(mm);
99624bdff867079 Matthew Brost         2025-03-05  1307  
99624bdff867079 Matthew Brost         2025-03-05  1308  		if (err == -EBUSY) {
99624bdff867079 Matthew Brost         2025-03-05  1309  			if (time_after(jiffies, timeout))
99624bdff867079 Matthew Brost         2025-03-05  1310  				break;
99624bdff867079 Matthew Brost         2025-03-05  1311  
99624bdff867079 Matthew Brost         2025-03-05  1312  			hmm_range.notifier_seq =
99624bdff867079 Matthew Brost         2025-03-05  1313  				mmu_interval_read_begin(notifier);
99624bdff867079 Matthew Brost         2025-03-05  1314  			continue;
99624bdff867079 Matthew Brost         2025-03-05  1315  		}
99624bdff867079 Matthew Brost         2025-03-05  1316  		break;
99624bdff867079 Matthew Brost         2025-03-05  1317  	}
99624bdff867079 Matthew Brost         2025-03-05  1318  	mmput(mm);
99624bdff867079 Matthew Brost         2025-03-05  1319  	if (err)
99624bdff867079 Matthew Brost         2025-03-05  1320  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1321  
99624bdff867079 Matthew Brost         2025-03-05  1322  map_pages:
99624bdff867079 Matthew Brost         2025-03-05  1323  	/*
99624bdff867079 Matthew Brost         2025-03-05  1324  	 * Perform all dma mappings under the notifier lock to not
99624bdff867079 Matthew Brost         2025-03-05  1325  	 * access freed pages. A notifier will either block on
99624bdff867079 Matthew Brost         2025-03-05  1326  	 * the notifier lock or unmap dma.
99624bdff867079 Matthew Brost         2025-03-05  1327  	 */
99624bdff867079 Matthew Brost         2025-03-05  1328  	drm_gpusvm_notifier_lock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1329  
f70da6f99d4f40c Matthew Auld          2025-08-28  1330  	flags.__flags = svm_pages->flags.__flags;
a9ac0fa455b050d Matthew Brost         2025-05-12  1331  	if (flags.unmapped) {
99624bdff867079 Matthew Brost         2025-03-05  1332  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1333  		err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1334  		goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1335  	}
99624bdff867079 Matthew Brost         2025-03-05  1336  
99624bdff867079 Matthew Brost         2025-03-05  1337  	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
99624bdff867079 Matthew Brost         2025-03-05  1338  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1339  		kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1340  		goto retry;
99624bdff867079 Matthew Brost         2025-03-05  1341  	}
99624bdff867079 Matthew Brost         2025-03-05  1342  
f70da6f99d4f40c Matthew Auld          2025-08-28  1343  	if (!svm_pages->dma_addr) {
99624bdff867079 Matthew Brost         2025-03-05  1344  		/* Unlock and restart mapping to allocate memory. */
99624bdff867079 Matthew Brost         2025-03-05  1345  		drm_gpusvm_notifier_unlock(gpusvm);
f70da6f99d4f40c Matthew Auld          2025-08-28  1346  		svm_pages->dma_addr =
f70da6f99d4f40c Matthew Auld          2025-08-28  1347  			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
f70da6f99d4f40c Matthew Auld          2025-08-28  1348  		if (!svm_pages->dma_addr) {
99624bdff867079 Matthew Brost         2025-03-05  1349  			err = -ENOMEM;
99624bdff867079 Matthew Brost         2025-03-05  1350  			goto err_free;
99624bdff867079 Matthew Brost         2025-03-05  1351  		}
99624bdff867079 Matthew Brost         2025-03-05  1352  		goto map_pages;
99624bdff867079 Matthew Brost         2025-03-05  1353  	}
99624bdff867079 Matthew Brost         2025-03-05  1354  
99624bdff867079 Matthew Brost         2025-03-05  1355  	zdd = NULL;
f86ad0ed620cb3c Matthew Brost         2025-06-19  1356  	pagemap = NULL;
99624bdff867079 Matthew Brost         2025-03-05  1357  	num_dma_mapped = 0;
99624bdff867079 Matthew Brost         2025-03-05  1358  	for (i = 0, j = 0; i < npages; ++j) {
99624bdff867079 Matthew Brost         2025-03-05  1359  		struct page *page = hmm_pfn_to_page(pfns[i]);
99624bdff867079 Matthew Brost         2025-03-05  1360  
c50729c68aaf936 Matthew Auld          2025-08-28  1361  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
99624bdff867079 Matthew Brost         2025-03-05  1362  		if (is_device_private_page(page) ||
99624bdff867079 Matthew Brost         2025-03-05  1363  		    is_device_coherent_page(page)) {
99624bdff867079 Matthew Brost         2025-03-05  1364  			if (zdd != page->zone_device_data && i > 0) {
99624bdff867079 Matthew Brost         2025-03-05  1365  				err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1366  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1367  			}
99624bdff867079 Matthew Brost         2025-03-05  1368  			zdd = page->zone_device_data;
eb0ece16027f822 Linus Torvalds        2025-04-01  1369  			if (pagemap != page_pgmap(page)) {
99624bdff867079 Matthew Brost         2025-03-05  1370  				if (i > 0) {
99624bdff867079 Matthew Brost         2025-03-05  1371  					err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1372  					goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1373  				}
99624bdff867079 Matthew Brost         2025-03-05  1374  
eb0ece16027f822 Linus Torvalds        2025-04-01  1375  				pagemap = page_pgmap(page);
f86ad0ed620cb3c Matthew Brost         2025-06-19  1376  				dpagemap = drm_pagemap_page_to_dpagemap(page);
99624bdff867079 Matthew Brost         2025-03-05  1377  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
99624bdff867079 Matthew Brost         2025-03-05  1378  					/*
99624bdff867079 Matthew Brost         2025-03-05  1379  					 * Raced. This is not supposed to happen
99624bdff867079 Matthew Brost         2025-03-05  1380  					 * since hmm_range_fault() should've migrated
99624bdff867079 Matthew Brost         2025-03-05  1381  					 * this page to system.
99624bdff867079 Matthew Brost         2025-03-05  1382  					 */
99624bdff867079 Matthew Brost         2025-03-05  1383  					err = -EAGAIN;
99624bdff867079 Matthew Brost         2025-03-05  1384  					goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1385  				}
99624bdff867079 Matthew Brost         2025-03-05  1386  			}
f70da6f99d4f40c Matthew Auld          2025-08-28  1387  			svm_pages->dma_addr[j] =
99624bdff867079 Matthew Brost         2025-03-05 @1388  				dpagemap->ops->device_map(dpagemap,
99624bdff867079 Matthew Brost         2025-03-05  1389  							  gpusvm->drm->dev,
99624bdff867079 Matthew Brost         2025-03-05  1390  							  page, order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1391  							  dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1392  			if (dma_mapping_error(gpusvm->drm->dev,
f70da6f99d4f40c Matthew Auld          2025-08-28  1393  					      svm_pages->dma_addr[j].addr)) {
99624bdff867079 Matthew Brost         2025-03-05  1394  				err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1395  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1396  			}
99624bdff867079 Matthew Brost         2025-03-05  1397  		} else {
99624bdff867079 Matthew Brost         2025-03-05  1398  			dma_addr_t addr;
99624bdff867079 Matthew Brost         2025-03-05  1399  
f86ad0ed620cb3c Matthew Brost         2025-06-19  1400  			if (is_zone_device_page(page) || pagemap) {
99624bdff867079 Matthew Brost         2025-03-05  1401  				err = -EOPNOTSUPP;
99624bdff867079 Matthew Brost         2025-03-05  1402  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1403  			}
99624bdff867079 Matthew Brost         2025-03-05  1404  
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1405  			if (ctx->devmem_only) {
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1406  				err = -EFAULT;
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1407  				goto err_unmap;
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1408  			}
8a9b978ebd47df9 Himal Prasad Ghimiray 2025-05-12  1409  
99624bdff867079 Matthew Brost         2025-03-05  1410  			addr = dma_map_page(gpusvm->drm->dev,
99624bdff867079 Matthew Brost         2025-03-05  1411  					    page, 0,
99624bdff867079 Matthew Brost         2025-03-05  1412  					    PAGE_SIZE << order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1413  					    dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1414  			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
99624bdff867079 Matthew Brost         2025-03-05  1415  				err = -EFAULT;
99624bdff867079 Matthew Brost         2025-03-05  1416  				goto err_unmap;
99624bdff867079 Matthew Brost         2025-03-05  1417  			}
99624bdff867079 Matthew Brost         2025-03-05  1418  
f70da6f99d4f40c Matthew Auld          2025-08-28  1419  			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
99624bdff867079 Matthew Brost         2025-03-05  1420  				(addr, DRM_INTERCONNECT_SYSTEM, order,
ad70e289ed4b1f8 Matthew Auld          2025-08-28  1421  				 dma_dir);
99624bdff867079 Matthew Brost         2025-03-05  1422  		}
99624bdff867079 Matthew Brost         2025-03-05  1423  		i += 1 << order;
99624bdff867079 Matthew Brost         2025-03-05  1424  		num_dma_mapped = i;
a9ac0fa455b050d Matthew Brost         2025-05-12  1425  		flags.has_dma_mapping = true;
99624bdff867079 Matthew Brost         2025-03-05  1426  	}
99624bdff867079 Matthew Brost         2025-03-05  1427  
f86ad0ed620cb3c Matthew Brost         2025-06-19  1428  	if (pagemap) {
a9ac0fa455b050d Matthew Brost         2025-05-12  1429  		flags.has_devmem_pages = true;
f70da6f99d4f40c Matthew Auld          2025-08-28  1430  		svm_pages->dpagemap = dpagemap;
99624bdff867079 Matthew Brost         2025-03-05  1431  	}
99624bdff867079 Matthew Brost         2025-03-05  1432  
a9ac0fa455b050d Matthew Brost         2025-05-12  1433  	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
f70da6f99d4f40c Matthew Auld          2025-08-28  1434  	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
a9ac0fa455b050d Matthew Brost         2025-05-12  1435  
99624bdff867079 Matthew Brost         2025-03-05  1436  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1437  	kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1438  set_seqno:
f70da6f99d4f40c Matthew Auld          2025-08-28  1439  	svm_pages->notifier_seq = hmm_range.notifier_seq;
99624bdff867079 Matthew Brost         2025-03-05  1440  
99624bdff867079 Matthew Brost         2025-03-05  1441  	return 0;
99624bdff867079 Matthew Brost         2025-03-05  1442  
99624bdff867079 Matthew Brost         2025-03-05  1443  err_unmap:
6364afd532bcabf Matthew Auld          2025-08-28  1444  	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
99624bdff867079 Matthew Brost         2025-03-05  1445  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff867079 Matthew Brost         2025-03-05  1446  err_free:
99624bdff867079 Matthew Brost         2025-03-05  1447  	kvfree(pfns);
99624bdff867079 Matthew Brost         2025-03-05  1448  	if (err == -EAGAIN)
99624bdff867079 Matthew Brost         2025-03-05  1449  		goto retry;
99624bdff867079 Matthew Brost         2025-03-05  1450  	return err;
99624bdff867079 Matthew Brost         2025-03-05  1451  }
83f706ecbde1dfd Matthew Auld          2025-08-28  1452  EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
6364afd532bcabf Matthew Auld          2025-08-28  1453  

:::::: The code at line 1388 was first introduced by commit
:::::: 99624bdff8670795b678eafa6509aaad3a5c0175 drm/gpusvm: Add support for GPU Shared Virtual Memory

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

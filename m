Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE053B67A
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 01:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768095880; cv=none; b=TPZHhsd4bWzCL2CQX2uZ46I0833SHxW8DMNbvbnoGZfb4w1yr0feGcXQioH6euiy1jv75SRj3pHAN+QCWOEuMikwZjeyS7T24UHfZLaeFtxg3ewo52TZDLj6Bd7GHjrxc/0ncJ+JZFkBXUNtjVDV2t2i28Kj2jYSjcRoHgqQpf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768095880; c=relaxed/simple;
	bh=YfEzrfFo3W13xcqUP6VPtcSBRJOuFNndVSCdtMWo1cY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HVAIzspwa0jDZRcxGpQcEb6pfUjvnsUtzqJB3J44jEPzU4pH/ujQaAtXSWMKSu5sJaZA7YRhhm5A9IeUsJ3TICcha59rBjAsIFcd7opUhpU3bCqmQo8j7QDQ/oV0u1z0bWc23akmNBGgCh9d619FluLiFzpEDzEDV1fQHNh4KRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6bkGQEb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6bkGQEb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768095878; x=1799631878;
  h=date:from:to:cc:subject:message-id;
  bh=YfEzrfFo3W13xcqUP6VPtcSBRJOuFNndVSCdtMWo1cY=;
  b=B6bkGQEbGECzBFVPEIm2PNU3psuWZfs/pT6aj1KN75zxdjnBpO0uvGik
   pMllTTGCAyUMcJcXx/xmYta4DohGE7Jo9oS77BwIXTjRRgeuLlnXiIJ6G
   Og+/WWQZjY5aZFHrWUc4E7LFG0F+yvA1i4sKf/O6SfTv78AyDUdxWIDqC
   JNQ/fUmHf8fK1eSkA2aQA5v4rzF023RgLLzo3sV91hir3Pd9NVWdUOHZd
   1Dx7Kh9swXR/X70AxuIgzaRVUnDfL2/INvvuV+lcvgxpMN1VXsFDWEliR
   1gQKGVh/Zo31vAy6qIFk992RaP9M5tfYDRiaMc9m40UAxqsk/O0egMOqU
   g==;
X-CSE-ConnectionGUID: XkNZA+LDTbq8TSTz+fKpFw==
X-CSE-MsgGUID: YTW4H3klQQ+ZB93A4dVOxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80061363"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="80061363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 17:44:37 -0800
X-CSE-ConnectionGUID: nXUtMmkKRqGU9OgUufA0JA==
X-CSE-MsgGUID: D+HKIP4HSZasXOWqlsmr9w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 17:44:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vekVO-000000009RU-0PEj;
	Sun, 11 Jan 2026 01:44:34 +0000
Date: Sun, 11 Jan 2026 09:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/drm_gpusvm.c:1354 drm_gpusvm_get_pages()
 error: uninitialized symbol 'dpagemap'.
Message-ID: <202601110958.RkjHT4i5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Matthew Auld <matthew.auld@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97313d6113ab4362ad15076f65560e65288fbcb8
commit: 6364afd532bcabf4a12bea44c3dd4c291e31a83e drm/gpusvm: refactor core API to use pages struct
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r072-20260109 (https://download.01.org/0day-ci/archive/20260111/202601110958.RkjHT4i5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601110958.RkjHT4i5-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:1354 drm_gpusvm_get_pages() error: uninitialized symbol 'dpagemap'.

Old smatch warnings:
drivers/gpu/drm/drm_gpusvm.c:780 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'end'.
drivers/gpu/drm/drm_gpusvm.c:780 drm_gpusvm_range_chunk_size() error: uninitialized symbol 'start'.

vim +/dpagemap +1354 drivers/gpu/drm/drm_gpusvm.c

99624bdff86707 Matthew Brost         2025-03-05  1207  
99624bdff86707 Matthew Brost         2025-03-05  1208  /**
6364afd532bcab Matthew Auld          2025-08-28  1209   * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
99624bdff86707 Matthew Brost         2025-03-05  1210   * @gpusvm: Pointer to the GPU SVM structure
6364afd532bcab Matthew Auld          2025-08-28  1211   * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
6364afd532bcab Matthew Auld          2025-08-28  1212   * @mm: The mm corresponding to the CPU range
6364afd532bcab Matthew Auld          2025-08-28  1213   * @notifier: The corresponding notifier for the given CPU range
6364afd532bcab Matthew Auld          2025-08-28  1214   * @pages_start: Start CPU address for the pages
6364afd532bcab Matthew Auld          2025-08-28  1215   * @pages_end: End CPU address for the pages (exclusive)
99624bdff86707 Matthew Brost         2025-03-05  1216   * @ctx: GPU SVM context
99624bdff86707 Matthew Brost         2025-03-05  1217   *
6364afd532bcab Matthew Auld          2025-08-28  1218   * This function gets and maps pages for CPU range and ensures they are
6364afd532bcab Matthew Auld          2025-08-28  1219   * mapped for DMA access.
99624bdff86707 Matthew Brost         2025-03-05  1220   *
99624bdff86707 Matthew Brost         2025-03-05  1221   * Return: 0 on success, negative error code on failure.
99624bdff86707 Matthew Brost         2025-03-05  1222   */
6364afd532bcab Matthew Auld          2025-08-28  1223  static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
6364afd532bcab Matthew Auld          2025-08-28  1224  				struct drm_gpusvm_pages *svm_pages,
6364afd532bcab Matthew Auld          2025-08-28  1225  				struct mm_struct *mm,
6364afd532bcab Matthew Auld          2025-08-28  1226  				struct mmu_interval_notifier *notifier,
6364afd532bcab Matthew Auld          2025-08-28  1227  				unsigned long pages_start,
6364afd532bcab Matthew Auld          2025-08-28  1228  				unsigned long pages_end,
99624bdff86707 Matthew Brost         2025-03-05  1229  				const struct drm_gpusvm_ctx *ctx)
99624bdff86707 Matthew Brost         2025-03-05  1230  {
99624bdff86707 Matthew Brost         2025-03-05  1231  	struct hmm_range hmm_range = {
99624bdff86707 Matthew Brost         2025-03-05  1232  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
99624bdff86707 Matthew Brost         2025-03-05  1233  			HMM_PFN_REQ_WRITE),
99624bdff86707 Matthew Brost         2025-03-05  1234  		.notifier = notifier,
6364afd532bcab Matthew Auld          2025-08-28  1235  		.start = pages_start,
6364afd532bcab Matthew Auld          2025-08-28  1236  		.end = pages_end,
99624bdff86707 Matthew Brost         2025-03-05  1237  		.dev_private_owner = gpusvm->device_private_page_owner,
99624bdff86707 Matthew Brost         2025-03-05  1238  	};
f86ad0ed620cb3 Matthew Brost         2025-06-19  1239  	void *zdd;
99624bdff86707 Matthew Brost         2025-03-05  1240  	unsigned long timeout =
99624bdff86707 Matthew Brost         2025-03-05  1241  		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
99624bdff86707 Matthew Brost         2025-03-05  1242  	unsigned long i, j;
6364afd532bcab Matthew Auld          2025-08-28  1243  	unsigned long npages = npages_in_range(pages_start, pages_end);
99624bdff86707 Matthew Brost         2025-03-05  1244  	unsigned long num_dma_mapped;
99624bdff86707 Matthew Brost         2025-03-05  1245  	unsigned int order = 0;
99624bdff86707 Matthew Brost         2025-03-05  1246  	unsigned long *pfns;
99624bdff86707 Matthew Brost         2025-03-05  1247  	int err = 0;
99624bdff86707 Matthew Brost         2025-03-05  1248  	struct dev_pagemap *pagemap;
99624bdff86707 Matthew Brost         2025-03-05  1249  	struct drm_pagemap *dpagemap;
f70da6f99d4f40 Matthew Auld          2025-08-28  1250  	struct drm_gpusvm_pages_flags flags;
ad70e289ed4b1f Matthew Auld          2025-08-28  1251  	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
ad70e289ed4b1f Matthew Auld          2025-08-28  1252  							   DMA_BIDIRECTIONAL;
99624bdff86707 Matthew Brost         2025-03-05  1253  
99624bdff86707 Matthew Brost         2025-03-05  1254  retry:
99624bdff86707 Matthew Brost         2025-03-05  1255  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
6364afd532bcab Matthew Auld          2025-08-28  1256  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
99624bdff86707 Matthew Brost         2025-03-05  1257  		goto set_seqno;
99624bdff86707 Matthew Brost         2025-03-05  1258  
99624bdff86707 Matthew Brost         2025-03-05  1259  	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
99624bdff86707 Matthew Brost         2025-03-05  1260  	if (!pfns)
99624bdff86707 Matthew Brost         2025-03-05  1261  		return -ENOMEM;
99624bdff86707 Matthew Brost         2025-03-05  1262  
99624bdff86707 Matthew Brost         2025-03-05  1263  	if (!mmget_not_zero(mm)) {
99624bdff86707 Matthew Brost         2025-03-05  1264  		err = -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1265  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1266  	}
99624bdff86707 Matthew Brost         2025-03-05  1267  
99624bdff86707 Matthew Brost         2025-03-05  1268  	hmm_range.hmm_pfns = pfns;
99624bdff86707 Matthew Brost         2025-03-05  1269  	while (true) {
99624bdff86707 Matthew Brost         2025-03-05  1270  		mmap_read_lock(mm);
99624bdff86707 Matthew Brost         2025-03-05  1271  		err = hmm_range_fault(&hmm_range);
99624bdff86707 Matthew Brost         2025-03-05  1272  		mmap_read_unlock(mm);
99624bdff86707 Matthew Brost         2025-03-05  1273  
99624bdff86707 Matthew Brost         2025-03-05  1274  		if (err == -EBUSY) {
99624bdff86707 Matthew Brost         2025-03-05  1275  			if (time_after(jiffies, timeout))
99624bdff86707 Matthew Brost         2025-03-05  1276  				break;
99624bdff86707 Matthew Brost         2025-03-05  1277  
99624bdff86707 Matthew Brost         2025-03-05  1278  			hmm_range.notifier_seq =
99624bdff86707 Matthew Brost         2025-03-05  1279  				mmu_interval_read_begin(notifier);
99624bdff86707 Matthew Brost         2025-03-05  1280  			continue;
99624bdff86707 Matthew Brost         2025-03-05  1281  		}
99624bdff86707 Matthew Brost         2025-03-05  1282  		break;
99624bdff86707 Matthew Brost         2025-03-05  1283  	}
99624bdff86707 Matthew Brost         2025-03-05  1284  	mmput(mm);
99624bdff86707 Matthew Brost         2025-03-05  1285  	if (err)
99624bdff86707 Matthew Brost         2025-03-05  1286  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1287  
99624bdff86707 Matthew Brost         2025-03-05  1288  map_pages:
99624bdff86707 Matthew Brost         2025-03-05  1289  	/*
99624bdff86707 Matthew Brost         2025-03-05  1290  	 * Perform all dma mappings under the notifier lock to not
99624bdff86707 Matthew Brost         2025-03-05  1291  	 * access freed pages. A notifier will either block on
99624bdff86707 Matthew Brost         2025-03-05  1292  	 * the notifier lock or unmap dma.
99624bdff86707 Matthew Brost         2025-03-05  1293  	 */
99624bdff86707 Matthew Brost         2025-03-05  1294  	drm_gpusvm_notifier_lock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1295  
f70da6f99d4f40 Matthew Auld          2025-08-28  1296  	flags.__flags = svm_pages->flags.__flags;
a9ac0fa455b050 Matthew Brost         2025-05-12  1297  	if (flags.unmapped) {
99624bdff86707 Matthew Brost         2025-03-05  1298  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1299  		err = -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1300  		goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1301  	}
99624bdff86707 Matthew Brost         2025-03-05  1302  
99624bdff86707 Matthew Brost         2025-03-05  1303  	if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
99624bdff86707 Matthew Brost         2025-03-05  1304  		drm_gpusvm_notifier_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1305  		kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1306  		goto retry;
99624bdff86707 Matthew Brost         2025-03-05  1307  	}
99624bdff86707 Matthew Brost         2025-03-05  1308  
f70da6f99d4f40 Matthew Auld          2025-08-28  1309  	if (!svm_pages->dma_addr) {
99624bdff86707 Matthew Brost         2025-03-05  1310  		/* Unlock and restart mapping to allocate memory. */
99624bdff86707 Matthew Brost         2025-03-05  1311  		drm_gpusvm_notifier_unlock(gpusvm);
f70da6f99d4f40 Matthew Auld          2025-08-28  1312  		svm_pages->dma_addr =
f70da6f99d4f40 Matthew Auld          2025-08-28  1313  			kvmalloc_array(npages, sizeof(*svm_pages->dma_addr), GFP_KERNEL);
f70da6f99d4f40 Matthew Auld          2025-08-28  1314  		if (!svm_pages->dma_addr) {
99624bdff86707 Matthew Brost         2025-03-05  1315  			err = -ENOMEM;
99624bdff86707 Matthew Brost         2025-03-05  1316  			goto err_free;
99624bdff86707 Matthew Brost         2025-03-05  1317  		}
99624bdff86707 Matthew Brost         2025-03-05  1318  		goto map_pages;
99624bdff86707 Matthew Brost         2025-03-05  1319  	}
99624bdff86707 Matthew Brost         2025-03-05  1320  
99624bdff86707 Matthew Brost         2025-03-05  1321  	zdd = NULL;
f86ad0ed620cb3 Matthew Brost         2025-06-19  1322  	pagemap = NULL;
99624bdff86707 Matthew Brost         2025-03-05  1323  	num_dma_mapped = 0;
99624bdff86707 Matthew Brost         2025-03-05  1324  	for (i = 0, j = 0; i < npages; ++j) {
99624bdff86707 Matthew Brost         2025-03-05  1325  		struct page *page = hmm_pfn_to_page(pfns[i]);
99624bdff86707 Matthew Brost         2025-03-05  1326  
c50729c68aaf93 Matthew Auld          2025-08-28  1327  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
99624bdff86707 Matthew Brost         2025-03-05  1328  		if (is_device_private_page(page) ||
99624bdff86707 Matthew Brost         2025-03-05  1329  		    is_device_coherent_page(page)) {
99624bdff86707 Matthew Brost         2025-03-05  1330  			if (zdd != page->zone_device_data && i > 0) {
99624bdff86707 Matthew Brost         2025-03-05  1331  				err = -EOPNOTSUPP;
99624bdff86707 Matthew Brost         2025-03-05  1332  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1333  			}
99624bdff86707 Matthew Brost         2025-03-05  1334  			zdd = page->zone_device_data;
eb0ece16027f82 Linus Torvalds        2025-04-01  1335  			if (pagemap != page_pgmap(page)) {
99624bdff86707 Matthew Brost         2025-03-05  1336  				if (i > 0) {
99624bdff86707 Matthew Brost         2025-03-05  1337  					err = -EOPNOTSUPP;
99624bdff86707 Matthew Brost         2025-03-05  1338  					goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1339  				}
99624bdff86707 Matthew Brost         2025-03-05  1340  
eb0ece16027f82 Linus Torvalds        2025-04-01  1341  				pagemap = page_pgmap(page);
f86ad0ed620cb3 Matthew Brost         2025-06-19  1342  				dpagemap = drm_pagemap_page_to_dpagemap(page);
99624bdff86707 Matthew Brost         2025-03-05  1343  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
99624bdff86707 Matthew Brost         2025-03-05  1344  					/*
99624bdff86707 Matthew Brost         2025-03-05  1345  					 * Raced. This is not supposed to happen
99624bdff86707 Matthew Brost         2025-03-05  1346  					 * since hmm_range_fault() should've migrated
99624bdff86707 Matthew Brost         2025-03-05  1347  					 * this page to system.
99624bdff86707 Matthew Brost         2025-03-05  1348  					 */
99624bdff86707 Matthew Brost         2025-03-05  1349  					err = -EAGAIN;
99624bdff86707 Matthew Brost         2025-03-05  1350  					goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1351  				}
99624bdff86707 Matthew Brost         2025-03-05  1352  			}
f70da6f99d4f40 Matthew Auld          2025-08-28  1353  			svm_pages->dma_addr[j] =
99624bdff86707 Matthew Brost         2025-03-05 @1354  				dpagemap->ops->device_map(dpagemap,
99624bdff86707 Matthew Brost         2025-03-05  1355  							  gpusvm->drm->dev,
99624bdff86707 Matthew Brost         2025-03-05  1356  							  page, order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1357  							  dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1358  			if (dma_mapping_error(gpusvm->drm->dev,
f70da6f99d4f40 Matthew Auld          2025-08-28  1359  					      svm_pages->dma_addr[j].addr)) {
99624bdff86707 Matthew Brost         2025-03-05  1360  				err = -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1361  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1362  			}
99624bdff86707 Matthew Brost         2025-03-05  1363  		} else {
99624bdff86707 Matthew Brost         2025-03-05  1364  			dma_addr_t addr;
99624bdff86707 Matthew Brost         2025-03-05  1365  
f86ad0ed620cb3 Matthew Brost         2025-06-19  1366  			if (is_zone_device_page(page) || pagemap) {
99624bdff86707 Matthew Brost         2025-03-05  1367  				err = -EOPNOTSUPP;
99624bdff86707 Matthew Brost         2025-03-05  1368  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1369  			}
99624bdff86707 Matthew Brost         2025-03-05  1370  
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1371  			if (ctx->devmem_only) {
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1372  				err = -EFAULT;
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1373  				goto err_unmap;
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1374  			}
8a9b978ebd47df Himal Prasad Ghimiray 2025-05-12  1375  
99624bdff86707 Matthew Brost         2025-03-05  1376  			addr = dma_map_page(gpusvm->drm->dev,
99624bdff86707 Matthew Brost         2025-03-05  1377  					    page, 0,
99624bdff86707 Matthew Brost         2025-03-05  1378  					    PAGE_SIZE << order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1379  					    dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1380  			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
99624bdff86707 Matthew Brost         2025-03-05  1381  				err = -EFAULT;
99624bdff86707 Matthew Brost         2025-03-05  1382  				goto err_unmap;
99624bdff86707 Matthew Brost         2025-03-05  1383  			}
99624bdff86707 Matthew Brost         2025-03-05  1384  
f70da6f99d4f40 Matthew Auld          2025-08-28  1385  			svm_pages->dma_addr[j] = drm_pagemap_addr_encode
99624bdff86707 Matthew Brost         2025-03-05  1386  				(addr, DRM_INTERCONNECT_SYSTEM, order,
ad70e289ed4b1f Matthew Auld          2025-08-28  1387  				 dma_dir);
99624bdff86707 Matthew Brost         2025-03-05  1388  		}
99624bdff86707 Matthew Brost         2025-03-05  1389  		i += 1 << order;
99624bdff86707 Matthew Brost         2025-03-05  1390  		num_dma_mapped = i;
a9ac0fa455b050 Matthew Brost         2025-05-12  1391  		flags.has_dma_mapping = true;
99624bdff86707 Matthew Brost         2025-03-05  1392  	}
99624bdff86707 Matthew Brost         2025-03-05  1393  
f86ad0ed620cb3 Matthew Brost         2025-06-19  1394  	if (pagemap) {
a9ac0fa455b050 Matthew Brost         2025-05-12  1395  		flags.has_devmem_pages = true;
f70da6f99d4f40 Matthew Auld          2025-08-28  1396  		svm_pages->dpagemap = dpagemap;
99624bdff86707 Matthew Brost         2025-03-05  1397  	}
99624bdff86707 Matthew Brost         2025-03-05  1398  
a9ac0fa455b050 Matthew Brost         2025-05-12  1399  	/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
f70da6f99d4f40 Matthew Auld          2025-08-28  1400  	WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
a9ac0fa455b050 Matthew Brost         2025-05-12  1401  
99624bdff86707 Matthew Brost         2025-03-05  1402  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1403  	kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1404  set_seqno:
f70da6f99d4f40 Matthew Auld          2025-08-28  1405  	svm_pages->notifier_seq = hmm_range.notifier_seq;
99624bdff86707 Matthew Brost         2025-03-05  1406  
99624bdff86707 Matthew Brost         2025-03-05  1407  	return 0;
99624bdff86707 Matthew Brost         2025-03-05  1408  
99624bdff86707 Matthew Brost         2025-03-05  1409  err_unmap:
6364afd532bcab Matthew Auld          2025-08-28  1410  	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
99624bdff86707 Matthew Brost         2025-03-05  1411  	drm_gpusvm_notifier_unlock(gpusvm);
99624bdff86707 Matthew Brost         2025-03-05  1412  err_free:
99624bdff86707 Matthew Brost         2025-03-05  1413  	kvfree(pfns);
99624bdff86707 Matthew Brost         2025-03-05  1414  	if (err == -EAGAIN)
99624bdff86707 Matthew Brost         2025-03-05  1415  		goto retry;
99624bdff86707 Matthew Brost         2025-03-05  1416  	return err;
99624bdff86707 Matthew Brost         2025-03-05  1417  }
6364afd532bcab Matthew Auld          2025-08-28  1418  

:::::: The code at line 1354 was first introduced by commit
:::::: 99624bdff8670795b678eafa6509aaad3a5c0175 drm/gpusvm: Add support for GPU Shared Virtual Memory

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

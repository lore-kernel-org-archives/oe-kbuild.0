Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC74A1B;
	Wed, 12 Jun 2024 02:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718160615; cv=none; b=PBPmtHudlMWWrkBNba3eFRRZbVtFxWcRCi6e7I6ybT7h4zb1HmZ0dW9Djidw8m2jH+z4wKdIdniKOitotuwmDv/rQt0+l91RD7y1gk26b+2rNLOZtbUbtQNhChDyUiClRrqVVMWG0x7qryZcRktRnjivPXqefW7kL6AnGHxjCEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718160615; c=relaxed/simple;
	bh=WNmbgIEW2ccQEpRrxUE+bt9lrsjKhOdoAw6JSC+8QhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y9lCCEe2GNRmQIEZvmaBHMB7F6PIEM63OwvHMly3ceCo7SuJCvZWUbnppSbjZ84lJscDUHPNUgE7rJ3cZR7ToYfqtV5qSI7Bb8MQn691LSMFlht38/c5tLuo7F1u45EjJ7CcZruybLoFXoo1BhMKh8jgpbdrsW3+9DGqUR2mP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VzVKh3ffVz2CkH1;
	Wed, 12 Jun 2024 10:46:16 +0800 (CST)
Received: from dggpemf100008.china.huawei.com (unknown [7.185.36.138])
	by mail.maildlp.com (Postfix) with ESMTPS id C7C6314022D;
	Wed, 12 Jun 2024 10:50:03 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemf100008.china.huawei.com (7.185.36.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Jun 2024 10:50:03 +0800
Message-ID: <c6df35cc-1331-4255-8ff5-898f6a911bec@huawei.com>
Date: Wed, 12 Jun 2024 10:50:02 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, Linux Memory Management
 List <linux-mm@kvack.org>, <ying.huang@intel.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Mel Gorman <mgorman@suse.de>, Ryan Roberts
	<ryan.roberts@arm.com>, <liushixin2@huawei.com>
References: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <100add53-aa58-44ce-a15d-8438001fb2b9@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100008.china.huawei.com (7.185.36.138)



On 2024/6/10 0:03, Dan Carpenter wrote:
> Hi Kefeng,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-fix-possible-OOB-in-numa_rebuild_large_mapping/20240607-183609
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240607103241.1298388-1-wangkefeng.wang%40huawei.com
> patch subject: [PATCH] mm: fix possible OOB in numa_rebuild_large_mapping()
> config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092325.eDrcikT8-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406092325.eDrcikT8-lkp@intel.com/
> 
> smatch warnings:
> mm/memory.c:5370 do_numa_page() error: uninitialized symbol 'nr_pages'.
> 
> vim +/nr_pages +5370 mm/memory.c
> 
> 2b7403035459c7 Souptick Joarder  2018-08-23  5265  static vm_fault_t do_numa_page(struct vm_fault *vmf)
> d10e63f29488b0 Mel Gorman        2012-10-25  5266  {
> 82b0f8c39a3869 Jan Kara          2016-12-14  5267  	struct vm_area_struct *vma = vmf->vma;
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5268  	struct folio *folio = NULL;
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5269  	int nid = NUMA_NO_NODE;
> d2136d749d76af Baolin Wang       2024-03-29  5270  	bool writable = false, ignore_writable = false;
> d2136d749d76af Baolin Wang       2024-03-29  5271  	bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
> 90572890d20252 Peter Zijlstra    2013-10-07  5272  	int last_cpupid;
> cbee9f88ec1b8d Peter Zijlstra    2012-10-25  5273  	int target_nid;
> 04a8645304500b Aneesh Kumar K.V  2019-03-05  5274  	pte_t pte, old_pte;
> d2136d749d76af Baolin Wang       2024-03-29  5275  	int flags = 0, nr_pages;
> d10e63f29488b0 Mel Gorman        2012-10-25  5276
> d10e63f29488b0 Mel Gorman        2012-10-25  5277  	/*
> 6c1b748ebf27be John Hubbard      2024-02-27  5278  	 * The pte cannot be used safely until we verify, while holding the page
> 6c1b748ebf27be John Hubbard      2024-02-27  5279  	 * table lock, that its contents have not changed during fault handling.
> d10e63f29488b0 Mel Gorman        2012-10-25  5280  	 */
> 82b0f8c39a3869 Jan Kara          2016-12-14  5281  	spin_lock(vmf->ptl);
> 6c1b748ebf27be John Hubbard      2024-02-27  5282  	/* Read the live PTE from the page tables: */
> 6c1b748ebf27be John Hubbard      2024-02-27  5283  	old_pte = ptep_get(vmf->pte);
> 6c1b748ebf27be John Hubbard      2024-02-27  5284
> 6c1b748ebf27be John Hubbard      2024-02-27  5285  	if (unlikely(!pte_same(old_pte, vmf->orig_pte))) {
> 82b0f8c39a3869 Jan Kara          2016-12-14  5286  		pte_unmap_unlock(vmf->pte, vmf->ptl);
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5287  		goto out;
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5288  	}
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5289
> 04a8645304500b Aneesh Kumar K.V  2019-03-05  5290  	pte = pte_modify(old_pte, vma->vm_page_prot);
> d10e63f29488b0 Mel Gorman        2012-10-25  5291
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5292  	/*
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5293  	 * Detect now whether the PTE could be writable; this information
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5294  	 * is only valid while holding the PT lock.
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5295  	 */
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5296  	writable = pte_write(pte);
> d2136d749d76af Baolin Wang       2024-03-29  5297  	if (!writable && pte_write_upgrade &&
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5298  	    can_change_pte_writable(vma, vmf->address, pte))
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5299  		writable = true;
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5300
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5301  	folio = vm_normal_folio(vma, vmf->address, pte);
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5302  	if (!folio || folio_is_zone_device(folio))
> b99a342d4f11a5 Huang Ying        2021-04-29  5303  		goto out_map;
> 
> nr_pages not initialized
> 
> d10e63f29488b0 Mel Gorman        2012-10-25  5304
> 6688cc05473b36 Peter Zijlstra    2013-10-07  5305  	/*
> bea66fbd11af1c Mel Gorman        2015-03-25  5306  	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
> bea66fbd11af1c Mel Gorman        2015-03-25  5307  	 * much anyway since they can be in shared cache state. This misses
> bea66fbd11af1c Mel Gorman        2015-03-25  5308  	 * the case where a mapping is writable but the process never writes
> bea66fbd11af1c Mel Gorman        2015-03-25  5309  	 * to it but pte_write gets cleared during protection updates and
> bea66fbd11af1c Mel Gorman        2015-03-25  5310  	 * pte_dirty has unpredictable behaviour between PTE scan updates,
> bea66fbd11af1c Mel Gorman        2015-03-25  5311  	 * background writeback, dirty balancing and application behaviour.
> bea66fbd11af1c Mel Gorman        2015-03-25  5312  	 */
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5313  	if (!writable)
> 6688cc05473b36 Peter Zijlstra    2013-10-07  5314  		flags |= TNF_NO_GROUP;
> 6688cc05473b36 Peter Zijlstra    2013-10-07  5315
> dabe1d992414a6 Rik van Riel      2013-10-07  5316  	/*
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5317  	 * Flag if the folio is shared between multiple address spaces. This
> dabe1d992414a6 Rik van Riel      2013-10-07  5318  	 * is later used when determining whether to group tasks together
> dabe1d992414a6 Rik van Riel      2013-10-07  5319  	 */
> ebb34f78d72c23 David Hildenbrand 2024-02-27  5320  	if (folio_likely_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
> dabe1d992414a6 Rik van Riel      2013-10-07  5321  		flags |= TNF_SHARED;
> dabe1d992414a6 Rik van Riel      2013-10-07  5322
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5323  	nid = folio_nid(folio);
> d2136d749d76af Baolin Wang       2024-03-29  5324  	nr_pages = folio_nr_pages(folio);
> 33024536bafd91 Huang Ying        2022-07-13  5325  	/*
> 33024536bafd91 Huang Ying        2022-07-13  5326  	 * For memory tiering mode, cpupid of slow memory page is used
> 33024536bafd91 Huang Ying        2022-07-13  5327  	 * to record page access time.  So use default value.
> 33024536bafd91 Huang Ying        2022-07-13  5328  	 */
> 33024536bafd91 Huang Ying        2022-07-13  5329  	if ((sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5330  	    !node_is_toptier(nid))
> 33024536bafd91 Huang Ying        2022-07-13  5331  		last_cpupid = (-1 & LAST_CPUPID_MASK);
> 33024536bafd91 Huang Ying        2022-07-13  5332  	else
> 67b33e3ff58374 Kefeng Wang       2023-10-18  5333  		last_cpupid = folio_last_cpupid(folio);
> f8fd525ba3a298 Donet Tom         2024-03-08  5334  	target_nid = numa_migrate_prep(folio, vmf, vmf->address, nid, &flags);
> 98fa15f34cb379 Anshuman Khandual 2019-03-05  5335  	if (target_nid == NUMA_NO_NODE) {
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5336  		folio_put(folio);
> b99a342d4f11a5 Huang Ying        2021-04-29  5337  		goto out_map;
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5338  	}
> b99a342d4f11a5 Huang Ying        2021-04-29  5339  	pte_unmap_unlock(vmf->pte, vmf->ptl);
> 6a56ccbcf6c695 David Hildenbrand 2022-11-08  5340  	writable = false;
> d2136d749d76af Baolin Wang       2024-03-29  5341  	ignore_writable = true;
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5342
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5343  	/* Migrate to the requested node */
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5344  	if (migrate_misplaced_folio(folio, vma, target_nid)) {
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5345  		nid = target_nid;
> 6688cc05473b36 Peter Zijlstra    2013-10-07  5346  		flags |= TNF_MIGRATED;
> b99a342d4f11a5 Huang Ying        2021-04-29  5347  	} else {
> 074c238177a75f Mel Gorman        2015-03-25  5348  		flags |= TNF_MIGRATE_FAIL;
> c7ad08804fae5b Hugh Dickins      2023-06-08  5349  		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
> c7ad08804fae5b Hugh Dickins      2023-06-08  5350  					       vmf->address, &vmf->ptl);
> c7ad08804fae5b Hugh Dickins      2023-06-08  5351  		if (unlikely(!vmf->pte))
> c7ad08804fae5b Hugh Dickins      2023-06-08  5352  			goto out;
> c33c794828f212 Ryan Roberts      2023-06-12  5353  		if (unlikely(!pte_same(ptep_get(vmf->pte), vmf->orig_pte))) {
> b99a342d4f11a5 Huang Ying        2021-04-29  5354  			pte_unmap_unlock(vmf->pte, vmf->ptl);
> b99a342d4f11a5 Huang Ying        2021-04-29  5355  			goto out;
> b99a342d4f11a5 Huang Ying        2021-04-29  5356  		}
> b99a342d4f11a5 Huang Ying        2021-04-29  5357  		goto out_map;
> b99a342d4f11a5 Huang Ying        2021-04-29  5358  	}
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5359
> 4daae3b4b9e49b Mel Gorman        2012-11-02  5360  out:
> 6695cf68b15c21 Kefeng Wang       2023-09-21  5361  	if (nid != NUMA_NO_NODE)
> d2136d749d76af Baolin Wang       2024-03-29  5362  		task_numa_fault(last_cpupid, nid, nr_pages, flags);
> d10e63f29488b0 Mel Gorman        2012-10-25  5363  	return 0;
> b99a342d4f11a5 Huang Ying        2021-04-29  5364  out_map:
> b99a342d4f11a5 Huang Ying        2021-04-29  5365  	/*
> b99a342d4f11a5 Huang Ying        2021-04-29  5366  	 * Make it present again, depending on how arch implements
> b99a342d4f11a5 Huang Ying        2021-04-29  5367  	 * non-accessible ptes, some can allow access by kernel mode.
> b99a342d4f11a5 Huang Ying        2021-04-29  5368  	 */
> d2136d749d76af Baolin Wang       2024-03-29  5369  	if (folio && folio_test_large(folio))
> 
> Are folio_test_large() and folio_is_zone_device() mutually exclusive?
> If so then this is a false positive.  Just ignore the warning in that
> case.
> 

The folio in ZONE_DEVICE is not a large folio, so there is no issue for 
now, but will fix.



> 8d27aa5be8ed93 Kefeng Wang       2024-06-07 @5370  		numa_rebuild_large_mapping(vmf, vma, folio, nr_pages, pte,
> 8d27aa5be8ed93 Kefeng Wang       2024-06-07  5371  					   ignore_writable, pte_write_upgrade);
> d2136d749d76af Baolin Wang       2024-03-29  5372  	else
> d2136d749d76af Baolin Wang       2024-03-29  5373  		numa_rebuild_single_mapping(vmf, vma, vmf->address, vmf->pte,
> d2136d749d76af Baolin Wang       2024-03-29  5374  					    writable);
> b99a342d4f11a5 Huang Ying        2021-04-29  5375  	pte_unmap_unlock(vmf->pte, vmf->ptl);
> b99a342d4f11a5 Huang Ying        2021-04-29  5376  	goto out;
> d10e63f29488b0 Mel Gorman        2012-10-25  5377  }
> 

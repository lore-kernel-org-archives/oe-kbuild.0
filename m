Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE20533EA
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717268667; cv=none; b=SdmFGf+c1pswf4khWhgTPv0AFznTBOmNRDxGUK4VvP+Zf+m3lF5ccOqZGWsBxMQcmYV3P9/oQ3fygo4W5I9ZK5nG0BiItBVLhhqDpYmSKAfo/vmw5rtIKScGeb0/4P+Ghq58vY0xs4yGeCPIPJN4vRb3Lc95JfAFE55oXpbpWVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717268667; c=relaxed/simple;
	bh=LmWrVFLEkIs9XVXXUTytrRFfUcTstKW9nIIunvuvx7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNreEkKTwjjk2J1ijhhdRiJucpzAOR4Mbfg18rjGJhLSsyuh1S7VJoIvDWd9ziEBRxSNk8HVNTo1ZvUAWSwMXRKvkkQIrz//STMe/xCRe03NfkH+ZhLc+HnP7gwz/WgVKzC4/rp6Od3TUcRreTab931V+nw2mcn2Rigy7QABvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7J/q/am; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7J/q/am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717268665; x=1748804665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmWrVFLEkIs9XVXXUTytrRFfUcTstKW9nIIunvuvx7w=;
  b=D7J/q/amnTB6w3sn6GzIlumvW7s3p8UK9dQyGgwWyPZrC7VvXnvXXwnr
   60jnMF7KoKbDIHhP6UEeq+16YC6EgRxKF7mCnpQG+bjqQLDq3r4z/F9At
   DNb7bSX6l8ixbeUSyAOOTQTMgtxcdTgsvFf8f95cmeKdHAEbvFeH8Tvym
   TIkV4mIXAiWhuf7Sp8dVcvAvTfcZv4O3OPTkTSJh3zQ0uNfZlWp354XR+
   xnjLDgYIkLOqv8+WJyi78CkON6qdooXkmIWfstORWMRNbl2eXXAlUz/Ju
   IlTb4zo7yS1s6ybXYJFuOWhaIZYjJotGlbm5LGgl5FUMEVnqVjJvIm8nu
   w==;
X-CSE-ConnectionGUID: ciHYR24TSjWHoQ08rqyzmw==
X-CSE-MsgGUID: AMm9zGOZQMKfVrHYnq85YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13924523"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="13924523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 12:04:23 -0700
X-CSE-ConnectionGUID: 8Mridp+2TfSsuZFlLuaIJg==
X-CSE-MsgGUID: pUKtpwJRRPqati7Bjiv40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="36565622"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Jun 2024 12:04:09 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDU1A-000JGx-2O;
	Sat, 01 Jun 2024 19:04:03 +0000
Date: Sun, 2 Jun 2024 03:03:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/6] mm: shmem: add mTHP support for anonymous shmem
Message-ID: <202406020203.14sT311e-lkp@intel.com>
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
In-Reply-To: <ec35a23026dd016705d211e85163cabe07681516.1717033868.git.baolin.wang@linux.alibaba.com>
References: <ec35a23026dd016705d211e85163cabe07681516.1717033868.git.baolin.wang@linux.alibaba.com>
TO: Baolin Wang <baolin.wang@linux.alibaba.com>
TO: akpm@linux-foundation.org
TO: hughd@google.com
CC: willy@infradead.org
CC: david@redhat.com
CC: wangkefeng.wang@huawei.com
CC: ying.huang@intel.com
CC: 21cnbao@gmail.com
CC: ryan.roberts@arm.com
CC: shy828301@gmail.com
CC: ziy@nvidia.com
CC: ioworker0@gmail.com
CC: da.gomez@samsung.com
CC: p.raghav@samsung.com
CC: baolin.wang@linux.alibaba.com
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org

Hi Baolin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20240531]
[cannot apply to linus/master v6.10-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-memory-extend-finish_fault-to-support-large-folio/20240530-100805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/ec35a23026dd016705d211e85163cabe07681516.1717033868.git.baolin.wang%40linux.alibaba.com
patch subject: [PATCH v3 4/6] mm: shmem: add mTHP support for anonymous shmem
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240602/202406020203.14sT311e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406020203.14sT311e-lkp@intel.com/

smatch warnings:
mm/shmem.c:1766 shmem_alloc_and_add_folio() error: uninitialized symbol 'suitable_orders'.

vim +/suitable_orders +1766 mm/shmem.c

800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1728  
ededbc2c2f28a1 Baolin Wang             2024-05-30  1729  static struct folio *shmem_alloc_and_add_folio(struct vm_fault *vmf,
ededbc2c2f28a1 Baolin Wang             2024-05-30  1730  		gfp_t gfp, struct inode *inode, pgoff_t index,
ededbc2c2f28a1 Baolin Wang             2024-05-30  1731  		struct mm_struct *fault_mm, unsigned long orders)
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1732  {
3022fd7af9604d Hugh Dickins            2023-09-29  1733  	struct address_space *mapping = inode->i_mapping;
0f0796945614b7 Mike Rapoport           2017-09-06  1734  	struct shmem_inode_info *info = SHMEM_I(inode);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1735  	struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1736  	unsigned long suitable_orders;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1737  	struct folio *folio = NULL;
3022fd7af9604d Hugh Dickins            2023-09-29  1738  	long pages;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1739  	int error, order;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1740  
396bcc5299c281 Matthew Wilcox (Oracle  2020-04-06  1741) 	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
ededbc2c2f28a1 Baolin Wang             2024-05-30  1742  		orders = 0;
800d8c63b2e989 Kirill A. Shutemov      2016-07-26  1743  
ededbc2c2f28a1 Baolin Wang             2024-05-30  1744  	if (orders > 0) {
ededbc2c2f28a1 Baolin Wang             2024-05-30  1745  		if (vma && vma_is_anon_shmem(vma)) {
ededbc2c2f28a1 Baolin Wang             2024-05-30  1746  			suitable_orders = anon_shmem_suitable_orders(inode, vmf,
ededbc2c2f28a1 Baolin Wang             2024-05-30  1747  							mapping, index, orders);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1748  		} else if (orders & BIT(HPAGE_PMD_ORDER)) {
3022fd7af9604d Hugh Dickins            2023-09-29  1749  			pages = HPAGE_PMD_NR;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1750  			suitable_orders = BIT(HPAGE_PMD_ORDER);
3022fd7af9604d Hugh Dickins            2023-09-29  1751  			index = round_down(index, HPAGE_PMD_NR);
3022fd7af9604d Hugh Dickins            2023-09-29  1752  
3022fd7af9604d Hugh Dickins            2023-09-29  1753  			/*
3022fd7af9604d Hugh Dickins            2023-09-29  1754  			 * Check for conflict before waiting on a huge allocation.
3022fd7af9604d Hugh Dickins            2023-09-29  1755  			 * Conflict might be that a huge page has just been allocated
3022fd7af9604d Hugh Dickins            2023-09-29  1756  			 * and added to page cache by a racing thread, or that there
3022fd7af9604d Hugh Dickins            2023-09-29  1757  			 * is already at least one small page in the huge extent.
3022fd7af9604d Hugh Dickins            2023-09-29  1758  			 * Be careful to retry when appropriate, but not forever!
3022fd7af9604d Hugh Dickins            2023-09-29  1759  			 * Elsewhere -EEXIST would be the right code, but not here.
3022fd7af9604d Hugh Dickins            2023-09-29  1760  			 */
3022fd7af9604d Hugh Dickins            2023-09-29  1761  			if (xa_find(&mapping->i_pages, &index,
3022fd7af9604d Hugh Dickins            2023-09-29  1762  				    index + HPAGE_PMD_NR - 1, XA_PRESENT))
3022fd7af9604d Hugh Dickins            2023-09-29  1763  				return ERR_PTR(-E2BIG);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1764  		}
52cd3b074050dd Lee Schermerhorn        2008-04-28  1765  
ededbc2c2f28a1 Baolin Wang             2024-05-30 @1766  		order = highest_order(suitable_orders);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1767  		while (suitable_orders) {
ededbc2c2f28a1 Baolin Wang             2024-05-30  1768  			pages = 1UL << order;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1769  			index = round_down(index, pages);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1770  			folio = shmem_alloc_folio(gfp, order, info, index);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1771  			if (folio)
ededbc2c2f28a1 Baolin Wang             2024-05-30  1772  				goto allocated;
ededbc2c2f28a1 Baolin Wang             2024-05-30  1773  
ededbc2c2f28a1 Baolin Wang             2024-05-30  1774  			if (pages == HPAGE_PMD_NR)
3022fd7af9604d Hugh Dickins            2023-09-29  1775  				count_vm_event(THP_FILE_FALLBACK);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1776  			order = next_order(&suitable_orders, order);
ededbc2c2f28a1 Baolin Wang             2024-05-30  1777  		}
3022fd7af9604d Hugh Dickins            2023-09-29  1778  	} else {
3022fd7af9604d Hugh Dickins            2023-09-29  1779  		pages = 1;
2198a98913385f Kefeng Wang             2024-05-15  1780  		folio = shmem_alloc_folio(gfp, 0, info, index);
3022fd7af9604d Hugh Dickins            2023-09-29  1781  	}
3022fd7af9604d Hugh Dickins            2023-09-29  1782  	if (!folio)
3022fd7af9604d Hugh Dickins            2023-09-29  1783  		return ERR_PTR(-ENOMEM);
3022fd7af9604d Hugh Dickins            2023-09-29  1784  
ededbc2c2f28a1 Baolin Wang             2024-05-30  1785  allocated:
72827e5c2bcb86 Matthew Wilcox (Oracle  2022-05-12  1786) 	__folio_set_locked(folio);
72827e5c2bcb86 Matthew Wilcox (Oracle  2022-05-12  1787) 	__folio_set_swapbacked(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  1788  
3022fd7af9604d Hugh Dickins            2023-09-29  1789  	gfp &= GFP_RECLAIM_MASK;
3022fd7af9604d Hugh Dickins            2023-09-29  1790  	error = mem_cgroup_charge(folio, fault_mm, gfp);
3022fd7af9604d Hugh Dickins            2023-09-29  1791  	if (error) {
3022fd7af9604d Hugh Dickins            2023-09-29  1792  		if (xa_find(&mapping->i_pages, &index,
3022fd7af9604d Hugh Dickins            2023-09-29  1793  				index + pages - 1, XA_PRESENT)) {
3022fd7af9604d Hugh Dickins            2023-09-29  1794  			error = -EEXIST;
e600e8b7466880 Baolin Wang             2024-05-30  1795  		} else if (pages == HPAGE_PMD_NR) {
3022fd7af9604d Hugh Dickins            2023-09-29  1796  			count_vm_event(THP_FILE_FALLBACK);
3022fd7af9604d Hugh Dickins            2023-09-29  1797  			count_vm_event(THP_FILE_FALLBACK_CHARGE);
3022fd7af9604d Hugh Dickins            2023-09-29  1798  		}
3022fd7af9604d Hugh Dickins            2023-09-29  1799  		goto unlock;
75edd345e8ede5 Hugh Dickins            2016-05-19  1800  	}
18a2f371f5edf4 Mel Gorman              2012-12-05  1801  
3022fd7af9604d Hugh Dickins            2023-09-29  1802  	error = shmem_add_to_page_cache(folio, mapping, index, NULL, gfp);
3022fd7af9604d Hugh Dickins            2023-09-29  1803  	if (error)
3022fd7af9604d Hugh Dickins            2023-09-29  1804  		goto unlock;
3022fd7af9604d Hugh Dickins            2023-09-29  1805  
3022fd7af9604d Hugh Dickins            2023-09-29  1806  	error = shmem_inode_acct_blocks(inode, pages);
3022fd7af9604d Hugh Dickins            2023-09-29  1807  	if (error) {
3022fd7af9604d Hugh Dickins            2023-09-29  1808  		struct shmem_sb_info *sbinfo = SHMEM_SB(inode->i_sb);
3022fd7af9604d Hugh Dickins            2023-09-29  1809  		long freed;
3022fd7af9604d Hugh Dickins            2023-09-29  1810  		/*
3022fd7af9604d Hugh Dickins            2023-09-29  1811  		 * Try to reclaim some space by splitting a few
3022fd7af9604d Hugh Dickins            2023-09-29  1812  		 * large folios beyond i_size on the filesystem.
3022fd7af9604d Hugh Dickins            2023-09-29  1813  		 */
3022fd7af9604d Hugh Dickins            2023-09-29  1814  		shmem_unused_huge_shrink(sbinfo, NULL, 2);
3022fd7af9604d Hugh Dickins            2023-09-29  1815  		/*
3022fd7af9604d Hugh Dickins            2023-09-29  1816  		 * And do a shmem_recalc_inode() to account for freed pages:
3022fd7af9604d Hugh Dickins            2023-09-29  1817  		 * except our folio is there in cache, so not quite balanced.
3022fd7af9604d Hugh Dickins            2023-09-29  1818  		 */
3022fd7af9604d Hugh Dickins            2023-09-29  1819  		spin_lock(&info->lock);
3022fd7af9604d Hugh Dickins            2023-09-29  1820  		freed = pages + info->alloced - info->swapped -
3022fd7af9604d Hugh Dickins            2023-09-29  1821  			READ_ONCE(mapping->nrpages);
3022fd7af9604d Hugh Dickins            2023-09-29  1822  		if (freed > 0)
3022fd7af9604d Hugh Dickins            2023-09-29  1823  			info->alloced -= freed;
3022fd7af9604d Hugh Dickins            2023-09-29  1824  		spin_unlock(&info->lock);
3022fd7af9604d Hugh Dickins            2023-09-29  1825  		if (freed > 0)
3022fd7af9604d Hugh Dickins            2023-09-29  1826  			shmem_inode_unacct_blocks(inode, freed);
3022fd7af9604d Hugh Dickins            2023-09-29  1827  		error = shmem_inode_acct_blocks(inode, pages);
3022fd7af9604d Hugh Dickins            2023-09-29  1828  		if (error) {
3022fd7af9604d Hugh Dickins            2023-09-29  1829  			filemap_remove_folio(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  1830  			goto unlock;
3022fd7af9604d Hugh Dickins            2023-09-29  1831  		}
3022fd7af9604d Hugh Dickins            2023-09-29  1832  	}
3022fd7af9604d Hugh Dickins            2023-09-29  1833  
3022fd7af9604d Hugh Dickins            2023-09-29  1834  	shmem_recalc_inode(inode, pages, 0);
3022fd7af9604d Hugh Dickins            2023-09-29  1835  	folio_add_lru(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  1836  	return folio;
3022fd7af9604d Hugh Dickins            2023-09-29  1837  
3022fd7af9604d Hugh Dickins            2023-09-29  1838  unlock:
3022fd7af9604d Hugh Dickins            2023-09-29  1839  	folio_unlock(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  1840  	folio_put(folio);
3022fd7af9604d Hugh Dickins            2023-09-29  1841  	return ERR_PTR(error);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1842  }
71fe804b6d56d6 Lee Schermerhorn        2008-04-28  1843  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

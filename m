Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D91F92E
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 04:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600262; cv=none; b=stz0Y3w1KEYgvr0PeD2CaNz6CfxgwszaoZK4uk18z78bbtMP48G13jXVT2VhS165Zz3ikq8ZMhVBfC+FISp/tfPnIm+dlYAN0QeOK7BbXpKw/KCsrs4b8OfREbTgFN3ggykBXEoNmrlHuRyqXnC0A4Lf5bpD7qI7PhlxPqU01SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600262; c=relaxed/simple;
	bh=PjEmfVtyw5xpHsySvLY0+V039Y2m2KaGLAGRkO8gPds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmmBjX++8RSpn1tiCBLHN+A0/9sfXnEzOUkark0WY8qDdNP4plL1FX6/x2CBipZX8NoiHoBKx0ac6ZZvaHgpR/1UbNaPiHlTcn907f5QwYuFr00dX8Sy2R+2ZZEc3mdSwuCePO016pIh0jrxCHS+waYsT+4K5E11aoD9r/LzfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A39m9/59; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A39m9/59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765600261; x=1797136261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PjEmfVtyw5xpHsySvLY0+V039Y2m2KaGLAGRkO8gPds=;
  b=A39m9/595e0EGZBesvhof7YqU5eZfyfECZqRln/5SAFF1RnIW93PURq0
   7u1LSc7W0K7iit4ZhcMX0FIhvc9qC+NQwulw8l8keQMo9Lj9DklnslPtf
   UsKTriEOdt02Teg+7+NxoI6ab0J3Hz77VJm5dNZKgz5xZgPxWaPqp5pf9
   PuQpLkFWT6VxgS92Z1AQqT1TIcDevZXDm6+hqIomPO+fRVg3aMHX7v7xi
   q0FmyMWw8SwtXOq1W0XAi176im/23ICsyVDdfbVnF4VHiPmZLYuhtlxpi
   omsAM8wpVjMQ/1133Ae0cY8zZ4Ard7u2kf1+xe6JliGaiHxy6TCPtGKY3
   Q==;
X-CSE-ConnectionGUID: +9x8Q+EJRkmWxzYZubVAvg==
X-CSE-MsgGUID: 8YKEUphoQ3CIDYaFwz4Tkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71447708"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="71447708"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:31:00 -0800
X-CSE-ConnectionGUID: LJKE4hrjSvG1tcLd1ZRP4A==
X-CSE-MsgGUID: oBLAlsq9TGaxT3J7AmDg6w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 20:30:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHHU-00000000737-3Dxl;
	Sat, 13 Dec 2025 04:30:56 +0000
Date: Sat, 13 Dec 2025 12:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/vfio_iommu_type1.c:786 vfio_pin_pages_remote() error:
 uninitialized symbol 'rsvd'.
Message-ID: <202512131239.2SzcYybx-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Li Zhe <lizhe.67@bytedance.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: David Hildenbrand <david@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 089722e8939e580c9ccc64678ba22f563fdf3bb5 vfio/type1: introduce a new member has_rsvd for struct vfio_dma
date:   10 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131239.2SzcYybx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131239.2SzcYybx-lkp@intel.com/

New smatch warnings:
drivers/vfio/vfio_iommu_type1.c:786 vfio_pin_pages_remote() error: uninitialized symbol 'rsvd'.

Old smatch warnings:
drivers/vfio/vfio_iommu_type1.c:2374 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list

vim +/rsvd +786 drivers/vfio/vfio_iommu_type1.c

f6c84a52cc41e2 Li Zhe          2025-08-14  662  
166fd7d94afdac Alex Williamson 2013-06-21  663  /*
166fd7d94afdac Alex Williamson 2013-06-21  664   * Attempt to pin pages.  We really don't want to track all the pfns and
166fd7d94afdac Alex Williamson 2013-06-21  665   * the iommu can only map chunks of consecutive pfns anyway, so get the
166fd7d94afdac Alex Williamson 2013-06-21  666   * first page and all consecutive pages with the same locking.
166fd7d94afdac Alex Williamson 2013-06-21  667   */
8f0d5bb95f763c Kirti Wankhede  2016-11-17  668  static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
0635559233434a Alex Williamson 2025-02-18  669  				  unsigned long npage, unsigned long *pfn_base,
4b6c33b3229678 Daniel Jordan   2021-02-19  670  				  unsigned long limit, struct vfio_batch *batch)
73fa0d10d077d9 Alex Williamson 2012-07-31  671  {
4d83de6da265cd Daniel Jordan   2021-02-19  672  	unsigned long pfn;
4d83de6da265cd Daniel Jordan   2021-02-19  673  	struct mm_struct *mm = current->mm;
6c38c055cc4c0a Alex Williamson 2016-12-30  674  	long ret, pinned = 0, lock_acct = 0;
89c29def6b0101 Alex Williamson 2018-06-02  675  	bool rsvd;
a54eb55045ae9b Kirti Wankhede  2016-11-17  676  	dma_addr_t iova = vaddr - dma->vaddr + dma->iova;
166fd7d94afdac Alex Williamson 2013-06-21  677  
6c38c055cc4c0a Alex Williamson 2016-12-30  678  	/* This code path is only user initiated */
4d83de6da265cd Daniel Jordan   2021-02-19  679  	if (!mm)
166fd7d94afdac Alex Williamson 2013-06-21  680  		return -ENODEV;
73fa0d10d077d9 Alex Williamson 2012-07-31  681  
4d83de6da265cd Daniel Jordan   2021-02-19  682  	if (batch->size) {
4d83de6da265cd Daniel Jordan   2021-02-19  683  		/* Leftover pages in batch from an earlier call. */
4d83de6da265cd Daniel Jordan   2021-02-19  684  		*pfn_base = page_to_pfn(batch->pages[batch->offset]);
4d83de6da265cd Daniel Jordan   2021-02-19  685  		pfn = *pfn_base;
89c29def6b0101 Alex Williamson 2018-06-02  686  		rsvd = is_invalid_reserved_pfn(*pfn_base);
4d83de6da265cd Daniel Jordan   2021-02-19  687  	} else {
4d83de6da265cd Daniel Jordan   2021-02-19  688  		*pfn_base = 0;
5c6c2b21ecc9ad Alex Williamson 2013-06-21  689  	}
5c6c2b21ecc9ad Alex Williamson 2013-06-21  690  
eb996eec783c1e Alex Williamson 2025-02-18  691  	if (unlikely(disable_hugepages))
eb996eec783c1e Alex Williamson 2025-02-18  692  		npage = 1;
eb996eec783c1e Alex Williamson 2025-02-18  693  
4d83de6da265cd Daniel Jordan   2021-02-19  694  	while (npage) {
4d83de6da265cd Daniel Jordan   2021-02-19  695  		if (!batch->size) {
b1779e4f209c7f Keith Busch     2025-07-15  696  			/*
b1779e4f209c7f Keith Busch     2025-07-15  697  			 * Large mappings may take a while to repeatedly refill
b1779e4f209c7f Keith Busch     2025-07-15  698  			 * the batch, so conditionally relinquish the CPU when
b1779e4f209c7f Keith Busch     2025-07-15  699  			 * needed to avoid stalls.
b1779e4f209c7f Keith Busch     2025-07-15  700  			 */
b1779e4f209c7f Keith Busch     2025-07-15  701  			cond_resched();
b1779e4f209c7f Keith Busch     2025-07-15  702  
4d83de6da265cd Daniel Jordan   2021-02-19  703  			/* Empty batch, so refill it. */
eb996eec783c1e Alex Williamson 2025-02-18  704  			ret = vaddr_get_pfns(mm, vaddr, npage, dma->prot,
eb996eec783c1e Alex Williamson 2025-02-18  705  					     &pfn, batch);
be16c1fd99f41a Daniel Jordan   2021-02-19  706  			if (ret < 0)
4d83de6da265cd Daniel Jordan   2021-02-19  707  				goto unpin_out;
166fd7d94afdac Alex Williamson 2013-06-21  708  
4d83de6da265cd Daniel Jordan   2021-02-19  709  			if (!*pfn_base) {
4d83de6da265cd Daniel Jordan   2021-02-19  710  				*pfn_base = pfn;
4d83de6da265cd Daniel Jordan   2021-02-19  711  				rsvd = is_invalid_reserved_pfn(*pfn_base);
4d83de6da265cd Daniel Jordan   2021-02-19  712  			}
eb996eec783c1e Alex Williamson 2025-02-18  713  
eb996eec783c1e Alex Williamson 2025-02-18  714  			/* Handle pfnmap */
eb996eec783c1e Alex Williamson 2025-02-18  715  			if (!batch->size) {
eb996eec783c1e Alex Williamson 2025-02-18  716  				if (pfn != *pfn_base + pinned || !rsvd)
eb996eec783c1e Alex Williamson 2025-02-18  717  					goto out;
eb996eec783c1e Alex Williamson 2025-02-18  718  
eb996eec783c1e Alex Williamson 2025-02-18  719  				pinned += ret;
eb996eec783c1e Alex Williamson 2025-02-18  720  				npage -= ret;
eb996eec783c1e Alex Williamson 2025-02-18  721  				vaddr += (PAGE_SIZE * ret);
eb996eec783c1e Alex Williamson 2025-02-18  722  				iova += (PAGE_SIZE * ret);
eb996eec783c1e Alex Williamson 2025-02-18  723  				continue;
eb996eec783c1e Alex Williamson 2025-02-18  724  			}
166fd7d94afdac Alex Williamson 2013-06-21  725  		}
166fd7d94afdac Alex Williamson 2013-06-21  726  
4d83de6da265cd Daniel Jordan   2021-02-19  727  		/*
eb996eec783c1e Alex Williamson 2025-02-18  728  		 * pfn is preset for the first iteration of this inner loop
eb996eec783c1e Alex Williamson 2025-02-18  729  		 * due to the fact that vaddr_get_pfns() needs to provide the
eb996eec783c1e Alex Williamson 2025-02-18  730  		 * initial pfn for pfnmaps.  Therefore to reduce redundancy,
eb996eec783c1e Alex Williamson 2025-02-18  731  		 * the next pfn is fetched at the end of the loop.
eb996eec783c1e Alex Williamson 2025-02-18  732  		 * A PageReserved() page could still qualify as page backed
eb996eec783c1e Alex Williamson 2025-02-18  733  		 * and rsvd here, and therefore continues to use the batch.
4d83de6da265cd Daniel Jordan   2021-02-19  734  		 */
4d83de6da265cd Daniel Jordan   2021-02-19  735  		while (true) {
f6c84a52cc41e2 Li Zhe          2025-08-14  736  			long nr_pages, acct_pages = 0;
f6c84a52cc41e2 Li Zhe          2025-08-14  737  
4d83de6da265cd Daniel Jordan   2021-02-19  738  			if (pfn != *pfn_base + pinned ||
4d83de6da265cd Daniel Jordan   2021-02-19  739  			    rsvd != is_invalid_reserved_pfn(pfn))
4d83de6da265cd Daniel Jordan   2021-02-19  740  				goto out;
4d83de6da265cd Daniel Jordan   2021-02-19  741  
f6c84a52cc41e2 Li Zhe          2025-08-14  742  			/*
f6c84a52cc41e2 Li Zhe          2025-08-14  743  			 * Using GUP with the FOLL_LONGTERM in
f6c84a52cc41e2 Li Zhe          2025-08-14  744  			 * vaddr_get_pfns() will not return invalid
f6c84a52cc41e2 Li Zhe          2025-08-14  745  			 * or reserved pages.
f6c84a52cc41e2 Li Zhe          2025-08-14  746  			 */
f6c84a52cc41e2 Li Zhe          2025-08-14  747  			nr_pages = num_pages_contiguous(
f6c84a52cc41e2 Li Zhe          2025-08-14  748  					&batch->pages[batch->offset],
f6c84a52cc41e2 Li Zhe          2025-08-14  749  					batch->size);
f6c84a52cc41e2 Li Zhe          2025-08-14  750  			if (!rsvd) {
f6c84a52cc41e2 Li Zhe          2025-08-14  751  				acct_pages = nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  752  				acct_pages -= vpfn_pages(dma, iova, nr_pages);
f6c84a52cc41e2 Li Zhe          2025-08-14  753  			}
f6c84a52cc41e2 Li Zhe          2025-08-14  754  
4d83de6da265cd Daniel Jordan   2021-02-19  755  			/*
4d83de6da265cd Daniel Jordan   2021-02-19  756  			 * Reserved pages aren't counted against the user,
4d83de6da265cd Daniel Jordan   2021-02-19  757  			 * externally pinned pages are already counted against
4d83de6da265cd Daniel Jordan   2021-02-19  758  			 * the user.
4d83de6da265cd Daniel Jordan   2021-02-19  759  			 */
f6c84a52cc41e2 Li Zhe          2025-08-14  760  			if (acct_pages) {
48d8476b41eed6 Alex Williamson 2018-05-11  761  				if (!dma->lock_cap &&
f6c84a52cc41e2 Li Zhe          2025-08-14  762  				    mm->locked_vm + lock_acct + acct_pages > limit) {
6c38c055cc4c0a Alex Williamson 2016-12-30  763  					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
6c38c055cc4c0a Alex Williamson 2016-12-30  764  						__func__, limit << PAGE_SHIFT);
0cfef2b7410b64 Alex Williamson 2017-04-13  765  					ret = -ENOMEM;
0cfef2b7410b64 Alex Williamson 2017-04-13  766  					goto unpin_out;
166fd7d94afdac Alex Williamson 2013-06-21  767  				}
f6c84a52cc41e2 Li Zhe          2025-08-14  768  				lock_acct += acct_pages;
a54eb55045ae9b Kirti Wankhede  2016-11-17  769  			}
4d83de6da265cd Daniel Jordan   2021-02-19  770  
f6c84a52cc41e2 Li Zhe          2025-08-14  771  			pinned += nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  772  			npage -= nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  773  			vaddr += PAGE_SIZE * nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  774  			iova += PAGE_SIZE * nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  775  			batch->offset += nr_pages;
f6c84a52cc41e2 Li Zhe          2025-08-14  776  			batch->size -= nr_pages;
4d83de6da265cd Daniel Jordan   2021-02-19  777  
4d83de6da265cd Daniel Jordan   2021-02-19  778  			if (!batch->size)
4d83de6da265cd Daniel Jordan   2021-02-19  779  				break;
4d83de6da265cd Daniel Jordan   2021-02-19  780  
4d83de6da265cd Daniel Jordan   2021-02-19  781  			pfn = page_to_pfn(batch->pages[batch->offset]);
4d83de6da265cd Daniel Jordan   2021-02-19  782  		}
a54eb55045ae9b Kirti Wankhede  2016-11-17  783  	}
166fd7d94afdac Alex Williamson 2013-06-21  784  
6c38c055cc4c0a Alex Williamson 2016-12-30  785  out:
089722e8939e58 Li Zhe          2025-08-14 @786  	dma->has_rsvd |= rsvd;
48d8476b41eed6 Alex Williamson 2018-05-11  787  	ret = vfio_lock_acct(dma, lock_acct, false);
0cfef2b7410b64 Alex Williamson 2017-04-13  788  
0cfef2b7410b64 Alex Williamson 2017-04-13  789  unpin_out:
be16c1fd99f41a Daniel Jordan   2021-02-19  790  	if (ret < 0) {
4d83de6da265cd Daniel Jordan   2021-02-19  791  		if (pinned && !rsvd) {
0cfef2b7410b64 Alex Williamson 2017-04-13  792  			for (pfn = *pfn_base ; pinned ; pfn++, pinned--)
0cfef2b7410b64 Alex Williamson 2017-04-13  793  				put_pfn(pfn, dma->prot);
89c29def6b0101 Alex Williamson 2018-06-02  794  		}
4d83de6da265cd Daniel Jordan   2021-02-19  795  		vfio_batch_unpin(batch, dma);
0cfef2b7410b64 Alex Williamson 2017-04-13  796  
0cfef2b7410b64 Alex Williamson 2017-04-13  797  		return ret;
0cfef2b7410b64 Alex Williamson 2017-04-13  798  	}
166fd7d94afdac Alex Williamson 2013-06-21  799  
6c38c055cc4c0a Alex Williamson 2016-12-30  800  	return pinned;
73fa0d10d077d9 Alex Williamson 2012-07-31  801  }
73fa0d10d077d9 Alex Williamson 2012-07-31  802  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

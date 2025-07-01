Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11B2777E8
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Jul 2025 14:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379652; cv=none; b=docr23ttZG2BSlE9NYSV73ua/asXhQkwR8c6iVDsCUfpGzGOb+jhCkimXFcDdtZ5BMkKmk5m4xPsEH1orrp6DMUW6M8HtHjlM+jjNtEFHcZm6JLLogn+VhXy8fTV03yJpksd0LilsKexrVqJiLe1KWukxBpLDF8tL9arsVFLsiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379652; c=relaxed/simple;
	bh=n8LZEZ7k/3QX0Nfb61jSNzx9kZi3eeyL3M89MRsJMn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7VhhQriZ14nRcwpJ9Imj5zv2eGt3JlntFNkHaGI45SFzQftPPVPzV0/gPUVramlBg0Tpj+xVuT/t5zo1crjaOU20yTcUniha8+0GLR2edDVNuky4URrcuBeOzUYi5k8JX3tb5+j5D/c+frM8Fffg0hhvEkwdiRL+wuhqqhlZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHtt9J1m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHtt9J1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751379650; x=1782915650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8LZEZ7k/3QX0Nfb61jSNzx9kZi3eeyL3M89MRsJMn0=;
  b=RHtt9J1mE0y8jbaY80Pu2QHuUZ9+d6S491dH1ioStp3OQ59HkivTkabg
   SNbJEXQ+W+y1SjsEYXjeNLwx9bzAX+v/V1ifT0usJ+gXjKC9KjvPgeyu1
   HCQK9ZkcQsgtu7uw7Mc90DRJQbrBuvFaokBTTNLeUVX390eVMT8zOLW+Z
   L8xuP2BLyDg7HlonffM8Le2w8V4+ZND9OETrbhZkYBK7JbxBxwlAtfqfM
   FuDZI3p5zzG1Gcz1loT4SVlv65l1eD/LaUOLNxTXyiW+P1eNBJpy1cnIM
   +rbVIqOcb4v19+8dviL29e1os2UJqkMDKYx6WePgdjONe+P2m+KUi/4eh
   g==;
X-CSE-ConnectionGUID: CnaLOzlLS1S+rkFG8ehHnQ==
X-CSE-MsgGUID: W4x46Ja5TlO/FkVyCcs3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53518753"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53518753"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 07:20:50 -0700
X-CSE-ConnectionGUID: sa+YXA0TQfO40+Z+OkLuGA==
X-CSE-MsgGUID: FpxQZTl0R0CiIIfP8gA+ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154319273"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2025 07:20:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWbqo-000aHS-0Y;
	Tue, 01 Jul 2025 14:20:46 +0000
Date: Tue, 1 Jul 2025 22:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/4] vfio/type1: introduce a new member has_rsvd for
 struct vfio_dma
Message-ID: <202507012121.wkDLcDXn-lkp@intel.com>
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
In-Reply-To: <20250630072518.31846-4-lizhe.67@bytedance.com>
References: <20250630072518.31846-4-lizhe.67@bytedance.com>
TO: lizhe.67@bytedance.com
TO: alex.williamson@redhat.com
TO: jgg@ziepe.ca
TO: david@redhat.com
TO: peterx@redhat.com
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: lizhe.67@bytedance.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on awilliam-vfio/for-linus linus/master v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/vfio-type1-optimize-vfio_pin_pages_remote-for-large-folios/20250630-152849
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250630072518.31846-4-lizhe.67%40bytedance.com
patch subject: [PATCH 3/4] vfio/type1: introduce a new member has_rsvd for struct vfio_dma
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-161-20250701 (https://download.01.org/0day-ci/archive/20250701/202507012121.wkDLcDXn-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507012121.wkDLcDXn-lkp@intel.com/

New smatch warnings:
drivers/vfio/vfio_iommu_type1.c:788 vfio_pin_pages_remote() error: uninitialized symbol 'rsvd'.

Old smatch warnings:
drivers/vfio/vfio_iommu_type1.c:2376 vfio_iommu_type1_attach_group() warn: '&group->next' not removed from list

vim +/rsvd +788 drivers/vfio/vfio_iommu_type1.c

6a2d9b72168041 Li Zhe          2025-06-30  678  
166fd7d94afdac Alex Williamson 2013-06-21  679  /*
166fd7d94afdac Alex Williamson 2013-06-21  680   * Attempt to pin pages.  We really don't want to track all the pfns and
166fd7d94afdac Alex Williamson 2013-06-21  681   * the iommu can only map chunks of consecutive pfns anyway, so get the
166fd7d94afdac Alex Williamson 2013-06-21  682   * first page and all consecutive pages with the same locking.
166fd7d94afdac Alex Williamson 2013-06-21  683   */
8f0d5bb95f763c Kirti Wankhede  2016-11-17  684  static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
0635559233434a Alex Williamson 2025-02-18  685  				  unsigned long npage, unsigned long *pfn_base,
4b6c33b3229678 Daniel Jordan   2021-02-19  686  				  unsigned long limit, struct vfio_batch *batch)
73fa0d10d077d9 Alex Williamson 2012-07-31  687  {
4d83de6da265cd Daniel Jordan   2021-02-19  688  	unsigned long pfn;
4d83de6da265cd Daniel Jordan   2021-02-19  689  	struct mm_struct *mm = current->mm;
6c38c055cc4c0a Alex Williamson 2016-12-30  690  	long ret, pinned = 0, lock_acct = 0;
89c29def6b0101 Alex Williamson 2018-06-02  691  	bool rsvd;
a54eb55045ae9b Kirti Wankhede  2016-11-17  692  	dma_addr_t iova = vaddr - dma->vaddr + dma->iova;
166fd7d94afdac Alex Williamson 2013-06-21  693  
6c38c055cc4c0a Alex Williamson 2016-12-30  694  	/* This code path is only user initiated */
4d83de6da265cd Daniel Jordan   2021-02-19  695  	if (!mm)
166fd7d94afdac Alex Williamson 2013-06-21  696  		return -ENODEV;
73fa0d10d077d9 Alex Williamson 2012-07-31  697  
4d83de6da265cd Daniel Jordan   2021-02-19  698  	if (batch->size) {
4d83de6da265cd Daniel Jordan   2021-02-19  699  		/* Leftover pages in batch from an earlier call. */
4d83de6da265cd Daniel Jordan   2021-02-19  700  		*pfn_base = page_to_pfn(batch->pages[batch->offset]);
4d83de6da265cd Daniel Jordan   2021-02-19  701  		pfn = *pfn_base;
89c29def6b0101 Alex Williamson 2018-06-02  702  		rsvd = is_invalid_reserved_pfn(*pfn_base);
4d83de6da265cd Daniel Jordan   2021-02-19  703  	} else {
4d83de6da265cd Daniel Jordan   2021-02-19  704  		*pfn_base = 0;
5c6c2b21ecc9ad Alex Williamson 2013-06-21  705  	}
5c6c2b21ecc9ad Alex Williamson 2013-06-21  706  
eb996eec783c1e Alex Williamson 2025-02-18  707  	if (unlikely(disable_hugepages))
eb996eec783c1e Alex Williamson 2025-02-18  708  		npage = 1;
eb996eec783c1e Alex Williamson 2025-02-18  709  
4d83de6da265cd Daniel Jordan   2021-02-19  710  	while (npage) {
4d83de6da265cd Daniel Jordan   2021-02-19  711  		if (!batch->size) {
4d83de6da265cd Daniel Jordan   2021-02-19  712  			/* Empty batch, so refill it. */
eb996eec783c1e Alex Williamson 2025-02-18  713  			ret = vaddr_get_pfns(mm, vaddr, npage, dma->prot,
eb996eec783c1e Alex Williamson 2025-02-18  714  					     &pfn, batch);
be16c1fd99f41a Daniel Jordan   2021-02-19  715  			if (ret < 0)
4d83de6da265cd Daniel Jordan   2021-02-19  716  				goto unpin_out;
166fd7d94afdac Alex Williamson 2013-06-21  717  
4d83de6da265cd Daniel Jordan   2021-02-19  718  			if (!*pfn_base) {
4d83de6da265cd Daniel Jordan   2021-02-19  719  				*pfn_base = pfn;
4d83de6da265cd Daniel Jordan   2021-02-19  720  				rsvd = is_invalid_reserved_pfn(*pfn_base);
4d83de6da265cd Daniel Jordan   2021-02-19  721  			}
eb996eec783c1e Alex Williamson 2025-02-18  722  
eb996eec783c1e Alex Williamson 2025-02-18  723  			/* Handle pfnmap */
eb996eec783c1e Alex Williamson 2025-02-18  724  			if (!batch->size) {
eb996eec783c1e Alex Williamson 2025-02-18  725  				if (pfn != *pfn_base + pinned || !rsvd)
eb996eec783c1e Alex Williamson 2025-02-18  726  					goto out;
eb996eec783c1e Alex Williamson 2025-02-18  727  
eb996eec783c1e Alex Williamson 2025-02-18  728  				pinned += ret;
eb996eec783c1e Alex Williamson 2025-02-18  729  				npage -= ret;
eb996eec783c1e Alex Williamson 2025-02-18  730  				vaddr += (PAGE_SIZE * ret);
eb996eec783c1e Alex Williamson 2025-02-18  731  				iova += (PAGE_SIZE * ret);
eb996eec783c1e Alex Williamson 2025-02-18  732  				continue;
eb996eec783c1e Alex Williamson 2025-02-18  733  			}
166fd7d94afdac Alex Williamson 2013-06-21  734  		}
166fd7d94afdac Alex Williamson 2013-06-21  735  
4d83de6da265cd Daniel Jordan   2021-02-19  736  		/*
eb996eec783c1e Alex Williamson 2025-02-18  737  		 * pfn is preset for the first iteration of this inner loop
eb996eec783c1e Alex Williamson 2025-02-18  738  		 * due to the fact that vaddr_get_pfns() needs to provide the
eb996eec783c1e Alex Williamson 2025-02-18  739  		 * initial pfn for pfnmaps.  Therefore to reduce redundancy,
eb996eec783c1e Alex Williamson 2025-02-18  740  		 * the next pfn is fetched at the end of the loop.
eb996eec783c1e Alex Williamson 2025-02-18  741  		 * A PageReserved() page could still qualify as page backed
eb996eec783c1e Alex Williamson 2025-02-18  742  		 * and rsvd here, and therefore continues to use the batch.
4d83de6da265cd Daniel Jordan   2021-02-19  743  		 */
4d83de6da265cd Daniel Jordan   2021-02-19  744  		while (true) {
6a2d9b72168041 Li Zhe          2025-06-30  745  			long nr_pages, acct_pages = 0;
6a2d9b72168041 Li Zhe          2025-06-30  746  
4d83de6da265cd Daniel Jordan   2021-02-19  747  			if (pfn != *pfn_base + pinned ||
4d83de6da265cd Daniel Jordan   2021-02-19  748  			    rsvd != is_invalid_reserved_pfn(pfn))
4d83de6da265cd Daniel Jordan   2021-02-19  749  				goto out;
4d83de6da265cd Daniel Jordan   2021-02-19  750  
6a2d9b72168041 Li Zhe          2025-06-30  751  			nr_pages = contig_pages(dma, batch, iova);
6a2d9b72168041 Li Zhe          2025-06-30  752  			if (!rsvd) {
6a2d9b72168041 Li Zhe          2025-06-30  753  				acct_pages = nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  754  				acct_pages -= vpfn_pages(dma, iova, nr_pages);
6a2d9b72168041 Li Zhe          2025-06-30  755  			}
6a2d9b72168041 Li Zhe          2025-06-30  756  
4d83de6da265cd Daniel Jordan   2021-02-19  757  			/*
4d83de6da265cd Daniel Jordan   2021-02-19  758  			 * Reserved pages aren't counted against the user,
4d83de6da265cd Daniel Jordan   2021-02-19  759  			 * externally pinned pages are already counted against
4d83de6da265cd Daniel Jordan   2021-02-19  760  			 * the user.
4d83de6da265cd Daniel Jordan   2021-02-19  761  			 */
6a2d9b72168041 Li Zhe          2025-06-30  762  			if (acct_pages) {
48d8476b41eed6 Alex Williamson 2018-05-11  763  				if (!dma->lock_cap &&
6a2d9b72168041 Li Zhe          2025-06-30  764  						mm->locked_vm + lock_acct + acct_pages > limit) {
6c38c055cc4c0a Alex Williamson 2016-12-30  765  					pr_warn("%s: RLIMIT_MEMLOCK (%ld) exceeded\n",
6c38c055cc4c0a Alex Williamson 2016-12-30  766  						__func__, limit << PAGE_SHIFT);
0cfef2b7410b64 Alex Williamson 2017-04-13  767  					ret = -ENOMEM;
0cfef2b7410b64 Alex Williamson 2017-04-13  768  					goto unpin_out;
166fd7d94afdac Alex Williamson 2013-06-21  769  				}
6a2d9b72168041 Li Zhe          2025-06-30  770  				lock_acct += acct_pages;
a54eb55045ae9b Kirti Wankhede  2016-11-17  771  			}
4d83de6da265cd Daniel Jordan   2021-02-19  772  
6a2d9b72168041 Li Zhe          2025-06-30  773  			pinned += nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  774  			npage -= nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  775  			vaddr += PAGE_SIZE * nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  776  			iova += PAGE_SIZE * nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  777  			batch->offset += nr_pages;
6a2d9b72168041 Li Zhe          2025-06-30  778  			batch->size -= nr_pages;
4d83de6da265cd Daniel Jordan   2021-02-19  779  
4d83de6da265cd Daniel Jordan   2021-02-19  780  			if (!batch->size)
4d83de6da265cd Daniel Jordan   2021-02-19  781  				break;
4d83de6da265cd Daniel Jordan   2021-02-19  782  
4d83de6da265cd Daniel Jordan   2021-02-19  783  			pfn = page_to_pfn(batch->pages[batch->offset]);
4d83de6da265cd Daniel Jordan   2021-02-19  784  		}
a54eb55045ae9b Kirti Wankhede  2016-11-17  785  	}
166fd7d94afdac Alex Williamson 2013-06-21  786  
6c38c055cc4c0a Alex Williamson 2016-12-30  787  out:
20448310d6b71d Li Zhe          2025-06-30 @788  	dma->has_rsvd |= rsvd;
48d8476b41eed6 Alex Williamson 2018-05-11  789  	ret = vfio_lock_acct(dma, lock_acct, false);
0cfef2b7410b64 Alex Williamson 2017-04-13  790  
0cfef2b7410b64 Alex Williamson 2017-04-13  791  unpin_out:
be16c1fd99f41a Daniel Jordan   2021-02-19  792  	if (ret < 0) {
4d83de6da265cd Daniel Jordan   2021-02-19  793  		if (pinned && !rsvd) {
0cfef2b7410b64 Alex Williamson 2017-04-13  794  			for (pfn = *pfn_base ; pinned ; pfn++, pinned--)
0cfef2b7410b64 Alex Williamson 2017-04-13  795  				put_pfn(pfn, dma->prot);
89c29def6b0101 Alex Williamson 2018-06-02  796  		}
4d83de6da265cd Daniel Jordan   2021-02-19  797  		vfio_batch_unpin(batch, dma);
0cfef2b7410b64 Alex Williamson 2017-04-13  798  
0cfef2b7410b64 Alex Williamson 2017-04-13  799  		return ret;
0cfef2b7410b64 Alex Williamson 2017-04-13  800  	}
166fd7d94afdac Alex Williamson 2013-06-21  801  
6c38c055cc4c0a Alex Williamson 2016-12-30  802  	return pinned;
73fa0d10d077d9 Alex Williamson 2012-07-31  803  }
73fa0d10d077d9 Alex Williamson 2012-07-31  804  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

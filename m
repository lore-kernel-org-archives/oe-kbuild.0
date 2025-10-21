Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D7A32ED42
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060264; cv=none; b=FMNezLteQeaUObPMOBFSFzkGWXlMvJV9UcA6jYzt6gBM61nwMQute+iGoAziDGeuCk5bPYYPp3/ZZGi2euyZ4IUZa5t8PvWZUcax6lNXjQCGIAqh4cw16S+x3qk3UpRHCRQ5j1J2pUBuCtGhE0Z0b/MZAKGiJqFIzWfrhmgL45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060264; c=relaxed/simple;
	bh=Zl5dIRZ+a15bJAMOShf9/ezp41V0LFJ17xOWZ4outWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsW+/yRRAKq81vSJw4QtkVdKKPGi4ixcwF56HWWe540yWT/KTUJYdkI7y5/AGkBn6NFUAaiZHirm3F33+V49ltUAEvOmM93Dg84a+UN5lBCtTaO82K9ew5l8ajzb8dkSmUsrlThOtxmWDl0g0hRD6qwWT1O9Yy/c5dn7Dj7XJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzbp88/d; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzbp88/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761060263; x=1792596263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zl5dIRZ+a15bJAMOShf9/ezp41V0LFJ17xOWZ4outWI=;
  b=gzbp88/d1ie5IZshzeDwRNktGMF/GAnhG38q2pfX8BnqUZsyzIBtksAY
   RGGwO1uWC3feAOu433pgWyKK4z6Al7VhkZRWw8B2mpyC6zknHxpC/C8iU
   oqTMmbTZseCGsrWnGhE/Am1wFyqFIJ3fiZSvvITLkWf62yaa0HNoFjoB+
   Z0hI0EhJWQdXjOFYpSJotX4bC4AjLmtgxugFGI0DlFdnn4QWnKU/DOMsv
   mHNW5PlWluAE5+Kl7o/Mm/pl7wqHpH0PEut4l010XI8sn4rNlu25VHmyp
   LOW7PHsIZJ271yQoUipI5t9xYDtnJ6m3xn5JWOhD9+CzhGNqxQMJQs5f0
   g==;
X-CSE-ConnectionGUID: eIEZcR3NQ4Ck83RNE4v+gg==
X-CSE-MsgGUID: 0w06z8NYTImJZtuaYq6myg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63111222"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63111222"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:24:22 -0700
X-CSE-ConnectionGUID: riQmFHboSVGJ428ITOOCSg==
X-CSE-MsgGUID: 3NBGs341QXGBRWi9ISyoag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="184392379"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Oct 2025 08:24:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBEDj-000AwX-00;
	Tue, 21 Oct 2025 15:24:19 +0000
Date: Tue, 21 Oct 2025 23:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 2/2] lib/scatterlist.c:477:43:
 sparse: signed value source
Message-ID: <202510212318.j9beLb3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/scatterlist.c:477:43: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0d6730ee65423d34e85936dcb3425463a4b14a4f
commit: cba5a7834e06ff22a5c2a101458da98b1bfb91e0 [2/2] UPSTREAM: asm-generic: add an optional pfn_valid check to page_to_phys
:::::: branch date: 26 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-061-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212318.j9beLb3v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212318.j9beLb3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510212318.j9beLb3v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/scatterlist.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> lib/scatterlist.c:477:43: sparse: signed value source
--
   arch/x86/kvm/svm/avic.c: note: in included file (through arch/x86/include/asm/page.h, arch/x86/include/asm/processor.h, include/linux/mutex.h, ...):
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
>> arch/x86/kvm/svm/avic.c:247:27: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/svm/avic.c:248:27: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/svm/avic.c:249:27: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/svm/avic.c:311:21: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/svm/avic.c:879:35: sparse: signed value source
   include/asm-generic/memory_model.h:29:23: sparse: sparse: unsigned value that used to be signed checked against zero?
   arch/x86/kvm/svm/avic.c:937:35: sparse: signed value source

vim +477 lib/scatterlist.c

1567b49d1a4081 Logan Gunthorpe     2022-10-21  425  
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  426  /**
3e302dbc6774a2 Maor Gottlieb       2021-08-24  427   * sg_alloc_append_table_from_pages - Allocate and initialize an append sg
3e302dbc6774a2 Maor Gottlieb       2021-08-24  428   *                                    table from an array of pages
3e302dbc6774a2 Maor Gottlieb       2021-08-24  429   * @sgt_append:  The sg append table to use
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  430   * @pages:       Pointer to an array of page pointers
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  431   * @n_pages:     Number of pages in the pages array
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  432   * @offset:      Offset from start of the first page to the start of a buffer
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  433   * @size:        Number of valid bytes in the buffer (after offset)
9a40401cfa1356 Jason Gunthorpe     2020-10-16  434   * @max_segment: Maximum size of a scatterlist element in bytes
07da1223ec9399 Maor Gottlieb       2020-10-04  435   * @left_pages:  Left pages caller have to set after this call
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  436   * @gfp_mask:	 GFP allocation mask
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  437   *
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  438   * Description:
3e302dbc6774a2 Maor Gottlieb       2021-08-24  439   *    In the first call it allocate and initialize an sg table from a list of
3e302dbc6774a2 Maor Gottlieb       2021-08-24  440   *    pages, else reuse the scatterlist from sgt_append. Contiguous ranges of
3e302dbc6774a2 Maor Gottlieb       2021-08-24  441   *    the pages are squashed into a single scatterlist entry up to the maximum
3e302dbc6774a2 Maor Gottlieb       2021-08-24  442   *    size specified in @max_segment.  A user may provide an offset at a start
3e302dbc6774a2 Maor Gottlieb       2021-08-24  443   *    and a size of valid data in a buffer specified by the page array. The
3e302dbc6774a2 Maor Gottlieb       2021-08-24  444   *    returned sg table is released by sg_free_append_table
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  445   *
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  446   * Returns:
3e302dbc6774a2 Maor Gottlieb       2021-08-24  447   *   0 on success, negative error on failure
07da1223ec9399 Maor Gottlieb       2020-10-04  448   *
07da1223ec9399 Maor Gottlieb       2020-10-04  449   * Notes:
07da1223ec9399 Maor Gottlieb       2020-10-04  450   *   If this function returns non-0 (eg failure), the caller must call
3e302dbc6774a2 Maor Gottlieb       2021-08-24  451   *   sg_free_append_table() to cleanup any leftover allocations.
3e302dbc6774a2 Maor Gottlieb       2021-08-24  452   *
3e302dbc6774a2 Maor Gottlieb       2021-08-24  453   *   In the fist call, sgt_append must by initialized.
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  454   */
3e302dbc6774a2 Maor Gottlieb       2021-08-24  455  int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
07da1223ec9399 Maor Gottlieb       2020-10-04  456  		struct page **pages, unsigned int n_pages, unsigned int offset,
89d8589cd72c6f Tvrtko Ursulin      2017-08-03  457  		unsigned long size, unsigned int max_segment,
3e302dbc6774a2 Maor Gottlieb       2021-08-24  458  		unsigned int left_pages, gfp_t gfp_mask)
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  459  {
07da1223ec9399 Maor Gottlieb       2020-10-04  460  	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
07da1223ec9399 Maor Gottlieb       2020-10-04  461  	unsigned int added_nents = 0;
3e302dbc6774a2 Maor Gottlieb       2021-08-24  462  	struct scatterlist *s = sgt_append->prv;
1567b49d1a4081 Logan Gunthorpe     2022-10-21  463  	struct page *last_pg;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  464  
9a40401cfa1356 Jason Gunthorpe     2020-10-16  465  	/*
9a40401cfa1356 Jason Gunthorpe     2020-10-16  466  	 * The algorithm below requires max_segment to be aligned to PAGE_SIZE
9a40401cfa1356 Jason Gunthorpe     2020-10-16  467  	 * otherwise it can overshoot.
9a40401cfa1356 Jason Gunthorpe     2020-10-16  468  	 */
9a40401cfa1356 Jason Gunthorpe     2020-10-16  469  	max_segment = ALIGN_DOWN(max_segment, PAGE_SIZE);
9a40401cfa1356 Jason Gunthorpe     2020-10-16  470  	if (WARN_ON(max_segment < PAGE_SIZE))
3e302dbc6774a2 Maor Gottlieb       2021-08-24  471  		return -EINVAL;
07da1223ec9399 Maor Gottlieb       2020-10-04  472  
3e302dbc6774a2 Maor Gottlieb       2021-08-24  473  	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && sgt_append->prv)
3e302dbc6774a2 Maor Gottlieb       2021-08-24  474  		return -EOPNOTSUPP;
07da1223ec9399 Maor Gottlieb       2020-10-04  475  
3e302dbc6774a2 Maor Gottlieb       2021-08-24  476  	if (sgt_append->prv) {
0f097f08c9b3c1 Yishai Hadas        2023-01-11 @477  		unsigned long next_pfn = (page_to_phys(sg_page(sgt_append->prv)) +
0f097f08c9b3c1 Yishai Hadas        2023-01-11  478  			sgt_append->prv->offset + sgt_append->prv->length) / PAGE_SIZE;
0f097f08c9b3c1 Yishai Hadas        2023-01-11  479  
07da1223ec9399 Maor Gottlieb       2020-10-04  480  		if (WARN_ON(offset))
3e302dbc6774a2 Maor Gottlieb       2021-08-24  481  			return -EINVAL;
07da1223ec9399 Maor Gottlieb       2020-10-04  482  
07da1223ec9399 Maor Gottlieb       2020-10-04  483  		/* Merge contiguous pages into the last SG */
3e302dbc6774a2 Maor Gottlieb       2021-08-24  484  		prv_len = sgt_append->prv->length;
0f097f08c9b3c1 Yishai Hadas        2023-01-11  485  		if (page_to_pfn(pages[0]) == next_pfn) {
0f097f08c9b3c1 Yishai Hadas        2023-01-11  486  			last_pg = pfn_to_page(next_pfn - 1);
e95d50d74b93a7 Yishai Hadas        2023-01-05  487  			while (n_pages && pages_are_mergeable(pages[0], last_pg)) {
3e302dbc6774a2 Maor Gottlieb       2021-08-24  488  				if (sgt_append->prv->length + PAGE_SIZE > max_segment)
07da1223ec9399 Maor Gottlieb       2020-10-04  489  					break;
3e302dbc6774a2 Maor Gottlieb       2021-08-24  490  				sgt_append->prv->length += PAGE_SIZE;
1567b49d1a4081 Logan Gunthorpe     2022-10-21  491  				last_pg = pages[0];
07da1223ec9399 Maor Gottlieb       2020-10-04  492  				pages++;
07da1223ec9399 Maor Gottlieb       2020-10-04  493  				n_pages--;
07da1223ec9399 Maor Gottlieb       2020-10-04  494  			}
07da1223ec9399 Maor Gottlieb       2020-10-04  495  			if (!n_pages)
07da1223ec9399 Maor Gottlieb       2020-10-04  496  				goto out;
07da1223ec9399 Maor Gottlieb       2020-10-04  497  		}
0f097f08c9b3c1 Yishai Hadas        2023-01-11  498  	}
89d8589cd72c6f Tvrtko Ursulin      2017-08-03  499  
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  500  	/* compute number of contiguous chunks */
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  501  	chunks = 1;
c125906b839b79 Tvrtko Ursulin      2017-08-03  502  	seg_len = 0;
c125906b839b79 Tvrtko Ursulin      2017-08-03  503  	for (i = 1; i < n_pages; i++) {
c125906b839b79 Tvrtko Ursulin      2017-08-03  504  		seg_len += PAGE_SIZE;
c125906b839b79 Tvrtko Ursulin      2017-08-03  505  		if (seg_len >= max_segment ||
1567b49d1a4081 Logan Gunthorpe     2022-10-21  506  		    !pages_are_mergeable(pages[i], pages[i - 1])) {
c125906b839b79 Tvrtko Ursulin      2017-08-03  507  			chunks++;
c125906b839b79 Tvrtko Ursulin      2017-08-03  508  			seg_len = 0;
c125906b839b79 Tvrtko Ursulin      2017-08-03  509  		}
c125906b839b79 Tvrtko Ursulin      2017-08-03  510  	}
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  511  
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  512  	/* merging chunks and putting them into the scatterlist */
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  513  	cur_page = 0;
07da1223ec9399 Maor Gottlieb       2020-10-04  514  	for (i = 0; i < chunks; i++) {
c125906b839b79 Tvrtko Ursulin      2017-08-03  515  		unsigned int j, chunk_size;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  516  
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  517  		/* look for the end of the current chunk */
c125906b839b79 Tvrtko Ursulin      2017-08-03  518  		seg_len = 0;
c125906b839b79 Tvrtko Ursulin      2017-08-03  519  		for (j = cur_page + 1; j < n_pages; j++) {
c125906b839b79 Tvrtko Ursulin      2017-08-03  520  			seg_len += PAGE_SIZE;
c125906b839b79 Tvrtko Ursulin      2017-08-03  521  			if (seg_len >= max_segment ||
1567b49d1a4081 Logan Gunthorpe     2022-10-21  522  			    !pages_are_mergeable(pages[j], pages[j - 1]))
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  523  				break;
c125906b839b79 Tvrtko Ursulin      2017-08-03  524  		}
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  525  
07da1223ec9399 Maor Gottlieb       2020-10-04  526  		/* Pass how many chunks might be left */
3e302dbc6774a2 Maor Gottlieb       2021-08-24  527  		s = get_next_sg(sgt_append, s, chunks - i + left_pages,
3e302dbc6774a2 Maor Gottlieb       2021-08-24  528  				gfp_mask);
07da1223ec9399 Maor Gottlieb       2020-10-04  529  		if (IS_ERR(s)) {
07da1223ec9399 Maor Gottlieb       2020-10-04  530  			/*
07da1223ec9399 Maor Gottlieb       2020-10-04  531  			 * Adjust entry length to be as before function was
07da1223ec9399 Maor Gottlieb       2020-10-04  532  			 * called.
07da1223ec9399 Maor Gottlieb       2020-10-04  533  			 */
3e302dbc6774a2 Maor Gottlieb       2021-08-24  534  			if (sgt_append->prv)
3e302dbc6774a2 Maor Gottlieb       2021-08-24  535  				sgt_append->prv->length = prv_len;
3e302dbc6774a2 Maor Gottlieb       2021-08-24  536  			return PTR_ERR(s);
07da1223ec9399 Maor Gottlieb       2020-10-04  537  		}
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  538  		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
c125906b839b79 Tvrtko Ursulin      2017-08-03  539  		sg_set_page(s, pages[cur_page],
c125906b839b79 Tvrtko Ursulin      2017-08-03  540  			    min_t(unsigned long, size, chunk_size), offset);
07da1223ec9399 Maor Gottlieb       2020-10-04  541  		added_nents++;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  542  		size -= chunk_size;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  543  		offset = 0;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  544  		cur_page = j;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  545  	}
3e302dbc6774a2 Maor Gottlieb       2021-08-24  546  	sgt_append->sgt.nents += added_nents;
3e302dbc6774a2 Maor Gottlieb       2021-08-24  547  	sgt_append->sgt.orig_nents = sgt_append->sgt.nents;
3e302dbc6774a2 Maor Gottlieb       2021-08-24  548  	sgt_append->prv = s;
07da1223ec9399 Maor Gottlieb       2020-10-04  549  out:
07da1223ec9399 Maor Gottlieb       2020-10-04  550  	if (!left_pages)
07da1223ec9399 Maor Gottlieb       2020-10-04  551  		sg_mark_end(s);
3e302dbc6774a2 Maor Gottlieb       2021-08-24  552  	return 0;
efc42bc98058a3 Tomasz Stanislawski 2012-06-18  553  }
90e7a6de62781c Maor Gottlieb       2021-08-24  554  EXPORT_SYMBOL(sg_alloc_append_table_from_pages);
89d8589cd72c6f Tvrtko Ursulin      2017-08-03  555  

:::::: The code at line 477 was first introduced by commit
:::::: 0f097f08c9b3c1fdb6cc9f2dd423abc17d13f1a2 lib/scatterlist: Fix to calculate the last_pg properly

:::::: TO: Yishai Hadas <yishaih@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

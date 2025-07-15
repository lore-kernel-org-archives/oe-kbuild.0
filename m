Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FFF2D0C73
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 03:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752548942; cv=none; b=aUJ1NNsrl3HfB5J5sfIura7v3jieR/Lf05jtz20PdBj8GuNZIDcKxTL5a+B7PSuqyjp2gJ0UNDbvN+hVxg0BF1z5SuvZ6568plfxgB4GRWiOhGWA/HUQvjdNhigb/D9eshs6jzXuzhCsFCMj85pgByacl7xYFxFA6bTjU9DL4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752548942; c=relaxed/simple;
	bh=ewC6ZjEEHybkyBqpws4ETGjJv3ip5X7m/JELyz2aYNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i17heJ8SU+mK5kZz3yxa7b1BYwKIJDKqJZhSt9GQMuOL0cVWRvsI0DqFiAo+alTKeeWjGDOZhjvCNPLqgCJ8HjPdAjwkcPikd6+HJ8vA0a+MLU+nzB2U5bfjyzGI3lFoYIFWZknJhdRez17n4fonCRv6MRhHd1bqBgX1hDzKUgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0BmrRcz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0BmrRcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752548940; x=1784084940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ewC6ZjEEHybkyBqpws4ETGjJv3ip5X7m/JELyz2aYNA=;
  b=a0BmrRczGAh7CMbEWmDUYDrAfIyetil+1LQ2WWHDCJt3YTEUDKU3ZJGe
   FQU0U6sjCjNRmQPZPgte2BMDg0pIIqQ21BX4O+JxUOx1NegUT00r0jRZ6
   lhNlyUkxx1oSjqee+CJ6V7/gT4P/7KHwt3e8UNm8mGXaBi0irZgO9IZlg
   7redZf6J0tguNaXmdQ+70Byttq3/Ue3T4X3DtHHmb56+NZfZOysXGIsQX
   6mhRA/B3bLetcGS/ztDtmD7XsXo72X+qLIEawA8X16Pjp9lc+8K7eX8q1
   O24xpyQCEykudxjYm/joK/XiKH4/sUozVTAgSb2O3jZ50nrAK4KpituQi
   w==;
X-CSE-ConnectionGUID: rgwr9c6oS9u8FhfMc4XlHg==
X-CSE-MsgGUID: P3nFrmc+RoWNg05fZ4O67w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54626878"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54626878"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 20:08:59 -0700
X-CSE-ConnectionGUID: y0A2/36iS5e3eaDpVir/tw==
X-CSE-MsgGUID: OEKP5PhtSeuWBFVneBewag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="180802859"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2025 20:08:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubW2J-0009aZ-33;
	Tue, 15 Jul 2025 03:08:55 +0000
Date: Tue, 15 Jul 2025 11:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/gup.c:3831 memfd_pin_folios() error: uninitialized symbol 'h'.
Message-ID: <202507151102.SIQXOrbl-lkp@intel.com>
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
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: David Hildenbrand <david@redhat.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 89c1905d9c140372b7f50ef48f42378cf85d9bc5 mm/gup: introduce memfd_pin_folios() for pinning memfd folios
date:   1 year ago
:::::: branch date: 30 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20250714 (https://download.01.org/0day-ci/archive/20250715/202507151102.SIQXOrbl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507151102.SIQXOrbl-lkp@intel.com/

smatch warnings:
mm/gup.c:3831 memfd_pin_folios() error: uninitialized symbol 'h'.

vim +/h +3831 mm/gup.c

89c1905d9c1403 Vivek Kasireddy 2024-06-23  3769  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3770  /**
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3771   * memfd_pin_folios() - pin folios associated with a memfd
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3772   * @memfd:      the memfd whose folios are to be pinned
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3773   * @start:      the first memfd offset
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3774   * @end:        the last memfd offset (inclusive)
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3775   * @folios:     array that receives pointers to the folios pinned
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3776   * @max_folios: maximum number of entries in @folios
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3777   * @offset:     the offset into the first folio
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3778   *
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3779   * Attempt to pin folios associated with a memfd in the contiguous range
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3780   * [start, end]. Given that a memfd is either backed by shmem or hugetlb,
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3781   * the folios can either be found in the page cache or need to be allocated
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3782   * if necessary. Once the folios are located, they are all pinned via
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3783   * FOLL_PIN and @offset is populatedwith the offset into the first folio.
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3784   * And, eventually, these pinned folios must be released either using
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3785   * unpin_folios() or unpin_folio().
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3786   *
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3787   * It must be noted that the folios may be pinned for an indefinite amount
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3788   * of time. And, in most cases, the duration of time they may stay pinned
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3789   * would be controlled by the userspace. This behavior is effectively the
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3790   * same as using FOLL_LONGTERM with other GUP APIs.
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3791   *
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3792   * Returns number of folios pinned, which could be less than @max_folios
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3793   * as it depends on the folio sizes that cover the range [start, end].
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3794   * If no folios were pinned, it returns -errno.
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3795   */
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3796  long memfd_pin_folios(struct file *memfd, loff_t start, loff_t end,
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3797  		      struct folio **folios, unsigned int max_folios,
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3798  		      pgoff_t *offset)
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3799  {
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3800  	unsigned int flags, nr_folios, nr_found;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3801  	unsigned int i, pgshift = PAGE_SHIFT;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3802  	pgoff_t start_idx, end_idx, next_idx;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3803  	struct folio *folio = NULL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3804  	struct folio_batch fbatch;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3805  	struct hstate *h;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3806  	long ret = -EINVAL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3807  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3808  	if (start < 0 || start > end || !max_folios)
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3809  		return -EINVAL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3810  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3811  	if (!memfd)
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3812  		return -EINVAL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3813  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3814  	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3815  		return -EINVAL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3816  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3817  	if (end >= i_size_read(file_inode(memfd)))
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3818  		return -EINVAL;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3819  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3820  	if (is_file_hugepages(memfd)) {
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3821  		h = hstate_file(memfd);
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3822  		pgshift = huge_page_shift(h);
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3823  	}
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3824  
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3825  	flags = memalloc_pin_save();
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3826  	do {
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3827  		nr_folios = 0;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3828  		start_idx = start >> pgshift;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3829  		end_idx = end >> pgshift;
89c1905d9c1403 Vivek Kasireddy 2024-06-23  3830  		if (is_file_hugepages(memfd)) {
89c1905d9c1403 Vivek Kasireddy 2024-06-23 @3831  			start_idx <<= huge_page_order(h);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

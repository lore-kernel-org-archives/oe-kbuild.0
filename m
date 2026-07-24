Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175735CB6F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923012; cv=none; b=HlnywMCSNKWWD8Bu38LFgTI285jhSJfDP2cj+KA0EXxorAEed9DNsrX2NYEMcvpBOiT8R907rQzpgZeFGcOSIYL+2MMVJb72d2mJhpLtT+b/xfWJ6ySJGe5K7QA2E2dbewr84248OaT3iIrqQhQ6+UDLre3ZwhrbwVov3/iuEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923012; c=relaxed/simple;
	bh=wZQ75uws1xtK3dRuczcoGm8tALljBw4YAJ4xPYrLe4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AORNmeeafRCmPHD/H0hQneWe1FbQcoM+/j2fahkoGz49x8Bn01KJj+o3CvqLtw0c2NknqPHds+mGhM29omusyfCSxzi5/kxJMpAAVN9eT5hNQNZMguUyAwOaMSwEX7u97dvPbFsm51yPCGhhvYm6lJ74AV5o41V5LOZ8xvuVYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK3+WBB7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK3+WBB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784923011; x=1816459011;
  h=date:from:to:cc:subject:message-id;
  bh=wZQ75uws1xtK3dRuczcoGm8tALljBw4YAJ4xPYrLe4I=;
  b=BK3+WBB7XmYBFxiS9yLZt31HSSayrn4OMFaoHfSYk6IQluZNwRkWTKmG
   JYKssFzUdQNr3Ko0Fzt8D7OEuN9pDcGB5yxFlrcHQgiZkam5TF/VHUA/f
   6gpmL7+wXPo4hFDsAIq17h8q+44dQ67eaVSzuRQJla3Mz3hxmREfeCsed
   Cd1c18+tI6Dm0K4qCDqZfSG4O4BsjWhjzIPPkv3mYQKFvoL2eo51kSvT/
   kSgp/YxvMZJmB6csQO/UMRkSq3sQIJ03sSYBN1Vy0S8D6QLUApmwBYQq+
   ICmg2IXTOxrxrtY4NnzY2W3eG/iQrJoJIUuWIJMbY4Vv26oPRGG6ngc5N
   A==;
X-CSE-ConnectionGUID: uYWu1+zZT3mCn9EUUsm4zg==
X-CSE-MsgGUID: AeLQHPOJSgOv0I6jxvFxBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85447038"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85447038"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 12:56:50 -0700
X-CSE-ConnectionGUID: 8vILSCTVS9+1o0NlVAwFUw==
X-CSE-MsgGUID: Oa9NoAP0SJ2ng2mwbr1tYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="260745843"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Jul 2026 12:56:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnM0k-00000000bAp-0jdE;
	Fri, 24 Jul 2026 19:56:46 +0000
Date: Sat, 25 Jul 2026 03:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-next 13/29]
 fs/netfs/iterator.c:137:26-35: WARNING: Unsigned expression compared with
 zero: max_pages > 0
Message-ID: <202607250357.stqkOHJt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   ddfc7002233eb9ca7143c363820b7480d5f705de
commit: d7c4f8b0f2c278af9e4e4d548ad71be933507f75 [13/29] netfs: Add a function to extract from an iter into a bvecq
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r052-20260724 (https://download.01.org/0day-ci/archive/20260725/202607250357.stqkOHJt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607250357.stqkOHJt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/iterator.c:137:26-35: WARNING: Unsigned expression compared with zero: max_pages > 0

vim +137 fs/netfs/iterator.c

85dd2c8ff368b1 David Howells 2022-10-20   15  
d7c4f8b0f2c278 David Howells 2026-01-07   16  /**
d7c4f8b0f2c278 David Howells 2026-01-07   17   * netfs_extract_iter - Extract virtually contiguous pages from an iterator into a bvecq
d7c4f8b0f2c278 David Howells 2026-01-07   18   * @orig: The original iterator
d7c4f8b0f2c278 David Howells 2026-01-07   19   * @max_len: Maximum number of bytes to extract
d7c4f8b0f2c278 David Howells 2026-01-07   20   * @max_pages: Maximum number of pages to extract
d7c4f8b0f2c278 David Howells 2026-01-07   21   * @fpos: Starting file position to label the bvecq with
d7c4f8b0f2c278 David Howells 2026-01-07   22   * @_bvecq_head: Where to cache the bvec queue
d7c4f8b0f2c278 David Howells 2026-01-07   23   * @extraction_flags: Flags to qualify the request
d7c4f8b0f2c278 David Howells 2026-01-07   24   *
d7c4f8b0f2c278 David Howells 2026-01-07   25   * Extract virtually contiguous page fragments from the source iterator up to
d7c4f8b0f2c278 David Howells 2026-01-07   26   * the given maxima and build bvec queue that refers to all of those bits.
d7c4f8b0f2c278 David Howells 2026-01-07   27   * This allows the original iterator to disposed of.
d7c4f8b0f2c278 David Howells 2026-01-07   28   *
d7c4f8b0f2c278 David Howells 2026-01-07   29   * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA be
d7c4f8b0f2c278 David Howells 2026-01-07   30   * allowed on the pages extracted.
d7c4f8b0f2c278 David Howells 2026-01-07   31   *
d7c4f8b0f2c278 David Howells 2026-01-07   32   * On success or partial success, the amount of data in the bvec is returned,
d7c4f8b0f2c278 David Howells 2026-01-07   33   * the original iterator will have been advanced by the amount extracted.
d7c4f8b0f2c278 David Howells 2026-01-07   34   *
d7c4f8b0f2c278 David Howells 2026-01-07   35   * If an error occurs and no pages are extracted, an error will be returned and
d7c4f8b0f2c278 David Howells 2026-01-07   36   * any allocated bvecq will be freed.  If there is no data to be extracted (or
d7c4f8b0f2c278 David Howells 2026-01-07   37   * @max_len or @max_pages are zero), a single empty bvecq will be returned.
d7c4f8b0f2c278 David Howells 2026-01-07   38   *
d7c4f8b0f2c278 David Howells 2026-01-07   39   * The bvecq segments are marked with indications on how to get clean up the
d7c4f8b0f2c278 David Howells 2026-01-07   40   * extracted fragments.
d7c4f8b0f2c278 David Howells 2026-01-07   41   */
d7c4f8b0f2c278 David Howells 2026-01-07   42  ssize_t netfs_extract_iter(struct iov_iter *orig, size_t max_len, size_t max_pages,
d7c4f8b0f2c278 David Howells 2026-01-07   43  			   unsigned long long fpos, struct bvecq **_bvecq_head,
d7c4f8b0f2c278 David Howells 2026-01-07   44  			   iov_iter_extraction_t extraction_flags)
d7c4f8b0f2c278 David Howells 2026-01-07   45  {
d7c4f8b0f2c278 David Howells 2026-01-07   46  	struct bvecq *bq_tail = NULL, *bq;
d7c4f8b0f2c278 David Howells 2026-01-07   47  	ssize_t ret = 0;
d7c4f8b0f2c278 David Howells 2026-01-07   48  	size_t extracted = 0;
d7c4f8b0f2c278 David Howells 2026-01-07   49  
d7c4f8b0f2c278 David Howells 2026-01-07   50  	_enter("{%u,%zx},%zx", orig->iter_type, orig->count, max_len);
d7c4f8b0f2c278 David Howells 2026-01-07   51  
d7c4f8b0f2c278 David Howells 2026-01-07   52  	*_bvecq_head = NULL;
d7c4f8b0f2c278 David Howells 2026-01-07   53  	if (max_len > orig->count)
d7c4f8b0f2c278 David Howells 2026-01-07   54  		max_len = orig->count;
d7c4f8b0f2c278 David Howells 2026-01-07   55  	if (WARN_ON_ONCE(!max_len || !max_pages))
d7c4f8b0f2c278 David Howells 2026-01-07   56  		goto alloc_empty;
d7c4f8b0f2c278 David Howells 2026-01-07   57  
d7c4f8b0f2c278 David Howells 2026-01-07   58  	max_pages = iov_iter_npages(orig, max_pages);
d7c4f8b0f2c278 David Howells 2026-01-07   59  	if (!max_pages)
d7c4f8b0f2c278 David Howells 2026-01-07   60  		goto alloc_empty;
d7c4f8b0f2c278 David Howells 2026-01-07   61  
d7c4f8b0f2c278 David Howells 2026-01-07   62  	do {
d7c4f8b0f2c278 David Howells 2026-01-07   63  		bq = bvecq_alloc_one(max_pages, GFP_NOFS);
d7c4f8b0f2c278 David Howells 2026-01-07   64  		if (!bq) {
d7c4f8b0f2c278 David Howells 2026-01-07   65  			ret = -ENOMEM;
d7c4f8b0f2c278 David Howells 2026-01-07   66  			break;
d7c4f8b0f2c278 David Howells 2026-01-07   67  		}
d7c4f8b0f2c278 David Howells 2026-01-07   68  		if (user_backed_iter(orig))
d7c4f8b0f2c278 David Howells 2026-01-07   69  			bq->mem_type = iov_iter_extract_will_pin(orig) ?
d7c4f8b0f2c278 David Howells 2026-01-07   70  				BVECQ_MEM_GUP : BVECQ_MEM_PAGECACHE;
d7c4f8b0f2c278 David Howells 2026-01-07   71  		bq->fpos	= fpos + extracted;
d7c4f8b0f2c278 David Howells 2026-01-07   72  
d7c4f8b0f2c278 David Howells 2026-01-07   73  		if (bq_tail)
d7c4f8b0f2c278 David Howells 2026-01-07   74  			bvecq_append(bq_tail, bq);
d7c4f8b0f2c278 David Howells 2026-01-07   75  		else
d7c4f8b0f2c278 David Howells 2026-01-07   76  			*_bvecq_head = bq;
d7c4f8b0f2c278 David Howells 2026-01-07   77  		bq_tail = bq;
d7c4f8b0f2c278 David Howells 2026-01-07   78  
d7c4f8b0f2c278 David Howells 2026-01-07   79  		if (max_len == 0)
d7c4f8b0f2c278 David Howells 2026-01-07   80  			break;
d7c4f8b0f2c278 David Howells 2026-01-07   81  
d7c4f8b0f2c278 David Howells 2026-01-07   82  		struct bio_vec *bv = bq->bv;
d7c4f8b0f2c278 David Howells 2026-01-07   83  		unsigned int slot = 0;
d7c4f8b0f2c278 David Howells 2026-01-07   84  		do {
d7c4f8b0f2c278 David Howells 2026-01-07   85  			struct page **pages;
d7c4f8b0f2c278 David Howells 2026-01-07   86  			ssize_t got;
d7c4f8b0f2c278 David Howells 2026-01-07   87  			size_t offset;
d7c4f8b0f2c278 David Howells 2026-01-07   88  			size_t space = bq->max_slots - slot;
d7c4f8b0f2c278 David Howells 2026-01-07   89  			size_t bv_size = array_size(bq->max_slots, sizeof(*bv));
d7c4f8b0f2c278 David Howells 2026-01-07   90  			size_t pg_size = array_size(space, sizeof(*pages));
d7c4f8b0f2c278 David Howells 2026-01-07   91  
d7c4f8b0f2c278 David Howells 2026-01-07   92  			/* Put the page list at the end of the bvec list
d7c4f8b0f2c278 David Howells 2026-01-07   93  			 * storage.  bvec elements are larger than page
d7c4f8b0f2c278 David Howells 2026-01-07   94  			 * pointers, so as long as we work 0->last, we should
d7c4f8b0f2c278 David Howells 2026-01-07   95  			 * be fine.
d7c4f8b0f2c278 David Howells 2026-01-07   96  			 */
d7c4f8b0f2c278 David Howells 2026-01-07   97  			pages = (void *)bv + bv_size - pg_size;
d7c4f8b0f2c278 David Howells 2026-01-07   98  
d7c4f8b0f2c278 David Howells 2026-01-07   99  			got = iov_iter_extract_pages(orig, &pages, max_len,
d7c4f8b0f2c278 David Howells 2026-01-07  100  						     min(space, max_pages),
d7c4f8b0f2c278 David Howells 2026-01-07  101  						     extraction_flags, &offset);
d7c4f8b0f2c278 David Howells 2026-01-07  102  			if (got < 0) {
d7c4f8b0f2c278 David Howells 2026-01-07  103  				ret = got;
d7c4f8b0f2c278 David Howells 2026-01-07  104  				goto out;
d7c4f8b0f2c278 David Howells 2026-01-07  105  			}
d7c4f8b0f2c278 David Howells 2026-01-07  106  
d7c4f8b0f2c278 David Howells 2026-01-07  107  			if (got == 0) {
d7c4f8b0f2c278 David Howells 2026-01-07  108  				pr_err("extract_pages gave nothing from %zu, %zu\n",
d7c4f8b0f2c278 David Howells 2026-01-07  109  				       extracted, max_len);
d7c4f8b0f2c278 David Howells 2026-01-07  110  				ret = -EIO;
d7c4f8b0f2c278 David Howells 2026-01-07  111  				goto out;
d7c4f8b0f2c278 David Howells 2026-01-07  112  			}
d7c4f8b0f2c278 David Howells 2026-01-07  113  
d7c4f8b0f2c278 David Howells 2026-01-07  114  			if (WARN(got > max_len,
d7c4f8b0f2c278 David Howells 2026-01-07  115  				 "%s: extract_pages overrun %zd > %zu bytes\n",
d7c4f8b0f2c278 David Howells 2026-01-07  116  				 __func__, got, max_len)) {
d7c4f8b0f2c278 David Howells 2026-01-07  117  				ret = -EIO;
d7c4f8b0f2c278 David Howells 2026-01-07  118  				goto out;
d7c4f8b0f2c278 David Howells 2026-01-07  119  			}
d7c4f8b0f2c278 David Howells 2026-01-07  120  
d7c4f8b0f2c278 David Howells 2026-01-07  121  			extracted += got;
d7c4f8b0f2c278 David Howells 2026-01-07  122  			max_len -= got;
d7c4f8b0f2c278 David Howells 2026-01-07  123  
d7c4f8b0f2c278 David Howells 2026-01-07  124  			do {
d7c4f8b0f2c278 David Howells 2026-01-07  125  				size_t len = umin(got, PAGE_SIZE - offset);
d7c4f8b0f2c278 David Howells 2026-01-07  126  
d7c4f8b0f2c278 David Howells 2026-01-07  127  				BUG_ON(slot >= bq->max_slots);
d7c4f8b0f2c278 David Howells 2026-01-07  128  
d7c4f8b0f2c278 David Howells 2026-01-07  129  				bvec_set_page(&bq->bv[slot], *pages++, len, offset);
d7c4f8b0f2c278 David Howells 2026-01-07  130  				slot++;
d7c4f8b0f2c278 David Howells 2026-01-07  131  				max_pages--;
d7c4f8b0f2c278 David Howells 2026-01-07  132  				got -= len;
d7c4f8b0f2c278 David Howells 2026-01-07  133  				offset = 0;
d7c4f8b0f2c278 David Howells 2026-01-07  134  			} while (got > 0);
d7c4f8b0f2c278 David Howells 2026-01-07  135  
d7c4f8b0f2c278 David Howells 2026-01-07  136  			bvecq_filled_to(bq, slot);
d7c4f8b0f2c278 David Howells 2026-01-07 @137  		} while (max_len > 0 && max_pages > 0 && !bvecq_is_full(bq));
d7c4f8b0f2c278 David Howells 2026-01-07  138  
d7c4f8b0f2c278 David Howells 2026-01-07  139  	} while (max_len > 0 && max_pages > 0);
d7c4f8b0f2c278 David Howells 2026-01-07  140  
d7c4f8b0f2c278 David Howells 2026-01-07  141  out:
d7c4f8b0f2c278 David Howells 2026-01-07  142  	if (extracted || ret == 0)
d7c4f8b0f2c278 David Howells 2026-01-07  143  		return extracted;
d7c4f8b0f2c278 David Howells 2026-01-07  144  	bvecq_put(*_bvecq_head);
d7c4f8b0f2c278 David Howells 2026-01-07  145  	*_bvecq_head = NULL;
d7c4f8b0f2c278 David Howells 2026-01-07  146  	return ret;
d7c4f8b0f2c278 David Howells 2026-01-07  147  
d7c4f8b0f2c278 David Howells 2026-01-07  148  alloc_empty:
d7c4f8b0f2c278 David Howells 2026-01-07  149  	bq = bvecq_alloc_one(1, GFP_NOFS);
d7c4f8b0f2c278 David Howells 2026-01-07  150  	if (!bq)
d7c4f8b0f2c278 David Howells 2026-01-07  151  		return -ENOMEM;
d7c4f8b0f2c278 David Howells 2026-01-07  152  	*_bvecq_head = bq;
d7c4f8b0f2c278 David Howells 2026-01-07  153  	return 0;
d7c4f8b0f2c278 David Howells 2026-01-07  154  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F213CF047
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790508713; cv=none; b=HeicOHs04RvRPqXbhEtNJTutzWe1U2IfSnItvuLm5WY5OycFbkeC5N/+jFAk0/kTelPpNLnsh2YCTIfXlUCSSNxUoxFzqZ1ElpFCKyt285CMeDobWL+MW8CHUKCIWLibVlhs0RZF481Iq7TD5eWg0Zxhjf/WNn8sbJIrgGaQAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790508713; c=relaxed/simple;
	bh=o3aYPR5NgeVZhwk/0yO9Rf3F7SfKWarb0Ajia83ulKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YN+tmjofWL32dUnmHLhBuyLUYTCXRKXsJiMaQKpDpA0OitNqnWfRFdGW+Fb1Y0DX/7TpB23VyxbPGXMy8LA5WSE6RWy5KMAHFRXNGoGSB6mP+hlQZGJ82s8Mxb5dhIxhI3hM7yx7wQVxS3LwDEP9q9m83YlgkOpo5zsCLklTOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIOl7bee; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIOl7bee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790508710; x=1822044710;
  h=date:from:to:cc:subject:message-id;
  bh=o3aYPR5NgeVZhwk/0yO9Rf3F7SfKWarb0Ajia83ulKU=;
  b=dIOl7beeA8tVE+AK9A6EkaNwU8xW4pujq9YxNIUE9TPZr9bpoJqe2Pp3
   YXkIP4dxwYuZkokzKHUsWDA1AH4UTV41AklDgh8E4JmYh61bjNaitgGY5
   SvU+/IHpNSQvIGNPX2nw8Oa2AqYFOfhOfEKW1f3p5+1ZM8CcdvbhS/kC0
   RmzSWoo6OCmaegaos0jDB24VuqadP9ClpCur2IwB53VYYYIJwiuDcIrJM
   DI/SAMOC1iLTJARM7VLa3lvN+eKjCSKR03Sogtfh7seXiq3Wox3jL8adS
   RbGiw67iH/6rpsUleXVCMabs/OCV4us1qOanARxOwcVvAeKnXNyNXsM9z
   Q==;
X-CSE-ConnectionGUID: VdUsVnTfRmOqADn/CbywBw==
X-CSE-MsgGUID: YSrkAvEvTCuN8T/bONG3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100562610"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="100562610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 04:31:49 -0700
X-CSE-ConnectionGUID: /h37Epl3TMWAgUbUhfA/wg==
X-CSE-MsgGUID: G04C05rrTr2aG6u8KYp9Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="301066241"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 27 Sep 2026 04:31:48 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAn6f-000000000Z5-3eNw;
	Sun, 27 Sep 2026 11:31:45 +0000
Date: Sun, 27 Sep 2026 13:31:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-next-3 21/26]
 fs/netfs/iterator.c:138:26-35: WARNING: Unsigned expression compared with
 zero: max_pages > 0
Message-ID: <202609271323.ddF8olh0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>
CC: Paulo Alcantara <pc@manguebit.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-3
head:   65d1ffcb408ea16b3a4a497269da871c62b7faa3
commit: eba2ce39522a73cddc7bbf0f5a6e7ecd2cf8a05c [21/26] netfs: Add a function to extract from an iter into a bvecq
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-randconfig-r2105-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271323.ddF8olh0-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609271323.ddF8olh0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/iterator.c:138:26-35: WARNING: Unsigned expression compared with zero: max_pages > 0

vim +138 fs/netfs/iterator.c

85dd2c8ff368b1 David Howells 2022-10-20   15  
eba2ce39522a73 David Howells 2026-01-07   16  /**
eba2ce39522a73 David Howells 2026-01-07   17   * netfs_extract_iter - Extract virtually contiguous pages from an iterator into a bvecq
eba2ce39522a73 David Howells 2026-01-07   18   * @orig: The original iterator
eba2ce39522a73 David Howells 2026-01-07   19   * @max_len: Maximum number of bytes to extract
eba2ce39522a73 David Howells 2026-01-07   20   * @max_pages: Maximum number of pages to extract
eba2ce39522a73 David Howells 2026-01-07   21   * @_bvecq_head: Where to cache the bvec queue
eba2ce39522a73 David Howells 2026-01-07   22   * @extraction_flags: Flags to qualify the request
eba2ce39522a73 David Howells 2026-01-07   23   * @gfp: Allocation mode for bvecq structs.
eba2ce39522a73 David Howells 2026-01-07   24   *
eba2ce39522a73 David Howells 2026-01-07   25   * Extract virtually contiguous page fragments from the source iterator up to
eba2ce39522a73 David Howells 2026-01-07   26   * the given maxima and build bvec queue that refers to all of those bits.
eba2ce39522a73 David Howells 2026-01-07   27   * This allows the original iterator to disposed of.
eba2ce39522a73 David Howells 2026-01-07   28   *
eba2ce39522a73 David Howells 2026-01-07   29   * @extraction_flags can have ITER_ALLOW_P2PDMA set to request peer-to-peer DMA
eba2ce39522a73 David Howells 2026-01-07   30   * be allowed on the pages extracted.
eba2ce39522a73 David Howells 2026-01-07   31   *
eba2ce39522a73 David Howells 2026-01-07   32   * On success or partial success, the amount of data in the bvec is returned,
eba2ce39522a73 David Howells 2026-01-07   33   * the original iterator will have been advanced by the amount extracted.
eba2ce39522a73 David Howells 2026-01-07   34   *
eba2ce39522a73 David Howells 2026-01-07   35   * If an error occurs and no pages are extracted, an error will be returned and
eba2ce39522a73 David Howells 2026-01-07   36   * any allocated bvecq will be freed.  If there is no data to be extracted (or
eba2ce39522a73 David Howells 2026-01-07   37   * @max_len or @max_pages are zero), a single empty bvecq will be returned.
eba2ce39522a73 David Howells 2026-01-07   38   *
eba2ce39522a73 David Howells 2026-01-07   39   * The bvecq segments are marked with indications on how to get clean up the
eba2ce39522a73 David Howells 2026-01-07   40   * extracted fragments.
eba2ce39522a73 David Howells 2026-01-07   41   */
eba2ce39522a73 David Howells 2026-01-07   42  ssize_t netfs_extract_iter(struct iov_iter *orig, size_t max_len, size_t max_pages,
eba2ce39522a73 David Howells 2026-01-07   43  			   struct bvecq **_bvecq_head,
eba2ce39522a73 David Howells 2026-01-07   44  			   iov_iter_extraction_t extraction_flags, gfp_t gfp)
eba2ce39522a73 David Howells 2026-01-07   45  {
eba2ce39522a73 David Howells 2026-01-07   46  	struct bvecq *bq_tail = NULL, *bq;
eba2ce39522a73 David Howells 2026-01-07   47  	ssize_t ret = 0;
eba2ce39522a73 David Howells 2026-01-07   48  	size_t extracted = 0;
eba2ce39522a73 David Howells 2026-01-07   49  
eba2ce39522a73 David Howells 2026-01-07   50  	_enter("{%u,%zx},%zx", orig->iter_type, orig->count, max_len);
eba2ce39522a73 David Howells 2026-01-07   51  
eba2ce39522a73 David Howells 2026-01-07   52  	*_bvecq_head = NULL;
eba2ce39522a73 David Howells 2026-01-07   53  	if (max_len > orig->count)
eba2ce39522a73 David Howells 2026-01-07   54  		max_len = orig->count;
eba2ce39522a73 David Howells 2026-01-07   55  	if (!max_len || !max_pages)
eba2ce39522a73 David Howells 2026-01-07   56  		goto alloc_empty;
eba2ce39522a73 David Howells 2026-01-07   57  	if (WARN_ON_ONCE(max_pages > INT_MAX))
eba2ce39522a73 David Howells 2026-01-07   58  		max_pages = INT_MAX; /* Protect iov_iter_npages(). */
eba2ce39522a73 David Howells 2026-01-07   59  
eba2ce39522a73 David Howells 2026-01-07   60  	max_pages = iov_iter_npages(orig, max_pages);
eba2ce39522a73 David Howells 2026-01-07   61  	if (!max_pages)
eba2ce39522a73 David Howells 2026-01-07   62  		goto alloc_empty;
eba2ce39522a73 David Howells 2026-01-07   63  
eba2ce39522a73 David Howells 2026-01-07   64  	do {
eba2ce39522a73 David Howells 2026-01-07   65  		bq = bvecq_alloc_one(max_pages, gfp, false);
eba2ce39522a73 David Howells 2026-01-07   66  		if (!bq) {
eba2ce39522a73 David Howells 2026-01-07   67  			ret = -ENOMEM;
eba2ce39522a73 David Howells 2026-01-07   68  			break;
eba2ce39522a73 David Howells 2026-01-07   69  		}
eba2ce39522a73 David Howells 2026-01-07   70  		if (user_backed_iter(orig))
eba2ce39522a73 David Howells 2026-01-07   71  			bq->mem_type = iov_iter_extract_will_pin(orig) ?
eba2ce39522a73 David Howells 2026-01-07   72  				BVECQ_MEM_GUP : BVECQ_MEM_PAGECACHE;
eba2ce39522a73 David Howells 2026-01-07   73  
eba2ce39522a73 David Howells 2026-01-07   74  		if (bq_tail)
eba2ce39522a73 David Howells 2026-01-07   75  			bvecq_append(bq_tail, bq);
eba2ce39522a73 David Howells 2026-01-07   76  		else
eba2ce39522a73 David Howells 2026-01-07   77  			*_bvecq_head = bq;
eba2ce39522a73 David Howells 2026-01-07   78  		bq_tail = bq;
eba2ce39522a73 David Howells 2026-01-07   79  
eba2ce39522a73 David Howells 2026-01-07   80  		if (max_len == 0)
eba2ce39522a73 David Howells 2026-01-07   81  			break;
eba2ce39522a73 David Howells 2026-01-07   82  
eba2ce39522a73 David Howells 2026-01-07   83  		struct bio_vec *bv = bq->bv;
eba2ce39522a73 David Howells 2026-01-07   84  		unsigned int slot = 0;
eba2ce39522a73 David Howells 2026-01-07   85  		do {
eba2ce39522a73 David Howells 2026-01-07   86  			struct page **pages;
eba2ce39522a73 David Howells 2026-01-07   87  			ssize_t got;
eba2ce39522a73 David Howells 2026-01-07   88  			size_t offset;
eba2ce39522a73 David Howells 2026-01-07   89  			size_t space = bq->max_slots - slot;
eba2ce39522a73 David Howells 2026-01-07   90  			size_t bv_size = array_size(bq->max_slots, sizeof(*bv));
eba2ce39522a73 David Howells 2026-01-07   91  			size_t pg_size = array_size(space, sizeof(*pages));
eba2ce39522a73 David Howells 2026-01-07   92  
eba2ce39522a73 David Howells 2026-01-07   93  			/* Put the page list at the end of the bvec list
eba2ce39522a73 David Howells 2026-01-07   94  			 * storage.  bvec elements are larger than page
eba2ce39522a73 David Howells 2026-01-07   95  			 * pointers, so as long as we work 0->last, we should
eba2ce39522a73 David Howells 2026-01-07   96  			 * be fine.
eba2ce39522a73 David Howells 2026-01-07   97  			 */
eba2ce39522a73 David Howells 2026-01-07   98  			pages = (void *)bv + bv_size - pg_size;
eba2ce39522a73 David Howells 2026-01-07   99  
eba2ce39522a73 David Howells 2026-01-07  100  			got = iov_iter_extract_pages(orig, &pages, max_len,
eba2ce39522a73 David Howells 2026-01-07  101  						     min(space, max_pages),
eba2ce39522a73 David Howells 2026-01-07  102  						     extraction_flags, &offset);
eba2ce39522a73 David Howells 2026-01-07  103  			if (got < 0) {
eba2ce39522a73 David Howells 2026-01-07  104  				ret = got;
eba2ce39522a73 David Howells 2026-01-07  105  				goto out;
eba2ce39522a73 David Howells 2026-01-07  106  			}
eba2ce39522a73 David Howells 2026-01-07  107  
eba2ce39522a73 David Howells 2026-01-07  108  			if (got == 0) {
eba2ce39522a73 David Howells 2026-01-07  109  				pr_err("extract_pages gave nothing from %zx, %zx\n",
eba2ce39522a73 David Howells 2026-01-07  110  				       extracted, max_len);
eba2ce39522a73 David Howells 2026-01-07  111  				ret = -EIO;
eba2ce39522a73 David Howells 2026-01-07  112  				goto out;
eba2ce39522a73 David Howells 2026-01-07  113  			}
eba2ce39522a73 David Howells 2026-01-07  114  
eba2ce39522a73 David Howells 2026-01-07  115  			if (WARN(got > max_len,
eba2ce39522a73 David Howells 2026-01-07  116  				 "%s: extract_pages overrun %zx > %zx bytes\n",
eba2ce39522a73 David Howells 2026-01-07  117  				 __func__, got, max_len)) {
eba2ce39522a73 David Howells 2026-01-07  118  				ret = -EIO;
eba2ce39522a73 David Howells 2026-01-07  119  				goto out;
eba2ce39522a73 David Howells 2026-01-07  120  			}
eba2ce39522a73 David Howells 2026-01-07  121  
eba2ce39522a73 David Howells 2026-01-07  122  			extracted += got;
eba2ce39522a73 David Howells 2026-01-07  123  			max_len -= got;
eba2ce39522a73 David Howells 2026-01-07  124  
eba2ce39522a73 David Howells 2026-01-07  125  			do {
eba2ce39522a73 David Howells 2026-01-07  126  				size_t len = umin(got, PAGE_SIZE - offset);
eba2ce39522a73 David Howells 2026-01-07  127  
eba2ce39522a73 David Howells 2026-01-07  128  				BUG_ON(slot >= bq->max_slots);
eba2ce39522a73 David Howells 2026-01-07  129  
eba2ce39522a73 David Howells 2026-01-07  130  				bvec_set_page(&bq->bv[slot], *pages++, len, offset);
eba2ce39522a73 David Howells 2026-01-07  131  				slot++;
eba2ce39522a73 David Howells 2026-01-07  132  				max_pages--;
eba2ce39522a73 David Howells 2026-01-07  133  				got -= len;
eba2ce39522a73 David Howells 2026-01-07  134  				offset = 0;
eba2ce39522a73 David Howells 2026-01-07  135  			} while (got > 0);
eba2ce39522a73 David Howells 2026-01-07  136  
eba2ce39522a73 David Howells 2026-01-07  137  			bvecq_filled_to(bq, slot);
eba2ce39522a73 David Howells 2026-01-07 @138  		} while (max_len > 0 && max_pages > 0 && !bvecq_is_full(bq));
eba2ce39522a73 David Howells 2026-01-07  139  
eba2ce39522a73 David Howells 2026-01-07  140  	} while (max_len > 0 && max_pages > 0);
eba2ce39522a73 David Howells 2026-01-07  141  
eba2ce39522a73 David Howells 2026-01-07  142  out:
eba2ce39522a73 David Howells 2026-01-07  143  	if (extracted || ret == 0)
eba2ce39522a73 David Howells 2026-01-07  144  		return extracted;
eba2ce39522a73 David Howells 2026-01-07  145  	bvecq_put(*_bvecq_head);
eba2ce39522a73 David Howells 2026-01-07  146  	*_bvecq_head = NULL;
eba2ce39522a73 David Howells 2026-01-07  147  	return ret;
eba2ce39522a73 David Howells 2026-01-07  148  
eba2ce39522a73 David Howells 2026-01-07  149  alloc_empty:
eba2ce39522a73 David Howells 2026-01-07  150  	bq = bvecq_alloc_one(1, gfp, false);
eba2ce39522a73 David Howells 2026-01-07  151  	if (!bq)
eba2ce39522a73 David Howells 2026-01-07  152  		return -ENOMEM;
eba2ce39522a73 David Howells 2026-01-07  153  	*_bvecq_head = bq;
eba2ce39522a73 David Howells 2026-01-07  154  	return 0;
eba2ce39522a73 David Howells 2026-01-07  155  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

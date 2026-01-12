Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133732E6BE
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 21:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252689; cv=none; b=lckEjvLqNHe0gLD0+ASQvaUHB7vLN/Txg4/tA66wYpHqa5G5QZywrwrAk8ccCFhX0Q38F18cB13/DyAwAkgdjEPOlof9JcgNRoOXX9hWZ+4w/KCWemQN88TKOMC8TEbv020JYmVBfIWGzjMQqHFDDa1LhsGoRrXPn74qc33bTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252689; c=relaxed/simple;
	bh=OcUJc6ESrPbxFFAf7KE5oP+FtxwTRGjvO1XDXtDO9qc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nd+VC1sN8y5PD8Cj3HOmnJh9OdU3DhSPAMfPStha8i8eXL5qugYZFmVnkmJ9AsrKsfFPTuIU87uCHp0U3Q6G8/LKjKSgomQWYhu9RLalRrOxyYq8JKZrD2uzOevRSFBKVt0SvsyEzbMFCpK60GTnAzBSqtw57cOEAoXag55Ydsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1xOr03j; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1xOr03j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768252678; x=1799788678;
  h=date:from:to:cc:subject:message-id;
  bh=OcUJc6ESrPbxFFAf7KE5oP+FtxwTRGjvO1XDXtDO9qc=;
  b=m1xOr03jNGRGz2Glm9tPu342HILwNW2sD7HkOq3JshiVdDLCehbyNemw
   O0obFC0LaeJB8ppqTql1hqVnZN1PhikqKBTNEYWXyQIFvHjsGjxr6OwMF
   Esxck6r3MXVFBuLsKH9ynTOSlZuN4K5jBs1RArv6zu+Zv9a9aninl+blk
   S/WO8rI0DU18olwk+y4k1MVqF4Eh2iCFAxquHxyb+rFA09pDa59QLhEgD
   AyYr91GvKoO1gVBMKpB9PHwLAQLPBEaw2if/dGq4khhtVksDbKPrvFlWj
   8+8e6XwELe5vW/bQDbdsKX1BeSfWs13zo+ZGnLZsF+yC8DXPz1ljWspyY
   A==;
X-CSE-ConnectionGUID: wcIfHQ3RSQiRBKtEBk36Zg==
X-CSE-MsgGUID: Z26lXgdVSnSTP75eRbhuiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69432796"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69432796"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:17:58 -0800
X-CSE-ConnectionGUID: sd3Hy3GqQGW5zP8+TQSy9g==
X-CSE-MsgGUID: JqVwDtZcSRewAwmjb2sO9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203356867"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jan 2026 13:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPIP-00000000DtA-2PZb;
	Mon, 12 Jan 2026 21:17:53 +0000
Date: Tue, 13 Jan 2026 05:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-next 6/17] fs/netfs/buffer.c:212
 netfs_expand_bvecq_buffer() error: uninitialized symbol 'p'.
Message-ID: <202601130502.UVDN6oYF-lkp@intel.com>
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
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: bff57425b6c4175565f1c28fa1f3d53ef7de7703 [6/17] afs: Use a bvecq to hold dir content rather than folioq
:::::: branch date: 7 hours ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r073-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130502.UVDN6oYF-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130502.UVDN6oYF-lkp@intel.com/

New smatch warnings:
fs/netfs/buffer.c:212 netfs_expand_bvecq_buffer() error: uninitialized symbol 'p'.

Old smatch warnings:
fs/netfs/buffer.c:298 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null (see line 288)

vim +/p +212 fs/netfs/buffer.c

8b13f6a2936831 David Howells 2025-07-31  163  
bff57425b6c417 David Howells 2026-01-07  164  /**
bff57425b6c417 David Howells 2026-01-07  165   * netfs_expand_bvecq_buffer - Allocate buffer space into a bvec queue
bff57425b6c417 David Howells 2026-01-07  166   * @mapping: Address space to set on the folio (or NULL).
bff57425b6c417 David Howells 2026-01-07  167   * @_buffer: Pointer to the folio queue to add to (may point to a NULL; updated).
bff57425b6c417 David Howells 2026-01-07  168   * @_cur_size: Current size of the buffer (updated).
bff57425b6c417 David Howells 2026-01-07  169   * @size: Target size of the buffer.
bff57425b6c417 David Howells 2026-01-07  170   * @gfp: The allocation constraints.
bff57425b6c417 David Howells 2026-01-07  171   */
bff57425b6c417 David Howells 2026-01-07  172  int netfs_expand_bvecq_buffer(struct bvecq **_buffer, size_t *_cur_size, ssize_t size, gfp_t gfp)
bff57425b6c417 David Howells 2026-01-07  173  {
bff57425b6c417 David Howells 2026-01-07  174  	struct bvecq *tail = *_buffer, *p;
bff57425b6c417 David Howells 2026-01-07  175  	const size_t max_segs = 32;
bff57425b6c417 David Howells 2026-01-07  176  
bff57425b6c417 David Howells 2026-01-07  177  	size = round_up(size, PAGE_SIZE);
bff57425b6c417 David Howells 2026-01-07  178  	if (*_cur_size >= size)
bff57425b6c417 David Howells 2026-01-07  179  		return 0;
bff57425b6c417 David Howells 2026-01-07  180  
bff57425b6c417 David Howells 2026-01-07  181  	if (tail)
bff57425b6c417 David Howells 2026-01-07  182  		while (tail->next)
bff57425b6c417 David Howells 2026-01-07  183  			tail = tail->next;
bff57425b6c417 David Howells 2026-01-07  184  
bff57425b6c417 David Howells 2026-01-07  185  	do {
bff57425b6c417 David Howells 2026-01-07  186  		struct page *page;
bff57425b6c417 David Howells 2026-01-07  187  		int order = 0;
bff57425b6c417 David Howells 2026-01-07  188  
bff57425b6c417 David Howells 2026-01-07  189  		if (!tail || tail->nr_segs >= tail->max_segs) {
bff57425b6c417 David Howells 2026-01-07  190  			p = netfs_alloc_one_bvecq(max_segs, gfp);
bff57425b6c417 David Howells 2026-01-07  191  			if (!p)
bff57425b6c417 David Howells 2026-01-07  192  				return -ENOMEM;
bff57425b6c417 David Howells 2026-01-07  193  			if (tail) {
bff57425b6c417 David Howells 2026-01-07  194  				tail->next = p;
bff57425b6c417 David Howells 2026-01-07  195  				p->prev = tail;
bff57425b6c417 David Howells 2026-01-07  196  			} else {
bff57425b6c417 David Howells 2026-01-07  197  				*_buffer = p;
bff57425b6c417 David Howells 2026-01-07  198  			}
bff57425b6c417 David Howells 2026-01-07  199  			tail = p;
bff57425b6c417 David Howells 2026-01-07  200  		}
bff57425b6c417 David Howells 2026-01-07  201  
bff57425b6c417 David Howells 2026-01-07  202  		if (size - *_cur_size > PAGE_SIZE)
bff57425b6c417 David Howells 2026-01-07  203  			order = umin(ilog2(size - *_cur_size) - PAGE_SHIFT,
bff57425b6c417 David Howells 2026-01-07  204  				     MAX_PAGECACHE_ORDER);
bff57425b6c417 David Howells 2026-01-07  205  
bff57425b6c417 David Howells 2026-01-07  206  		page = alloc_pages(gfp | __GFP_COMP, order);
bff57425b6c417 David Howells 2026-01-07  207  		if (!page && order > 0)
bff57425b6c417 David Howells 2026-01-07  208  			page = alloc_pages(gfp | __GFP_COMP, 0);
bff57425b6c417 David Howells 2026-01-07  209  		if (!page)
bff57425b6c417 David Howells 2026-01-07  210  			return -ENOMEM;
bff57425b6c417 David Howells 2026-01-07  211  
bff57425b6c417 David Howells 2026-01-07 @212  		bvec_set_page(&p->bv[p->nr_segs++], page, PAGE_SIZE << order, 0);
bff57425b6c417 David Howells 2026-01-07  213  		*_cur_size += PAGE_SIZE << order;
bff57425b6c417 David Howells 2026-01-07  214  	} while (*_cur_size < size);
bff57425b6c417 David Howells 2026-01-07  215  
bff57425b6c417 David Howells 2026-01-07  216  	return 0;
bff57425b6c417 David Howells 2026-01-07  217  }
bff57425b6c417 David Howells 2026-01-07  218  EXPORT_SYMBOL(netfs_expand_bvecq_buffer);
bff57425b6c417 David Howells 2026-01-07  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

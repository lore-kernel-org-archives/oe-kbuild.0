Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D04D37FF46
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294005; cv=none; b=JzrYpgt4V0cRrA9WrAmUpSJbwGTGxoA0bDaMP4pUUjvi9J6DpqCel3pYOUwjzDSM3dv0pmYsLHmDY9AOKpdf5qwjmzkK7ow0/ioWq+JbdiCtHF9jkhNPjRQYXMxP3KUnOnTyMBQ/1+lmd6aAv4jkVKeMS78CX1u2xanXDevPAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294005; c=relaxed/simple;
	bh=1xlDqqKy4u4KfdlY2bJ8u7vLgZ0f4jyPMOskrHtxkwM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ISVK28NrEh4qMaPv4RLdZZPI+2lNRO70/PM3qbc3BTjepb0H8nN0AehH8jWq/dSIIZVC7ED4yJpi5b+dfuwdhR/MUaoQgsn5Je4pHDhTQdpraDwvrTgjj/OQbaSZEd44U3JMlbLIu7vs/seRPQtyIL9zaQnr6jH1OyO6t465WFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsNyfrLn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsNyfrLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791294003; x=1822830003;
  h=date:from:to:cc:subject:message-id;
  bh=1xlDqqKy4u4KfdlY2bJ8u7vLgZ0f4jyPMOskrHtxkwM=;
  b=DsNyfrLn21XLF+QpTaPg16NFj08nT7eU87548aiehMvzjX+UPUM9xz9c
   pNCKhoZt51u/0ROSraIzG5779ZzY8KfPB+3P41TcWNrncBKuTvvq2iF9h
   P3907n7CeXeBVBilZBRV82uMLf2tPehsZBV8xD/PlW2jVPbWbjm2yBn+T
   eAYj6hejgxauF2XbUzq8trXEof9tW+MCXZexUxbflz76dH/G9cfZW0ic+
   Ud4cbjkftyMOPy7s9eFcjJpfu6R+wijr3Hkm9Zpl3eaMitxpNyJxmaQEK
   9HXqjLhejJv0urqF4ofMb36/quaIDpfrToORlyxRGwEQ+UdiQqsuFCejR
   w==;
X-CSE-ConnectionGUID: umKgB9DqTFCs8p0WC35nig==
X-CSE-MsgGUID: oif7fPNBRdC4Sv1ku1Axsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="33452"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="33452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 06:40:03 -0700
X-CSE-ConnectionGUID: U1BimBRYQyyFAc67e7iGjA==
X-CSE-MsgGUID: ZkKaNGtLSE6EkoRuaSGKYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305091130"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 06:40:02 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE5Oi-000000001Jz-05Dp;
	Tue, 06 Oct 2026 13:40:00 +0000
Date: Tue, 06 Oct 2026 15:39:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:netfs-next-4 7/9]
 fs/netfs/buffered_read.c:626:31: error: call to '__compiletime_assert_575'
 declared with 'error' attribute: max(to, ret) signedness error
Message-ID: <202610061525.TWEdA6iU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-4
head:   3cb439a956a371e7d3217f13e684b271f1cac997
commit: 4da074c3ab2ca3f97d9a1ac526d803a3bf2ef432 [7/9] netfs: Use bvecq_pos to hold the buffer positions
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc64-randconfig-r2105-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061525.TWEdA6iU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061525.TWEdA6iU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610061525.TWEdA6iU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:626:31: error: call to '__compiletime_assert_575' declared with 'error' attribute: max(to, ret) signedness error
     626 |                                 folio_zero_segment(folio, max(to, ret), flen);
         |                                                           ^
   include/linux/minmax.h:112:19: note: expanded from macro 'max'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:63:1: note: expanded from here
      63 | __compiletime_assert_575
         | ^
   fs/netfs/buffered_read.c:626:31: note: called by function 'netfs_read_gaps'
   include/linux/minmax.h:112:19: note: expanded from macro 'max'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:63:1: note: expanded from here
      63 | __compiletime_assert_575
         | ^
   fs/netfs/buffered_read.c:626:31: note: inlined by function 'netfs_read_folio'
   include/linux/minmax.h:112:19: note: expanded from macro 'max'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:63:1: note: expanded from here
      63 | __compiletime_assert_575
         | ^
   1 error generated.


vim +626 fs/netfs/buffered_read.c

ee4cdf7ba857a8 David Howells   2024-07-02  537  
ee4cdf7ba857a8 David Howells   2024-07-02  538  /*
ee4cdf7ba857a8 David Howells   2024-07-02  539   * Read into gaps in a folio partially filled by a streaming write.
ee4cdf7ba857a8 David Howells   2024-07-02  540   */
ee4cdf7ba857a8 David Howells   2024-07-02  541  static int netfs_read_gaps(struct file *file, struct folio *folio)
16211268fcb366 David Howells   2022-03-01  542  {
16211268fcb366 David Howells   2022-03-01  543  	struct netfs_io_request *rreq;
ee4cdf7ba857a8 David Howells   2024-07-02  544  	struct address_space *mapping = folio->mapping;
a41168aef63435 David Howells   2026-05-12  545  	struct netfs_group *group = netfs_folio_group(folio);
ee4cdf7ba857a8 David Howells   2024-07-02  546  	struct netfs_folio *finfo = netfs_folio_info(folio);
874c8ca1e60b2c David Howells   2022-06-09  547  	struct netfs_inode *ctx = netfs_inode(mapping->host);
4da074c3ab2ca3 David Howells   2026-04-09  548  	struct bvecq *bq = NULL;
ee4cdf7ba857a8 David Howells   2024-07-02  549  	unsigned int from = finfo->dirty_offset;
ee4cdf7ba857a8 David Howells   2024-07-02  550  	unsigned int to = from + finfo->dirty_len;
fc3ae66514ca5e David Howells   2026-09-14  551  	unsigned int off = 0;
ee4cdf7ba857a8 David Howells   2024-07-02  552  	size_t flen = folio_size(folio);
ee4cdf7ba857a8 David Howells   2024-07-02  553  	size_t nr_bvec = flen / PAGE_SIZE + 2;
ee4cdf7ba857a8 David Howells   2024-07-02  554  	size_t part;
4da074c3ab2ca3 David Howells   2026-04-09  555  	int ret, i = 0;
16211268fcb366 David Howells   2022-03-01  556  
a9d47a50cf257f David Howells   2024-07-18  557  	_enter("%lx", folio->index);
16211268fcb366 David Howells   2022-03-01  558  
ee4cdf7ba857a8 David Howells   2024-07-02  559  	rreq = netfs_alloc_request(mapping, file, folio_pos(folio), flen, NETFS_READ_GAPS);
16211268fcb366 David Howells   2022-03-01  560  	if (IS_ERR(rreq)) {
16211268fcb366 David Howells   2022-03-01  561  		ret = PTR_ERR(rreq);
16211268fcb366 David Howells   2022-03-01  562  		goto alloc_error;
16211268fcb366 David Howells   2022-03-01  563  	}
16211268fcb366 David Howells   2022-03-01  564  
4498a8eccc97de David Howells   2023-11-20  565  	ret = netfs_begin_cache_read(rreq, ctx);
16211268fcb366 David Howells   2022-03-01  566  	if (ret == -ENOMEM || ret == -EINTR || ret == -ERESTARTSYS)
16211268fcb366 David Howells   2022-03-01  567  		goto discard;
16211268fcb366 David Howells   2022-03-01  568  
4824e5917f907c David Howells   2024-03-26  569  	netfs_stat(&netfs_n_rh_read_folio);
ee4cdf7ba857a8 David Howells   2024-07-02  570  	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_read_gaps);
92b6cc5d1e7cbe David Howells   2023-09-26  571  
ee4cdf7ba857a8 David Howells   2024-07-02  572  	/* Fiddle the buffer so that a gap at the beginning and/or a gap at the
ee4cdf7ba857a8 David Howells   2024-07-02  573  	 * end get copied to, but the middle is discarded.
7f84a7b9892d1c David Howells   2023-10-02  574  	 */
7f84a7b9892d1c David Howells   2023-10-02  575  	ret = -ENOMEM;
4da074c3ab2ca3 David Howells   2026-04-09  576  	bq = bvecq_alloc_chain(nr_bvec, rreq->gfp, false);
4da074c3ab2ca3 David Howells   2026-04-09  577  	if (!bq)
7f84a7b9892d1c David Howells   2023-10-02  578  		goto discard;
4da074c3ab2ca3 David Howells   2026-04-09  579  	rreq->dispatch_cursor.bvecq = bq;
7f84a7b9892d1c David Howells   2023-10-02  580  
7f84a7b9892d1c David Howells   2023-10-02  581  	trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
7f84a7b9892d1c David Howells   2023-10-02  582  
4da074c3ab2ca3 David Howells   2026-04-09  583  	for (struct bvecq *p = bq; p; p = p->next)
4da074c3ab2ca3 David Howells   2026-04-09  584  		p->mem_type = BVECQ_MEM_PAGECACHE;
4da074c3ab2ca3 David Howells   2026-04-09  585  
7f84a7b9892d1c David Howells   2023-10-02  586  	if (from > 0) {
4da074c3ab2ca3 David Howells   2026-04-09  587  		folio_get(folio);
4da074c3ab2ca3 David Howells   2026-04-09  588  		bvec_set_folio(&bq->bv[i++], folio, from, 0);
7f84a7b9892d1c David Howells   2023-10-02  589  		off = from;
7f84a7b9892d1c David Howells   2023-10-02  590  	}
7f84a7b9892d1c David Howells   2023-10-02  591  	while (off < to) {
fc3ae66514ca5e David Howells   2026-09-14  592  		struct folio *sink = folio_alloc(GFP_KERNEL, 0);
fc3ae66514ca5e David Howells   2026-09-14  593  
fc3ae66514ca5e David Howells   2026-09-14  594  		if (!sink)
fc3ae66514ca5e David Howells   2026-09-14  595  			goto discard;
4da074c3ab2ca3 David Howells   2026-04-09  596  		if (i >= bq->max_slots) {
4da074c3ab2ca3 David Howells   2026-04-09  597  			bvecq_filled_to(bq, i);
4da074c3ab2ca3 David Howells   2026-04-09  598  			bq = bq->next;
4da074c3ab2ca3 David Howells   2026-04-09  599  			i = 0;
4da074c3ab2ca3 David Howells   2026-04-09  600  		}
4da074c3ab2ca3 David Howells   2026-04-09  601  		part = min(to - off, PAGE_SIZE);
4da074c3ab2ca3 David Howells   2026-04-09  602  		bvec_set_folio(&bq->bv[i++], sink, part, 0);
7f84a7b9892d1c David Howells   2023-10-02  603  		off += part;
7f84a7b9892d1c David Howells   2023-10-02  604  	}
4da074c3ab2ca3 David Howells   2026-04-09  605  	if (to < flen) {
4da074c3ab2ca3 David Howells   2026-04-09  606  		if (i >= bq->max_slots) {
4da074c3ab2ca3 David Howells   2026-04-09  607  			bvecq_filled_to(bq, i);
4da074c3ab2ca3 David Howells   2026-04-09  608  			bq = bq->next;
4da074c3ab2ca3 David Howells   2026-04-09  609  			i = 0;
4da074c3ab2ca3 David Howells   2026-04-09  610  		}
4da074c3ab2ca3 David Howells   2026-04-09  611  		folio_get(folio);
4da074c3ab2ca3 David Howells   2026-04-09  612  		bvec_set_folio(&bq->bv[i++], folio, flen - to, to);
4da074c3ab2ca3 David Howells   2026-04-09  613  	}
4da074c3ab2ca3 David Howells   2026-04-09  614  	bvecq_filled_to(bq, i);
4da074c3ab2ca3 David Howells   2026-04-09  615  
ee4cdf7ba857a8 David Howells   2024-07-02  616  	rreq->submitted = rreq->start + flen;
ee4cdf7ba857a8 David Howells   2024-07-02  617  
fed0b33e6c5849 David Howells   2026-08-27  618  	netfs_read_to_pagecache(rreq);
92b6cc5d1e7cbe David Howells   2023-09-26  619  
ee4cdf7ba857a8 David Howells   2024-07-02  620  	ret = netfs_wait_for_read(rreq);
e2d46f2ec33253 David Howells   2024-12-16  621  	if (ret >= 0) {
8db55c5cd831a7 Paulo Alcantara 2026-09-26  622  		if (ret < flen) {
4da074c3ab2ca3 David Howells   2026-04-09  623  			if (ret < from)
4da074c3ab2ca3 David Howells   2026-04-09  624  				folio_zero_segments(folio, ret, from, to, flen);
4da074c3ab2ca3 David Howells   2026-04-09  625  			else
4da074c3ab2ca3 David Howells   2026-04-09 @626  				folio_zero_segment(folio, max(to, ret), flen);
8db55c5cd831a7 Paulo Alcantara 2026-09-26  627  		}
a41168aef63435 David Howells   2026-05-12  628  		if (group)
a41168aef63435 David Howells   2026-05-12  629  			folio_change_private(folio, group);
a41168aef63435 David Howells   2026-05-12  630  		else
a41168aef63435 David Howells   2026-05-12  631  			folio_detach_private(folio);
a41168aef63435 David Howells   2026-05-12  632  		kfree(finfo);
a41168aef63435 David Howells   2026-05-12  633  		trace_netfs_folio(folio, netfs_folio_trace_filled_gaps);
ee4cdf7ba857a8 David Howells   2024-07-02  634  		flush_dcache_folio(folio);
ee4cdf7ba857a8 David Howells   2024-07-02  635  		folio_mark_uptodate(folio);
ee4cdf7ba857a8 David Howells   2024-07-02  636  	}
3e5dd91b87a8b1 David Howells   2026-05-12  637  
4da074c3ab2ca3 David Howells   2026-04-09  638  	bvecq_pos_unset(&rreq->dispatch_cursor);
ee4cdf7ba857a8 David Howells   2024-07-02  639  	folio_unlock(folio);
20d72b00ca814d David Howells   2025-05-19  640  	netfs_put_request(rreq, netfs_rreq_trace_put_return);
ee4cdf7ba857a8 David Howells   2024-07-02  641  	return ret < 0 ? ret : 0;
ee4cdf7ba857a8 David Howells   2024-07-02  642  
ee4cdf7ba857a8 David Howells   2024-07-02  643  discard:
4da074c3ab2ca3 David Howells   2026-04-09  644  	bvecq_pos_unset(&rreq->dispatch_cursor);
4d428dca252c85 Max Kellermann  2025-09-25  645  	netfs_put_failed_request(rreq);
ee4cdf7ba857a8 David Howells   2024-07-02  646  alloc_error:
ee4cdf7ba857a8 David Howells   2024-07-02  647  	folio_unlock(folio);
ee4cdf7ba857a8 David Howells   2024-07-02  648  	return ret;
ee4cdf7ba857a8 David Howells   2024-07-02  649  }
ee4cdf7ba857a8 David Howells   2024-07-02  650  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

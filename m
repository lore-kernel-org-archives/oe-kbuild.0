Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E61419A4
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Aug 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677663; cv=none; b=QvU2wrA0/nu1jVbP52F0gMdoL2VSmNBmBMkB5Vk2wdCeTVRGmroRjeQjzmbCuOhS0Jd2FqbxQG06uDxF7fzlakZYIYUEE22cAmb4ApSfGln+dxLgK9KNf8yQ5+FoHTb1XS1ekCiTuUKucexsWNG6Ivu/lO7QFzocPOOOiZK+pXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677663; c=relaxed/simple;
	bh=uZj/Uw3txmWpU//+bEeSQEYXJWnmAKtaZw5KSsBlYXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ysi5oYb2gF60iy8QpPETl381ou+gtFO1VRzPJMH7OEzR14zV/V6OF9ra7FZeh/U5O+rKH3Jgv1ZEPmqsJT2uoSwZLYzYEXHbfYHvSGULH0bvm0g9gRu/R0iG9QUUZhF4GrvrkdHaNONALWAsSDeFRE1QsSdW/A6LFIHurIyomGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWpdfJ6p; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWpdfJ6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785677661; x=1817213661;
  h=date:from:to:cc:subject:message-id;
  bh=uZj/Uw3txmWpU//+bEeSQEYXJWnmAKtaZw5KSsBlYXI=;
  b=gWpdfJ6pZ1303BDCIgrIF9rNuse58j3ZT6WlufjXe8nggXpIM/QN+xHP
   7xf+TISibNIDvgaKEOEtToIDg7FeUcqcQ/hFbmBPqwHroerFtWdH62dT+
   2XF0K/EvID/uazzEvhIv/drEhG9XWwmQEUmxE6iu6YEstCw6vfK1uQNeh
   gjQcb1LiCSxlpHpnwHX/Wv8OToM4jqXF4TpFoZD3XC4V6sTyIpiX65Hdj
   EfX+1RVhggRmcWABYGyYq5//c9CZhmKlPozhoVORF2FSUkvIrKqpbN16+
   YIX55R6jvZ854F7HClbneQvBqMcb7PftUcruc3ksHEIw13yuGPldp5aCY
   w==;
X-CSE-ConnectionGUID: h8UpZJQVRdiolimZpP0isA==
X-CSE-MsgGUID: mk34CNd4T1OXWFIiT8huLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="109034205"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="109034205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 06:34:20 -0700
X-CSE-ConnectionGUID: BReZ4cSoSUam4rVZ085tZg==
X-CSE-MsgGUID: no+mB5CoTmumqk4a1dCZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="257078817"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Aug 2026 06:34:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqWKW-0000000050B-40OR;
	Sun, 02 Aug 2026 13:34:16 +0000
Date: Sun, 02 Aug 2026 21:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:rw-dmabuf-v5 7/16] block/blk-merge.c:388
 bio_split_io_at() warn: missing unwind goto?
Message-ID: <202608022100.WFQa1Sj3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux rw-dmabuf-v5
head:   830cd62ae8958351a9fcd6d663dea3430921f95b
commit: e26aefbcb383be7092dc76343ce745013e671334 [7/16] block: introduce dma map backed bio type
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-r072-20260802 (https://download.01.org/0day-ci/archive/20260802/202608022100.WFQa1Sj3-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608022100.WFQa1Sj3-lkp@intel.com/

smatch warnings:
block/blk-merge.c:388 bio_split_io_at() warn: missing unwind goto?
block/blk-merge.c:388 bio_split_io_at() warn: missing unwind goto?
block/blk-merge.c:388 bio_split_io_at() warn: missing unwind goto?

vim +388 block/blk-merge.c

e26aefbcb383be Pavel Begunkov    2025-06-25  344  
dad7758459bc60 Bart Van Assche   2019-08-01  345  /**
fec2e705729dc9 Keith Busch       2025-08-27  346   * bio_split_io_at - check if and where to split a bio
dad7758459bc60 Bart Van Assche   2019-08-01  347   * @bio:  [in] bio to be split
c55ddd9082f757 Christoph Hellwig 2022-07-27  348   * @lim:  [in] queue limits to split based on
dad7758459bc60 Bart Van Assche   2019-08-01  349   * @segs: [out] number of segments in the bio with the first half of the sectors
a85b36375b05f7 Christoph Hellwig 2022-07-27  350   * @max_bytes: [in] maximum number of bytes per bio
fec2e705729dc9 Keith Busch       2025-08-27  351   * @len_align_mask: [in] length alignment mask for each vector
dad7758459bc60 Bart Van Assche   2019-08-01  352   *
b35243a447b9fe Christoph Hellwig 2024-08-26  353   * Find out if @bio needs to be split to fit the queue limits in @lim and a
b35243a447b9fe Christoph Hellwig 2024-08-26  354   * maximum size of @max_bytes.  Returns a negative error number if @bio can't be
b35243a447b9fe Christoph Hellwig 2024-08-26  355   * split, 0 if the bio doesn't have to be split, or a positive sector offset if
b35243a447b9fe Christoph Hellwig 2024-08-26  356   * @bio needs to be split.
dad7758459bc60 Bart Van Assche   2019-08-01  357   */
fec2e705729dc9 Keith Busch       2025-08-27  358  int bio_split_io_at(struct bio *bio, const struct queue_limits *lim,
fec2e705729dc9 Keith Busch       2025-08-27  359  		unsigned *segs, unsigned max_bytes, unsigned len_align_mask)
54efd50bfd873e Kent Overstreet   2015-04-23  360  {
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  361  	struct bio_crypt_ctx *bc = bio_crypt_ctx(bio);
5014c311baa2b2 Jens Axboe        2015-09-02  362  	struct bio_vec bv, bvprv, *bvprvp = NULL;
2f6b2565d43cdb Keith Busch       2025-10-14  363  	unsigned nsegs = 0, bytes = 0, gaps = 0;
54efd50bfd873e Kent Overstreet   2015-04-23  364  	struct bvec_iter iter;
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  365  	unsigned start_align_mask = lim->dma_alignment;
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  366  
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  367  	if (bc) {
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  368  		start_align_mask |= (bc->bc_key->crypto_cfg.data_unit_size - 1);
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  369  		len_align_mask |= (bc->bc_key->crypto_cfg.data_unit_size - 1);
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  370  	}
54efd50bfd873e Kent Overstreet   2015-04-23  371  
e26aefbcb383be Pavel Begunkov    2025-06-25  372  	if (op_is_dmabuf(bio->bi_opf)) {
e26aefbcb383be Pavel Begunkov    2025-06-25  373  		int ret;
e26aefbcb383be Pavel Begunkov    2025-06-25  374  
e26aefbcb383be Pavel Begunkov    2025-06-25  375  		ret = bio_split_io_at_dmabuf(bio, lim, &nsegs, max_bytes,
e26aefbcb383be Pavel Begunkov    2025-06-25  376  					     len_align_mask, start_align_mask);
e26aefbcb383be Pavel Begunkov    2025-06-25  377  		if (ret < 0)
e26aefbcb383be Pavel Begunkov    2025-06-25  378  			return ret;
e26aefbcb383be Pavel Begunkov    2025-06-25  379  		if (!ret)
e26aefbcb383be Pavel Begunkov    2025-06-25  380  			goto out;
e26aefbcb383be Pavel Begunkov    2025-06-25  381  		bytes = ret;
e26aefbcb383be Pavel Begunkov    2025-06-25  382  		goto split;
e26aefbcb383be Pavel Begunkov    2025-06-25  383  	}
e26aefbcb383be Pavel Begunkov    2025-06-25  384  
dcebd755926b0f Ming Lei          2019-02-15  385  	bio_for_each_bvec(bv, bio, iter) {
66e5a11d2ed6d5 Christoph Hellwig 2026-01-09  386  		if (bv.bv_offset & start_align_mask ||
fec2e705729dc9 Keith Busch       2025-08-27  387  		    bv.bv_len & len_align_mask)
fec2e705729dc9 Keith Busch       2025-08-27 @388  			return -EINVAL;
fec2e705729dc9 Keith Busch       2025-08-27  389  
54efd50bfd873e Kent Overstreet   2015-04-23  390  		/*
54efd50bfd873e Kent Overstreet   2015-04-23  391  		 * If the queue doesn't support SG gaps and adding this
54efd50bfd873e Kent Overstreet   2015-04-23  392  		 * offset would create a gap, disallow it.
54efd50bfd873e Kent Overstreet   2015-04-23  393  		 */
2f6b2565d43cdb Keith Busch       2025-10-14  394  		if (bvprvp) {
2f6b2565d43cdb Keith Busch       2025-10-14  395  			if (bvec_gap_to_prev(lim, bvprvp, bv.bv_offset))
54efd50bfd873e Kent Overstreet   2015-04-23  396  				goto split;
2f6b2565d43cdb Keith Busch       2025-10-14  397  			gaps |= bvec_seg_gap(bvprvp, &bv);
2f6b2565d43cdb Keith Busch       2025-10-14  398  		}
54efd50bfd873e Kent Overstreet   2015-04-23  399  
c55ddd9082f757 Christoph Hellwig 2022-07-27  400  		if (nsegs < lim->max_segments &&
67927d22015060 Keith Busch       2022-06-10  401  		    bytes + bv.bv_len <= max_bytes &&
5c5028ee594ce5 Keith Busch       2025-10-20  402  		    bv.bv_offset + bv.bv_len <= lim->max_fast_segment_size) {
708b25b344fd9b Bart Van Assche   2019-08-01  403  			nsegs++;
67927d22015060 Keith Busch       2022-06-10  404  			bytes += bv.bv_len;
c55ddd9082f757 Christoph Hellwig 2022-07-27  405  		} else {
c55ddd9082f757 Christoph Hellwig 2022-07-27  406  			if (bvec_split_segs(lim, &bv, &nsegs, &bytes,
c55ddd9082f757 Christoph Hellwig 2022-07-27  407  					lim->max_segments, max_bytes))
e36f6204288088 Keith Busch       2016-01-12  408  				goto split;
e36f6204288088 Keith Busch       2016-01-12  409  		}
e36f6204288088 Keith Busch       2016-01-12  410  
54efd50bfd873e Kent Overstreet   2015-04-23  411  		bvprv = bv;
578270bfbd2803 Ming Lei          2015-11-24  412  		bvprvp = &bvprv;
54efd50bfd873e Kent Overstreet   2015-04-23  413  	}
54efd50bfd873e Kent Overstreet   2015-04-23  414  
e26aefbcb383be Pavel Begunkov    2025-06-25  415  out:
d627065d884699 Christoph Hellwig 2019-06-06  416  	*segs = nsegs;
2f6b2565d43cdb Keith Busch       2025-10-14  417  	bio->bi_bvec_gap_bit = ffs(gaps);
b35243a447b9fe Christoph Hellwig 2024-08-26  418  	return 0;
54efd50bfd873e Kent Overstreet   2015-04-23  419  split:
b35243a447b9fe Christoph Hellwig 2024-08-26  420  	if (bio->bi_opf & REQ_ATOMIC)
b35243a447b9fe Christoph Hellwig 2024-08-26  421  		return -EINVAL;
b35243a447b9fe Christoph Hellwig 2024-08-26  422  
9cea62b2cbabff Jens Axboe        2023-01-04  423  	/*
9cea62b2cbabff Jens Axboe        2023-01-04  424  	 * We can't sanely support splitting for a REQ_NOWAIT bio. End it
9cea62b2cbabff Jens Axboe        2023-01-04  425  	 * with EAGAIN if splitting is required and return an error pointer.
9cea62b2cbabff Jens Axboe        2023-01-04  426  	 */
b35243a447b9fe Christoph Hellwig 2024-08-26  427  	if (bio->bi_opf & REQ_NOWAIT)
b35243a447b9fe Christoph Hellwig 2024-08-26  428  		return -EAGAIN;
9cea62b2cbabff Jens Axboe        2023-01-04  429  
bdced438acd83a Ming Lei          2015-10-20  430  	*segs = nsegs;
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  431  
67927d22015060 Keith Busch       2022-06-10  432  	/*
67927d22015060 Keith Busch       2022-06-10  433  	 * Individual bvecs might not be logical block aligned. Round down the
67927d22015060 Keith Busch       2022-06-10  434  	 * split size so that each bio is properly block size aligned, even if
67927d22015060 Keith Busch       2022-06-10  435  	 * we do not use the full hardware limits.
fec2e705729dc9 Keith Busch       2025-08-27  436  	 *
fec2e705729dc9 Keith Busch       2025-08-27  437  	 * It is possible to submit a bio that can't be split into a valid io:
fec2e705729dc9 Keith Busch       2025-08-27  438  	 * there may either be too many discontiguous vectors for the max
fec2e705729dc9 Keith Busch       2025-08-27  439  	 * segments limit, or contain virtual boundary gaps without having a
fec2e705729dc9 Keith Busch       2025-08-27  440  	 * valid block sized split. A zero byte result means one of those
fec2e705729dc9 Keith Busch       2025-08-27  441  	 * conditions occured.
67927d22015060 Keith Busch       2022-06-10  442  	 */
7ecd2cd4fae3e8 Christoph Hellwig 2024-11-04  443  	bytes = ALIGN_DOWN(bytes, bio_split_alignment(bio, lim));
fec2e705729dc9 Keith Busch       2025-08-27  444  	if (!bytes)
fec2e705729dc9 Keith Busch       2025-08-27  445  		return -EINVAL;
67927d22015060 Keith Busch       2022-06-10  446  
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  447  	/*
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  448  	 * Bio splitting may cause subtle trouble such as hang when doing sync
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  449  	 * iopoll in direct IO routine. Given performance gain of iopoll for
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  450  	 * big IO can be trival, disable iopoll when split needed.
cc29e1bf0d63f7 Jeffle Xu         2020-11-26  451  	 */
6ce913fe3eee14 Christoph Hellwig 2021-10-12  452  	bio_clear_polled(bio);
2f6b2565d43cdb Keith Busch       2025-10-14  453  	bio->bi_bvec_gap_bit = ffs(gaps);
b35243a447b9fe Christoph Hellwig 2024-08-26  454  	return bytes >> SECTOR_SHIFT;
54efd50bfd873e Kent Overstreet   2015-04-23  455  }
fec2e705729dc9 Keith Busch       2025-08-27  456  EXPORT_SYMBOL_GPL(bio_split_io_at);
54efd50bfd873e Kent Overstreet   2015-04-23  457  

:::::: The code at line 388 was first introduced by commit
:::::: fec2e705729dc93de5399d8b139e4746805c3d81 block: check for valid bio while splitting

:::::: TO: Keith Busch <kbusch@kernel.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10D411CA5
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685206511; x=1716742511;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=psAYddo0rvns+5ymbYuwrt3EigE++1w2rBGlyq0vTzA=;
  b=f8rcivxVI6V76/oEkLHrMPrKHV1C7e4be9noIgVwR+jS2DDP87d3P+IM
   hwdtM5G63NnJVa2MHrvM4tQoKXKwOBJcH+aQrLGHjS91Gf7fTEKZDWAyW
   s10kFO6YB5TodRtEwyMn+np9N3X8SlLaSxMtx5HJ+XBq82lQ5TvRTj289
   Wr/Mru5MWlDfcNMzySj6WvW/ReR8cwEwphPI7Jw0LSUheZMNzVMqyO/G4
   /xLXkto9vs7e/4wRSY9dfbXq9UyY4FQOOLJXirk4ol2g7ZPk0xMrgTJrw
   1Cqkunh7rh13JKWHNEoGKMNwWBl3wPlm9c5tPXw2T58ueqbmbhhaAfG+9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="343922048"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="343922048"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 09:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="708733727"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="708733727"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 May 2023 09:55:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2xC8-000K58-2U;
	Sat, 27 May 2023 16:55:08 +0000
Date: Sun, 28 May 2023 00:54:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-intel:for-linux-next-gt 2/2]
 drivers/gpu/drm/i915/gt/intel_migrate.c:819 intel_context_migrate_copy()
 error: uninitialized symbol 'ccs_pat_index'.
Message-ID: <202305280054.Gq4AiJsZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
TO: Fei Yang <fei.yang@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel for-linux-next-gt
head:   08264f85c5c05ecc38d409c84d48cfb00ccd3bc4
commit: 9275277d53248d3f529d7ce66a6954241ae4d5cb [2/2] drm/i915: use pat_index instead of cache_level
:::::: branch date: 31 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-m021-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280054.Gq4AiJsZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305280054.Gq4AiJsZ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_migrate.c:819 intel_context_migrate_copy() error: uninitialized symbol 'ccs_pat_index'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_migrate.c:820 intel_context_migrate_copy() error: uninitialized symbol 'ccs_is_src'.

vim +/ccs_pat_index +819 drivers/gpu/drm/i915/gt/intel_migrate.c

da0595ae91da837 Ramalingam C     2022-04-05  676  
cf586021642d801 Chris Wilson     2021-06-17  677  int
cf586021642d801 Chris Wilson     2021-06-17  678  intel_context_migrate_copy(struct intel_context *ce,
1193081710b361d Thomas Hellström 2021-12-21  679  			   const struct i915_deps *deps,
cf586021642d801 Chris Wilson     2021-06-17  680  			   struct scatterlist *src,
9275277d53248d3 Fei Yang         2023-05-09  681  			   unsigned int src_pat_index,
cf586021642d801 Chris Wilson     2021-06-17  682  			   bool src_is_lmem,
cf586021642d801 Chris Wilson     2021-06-17  683  			   struct scatterlist *dst,
9275277d53248d3 Fei Yang         2023-05-09  684  			   unsigned int dst_pat_index,
cf586021642d801 Chris Wilson     2021-06-17  685  			   bool dst_is_lmem,
cf586021642d801 Chris Wilson     2021-06-17  686  			   struct i915_request **out)
cf586021642d801 Chris Wilson     2021-06-17  687  {
da0595ae91da837 Ramalingam C     2022-04-05  688  	struct sgt_dma it_src = sg_sgt(src), it_dst = sg_sgt(dst), it_ccs;
da0595ae91da837 Ramalingam C     2022-04-05  689  	struct drm_i915_private *i915 = ce->engine->i915;
8676145eb2f53a9 Matthew Auld     2022-08-05  690  	u64 ccs_bytes_to_cpy = 0, bytes_to_cpy;
9275277d53248d3 Fei Yang         2023-05-09  691  	unsigned int ccs_pat_index;
6e6bc8c0a815768 Ramalingam C     2022-04-05  692  	u32 src_offset, dst_offset;
da0595ae91da837 Ramalingam C     2022-04-05  693  	u8 src_access, dst_access;
cf586021642d801 Chris Wilson     2021-06-17  694  	struct i915_request *rq;
8676145eb2f53a9 Matthew Auld     2022-08-05  695  	u64 src_sz, dst_sz;
353819d85f87be4 Matthew Auld     2022-07-27  696  	bool ccs_is_src, overwrite_ccs;
cf586021642d801 Chris Wilson     2021-06-17  697  	int err;
cf586021642d801 Chris Wilson     2021-06-17  698  
94ce0d65076cda5 Chris Wilson     2021-06-17  699  	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
552caa1fdbb8624 Matthew Auld     2022-03-24  700  	GEM_BUG_ON(IS_DGFX(ce->engine->i915) && (!src_is_lmem && !dst_is_lmem));
cf586021642d801 Chris Wilson     2021-06-17  701  	*out = NULL;
cf586021642d801 Chris Wilson     2021-06-17  702  
cf586021642d801 Chris Wilson     2021-06-17  703  	GEM_BUG_ON(ce->ring->size < SZ_64K);
cf586021642d801 Chris Wilson     2021-06-17  704  
da0595ae91da837 Ramalingam C     2022-04-05  705  	src_sz = scatter_list_length(src);
da0595ae91da837 Ramalingam C     2022-04-05  706  	bytes_to_cpy = src_sz;
da0595ae91da837 Ramalingam C     2022-04-05  707  
da0595ae91da837 Ramalingam C     2022-04-05  708  	if (HAS_FLAT_CCS(i915) && src_is_lmem ^ dst_is_lmem) {
da0595ae91da837 Ramalingam C     2022-04-05  709  		src_access = !src_is_lmem && dst_is_lmem;
da0595ae91da837 Ramalingam C     2022-04-05  710  		dst_access = !src_access;
da0595ae91da837 Ramalingam C     2022-04-05  711  
da0595ae91da837 Ramalingam C     2022-04-05  712  		dst_sz = scatter_list_length(dst);
da0595ae91da837 Ramalingam C     2022-04-05  713  		if (src_is_lmem) {
da0595ae91da837 Ramalingam C     2022-04-05  714  			it_ccs = it_dst;
9275277d53248d3 Fei Yang         2023-05-09  715  			ccs_pat_index = dst_pat_index;
da0595ae91da837 Ramalingam C     2022-04-05  716  			ccs_is_src = false;
da0595ae91da837 Ramalingam C     2022-04-05  717  		} else if (dst_is_lmem) {
da0595ae91da837 Ramalingam C     2022-04-05  718  			bytes_to_cpy = dst_sz;
da0595ae91da837 Ramalingam C     2022-04-05  719  			it_ccs = it_src;
9275277d53248d3 Fei Yang         2023-05-09  720  			ccs_pat_index = src_pat_index;
da0595ae91da837 Ramalingam C     2022-04-05  721  			ccs_is_src = true;
da0595ae91da837 Ramalingam C     2022-04-05  722  		}
da0595ae91da837 Ramalingam C     2022-04-05  723  
da0595ae91da837 Ramalingam C     2022-04-05  724  		/*
da0595ae91da837 Ramalingam C     2022-04-05  725  		 * When there is a eviction of ccs needed smem will have the
da0595ae91da837 Ramalingam C     2022-04-05  726  		 * extra pages for the ccs data
da0595ae91da837 Ramalingam C     2022-04-05  727  		 *
da0595ae91da837 Ramalingam C     2022-04-05  728  		 * TO-DO: Want to move the size mismatch check to a WARN_ON,
da0595ae91da837 Ramalingam C     2022-04-05  729  		 * but still we have some requests of smem->lmem with same size.
da0595ae91da837 Ramalingam C     2022-04-05  730  		 * Need to fix it.
da0595ae91da837 Ramalingam C     2022-04-05  731  		 */
da0595ae91da837 Ramalingam C     2022-04-05  732  		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
da0595ae91da837 Ramalingam C     2022-04-05  733  		if (ccs_bytes_to_cpy)
da0595ae91da837 Ramalingam C     2022-04-05  734  			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
da0595ae91da837 Ramalingam C     2022-04-05  735  	}
da0595ae91da837 Ramalingam C     2022-04-05  736  
353819d85f87be4 Matthew Auld     2022-07-27  737  	overwrite_ccs = HAS_FLAT_CCS(i915) && !ccs_bytes_to_cpy && dst_is_lmem;
353819d85f87be4 Matthew Auld     2022-07-27  738  
6e6bc8c0a815768 Ramalingam C     2022-04-05  739  	src_offset = 0;
6e6bc8c0a815768 Ramalingam C     2022-04-05  740  	dst_offset = CHUNK_SZ;
6e6bc8c0a815768 Ramalingam C     2022-04-05  741  	if (HAS_64K_PAGES(ce->engine->i915)) {
6e6bc8c0a815768 Ramalingam C     2022-04-05  742  		src_offset = 0;
6e6bc8c0a815768 Ramalingam C     2022-04-05  743  		dst_offset = 0;
6e6bc8c0a815768 Ramalingam C     2022-04-05  744  		if (src_is_lmem)
6e6bc8c0a815768 Ramalingam C     2022-04-05  745  			src_offset = CHUNK_SZ;
6e6bc8c0a815768 Ramalingam C     2022-04-05  746  		if (dst_is_lmem)
6e6bc8c0a815768 Ramalingam C     2022-04-05  747  			dst_offset = 2 * CHUNK_SZ;
6e6bc8c0a815768 Ramalingam C     2022-04-05  748  	}
6e6bc8c0a815768 Ramalingam C     2022-04-05  749  
cf586021642d801 Chris Wilson     2021-06-17  750  	do {
cf586021642d801 Chris Wilson     2021-06-17  751  		int len;
cf586021642d801 Chris Wilson     2021-06-17  752  
cf586021642d801 Chris Wilson     2021-06-17  753  		rq = i915_request_create(ce);
cf586021642d801 Chris Wilson     2021-06-17  754  		if (IS_ERR(rq)) {
cf586021642d801 Chris Wilson     2021-06-17  755  			err = PTR_ERR(rq);
cf586021642d801 Chris Wilson     2021-06-17  756  			goto out_ce;
cf586021642d801 Chris Wilson     2021-06-17  757  		}
cf586021642d801 Chris Wilson     2021-06-17  758  
1193081710b361d Thomas Hellström 2021-12-21  759  		if (deps) {
1193081710b361d Thomas Hellström 2021-12-21  760  			err = i915_request_await_deps(rq, deps);
cf586021642d801 Chris Wilson     2021-06-17  761  			if (err)
cf586021642d801 Chris Wilson     2021-06-17  762  				goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  763  
cf586021642d801 Chris Wilson     2021-06-17  764  			if (rq->engine->emit_init_breadcrumb) {
cf586021642d801 Chris Wilson     2021-06-17  765  				err = rq->engine->emit_init_breadcrumb(rq);
cf586021642d801 Chris Wilson     2021-06-17  766  				if (err)
cf586021642d801 Chris Wilson     2021-06-17  767  					goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  768  			}
cf586021642d801 Chris Wilson     2021-06-17  769  
1193081710b361d Thomas Hellström 2021-12-21  770  			deps = NULL;
cf586021642d801 Chris Wilson     2021-06-17  771  		}
cf586021642d801 Chris Wilson     2021-06-17  772  
cf586021642d801 Chris Wilson     2021-06-17  773  		/* The PTE updates + copy must not be interrupted. */
cf586021642d801 Chris Wilson     2021-06-17  774  		err = emit_no_arbitration(rq);
cf586021642d801 Chris Wilson     2021-06-17  775  		if (err)
cf586021642d801 Chris Wilson     2021-06-17  776  			goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  777  
8676145eb2f53a9 Matthew Auld     2022-08-05  778  		src_sz = calculate_chunk_sz(i915, src_is_lmem,
da0595ae91da837 Ramalingam C     2022-04-05  779  					    bytes_to_cpy, ccs_bytes_to_cpy);
da0595ae91da837 Ramalingam C     2022-04-05  780  
9275277d53248d3 Fei Yang         2023-05-09  781  		len = emit_pte(rq, &it_src, src_pat_index, src_is_lmem,
da0595ae91da837 Ramalingam C     2022-04-05  782  			       src_offset, src_sz);
310bf25df2fcccc Ramalingam C     2022-04-05  783  		if (!len) {
310bf25df2fcccc Ramalingam C     2022-04-05  784  			err = -EINVAL;
310bf25df2fcccc Ramalingam C     2022-04-05  785  			goto out_rq;
310bf25df2fcccc Ramalingam C     2022-04-05  786  		}
310bf25df2fcccc Ramalingam C     2022-04-05  787  		if (len < 0) {
cf586021642d801 Chris Wilson     2021-06-17  788  			err = len;
cf586021642d801 Chris Wilson     2021-06-17  789  			goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  790  		}
cf586021642d801 Chris Wilson     2021-06-17  791  
9275277d53248d3 Fei Yang         2023-05-09  792  		err = emit_pte(rq, &it_dst, dst_pat_index, dst_is_lmem,
00e27ad85bc9842 Matthew Auld     2022-02-19  793  			       dst_offset, len);
cf586021642d801 Chris Wilson     2021-06-17  794  		if (err < 0)
cf586021642d801 Chris Wilson     2021-06-17  795  			goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  796  		if (err < len) {
cf586021642d801 Chris Wilson     2021-06-17  797  			err = -EINVAL;
cf586021642d801 Chris Wilson     2021-06-17  798  			goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  799  		}
cf586021642d801 Chris Wilson     2021-06-17  800  
cf586021642d801 Chris Wilson     2021-06-17  801  		err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
cf586021642d801 Chris Wilson     2021-06-17  802  		if (err)
cf586021642d801 Chris Wilson     2021-06-17  803  			goto out_rq;
cf586021642d801 Chris Wilson     2021-06-17  804  
00e27ad85bc9842 Matthew Auld     2022-02-19  805  		err = emit_copy(rq, dst_offset,	src_offset, len);
da0595ae91da837 Ramalingam C     2022-04-05  806  		if (err)
da0595ae91da837 Ramalingam C     2022-04-05  807  			goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  808  
da0595ae91da837 Ramalingam C     2022-04-05  809  		bytes_to_cpy -= len;
da0595ae91da837 Ramalingam C     2022-04-05  810  
da0595ae91da837 Ramalingam C     2022-04-05  811  		if (ccs_bytes_to_cpy) {
b8c9d486af7b462 Ramalingam C     2022-05-02  812  			int ccs_sz;
b8c9d486af7b462 Ramalingam C     2022-05-02  813  
da0595ae91da837 Ramalingam C     2022-04-05  814  			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
da0595ae91da837 Ramalingam C     2022-04-05  815  			if (err)
da0595ae91da837 Ramalingam C     2022-04-05  816  				goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  817  
b8c9d486af7b462 Ramalingam C     2022-05-02  818  			ccs_sz = GET_CCS_BYTES(i915, len);
9275277d53248d3 Fei Yang         2023-05-09 @819  			err = emit_pte(rq, &it_ccs, ccs_pat_index, false,
da0595ae91da837 Ramalingam C     2022-04-05  820  				       ccs_is_src ? src_offset : dst_offset,
da0595ae91da837 Ramalingam C     2022-04-05  821  				       ccs_sz);
b8c9d486af7b462 Ramalingam C     2022-05-02  822  			if (err < 0)
b8c9d486af7b462 Ramalingam C     2022-05-02  823  				goto out_rq;
b8c9d486af7b462 Ramalingam C     2022-05-02  824  			if (err < ccs_sz) {
b8c9d486af7b462 Ramalingam C     2022-05-02  825  				err = -EINVAL;
b8c9d486af7b462 Ramalingam C     2022-05-02  826  				goto out_rq;
b8c9d486af7b462 Ramalingam C     2022-05-02  827  			}
da0595ae91da837 Ramalingam C     2022-04-05  828  
da0595ae91da837 Ramalingam C     2022-04-05  829  			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
da0595ae91da837 Ramalingam C     2022-04-05  830  			if (err)
da0595ae91da837 Ramalingam C     2022-04-05  831  				goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  832  
da0595ae91da837 Ramalingam C     2022-04-05  833  			err = emit_copy_ccs(rq, dst_offset, dst_access,
b8c9d486af7b462 Ramalingam C     2022-05-02  834  					    src_offset, src_access, len);
da0595ae91da837 Ramalingam C     2022-04-05  835  			if (err)
da0595ae91da837 Ramalingam C     2022-04-05  836  				goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  837  
da0595ae91da837 Ramalingam C     2022-04-05  838  			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
da0595ae91da837 Ramalingam C     2022-04-05  839  			if (err)
da0595ae91da837 Ramalingam C     2022-04-05  840  				goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  841  			ccs_bytes_to_cpy -= ccs_sz;
353819d85f87be4 Matthew Auld     2022-07-27  842  		} else if (overwrite_ccs) {
353819d85f87be4 Matthew Auld     2022-07-27  843  			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
353819d85f87be4 Matthew Auld     2022-07-27  844  			if (err)
353819d85f87be4 Matthew Auld     2022-07-27  845  				goto out_rq;
353819d85f87be4 Matthew Auld     2022-07-27  846  
b29d26fbcb86252 Matthew Auld     2022-12-12  847  			if (src_is_lmem) {
b29d26fbcb86252 Matthew Auld     2022-12-12  848  				/*
b29d26fbcb86252 Matthew Auld     2022-12-12  849  				 * If the src is already in lmem, then we must
b29d26fbcb86252 Matthew Auld     2022-12-12  850  				 * be doing an lmem -> lmem transfer, and so
b29d26fbcb86252 Matthew Auld     2022-12-12  851  				 * should be safe to directly copy the CCS
b29d26fbcb86252 Matthew Auld     2022-12-12  852  				 * state. In this case we have either
b29d26fbcb86252 Matthew Auld     2022-12-12  853  				 * initialised the CCS aux state when first
b29d26fbcb86252 Matthew Auld     2022-12-12  854  				 * clearing the pages (since it is already
b29d26fbcb86252 Matthew Auld     2022-12-12  855  				 * allocated in lmem), or the user has
b29d26fbcb86252 Matthew Auld     2022-12-12  856  				 * potentially populated it, in which case we
b29d26fbcb86252 Matthew Auld     2022-12-12  857  				 * need to copy the CCS state as-is.
b29d26fbcb86252 Matthew Auld     2022-12-12  858  				 */
b29d26fbcb86252 Matthew Auld     2022-12-12  859  				err = emit_copy_ccs(rq,
b29d26fbcb86252 Matthew Auld     2022-12-12  860  						    dst_offset, INDIRECT_ACCESS,
b29d26fbcb86252 Matthew Auld     2022-12-12  861  						    src_offset, INDIRECT_ACCESS,
b29d26fbcb86252 Matthew Auld     2022-12-12  862  						    len);
b29d26fbcb86252 Matthew Auld     2022-12-12  863  			} else {
353819d85f87be4 Matthew Auld     2022-07-27  864  				/*
b29d26fbcb86252 Matthew Auld     2022-12-12  865  				 * While we can't always restore/manage the CCS
b29d26fbcb86252 Matthew Auld     2022-12-12  866  				 * state, we still need to ensure we don't leak
b29d26fbcb86252 Matthew Auld     2022-12-12  867  				 * the CCS state from the previous user, so make
b29d26fbcb86252 Matthew Auld     2022-12-12  868  				 * sure we overwrite it with something.
353819d85f87be4 Matthew Auld     2022-07-27  869  				 */
b29d26fbcb86252 Matthew Auld     2022-12-12  870  				err = emit_copy_ccs(rq,
b29d26fbcb86252 Matthew Auld     2022-12-12  871  						    dst_offset, INDIRECT_ACCESS,
b29d26fbcb86252 Matthew Auld     2022-12-12  872  						    dst_offset, DIRECT_ACCESS,
b29d26fbcb86252 Matthew Auld     2022-12-12  873  						    len);
b29d26fbcb86252 Matthew Auld     2022-12-12  874  			}
b29d26fbcb86252 Matthew Auld     2022-12-12  875  
353819d85f87be4 Matthew Auld     2022-07-27  876  			if (err)
353819d85f87be4 Matthew Auld     2022-07-27  877  				goto out_rq;
353819d85f87be4 Matthew Auld     2022-07-27  878  
353819d85f87be4 Matthew Auld     2022-07-27  879  			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
353819d85f87be4 Matthew Auld     2022-07-27  880  			if (err)
353819d85f87be4 Matthew Auld     2022-07-27  881  				goto out_rq;
da0595ae91da837 Ramalingam C     2022-04-05  882  		}
cf586021642d801 Chris Wilson     2021-06-17  883  
cf586021642d801 Chris Wilson     2021-06-17  884  		/* Arbitration is re-enabled between requests. */
cf586021642d801 Chris Wilson     2021-06-17  885  out_rq:
cf586021642d801 Chris Wilson     2021-06-17  886  		if (*out)
cf586021642d801 Chris Wilson     2021-06-17  887  			i915_request_put(*out);
cf586021642d801 Chris Wilson     2021-06-17  888  		*out = i915_request_get(rq);
cf586021642d801 Chris Wilson     2021-06-17  889  		i915_request_add(rq);
da0595ae91da837 Ramalingam C     2022-04-05  890  
da0595ae91da837 Ramalingam C     2022-04-05  891  		if (err)
cf586021642d801 Chris Wilson     2021-06-17  892  			break;
cf586021642d801 Chris Wilson     2021-06-17  893  
da0595ae91da837 Ramalingam C     2022-04-05  894  		if (!bytes_to_cpy && !ccs_bytes_to_cpy) {
da0595ae91da837 Ramalingam C     2022-04-05  895  			if (src_is_lmem)
da0595ae91da837 Ramalingam C     2022-04-05  896  				WARN_ON(it_src.sg && sg_dma_len(it_src.sg));
da0595ae91da837 Ramalingam C     2022-04-05  897  			else
da0595ae91da837 Ramalingam C     2022-04-05  898  				WARN_ON(it_dst.sg && sg_dma_len(it_dst.sg));
da0595ae91da837 Ramalingam C     2022-04-05  899  			break;
da0595ae91da837 Ramalingam C     2022-04-05  900  		}
da0595ae91da837 Ramalingam C     2022-04-05  901  
da0595ae91da837 Ramalingam C     2022-04-05  902  		if (WARN_ON(!it_src.sg || !sg_dma_len(it_src.sg) ||
da0595ae91da837 Ramalingam C     2022-04-05  903  			    !it_dst.sg || !sg_dma_len(it_dst.sg) ||
da0595ae91da837 Ramalingam C     2022-04-05  904  			    (ccs_bytes_to_cpy && (!it_ccs.sg ||
da0595ae91da837 Ramalingam C     2022-04-05  905  						  !sg_dma_len(it_ccs.sg))))) {
da0595ae91da837 Ramalingam C     2022-04-05  906  			err = -EINVAL;
da0595ae91da837 Ramalingam C     2022-04-05  907  			break;
da0595ae91da837 Ramalingam C     2022-04-05  908  		}
da0595ae91da837 Ramalingam C     2022-04-05  909  
cf586021642d801 Chris Wilson     2021-06-17  910  		cond_resched();
cf586021642d801 Chris Wilson     2021-06-17  911  	} while (1);
cf586021642d801 Chris Wilson     2021-06-17  912  
cf586021642d801 Chris Wilson     2021-06-17  913  out_ce:
cf586021642d801 Chris Wilson     2021-06-17  914  	return err;
cf586021642d801 Chris Wilson     2021-06-17  915  }
cf586021642d801 Chris Wilson     2021-06-17  916  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

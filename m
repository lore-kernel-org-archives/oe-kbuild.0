Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891B1E491
	for <oe-kbuild@lists.linux.dev>; Tue, 14 May 2024 21:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715721484; cv=none; b=JcSVm6cTBB4wkd8i31ifo75peuaOPmWuXlnxCZghrBsXbw8XOz/UrwS+7evkeHxXt1TE1CSN6Nza6QBZQqIMI69WB1xXytYsyH5zg+9q1VNDWN4kH6XXsjm/8PGSdAawqKMxSu+idDE0Jh3Ki50hGOiXRh2H+nzBANpIgkRps/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715721484; c=relaxed/simple;
	bh=ocrx7EaXhOxNCoUcwdkXzcxxJnaaw4HzINAXbhPpNSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gm8F/Zg40xjVAn5GlHD0l/NHDeSfeCp+2l0yWl68m4pRtoE4TP2vR0D38ZqcPlhuh22yCW5RtxrxdB6r+UXzFvPSplgyLLWiESHAO9ODEHwymAplAJjiCObSE0SKiE0qBBG+wnQpBKnCjOWbk5dXRHndzyTGpk7J1sEk/wzJkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy7JO2BO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy7JO2BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715721483; x=1747257483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocrx7EaXhOxNCoUcwdkXzcxxJnaaw4HzINAXbhPpNSY=;
  b=Dy7JO2BOyso4X/er8b0GCrCovMay97wrVMmVOhuejg7rplmUcn9uTwCR
   mu0h0Qtf4BziYPbTU88HljGbGoNfhRBP8eiebQkylhaRPbS/K8KwuYjBP
   K34v6pLTgY/TBBr6e4wLPRHcGmV80o3ckR5zbrMyOQfcWC38i5cprkujG
   g9qA73sE9IocqSvjWExazS7b860RKTdNySDydjcf5ZtKzJEXIbxNSca/z
   EH2r3LQtU5I7dV3hrceJ70Tz6ToH8lFE1ZV1L95XlkxmIt7XY96WcySTY
   /52uAUqfc4uBEP8I0Ir4UbCzzBSUCVSvm6EAFt5re2t3lf06V4U1J0O56
   w==;
X-CSE-ConnectionGUID: dmICjcIeQJmhxfJYZEivQw==
X-CSE-MsgGUID: gVp2XcGaT6yNOiwfUnVWPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11681398"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11681398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 14:18:03 -0700
X-CSE-ConnectionGUID: Di+lu2cbTkOuIdlWjLGJTg==
X-CSE-MsgGUID: yUbs4WvwTyuNe21O2n4gQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="35605085"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 May 2024 14:18:01 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6zX4-000C1T-0v;
	Tue, 14 May 2024 21:17:58 +0000
Date: Wed, 15 May 2024 05:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [goldwynr:iomap.2 3/32] fs/iomap/buffered-io.c:426
 iomap_read_encoded() error: we previously assumed 'ctx->ops' could be null
 (see line 395)
Message-ID: <202405150541.8zhPcUkQ-lkp@intel.com>
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
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>

tree:   https://github.com/goldwynr/linux iomap.2
head:   7defcedce6c031c95fa753060462301bd623163f
commit: 1bc69b67cc4890a9f5afb4ac4f3ba3f14fb287da [3/32] iomap: Introduce IOMAP_ENCODED
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: xtensa-randconfig-r071-20240514 (https://download.01.org/0day-ci/archive/20240515/202405150541.8zhPcUkQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405150541.8zhPcUkQ-lkp@intel.com/

New smatch warnings:
fs/iomap/buffered-io.c:426 iomap_read_encoded() error: we previously assumed 'ctx->ops' could be null (see line 395)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +426 fs/iomap/buffered-io.c

009d8d849d3ff5 Christoph Hellwig 2019-10-17  372  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  373  static loff_t
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  374  iomap_read_encoded(const struct iomap_iter *iter, struct iomap_readpage_ctx *ctx)
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  375  {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  376  	struct folio *folio;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  377  	const struct iomap *iomap = &iter->iomap;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  378  	struct address_space *mapping = iter->inode->i_mapping;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  379  	pgoff_t index = iomap->offset >> PAGE_SHIFT;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  380  	pgoff_t end_index = (iomap->offset + iomap->length + PAGE_SIZE - 1) >> PAGE_SHIFT;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  381  	pgoff_t ra_index = -1, ra_end_index = 0;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  382  	gfp_t gfp = mapping_gfp_constraint(mapping, GFP_KERNEL);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  383  	struct bio *bio;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  384  	struct bio_set *bioset;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  385  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  386  	WARN_ON(ctx->cur_folio && (ctx->cur_folio->index > end_index ||
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  387  			ctx->cur_folio->index < index));
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  388  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  389  	/* If there is already a bio in progress, submit it first */
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  390  	if (ctx->bio) {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  391  		ctx->ops->submit_io(iter->inode, ctx->bio, iter->pos, false);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  392  		ctx->bio = NULL;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  393  	}
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  394  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31 @395  	if (ctx->ops && ctx->ops->bio_set)
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  396  		bioset = ctx->ops->bio_set;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  397  	else
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  398  		bioset = &fs_bio_set;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  399  	bio = bio_alloc_bioset(iomap->bdev, end_index - index + 1,
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  400  			REQ_OP_READ, gfp, bioset);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  401  	bio->bi_iter.bi_sector = iomap_sector(iomap, iomap->offset);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  402  	bio->bi_end_io = iomap_read_end_io;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  403  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  404  	if (ctx->rac) {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  405  		ra_index = readahead_index(ctx->rac);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  406  		ra_end_index = ra_index + readahead_count(ctx->rac);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  407  	}
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  408  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  409  	while (index < end_index) {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  410  		if (ctx->cur_folio && index == ctx->cur_folio->index) {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  411  			folio = ctx->cur_folio;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  412  			ctx->cur_folio = NULL;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  413  			ctx->cur_folio_in_bio = true;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  414  		} else if (index >= ra_index && index < ra_end_index) {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  415  			do {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  416  				folio = readahead_folio(ctx->rac);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  417  			} while (folio->index < index);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  418  			ra_index = readahead_index(ctx->rac);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  419  		} else {
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  420  			folio = filemap_grab_folio(mapping, index);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  421  		}
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  422  		bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  423  		index++;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  424  	}
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  425  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31 @426  	ctx->ops->submit_io(iter->inode, bio, iomap->offset, true);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  427  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  428  	return iomap->length - (iter->pos - iomap->offset);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  429  }
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  430  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

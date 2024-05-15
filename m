Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052C556458
	for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764368; cv=none; b=A1J1yFA31gcyPLg2ghgy7Y5caW1i9L3GJdrgjO0eHdjYyHdEZYcRVZSkrgYnL9LaQTeLdIsEKYZjsfaV4d78JrLoE3kIif2j4ZtgI0AwJqluwc1+kKHUfHVujLxnEE9iLdEaflYhugCmERzvRPbM+UpiM2iE45l7WVtBpdcY77g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764368; c=relaxed/simple;
	bh=4/9GuGJajK62ln1Cgzoxm9kfJbOPYOE76TLssq0WiBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hd+bFPGA/reTKvKBD/BPqHoziXMg6qqnw+SC2BIZIPlHgjcE9gBdNgdyIewjujTY0/PasRlArzUM/jtOn8FJvoQTI9ex/ToxOSQSdi/ITlAUzr5WCpQDjwb26g5oAwsfP0JX1bHdayet8Gi91H9pwKqGp9UTt9PkmkEVbws0Z4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBOFBwqv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBOFBwqv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41fd5dc04e2so40477285e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 15 May 2024 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715764364; x=1716369164; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLJ6MaE2DFoqwFNpytnmQOglGif20+pmWBjl4rnHlI4=;
        b=JBOFBwqv6UNzTOrRU7dgbU76jXa5MCAklqu31bkPDePYTigS6HvhS+UfcsVw104QGy
         w4h13Oy9Lc/GqeGYHsg5lIS+IIfcvLg+OdtZ6D9RannRmXAcxcD0OCscUGSdHDuYU2Uc
         fApvVbEqTtGIUyBXZPS6aUhYwMW/tDDQwmcIvDFIGhVl9eYTBS77NjOSBC5cXCvSZdao
         vsFQc0tARR1/NXNDHWaFnYHD+bX9gwkHdXSqFF/vJRXzREB9sQ3k3H652s+5KpHBYA2k
         CVnR2nqN6lcqW5Q/V9EoorrIm9iaQTbV70owrF3RCRSqinNr84sbh8V+JOBzjkoEk1uE
         lILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764364; x=1716369164;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLJ6MaE2DFoqwFNpytnmQOglGif20+pmWBjl4rnHlI4=;
        b=aGW6HOa5hCguHeXxf9P37A5vhhFbDFlFoEr9bMy2gO/rtDpPQrCmmR5n/kvEGx9UUN
         lF0treomsxWkKDuewNUlXxFrkghBXtztCvAEpXjmaKo6yeMhGH4PrLkIoounIx7B2xcf
         vbluESxiD85EPujkLbdirGHr6Ch2ai++ZnAHc3sjead0PKF3H7EyPi1AhiZA2WpMXSMs
         v3tNFPSDCjFoooYmh9HRVgC+Fuj8+IRnTA6ckClkhZsKj7+FDSt6/11mMqzGhBvGFxsJ
         IzAx4G/azeiW8Y1z/sXXt4BKLRo1teIvhGj+j7nIuRBEDghMpDK80dN37XAcWwxEqjtT
         K80g==
X-Gm-Message-State: AOJu0YxqnrAwrWMNjLHu0ry8sJc3/0LZk5+86JNK2xowxpBiw10JRAN/
	B6Jk8V6mC0PuhPyB8lPiooA8glp7EaAGzQwOmIfmwVME8jOiVJvQ/tvDsKx+YaaktIUl7BfoqwR
	0
X-Google-Smtp-Source: AGHT+IGEa2KHmbNQaLbKQuZWN9MPKzrVilJvm2BuQQNtMvWoemXU512v52+B+6U+vQtLRz5tz1Q3bA==
X-Received: by 2002:a05:600c:314e:b0:41b:4443:9e10 with SMTP id 5b1f17b1804b1-41feac63467mr100360905e9.29.1715764363541;
        Wed, 15 May 2024 02:12:43 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24c0sm225719355e9.17.2024.05.15.02.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:12:42 -0700 (PDT)
Date: Wed, 15 May 2024 11:12:38 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:iomap.2 3/32] fs/iomap/buffered-io.c:426
 iomap_read_encoded() error: we previously assumed 'ctx->ops' could be null
 (see line 395)
Message-ID: <fb3910cc-2691-488b-823b-7ebcb0b31a64@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux iomap.2
head:   7defcedce6c031c95fa753060462301bd623163f
commit: 1bc69b67cc4890a9f5afb4ac4f3ba3f14fb287da [3/32] iomap: Introduce IOMAP_ENCODED
config: xtensa-randconfig-r071-20240514 (https://download.01.org/0day-ci/archive/20240515/202405150541.8zhPcUkQ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405150541.8zhPcUkQ-lkp@intel.com/

New smatch warnings:
fs/iomap/buffered-io.c:426 iomap_read_encoded() error: we previously assumed 'ctx->ops' could be null (see line 395)

vim +426 fs/iomap/buffered-io.c

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
                                                                ^^^^^^^^^^
Unchecked dereference

1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  392  		ctx->bio = NULL;
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  393  	}
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  394  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31 @395  	if (ctx->ops && ctx->ops->bio_set)
                                                            ^^^^^^^^
Check for NULL.  Is this necessary?

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
                                                        ^^^^^^^^^^
Unchecked dereference

1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  427  
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  428  	return iomap->length - (iter->pos - iomap->offset);
1bc69b67cc4890 Goldwyn Rodrigues 2023-01-31  429  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


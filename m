Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2D2F9CC
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 05:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710135193; cv=none; b=phgtBmQphdFx559uGvhZLrmI2IuW48ZVAQhxeJX5nH7mlVC0oPJbDaEbA/E1LONUDRBPN+xaWfUi1VXhmrd7Xb945dinLre2X2Lhq3GDfsO1gQpCv3uagYruHTLrgt7/KZxrzwQY6PKrucHa1pFURiQC0JmRX0UJX+cdzX2cSH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710135193; c=relaxed/simple;
	bh=1bSfqQ/uU1vXRPMnsFGLGOBy4UiEfMrETUIHFdoryXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crSfdrcSZK/PFgdieMfhUwxT/V6YttaDeXoIlAshqI3fwd94Ikmvg/fvy5K4ueIYaCTEilkCy5HXW5S1v+JOo0dO8FViKSI+0jF7/Tn5H4nxzLVmUQth17oXRhYV9aPHj3Csp9cG0+59Q/YUtiEqQ3NwBwyg8E37p5rjniPv4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JPvM/a4V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JPvM/a4V"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4131b1f8c91so17066935e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 22:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710135188; x=1710739988; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nueGqSA9iP5exIyeGBujnvloVKsmf9+CwtWJlWW3bCg=;
        b=JPvM/a4VcyWgHIQjqA13lbP48fK7c2eS6iO8KKRgrh2kJ++FRTuyfJVJSIANmRYJe3
         PC1UvabXHV6EHKBYOmjO+J6jLEtg/JBg+/vh7zxqv8VDIf3tT6qqykfVG7fcOGKi0vl0
         4ecmgYXL5v5vissHYPXlH7BoSBYNXmbbPMSjEL/eqPfCn48KWGY75ndXwuFuCpv+iHIA
         hUfM3a1ffFP1mmdi8h6EeHThCApkRVMboWKmvRbgLj7FMRoZoFkRXgS+TazYg3+HkOK5
         sRcvuVL/jBihknkD9goWBkuElD0nFaCCdikJp3e1JBOVm5bbtMSjYwd//FV2UltA8FPn
         dyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710135188; x=1710739988;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nueGqSA9iP5exIyeGBujnvloVKsmf9+CwtWJlWW3bCg=;
        b=EvMmkCXznwlJX59b/UcLfzB1Oy2WaVjsZpQ7fjfmzsAL301SqUB+ZqpgIxcrSux86/
         8Nl9nhDZ/r+Om16RUV99zAChQYhIT+bXpugmOai0uewCF/Ok900Qo45MUnAy5DsjSlGi
         nSEDqiIDmSRIEhHCaIFIHG+lr9wviQysdBKoKWxSxW1EHwc4dtdcF9zYn8XzMFzmj+c2
         uVygpEw7zixM8f1XHhrIo4KmuOyAEWDqp7Thsu6latF69cimZEjaFvFY3yWqaeWblOPG
         1V0DCJQp5KUdJkq46XTrN8ruETAYyrviL0QMdoAOWOB5wBU6d4NvSoEgugZRSQqw/+qW
         hPsg==
X-Gm-Message-State: AOJu0YyGiCVg8jiDyXmvEHUqYuFZj4gY0ROMj+GJKlmqaTTmD5yd0OKG
	TRPoXrkhBQHYXo8vEi2RdEHwKeyYqJm2y/wYf/D3p0bq1CLK7s4WuTUSGZW281HJZILru9yhWwI
	n
X-Google-Smtp-Source: AGHT+IGcmxbRVUQmyGvmc+Ldf9LGaskWiDGtUEb3QTr7lz6qKFfIJm+VGhdzhwj8+PRCU89r24qBVQ==
X-Received: by 2002:a05:600c:1c13:b0:412:abfd:2c0e with SMTP id j19-20020a05600c1c1300b00412abfd2c0emr5188462wms.41.1710135187385;
        Sun, 10 Mar 2024 22:33:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c310d00b004131bb71c07sm7755280wmo.11.2024.03.10.22.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:33:07 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:33:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 7/37] fs/verity/verify.c:208
 verify_data_block() error: uninitialized symbol 'err'.
Message-ID: <f9e79efc-a16f-495d-8e53-d5a9eef5936e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   16654e84b3e67ad84f5461574994b653c849406d
commit: aeaffdfa6a9871c1ad1ecd755664ecfe5d8a51dc [7/37] fsverity: support block-based Merkle tree caching
config: i386-randconfig-141-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101516.ySR7iu7Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403101516.ySR7iu7Z-lkp@intel.com/

smatch warnings:
fs/verity/verify.c:208 verify_data_block() error: uninitialized symbol 'err'.

vim +/err +208 fs/verity/verify.c

5306892a50bf4c Eric Biggers       2022-12-23  100  static bool
5306892a50bf4c Eric Biggers       2022-12-23  101  verify_data_block(struct inode *inode, struct fsverity_info *vi,
8fcd94add6c5c9 Eric Biggers       2023-05-15  102  		  const void *data, u64 data_pos, unsigned long max_ra_pages)
8a1d0f9cacc997 Eric Biggers       2019-07-22  103  {
8a1d0f9cacc997 Eric Biggers       2019-07-22  104  	const struct merkle_tree_params *params = &vi->tree_params;
8a1d0f9cacc997 Eric Biggers       2019-07-22  105  	const unsigned int hsize = params->digest_size;
8a1d0f9cacc997 Eric Biggers       2019-07-22  106  	int level;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  107  	int err;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  108  	int num_ra_pages;
8a1d0f9cacc997 Eric Biggers       2019-07-22  109  	u8 _want_hash[FS_VERITY_MAX_DIGEST_SIZE];
8a1d0f9cacc997 Eric Biggers       2019-07-22  110  	const u8 *want_hash;
8a1d0f9cacc997 Eric Biggers       2019-07-22  111  	u8 real_hash[FS_VERITY_MAX_DIGEST_SIZE];
5306892a50bf4c Eric Biggers       2022-12-23  112  	/* The hash blocks that are traversed, indexed by level */
5306892a50bf4c Eric Biggers       2022-12-23  113  	struct {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  114  		/* Buffer containing the hash block */
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  115  		struct fsverity_blockbuf block;
5306892a50bf4c Eric Biggers       2022-12-23  116  		/* Index of the hash block in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  117  		unsigned long index;
8fcd94add6c5c9 Eric Biggers       2023-05-15  118  		/* Byte offset of the wanted hash relative to @addr */
5306892a50bf4c Eric Biggers       2022-12-23  119  		unsigned int hoffset;
5306892a50bf4c Eric Biggers       2022-12-23  120  	} hblocks[FS_VERITY_MAX_LEVELS];
5306892a50bf4c Eric Biggers       2022-12-23  121  	/*
5306892a50bf4c Eric Biggers       2022-12-23  122  	 * The index of the previous level's block within that level; also the
5306892a50bf4c Eric Biggers       2022-12-23  123  	 * index of that block's hash within the current level.
5306892a50bf4c Eric Biggers       2022-12-23  124  	 */
5306892a50bf4c Eric Biggers       2022-12-23  125  	u64 hidx = data_pos >> params->log_blocksize;
8a1d0f9cacc997 Eric Biggers       2019-07-22  126  
8fcd94add6c5c9 Eric Biggers       2023-05-15  127  	/* Up to 1 + FS_VERITY_MAX_LEVELS pages may be mapped at once */
8fcd94add6c5c9 Eric Biggers       2023-05-15  128  	BUILD_BUG_ON(1 + FS_VERITY_MAX_LEVELS > KM_MAX_IDX);
8fcd94add6c5c9 Eric Biggers       2023-05-15  129  
5306892a50bf4c Eric Biggers       2022-12-23  130  	if (unlikely(data_pos >= inode->i_size)) {
5306892a50bf4c Eric Biggers       2022-12-23  131  		/*
5306892a50bf4c Eric Biggers       2022-12-23  132  		 * This can happen in the data page spanning EOF when the Merkle
5306892a50bf4c Eric Biggers       2022-12-23  133  		 * tree block size is less than the page size.  The Merkle tree
5306892a50bf4c Eric Biggers       2022-12-23  134  		 * doesn't cover data blocks fully past EOF.  But the entire
5306892a50bf4c Eric Biggers       2022-12-23  135  		 * page spanning EOF can be visible to userspace via a mmap, and
5306892a50bf4c Eric Biggers       2022-12-23  136  		 * any part past EOF should be all zeroes.  Therefore, we need
5306892a50bf4c Eric Biggers       2022-12-23  137  		 * to verify that any data blocks fully past EOF are all zeroes.
5306892a50bf4c Eric Biggers       2022-12-23  138  		 */
8fcd94add6c5c9 Eric Biggers       2023-05-15  139  		if (memchr_inv(data, 0, params->block_size)) {
8fcd94add6c5c9 Eric Biggers       2023-05-15  140  			fsverity_err(inode,
8fcd94add6c5c9 Eric Biggers       2023-05-15  141  				     "FILE CORRUPTED!  Data past EOF is not zeroed");
8fcd94add6c5c9 Eric Biggers       2023-05-15  142  			return false;
8fcd94add6c5c9 Eric Biggers       2023-05-15  143  		}
8fcd94add6c5c9 Eric Biggers       2023-05-15  144  		return true;
5306892a50bf4c Eric Biggers       2022-12-23  145  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  146  
8a1d0f9cacc997 Eric Biggers       2019-07-22  147  	/*
5306892a50bf4c Eric Biggers       2022-12-23  148  	 * Starting at the leaf level, ascend the tree saving hash blocks along
5306892a50bf4c Eric Biggers       2022-12-23  149  	 * the way until we find a hash block that has already been verified, or
5306892a50bf4c Eric Biggers       2022-12-23  150  	 * until we reach the root.
8a1d0f9cacc997 Eric Biggers       2019-07-22  151  	 */
8a1d0f9cacc997 Eric Biggers       2019-07-22  152  	for (level = 0; level < params->num_levels; level++) {
5306892a50bf4c Eric Biggers       2022-12-23  153  		unsigned long next_hidx;
5306892a50bf4c Eric Biggers       2022-12-23  154  		unsigned long hblock_idx;
5306892a50bf4c Eric Biggers       2022-12-23  155  		pgoff_t hpage_idx;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  156  		u64 hblock_pos;
5306892a50bf4c Eric Biggers       2022-12-23  157  		unsigned int hblock_offset_in_page;
8a1d0f9cacc997 Eric Biggers       2019-07-22  158  		unsigned int hoffset;
8a1d0f9cacc997 Eric Biggers       2019-07-22  159  		struct page *hpage;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  160  		struct fsverity_blockbuf *block = &hblocks[level].block;
8a1d0f9cacc997 Eric Biggers       2019-07-22  161  
5306892a50bf4c Eric Biggers       2022-12-23  162  		/*
5306892a50bf4c Eric Biggers       2022-12-23  163  		 * The index of the block in the current level; also the index
5306892a50bf4c Eric Biggers       2022-12-23  164  		 * of that block's hash within the next level.
5306892a50bf4c Eric Biggers       2022-12-23  165  		 */
5306892a50bf4c Eric Biggers       2022-12-23  166  		next_hidx = hidx >> params->log_arity;
5306892a50bf4c Eric Biggers       2022-12-23  167  
5306892a50bf4c Eric Biggers       2022-12-23  168  		/* Index of the hash block in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  169  		hblock_idx = params->level_start[level] + next_hidx;
8a1d0f9cacc997 Eric Biggers       2019-07-22  170  
5306892a50bf4c Eric Biggers       2022-12-23  171  		/* Index of the hash page in the tree overall */
5306892a50bf4c Eric Biggers       2022-12-23  172  		hpage_idx = hblock_idx >> params->log_blocks_per_page;
5306892a50bf4c Eric Biggers       2022-12-23  173  
5306892a50bf4c Eric Biggers       2022-12-23  174  		/* Byte offset of the hash block within the page */
5306892a50bf4c Eric Biggers       2022-12-23  175  		hblock_offset_in_page =
5306892a50bf4c Eric Biggers       2022-12-23  176  			(hblock_idx << params->log_blocksize) & ~PAGE_MASK;
5306892a50bf4c Eric Biggers       2022-12-23  177  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  178  		/* Offset of the Merkle tree block into the tree */
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  179  		hblock_pos = hblock_idx << params->log_blocksize;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  180  
8fcd94add6c5c9 Eric Biggers       2023-05-15  181  		/* Byte offset of the hash within the block */
8fcd94add6c5c9 Eric Biggers       2023-05-15  182  		hoffset = (hidx << params->log_digestsize) &
8fcd94add6c5c9 Eric Biggers       2023-05-15  183  			  (params->block_size - 1);
5306892a50bf4c Eric Biggers       2022-12-23  184  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  185  		num_ra_pages = level == 0 ?
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  186  			min(max_ra_pages, params->tree_pages - hpage_idx) : 0;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  187  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  188  		if (inode->i_sb->s_vop->read_merkle_tree_block) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  189  			err = inode->i_sb->s_vop->read_merkle_tree_block(
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  190  				inode, hblock_pos, block, params->log_blocksize,
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  191  				num_ra_pages);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  192  		} else {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  193  			unsigned int blocks_per_page =
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  194  				vi->tree_params.blocks_per_page;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  195  			hblock_idx = round_down(hblock_idx, blocks_per_page);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  196  			hpage = inode->i_sb->s_vop->read_merkle_tree_page(
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  197  				inode, hpage_idx, (num_ra_pages << PAGE_SHIFT));
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  198  
8a1d0f9cacc997 Eric Biggers       2019-07-22  199  			if (IS_ERR(hpage)) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  200  				err = PTR_ERR(hpage);
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  201  			} else {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  202  				block->kaddr = kmap_local_page(hpage) +
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  203  					hblock_offset_in_page;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  204  				block->context = hpage;

err not set on this else path

aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  205  			}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  206  		}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  207  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28 @208  		if (err) {
8a1d0f9cacc997 Eric Biggers       2019-07-22  209  			fsverity_err(inode,
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  210  				     "Error %d reading Merkle tree block %lu",
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  211  				     err, hblock_idx);
13e2408d02dd12 Eric Biggers       2023-06-03  212  			goto error;
8a1d0f9cacc997 Eric Biggers       2019-07-22  213  		}
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  214  
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  215  		if (is_hash_block_verified(inode, block, hblock_idx)) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  216  			memcpy(_want_hash, block->kaddr + hoffset, hsize);
8a1d0f9cacc997 Eric Biggers       2019-07-22  217  			want_hash = _want_hash;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  218  			fsverity_drop_block(inode, block);
8a1d0f9cacc997 Eric Biggers       2019-07-22  219  			goto descend;
8a1d0f9cacc997 Eric Biggers       2019-07-22  220  		}
5306892a50bf4c Eric Biggers       2022-12-23  221  		hblocks[level].index = hblock_idx;
5306892a50bf4c Eric Biggers       2022-12-23  222  		hblocks[level].hoffset = hoffset;
5306892a50bf4c Eric Biggers       2022-12-23  223  		hidx = next_hidx;
8a1d0f9cacc997 Eric Biggers       2019-07-22  224  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  225  
8a1d0f9cacc997 Eric Biggers       2019-07-22  226  	want_hash = vi->root_hash;
8a1d0f9cacc997 Eric Biggers       2019-07-22  227  descend:
f45555bf23cfc6 Eric Biggers       2022-12-23  228  	/* Descend the tree verifying hash blocks. */
8a1d0f9cacc997 Eric Biggers       2019-07-22  229  	for (; level > 0; level--) {
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  230  		struct fsverity_blockbuf *block = &hblocks[level - 1].block;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  231  		const void *haddr = block->kaddr;
5306892a50bf4c Eric Biggers       2022-12-23  232  		unsigned long hblock_idx = hblocks[level - 1].index;
5306892a50bf4c Eric Biggers       2022-12-23  233  		unsigned int hoffset = hblocks[level - 1].hoffset;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  234  		struct page *hpage = (struct page *)block->context;
8a1d0f9cacc997 Eric Biggers       2019-07-22  235  
13e2408d02dd12 Eric Biggers       2023-06-03  236  		if (fsverity_hash_block(params, inode, haddr, real_hash) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  237  			goto error;
13e2408d02dd12 Eric Biggers       2023-06-03  238  		if (memcmp(want_hash, real_hash, hsize) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  239  			goto corrupted;
5306892a50bf4c Eric Biggers       2022-12-23  240  		/*
5306892a50bf4c Eric Biggers       2022-12-23  241  		 * Mark the hash block as verified.  This must be atomic and
5306892a50bf4c Eric Biggers       2022-12-23  242  		 * idempotent, as the same hash block might be verified by
5306892a50bf4c Eric Biggers       2022-12-23  243  		 * multiple threads concurrently.
5306892a50bf4c Eric Biggers       2022-12-23  244  		 */
5306892a50bf4c Eric Biggers       2022-12-23  245  		if (vi->hash_block_verified)
5306892a50bf4c Eric Biggers       2022-12-23  246  			set_bit(hblock_idx, vi->hash_block_verified);
5306892a50bf4c Eric Biggers       2022-12-23  247  		else
8a1d0f9cacc997 Eric Biggers       2019-07-22  248  			SetPageChecked(hpage);
8fcd94add6c5c9 Eric Biggers       2023-05-15  249  		memcpy(_want_hash, haddr + hoffset, hsize);
8a1d0f9cacc997 Eric Biggers       2019-07-22  250  		want_hash = _want_hash;
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  251  		fsverity_drop_block(inode, block);
8a1d0f9cacc997 Eric Biggers       2019-07-22  252  	}
8a1d0f9cacc997 Eric Biggers       2019-07-22  253  
f45555bf23cfc6 Eric Biggers       2022-12-23  254  	/* Finally, verify the data block. */
13e2408d02dd12 Eric Biggers       2023-06-03  255  	if (fsverity_hash_block(params, inode, data, real_hash) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  256  		goto error;
13e2408d02dd12 Eric Biggers       2023-06-03  257  	if (memcmp(want_hash, real_hash, hsize) != 0)
13e2408d02dd12 Eric Biggers       2023-06-03  258  		goto corrupted;
13e2408d02dd12 Eric Biggers       2023-06-03  259  	return true;
13e2408d02dd12 Eric Biggers       2023-06-03  260  
13e2408d02dd12 Eric Biggers       2023-06-03  261  corrupted:
13e2408d02dd12 Eric Biggers       2023-06-03  262  	fsverity_err(inode,
13e2408d02dd12 Eric Biggers       2023-06-03  263  		     "FILE CORRUPTED! pos=%llu, level=%d, want_hash=%s:%*phN, real_hash=%s:%*phN",
13e2408d02dd12 Eric Biggers       2023-06-03  264  		     data_pos, level - 1,
13e2408d02dd12 Eric Biggers       2023-06-03  265  		     params->hash_alg->name, hsize, want_hash,
13e2408d02dd12 Eric Biggers       2023-06-03  266  		     params->hash_alg->name, hsize, real_hash);
13e2408d02dd12 Eric Biggers       2023-06-03  267  error:
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  268  	for (; level > 0; level--)
aeaffdfa6a9871 Andrey Albershteyn 2024-02-28  269  		fsverity_drop_block(inode, &hblocks[level - 1].block);
13e2408d02dd12 Eric Biggers       2023-06-03  270  	return false;
8a1d0f9cacc997 Eric Biggers       2019-07-22  271  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


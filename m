Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F23C47B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662659; cv=none; b=YviuftxCBKtasJIrMiNkg3xfMxiTnOT7olRyXoVxbzk/RwYxHngkJn6ddwXldeJ2e1XcFkZXW2w6G+dJouddUarAPt67qLbbAF7cM0eJJbPrOPhkNnrDAgRkfTWDnOby9uwiFS2vD7ILtg05zbmp1ATWdHvQoZs1u7WzBeB/zxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662659; c=relaxed/simple;
	bh=/xzSjiSdBXWGYK6ctLWTtVvDRWbjNfPwhb5OjXYpyrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EU0RW3awGVTClVdWwOiexLDF6NilbUM+Ahsn5n9cuT/a5L/R3Abz6CYCyp6VzLbW3TAUlUUvqJsfK5VDeTtrHTX36kkTn6As64x60Bj3fhBcho1FqpJp3z86XfUuvvtynp3fHdAdVdC7x7vjOA4KvyanJTSXeZf98rpEr8tIPDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=akDHIbjD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="akDHIbjD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337d6d7fbd5so792408f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 03:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662655; x=1706267455; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/tlRd9ir6O1nYz/6SExASgeFu7aYjEIcs7W6XXABxg=;
        b=akDHIbjDLU9W73A5bxrNkD3cgGYW+l1wqi223JVQRblnxg+sYBqvsZ7k5HqELLhJ7X
         MEhve7+VnWOHfCcKSKdkruytwUM3E51wfIRgBZKjWL0r4/oXPo9ID9cfrlYc3aedLmyS
         zupckMksjxD7bcxuVO0uv+F86h8FXgKzr+4KpSpVgK/TeJiqyTfHV35f8JTOxrIHB+aY
         QQTeMasH/88mffSK9FLSIWPf9bkhr7O4VzUz6ArzxnzvxbvXQnjhBFEaOlzJOOdHDBlN
         zrR4h17OXwrffhu57GSVVzjK1cXwQxK87j1EckYbV51jt8H1Yv/xP91QXSDRqr9j4Clp
         Es3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662655; x=1706267455;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/tlRd9ir6O1nYz/6SExASgeFu7aYjEIcs7W6XXABxg=;
        b=wHG+qvSc25D1/YpobPaPth4X5W9toRas3PDawJjAva7xybJmFmn6IBSDshk+fzRrUa
         l50T7eX2fmU9LAOAb14xsBv5x5J8tD+sGGF6hJ5MIFcHPdCT5CesPqtRclB1DNzwr6Yt
         v6ULt94Byrg9HCE1l+zB/iAsGj4pvOSI2tuzmZithVgssWFBE1qPDe2P3SJcLhrOI45B
         IIcVmqdmg7FOzfYlp7zjtra9rcEmylq2dLe7ZjSG+6ux8oQcZ1mhL6o2FAJ7dGMpd/T7
         sb+pzW+g1sSCL874Btkyoao6wmJ8LaXFTMl4MT+tJxXKnBZ/Lq/eej+5XGjYpOPUx2Kq
         adgw==
X-Gm-Message-State: AOJu0YzSuhJbrjhK7ptLdlDd9j2f0qQwmK0JgKq1mgZJp+W4qNUDsRTi
	dHQdLvdvbVuTXdQNCVpAdl2QHnBQ6GFsFfb1InSsZaeRPOdlT7XBqs5/6Je5kFxnqbhnj94hge9
	fV/U=
X-Google-Smtp-Source: AGHT+IHNff0iIWFoPY0M5bi4fGnVi4PmL1Ayyq9kDA3QdW2gd3OKsuUlx0ugFCeUCq3lSVvlcoFD0Q==
X-Received: by 2002:a05:600c:43c3:b0:40c:6939:b470 with SMTP id f3-20020a05600c43c300b0040c6939b470mr524991wmn.53.1705662655349;
        Fri, 19 Jan 2024 03:10:55 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0040e47dc2e8fsm28591668wmq.6.2024.01.19.03.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:10:54 -0800 (PST)
Date: Fri, 19 Jan 2024 14:10:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 209/370] fs/xfs/xfs_buf_mem.c:124
 xmbuf_alloc() warn: missing error code 'error'
Message-ID: <930e558a-4e40-4014-abd4-62d8150c0dae@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   47566740a753390604b54a9f3786737c56ab4d7b
commit: e9fac4aaae33bd311c3925cc81cd7b9e43ba53a2 [209/370] xfs: support in-memory buffer cache targets
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191812.feAbH0et-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401191812.feAbH0et-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_buf_mem.c:124 xmbuf_alloc() warn: missing error code 'error'

vim +/error +124 fs/xfs/xfs_buf_mem.c

e9fac4aaae33bd Darrick J. Wong 2024-01-09   63  int
e9fac4aaae33bd Darrick J. Wong 2024-01-09   64  xmbuf_alloc(
e9fac4aaae33bd Darrick J. Wong 2024-01-09   65  	struct xfs_mount	*mp,
e9fac4aaae33bd Darrick J. Wong 2024-01-09   66  	const char		*descr,
e9fac4aaae33bd Darrick J. Wong 2024-01-09   67  	struct xmbuf		**xmbp)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   68  {
e9fac4aaae33bd Darrick J. Wong 2024-01-09   69  	struct file		*file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   70  	struct inode		*inode;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   71  	struct xmbuf		*xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   72  	int			error;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   73  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   74  	xmb = kzalloc(sizeof(*xmb), GFP_KERNEL);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   75  	if (!xmb)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   76  		return -ENOMEM;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   77  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   78  	file = shmem_kernel_file_setup(descr, 0, 0);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   79  	if (IS_ERR(file)) {
e9fac4aaae33bd Darrick J. Wong 2024-01-09   80  		error = PTR_ERR(file);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   81  		goto out_xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   82  	}
e9fac4aaae33bd Darrick J. Wong 2024-01-09   83  	xmb->file = file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09   84  	inode = file_inode(xmb->file);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   85  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   86  	/* private file, private locking */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   87  	lockdep_set_class(&inode->i_rwsem, &xmbuf_i_mutex_key);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   88  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   89  	/* no highmem so we can use page_address */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   90  	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   91  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   92  	/* all writes are below EOF */
e9fac4aaae33bd Darrick J. Wong 2024-01-09   93  	i_size_write(inode, inode->i_sb->s_maxbytes);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   94  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   95  	trace_xmbuf_create(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   96  
e9fac4aaae33bd Darrick J. Wong 2024-01-09   97  	error = xfs_buf_cache_init(&xmb->bcache);
e9fac4aaae33bd Darrick J. Wong 2024-01-09   98  	if (error)
e9fac4aaae33bd Darrick J. Wong 2024-01-09   99  		goto out_file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  100  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  101  	/* Initialize buffer target */
e9fac4aaae33bd Darrick J. Wong 2024-01-09  102  	xmb->target.bt_mount = mp;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  103  	xmb->target.bt_dev = (dev_t)-1U;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  104  	xmb->target.bt_file = xmb->file;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  105  	xmb->target.bt_flags |= XFS_BUFTARG_MEM;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  106  	xmb->target.bt_cache = &xmb->bcache;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  107  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  108  	xmb->target.bt_meta_sectorsize = XMBUF_BLOCKSIZE;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  109  	xmb->target.bt_meta_sectormask = XMBUF_BLOCKSIZE - 1;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  110  	xmb->target.bt_logical_sectorsize = XMBUF_BLOCKSIZE;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  111  	xmb->target.bt_logical_sectormask = XMBUF_BLOCKSIZE - 1;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  112  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  113  	/*
e9fac4aaae33bd Darrick J. Wong 2024-01-09  114  	 * Buffer IO error rate limiting. Limit it to no more than 10 messages
e9fac4aaae33bd Darrick J. Wong 2024-01-09  115  	 * per 30 seconds so as to not spam logs too much on repeated errors.
e9fac4aaae33bd Darrick J. Wong 2024-01-09  116  	 */
e9fac4aaae33bd Darrick J. Wong 2024-01-09  117  	ratelimit_state_init(&xmb->target.bt_ioerror_rl, 30 * HZ,
e9fac4aaae33bd Darrick J. Wong 2024-01-09  118  			     DEFAULT_RATELIMIT_BURST);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  119  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  120  	if (list_lru_init(&xmb->target.bt_lru))
e9fac4aaae33bd Darrick J. Wong 2024-01-09  121  		goto out_bcache;

Set error code?

e9fac4aaae33bd Darrick J. Wong 2024-01-09  122  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  123  	if (percpu_counter_init(&xmb->target.bt_io_count, 0, GFP_KERNEL))
e9fac4aaae33bd Darrick J. Wong 2024-01-09 @124  		goto out_lru;

Here too.

e9fac4aaae33bd Darrick J. Wong 2024-01-09  125  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  126  	*xmbp = xmb;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  127  	return 0;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  128  
e9fac4aaae33bd Darrick J. Wong 2024-01-09  129  out_lru:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  130  	list_lru_destroy(&xmb->target.bt_lru);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  131  out_bcache:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  132  	xfs_buf_cache_destroy(&xmb->bcache);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  133  out_file:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  134  	xmbuf_close(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  135  out_xmb:
e9fac4aaae33bd Darrick J. Wong 2024-01-09  136  	kfree(xmb);
e9fac4aaae33bd Darrick J. Wong 2024-01-09  137  	return error;
e9fac4aaae33bd Darrick J. Wong 2024-01-09  138  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


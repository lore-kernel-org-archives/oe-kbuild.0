Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204CD86146
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Apr 2024 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712067520; cv=none; b=Hkap6SUVIrsYi9+umv8A9dCbgFoLm7ugyVpzpesNB4j2oWiXwSMdX6/pt5Qq+oBCwyUYIRJ+AfdJbRpALas1PspquUPBIOKC/Xqcf68WC+y6AkrxrLmOvVzGWVsHAoTPqlK6rup+mJE32cw8ydka1uqMDGTsDsCuTLkd/c6Fjlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712067520; c=relaxed/simple;
	bh=jO6nZm3xJ+Eeaajj+pK251zaXUi45pwuq5x1buHsrns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=erX9pbJ9Y3d14yBKvCY6jImVjckCqHv6JZ0TrSchOdA4O0YinH37OmMFpyrOQnSwSwUpNLEVLctj+t1cy+HtsdAQZGdFde5frX5BARrAfksPa5kkkkkLV4/KKj4txTSUInAO+nThONQbkgpERVEYZN+EbqS4F11uj5DezKuMrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vC77v8Hn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vC77v8Hn"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a44f2d894b7so603167066b.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Apr 2024 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712067516; x=1712672316; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+Wo7VSic5TLUHvkMVseSwIHAZZoQ29RtTOPm4PMfB8=;
        b=vC77v8Hn+llX2SFmxLp1LXZg7K2XY0wnFzIV9wyeszHFEPK8B3GC9xHJiPwhqOcKTr
         w3grTuGBw9BQlcNkkWFldHoOv6c7ScHPH63aSGMTEf95KxeQQFVJlvYwiTTuB2UYpZ3m
         WVY0eWDBXnfs71GvVgf18aD8pPpisCy8XHLqDMBdSqQxw7ITQmISaVD8hg04zN6idz2s
         1jJMI4ZJoHS7zHA5wmbfNPRjnk/dKyeuFS7/3XBOfLZxEUvrX3hI1YNtU/FEd1WY+CNv
         /DlCjg15vBQx4EHc+7iOdG0xrdgBaRzrSUVUYo5EkkoEKs8IIZqHv/GIEpdthngUbGWp
         kYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712067516; x=1712672316;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Wo7VSic5TLUHvkMVseSwIHAZZoQ29RtTOPm4PMfB8=;
        b=r+UD/ZbKuBnkPFTxRNJCnzQ2/1gtE93a9DPr/HOqtseMb3AMnBhXTxSEHoguXWfwL3
         KLoXf4dgH+VsGvrRt0jOJLhLyqAiSAbOtdmfa6r4Yzxm9Du4MyeoL/u4CQhcTfzEcmDV
         U1MN/ZsPbIiTVDjzdvTrFluD5o3PHF2J2dQfXuUdu0q4s9/9AdAYTqw5NWvtSHKy1v+r
         ug/NE86F/KS9zdC1Yx5ZvKFIP0MLf9LQEf7WFlWhVEqdQxFJ62Pzz/ijqa+sByaTW3QR
         zYeIljlIVi/x5q0VzXeRM6+dMwsbYyigHd8EbNi8EHV03sAtdoPuRwS7NDLCciXQHL+/
         BWaw==
X-Gm-Message-State: AOJu0YzUFBolKIrcH3S/0yHrGkGsZ52V8WYZcV6K89gGxULuRjWHSrUs
	/RY+EsT2jD39vje9CcR87gpQ7ZEt5rsv6UXd4BpYyneSk95lrSSlCmglcC6issoEE9kt2Rco8KU
	q
X-Google-Smtp-Source: AGHT+IG2e6z3u18Je5G62kuspj75mRjo564sAANnVA7qq5lZp1rCrt2T2VvVAUWf13r1AjmoU5skOg==
X-Received: by 2002:a17:906:711a:b0:a46:11a9:430 with SMTP id x26-20020a170906711a00b00a4611a90430mr8422379ejj.76.1712067516035;
        Tue, 02 Apr 2024 07:18:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r17-20020a170906705100b00a42f6d17123sm6553353ejj.46.2024.04.02.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 07:18:35 -0700 (PDT)
Date: Tue, 2 Apr 2024 17:18:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 103/159] fs/xfs/scrub/attr.c:512
 xchk_xattr_rec() warn: missing error code? 'error'
Message-ID: <8266f0c8-7e98-49a1-bb5c-727531f57fa4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   99c234d902a07d52b882f19b188bd6c96ed25640
commit: 25308399c1406b821d4df4a51294087c2726cb1e [103/159] xfs: enforce one namespace per attribute
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010529.7F6qVl9f-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404010529.7F6qVl9f-lkp@intel.com/

New smatch warnings:
fs/xfs/scrub/attr.c:512 xchk_xattr_rec() warn: missing error code? 'error'

Old smatch warnings:
fs/xfs/scrub/attr.c:516 xchk_xattr_rec() warn: missing error code? 'error'

vim +/error +512 fs/xfs/scrub/attr.c

eec0482e0829ea Darrick J. Wong   2017-10-17  463  STATIC int
c517b3aa02cff1 Darrick J. Wong   2018-07-19  464  xchk_xattr_rec(
c517b3aa02cff1 Darrick J. Wong   2018-07-19  465  	struct xchk_da_btree		*ds,
649d9d98c60ec5 Christoph Hellwig 2019-11-08  466  	int				level)
eec0482e0829ea Darrick J. Wong   2017-10-17  467  {
eec0482e0829ea Darrick J. Wong   2017-10-17  468  	struct xfs_mount		*mp = ds->state->mp;
649d9d98c60ec5 Christoph Hellwig 2019-11-08  469  	struct xfs_da_state_blk		*blk = &ds->state->path.blk[level];
eec0482e0829ea Darrick J. Wong   2017-10-17  470  	struct xfs_attr_leaf_name_local	*lentry;
eec0482e0829ea Darrick J. Wong   2017-10-17  471  	struct xfs_attr_leaf_name_remote	*rentry;
eec0482e0829ea Darrick J. Wong   2017-10-17  472  	struct xfs_buf			*bp;
649d9d98c60ec5 Christoph Hellwig 2019-11-08  473  	struct xfs_attr_leaf_entry	*ent;
eec0482e0829ea Darrick J. Wong   2017-10-17  474  	xfs_dahash_t			calc_hash;
eec0482e0829ea Darrick J. Wong   2017-10-17  475  	xfs_dahash_t			hash;
eec0482e0829ea Darrick J. Wong   2017-10-17  476  	int				nameidx;
eec0482e0829ea Darrick J. Wong   2017-10-17  477  	int				hdrsize;
eec0482e0829ea Darrick J. Wong   2017-10-17  478  	unsigned int			badflags;
eec0482e0829ea Darrick J. Wong   2017-10-17  479  	int				error;
eec0482e0829ea Darrick J. Wong   2017-10-17  480  
649d9d98c60ec5 Christoph Hellwig 2019-11-08  481  	ASSERT(blk->magic == XFS_ATTR_LEAF_MAGIC);
649d9d98c60ec5 Christoph Hellwig 2019-11-08  482  
649d9d98c60ec5 Christoph Hellwig 2019-11-08  483  	ent = xfs_attr3_leaf_entryp(blk->bp->b_addr) + blk->index;
eec0482e0829ea Darrick J. Wong   2017-10-17  484  
13791d3b833428 Darrick J. Wong   2017-10-31  485  	/* Check the whole block, if necessary. */
c517b3aa02cff1 Darrick J. Wong   2018-07-19  486  	error = xchk_xattr_block(ds, level);
13791d3b833428 Darrick J. Wong   2017-10-31  487  	if (error)
13791d3b833428 Darrick J. Wong   2017-10-31  488  		goto out;
13791d3b833428 Darrick J. Wong   2017-10-31  489  	if (ds->sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
13791d3b833428 Darrick J. Wong   2017-10-31  490  		goto out;
13791d3b833428 Darrick J. Wong   2017-10-31  491  
eec0482e0829ea Darrick J. Wong   2017-10-17  492  	/* Check the hash of the entry. */
c517b3aa02cff1 Darrick J. Wong   2018-07-19  493  	error = xchk_da_btree_hash(ds, level, &ent->hashval);
eec0482e0829ea Darrick J. Wong   2017-10-17  494  	if (error)
eec0482e0829ea Darrick J. Wong   2017-10-17  495  		goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  496  
eec0482e0829ea Darrick J. Wong   2017-10-17  497  	/* Find the attr entry's location. */
eec0482e0829ea Darrick J. Wong   2017-10-17  498  	bp = blk->bp;
eec0482e0829ea Darrick J. Wong   2017-10-17  499  	hdrsize = xfs_attr3_leaf_hdr_size(bp->b_addr);
eec0482e0829ea Darrick J. Wong   2017-10-17  500  	nameidx = be16_to_cpu(ent->nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  501  	if (nameidx < hdrsize || nameidx >= mp->m_attr_geo->blksize) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  502  		xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  503  		goto out;

There are several goto out paths were "error" is zero but those don't
trigger a static checker warning.

eec0482e0829ea Darrick J. Wong   2017-10-17  504  	}
eec0482e0829ea Darrick J. Wong   2017-10-17  505  
eec0482e0829ea Darrick J. Wong   2017-10-17  506  	/* Retrieve the entry and check it. */
eec0482e0829ea Darrick J. Wong   2017-10-17  507  	hash = be32_to_cpu(ent->hashval);
eec0482e0829ea Darrick J. Wong   2017-10-17  508  	badflags = ~(XFS_ATTR_LOCAL | XFS_ATTR_ROOT | XFS_ATTR_SECURE |
3c41934e739891 Allison Henderson 2024-01-09  509  			XFS_ATTR_INCOMPLETE | XFS_ATTR_PARENT);
25308399c1406b Darrick J. Wong   2024-03-26  510  	if ((ent->flags & badflags) != 0) {
25308399c1406b Darrick J. Wong   2024-03-26  511  		xchk_da_set_corrupt(ds, level);
25308399c1406b Darrick J. Wong   2024-03-26 @512  		return error;

error is zero here.  Better to return a literal if it's intentional.

25308399c1406b Darrick J. Wong   2024-03-26  513  	}
25308399c1406b Darrick J. Wong   2024-03-26  514  	if (!xfs_attr_check_namespace(ent->flags)) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  515  		xchk_da_set_corrupt(ds, level);
25308399c1406b Darrick J. Wong   2024-03-26  516  		return error;

Here too.

25308399c1406b Darrick J. Wong   2024-03-26  517  	}
25308399c1406b Darrick J. Wong   2024-03-26  518  
eec0482e0829ea Darrick J. Wong   2017-10-17  519  	if (ent->flags & XFS_ATTR_LOCAL) {
eec0482e0829ea Darrick J. Wong   2017-10-17  520  		lentry = (struct xfs_attr_leaf_name_local *)
eec0482e0829ea Darrick J. Wong   2017-10-17  521  				(((char *)bp->b_addr) + nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  522  		if (lentry->namelen <= 0) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  523  			xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  524  			goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  525  		}
dd3edd796680a0 Darrick J. Wong   2024-03-26  526  		calc_hash = xfs_attr_hashval(mp, ent->flags, lentry->nameval,
dd3edd796680a0 Darrick J. Wong   2024-03-26  527  					     lentry->namelen,
dd3edd796680a0 Darrick J. Wong   2024-03-26  528  					     lentry->nameval + lentry->namelen,
dd3edd796680a0 Darrick J. Wong   2024-03-26  529  					     be16_to_cpu(lentry->valuelen));
eec0482e0829ea Darrick J. Wong   2017-10-17  530  	} else {
eec0482e0829ea Darrick J. Wong   2017-10-17  531  		rentry = (struct xfs_attr_leaf_name_remote *)
eec0482e0829ea Darrick J. Wong   2017-10-17  532  				(((char *)bp->b_addr) + nameidx);
eec0482e0829ea Darrick J. Wong   2017-10-17  533  		if (rentry->namelen <= 0) {
c517b3aa02cff1 Darrick J. Wong   2018-07-19  534  			xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  535  			goto out;
eec0482e0829ea Darrick J. Wong   2017-10-17  536  		}
dd3edd796680a0 Darrick J. Wong   2024-03-26  537  		calc_hash = xfs_attr_hashval(mp, ent->flags, rentry->name,
dd3edd796680a0 Darrick J. Wong   2024-03-26  538  					     rentry->namelen, NULL,
dd3edd796680a0 Darrick J. Wong   2024-03-26  539  					     be32_to_cpu(rentry->valuelen));
eec0482e0829ea Darrick J. Wong   2017-10-17  540  	}
eec0482e0829ea Darrick J. Wong   2017-10-17  541  	if (calc_hash != hash)
c517b3aa02cff1 Darrick J. Wong   2018-07-19  542  		xchk_da_set_corrupt(ds, level);
eec0482e0829ea Darrick J. Wong   2017-10-17  543  
eec0482e0829ea Darrick J. Wong   2017-10-17  544  out:
eec0482e0829ea Darrick J. Wong   2017-10-17  545  	return error;
eec0482e0829ea Darrick J. Wong   2017-10-17  546  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


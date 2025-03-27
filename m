Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3641AF0C7
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 04:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743050684; cv=none; b=LARCV/1PYxtjeTxSo1D9mU6+oiFywgzleRcL8lGAsFt2qTv0geylsjyJFxNlCPnEthtsbummo1Af3ySybrY0EGG9UeqxK7Wl4y+glBeLtdq9la8Btj6rh+BeNLMjKRdvYC27GeQ9fonIJjqyX/I7sipEaipR4HnUCHOK8PWafiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743050684; c=relaxed/simple;
	bh=qWWoa5nQIUu32lIZQ3aH/VMFhK0fqtrqNi7RWB7u+9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSD9YHaPwTfxRto0v0ByNpoWUNbMSnG9vaf4eq7LhA/wnONXbBlaidSRu7JkjvSlLU7BHfZCbjlnAVbuM6rI65x1HwjbXdKdCqUzZZsAj+cNag1tH0y9Na/4hZq/yADcYtPFwh9dkJLrPb9kvmZIkP5uYXQzjdWJj20YjC0+0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUj8tFE2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUj8tFE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743050682; x=1774586682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWWoa5nQIUu32lIZQ3aH/VMFhK0fqtrqNi7RWB7u+9g=;
  b=NUj8tFE2PloJs2NW9vydVLKhMTDhzQJuG1h3Emsaqcq5AIp1XRlxqyLh
   Z4X9UxGJkBfgcrUwnIV17gFg6w3uzidM7fDNHD+rVscibrFICoPau81C4
   H0r1140VgkqfNuHSwtRf+g118PAUFTH+IpiwQuEt108sWc9HuvKuvalvT
   xWb+FHqNijtnkZld/yAZ/a3VYd39MbfXp2jeZyfE0ePbtDYdU7nyNUj2A
   IpLHN7/nWA3Tk95sGBrVHoNwMjHGY6mLGatAK+duezc04LpH7GI9Fx6X9
   6CMZxtJo63bbJgbOhVeqXkzxOHRaJjzSg/BQ2p6zaCyxqj4S+YgyiqwvU
   g==;
X-CSE-ConnectionGUID: z4w+Y3wKRUieNZckLHHcAg==
X-CSE-MsgGUID: vsbInmvGTHCCOD3BYAAN0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66830565"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="66830565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 21:44:40 -0700
X-CSE-ConnectionGUID: nkTqlRoeTs296sN4Yka1aA==
X-CSE-MsgGUID: VTuQMZMFQlaJfqvphKZbbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155951945"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2025 21:44:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txf6Z-0006Mv-2H;
	Thu, 27 Mar 2025 04:44:35 +0000
Date: Thu, 27 Mar 2025 12:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:master 202/204] fs/bcachefs/sysfs.c:400:49-63:
 opportunity for str_yes_no(bdev_fua ( bdev ))
Message-ID: <202503271244.6V5OX8Nm-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   4594600d4d08c19525bc7118a5f1a1f3396f608f
commit: e52b1d339e087a1e01833033e3dd271c36e721ca [202/204] bcachefs: read_fua_test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-051-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271244.6V5OX8Nm-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503271244.6V5OX8Nm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/sysfs.c:400:49-63: opportunity for str_yes_no(bdev_fua ( bdev ))

vim +400 fs/bcachefs/sysfs.c

72c277878031a98 Kent Overstreet 2024-02-23  313  
e52b1d339e087a1 Kent Overstreet 2025-03-17  314  static int bch2_read_fua_test(struct printbuf *out, struct bch_dev *ca)
e52b1d339e087a1 Kent Overstreet 2025-03-17  315  {
e52b1d339e087a1 Kent Overstreet 2025-03-17  316  	struct bch_fs *c = ca->fs;
e52b1d339e087a1 Kent Overstreet 2025-03-17  317  	struct bio *bio = NULL;
e52b1d339e087a1 Kent Overstreet 2025-03-17  318  	void *buf = NULL;
e52b1d339e087a1 Kent Overstreet 2025-03-17  319  	unsigned bs = c->opts.block_size, iters;
e52b1d339e087a1 Kent Overstreet 2025-03-17  320  	u64 end, test_duration = NSEC_PER_SEC * 2;
e52b1d339e087a1 Kent Overstreet 2025-03-17  321  	struct bch2_time_stats stats_nofua, stats_fua, stats_random;
e52b1d339e087a1 Kent Overstreet 2025-03-17  322  	int ret = 0;
e52b1d339e087a1 Kent Overstreet 2025-03-17  323  
e52b1d339e087a1 Kent Overstreet 2025-03-17  324  	bch2_time_stats_init_no_pcpu(&stats_nofua);
e52b1d339e087a1 Kent Overstreet 2025-03-17  325  	bch2_time_stats_init_no_pcpu(&stats_fua);
e52b1d339e087a1 Kent Overstreet 2025-03-17  326  	bch2_time_stats_init_no_pcpu(&stats_random);
e52b1d339e087a1 Kent Overstreet 2025-03-17  327  
e52b1d339e087a1 Kent Overstreet 2025-03-17  328  	if (!bch2_dev_get_ioref(c, ca->dev_idx, READ)) {
e52b1d339e087a1 Kent Overstreet 2025-03-17  329  		prt_str(out, "offline\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  330  		return 0;
e52b1d339e087a1 Kent Overstreet 2025-03-17  331  	}
e52b1d339e087a1 Kent Overstreet 2025-03-17  332  
e52b1d339e087a1 Kent Overstreet 2025-03-17  333  	struct block_device *bdev = ca->disk_sb.bdev;
e52b1d339e087a1 Kent Overstreet 2025-03-17  334  
e52b1d339e087a1 Kent Overstreet 2025-03-17  335  	bio = bio_kmalloc(1, GFP_KERNEL);
e52b1d339e087a1 Kent Overstreet 2025-03-17  336  	if (!bio) {
e52b1d339e087a1 Kent Overstreet 2025-03-17  337  		ret = -ENOMEM;
e52b1d339e087a1 Kent Overstreet 2025-03-17  338  		goto err;
e52b1d339e087a1 Kent Overstreet 2025-03-17  339  	}
e52b1d339e087a1 Kent Overstreet 2025-03-17  340  
e52b1d339e087a1 Kent Overstreet 2025-03-17  341  	buf = kmalloc(bs, GFP_KERNEL);
e52b1d339e087a1 Kent Overstreet 2025-03-17  342  	if (!buf)
e52b1d339e087a1 Kent Overstreet 2025-03-17  343  		goto err;
e52b1d339e087a1 Kent Overstreet 2025-03-17  344  
e52b1d339e087a1 Kent Overstreet 2025-03-17  345  	end = ktime_get_ns() + test_duration;
e52b1d339e087a1 Kent Overstreet 2025-03-17  346  	for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
e52b1d339e087a1 Kent Overstreet 2025-03-17  347  		bio_init(bio, bdev, bio->bi_inline_vecs, 1, READ);
e52b1d339e087a1 Kent Overstreet 2025-03-17  348  		bch2_bio_map(bio, buf, bs);
e52b1d339e087a1 Kent Overstreet 2025-03-17  349  
e52b1d339e087a1 Kent Overstreet 2025-03-17  350  		u64 submit_time = ktime_get_ns();
e52b1d339e087a1 Kent Overstreet 2025-03-17  351  		ret = submit_bio_wait(bio);
e52b1d339e087a1 Kent Overstreet 2025-03-17  352  		bch2_time_stats_update(&stats_nofua, submit_time);
e52b1d339e087a1 Kent Overstreet 2025-03-17  353  
e52b1d339e087a1 Kent Overstreet 2025-03-17  354  		if (ret)
e52b1d339e087a1 Kent Overstreet 2025-03-17  355  			goto err;
e52b1d339e087a1 Kent Overstreet 2025-03-17  356  	}
e52b1d339e087a1 Kent Overstreet 2025-03-17  357  
e52b1d339e087a1 Kent Overstreet 2025-03-17  358  	end = ktime_get_ns() + test_duration;
e52b1d339e087a1 Kent Overstreet 2025-03-17  359  	for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
e52b1d339e087a1 Kent Overstreet 2025-03-17  360  		bio_init(bio, bdev, bio->bi_inline_vecs, 1, REQ_FUA|READ);
e52b1d339e087a1 Kent Overstreet 2025-03-17  361  		bch2_bio_map(bio, buf, bs);
e52b1d339e087a1 Kent Overstreet 2025-03-17  362  
e52b1d339e087a1 Kent Overstreet 2025-03-17  363  		u64 submit_time = ktime_get_ns();
e52b1d339e087a1 Kent Overstreet 2025-03-17  364  		ret = submit_bio_wait(bio);
e52b1d339e087a1 Kent Overstreet 2025-03-17  365  		bch2_time_stats_update(&stats_fua, submit_time);
e52b1d339e087a1 Kent Overstreet 2025-03-17  366  
e52b1d339e087a1 Kent Overstreet 2025-03-17  367  		if (ret)
e52b1d339e087a1 Kent Overstreet 2025-03-17  368  			goto err;
e52b1d339e087a1 Kent Overstreet 2025-03-17  369  	}
e52b1d339e087a1 Kent Overstreet 2025-03-17  370  
e52b1d339e087a1 Kent Overstreet 2025-03-17  371  	u64 dev_size = ca->mi.nbuckets * bucket_bytes(ca);
e52b1d339e087a1 Kent Overstreet 2025-03-17  372  
e52b1d339e087a1 Kent Overstreet 2025-03-17  373  	end = ktime_get_ns() + test_duration;
e52b1d339e087a1 Kent Overstreet 2025-03-17  374  	for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
e52b1d339e087a1 Kent Overstreet 2025-03-17  375  		bio_init(bio, bdev, bio->bi_inline_vecs, 1, READ);
e52b1d339e087a1 Kent Overstreet 2025-03-17  376  		bio->bi_iter.bi_sector = (bch2_get_random_u64_below(dev_size) & ~((u64) bs - 1)) >> 9;
e52b1d339e087a1 Kent Overstreet 2025-03-17  377  		bch2_bio_map(bio, buf, bs);
e52b1d339e087a1 Kent Overstreet 2025-03-17  378  
e52b1d339e087a1 Kent Overstreet 2025-03-17  379  		u64 submit_time = ktime_get_ns();
e52b1d339e087a1 Kent Overstreet 2025-03-17  380  		ret = submit_bio_wait(bio);
e52b1d339e087a1 Kent Overstreet 2025-03-17  381  		bch2_time_stats_update(&stats_random, submit_time);
e52b1d339e087a1 Kent Overstreet 2025-03-17  382  
e52b1d339e087a1 Kent Overstreet 2025-03-17  383  		if (ret)
e52b1d339e087a1 Kent Overstreet 2025-03-17  384  			goto err;
e52b1d339e087a1 Kent Overstreet 2025-03-17  385  	}
e52b1d339e087a1 Kent Overstreet 2025-03-17  386  
e52b1d339e087a1 Kent Overstreet 2025-03-17  387  	u64 ns_nofua		= mean_and_variance_get_mean(stats_nofua.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  388  	u64 ns_fua		= mean_and_variance_get_mean(stats_fua.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  389  	u64 ns_rand		= mean_and_variance_get_mean(stats_random.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  390  
e52b1d339e087a1 Kent Overstreet 2025-03-17  391  	u64 stddev_nofua	= mean_and_variance_get_stddev(stats_nofua.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  392  	u64 stddev_fua		= mean_and_variance_get_stddev(stats_fua.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  393  	u64 stddev_rand		= mean_and_variance_get_stddev(stats_random.duration_stats);
e52b1d339e087a1 Kent Overstreet 2025-03-17  394  
e52b1d339e087a1 Kent Overstreet 2025-03-17  395  	printbuf_tabstop_push(out, 8);
e52b1d339e087a1 Kent Overstreet 2025-03-17  396  	printbuf_tabstop_push(out, 12);
e52b1d339e087a1 Kent Overstreet 2025-03-17  397  	printbuf_tabstop_push(out, 12);
e52b1d339e087a1 Kent Overstreet 2025-03-17  398  	prt_printf(out, "This test must be run on an idle drive for accurate results\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  399  	prt_printf(out, "%s\n", dev_name(&ca->disk_sb.bdev->bd_device));
e52b1d339e087a1 Kent Overstreet 2025-03-17 @400  	prt_printf(out, "fua support advertized: %s\n", bdev_fua(bdev) ? "yes" : "no");
e52b1d339e087a1 Kent Overstreet 2025-03-17  401  	prt_newline(out);
e52b1d339e087a1 Kent Overstreet 2025-03-17  402  	prt_printf(out, "ns:\tlatency\rstddev\r\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  403  	prt_printf(out, "nofua\t%llu\r%llu\r\n",	ns_nofua,	stddev_nofua);
e52b1d339e087a1 Kent Overstreet 2025-03-17  404  	prt_printf(out, "fua\t%llu\r%llu\r\n",		ns_fua,		stddev_fua);
e52b1d339e087a1 Kent Overstreet 2025-03-17  405  	prt_printf(out, "random\t%llu\r%llu\r\n",	ns_rand,	stddev_rand);
e52b1d339e087a1 Kent Overstreet 2025-03-17  406  
e52b1d339e087a1 Kent Overstreet 2025-03-17  407  	bool read_cache = ns_nofua * 2 < ns_rand;
e52b1d339e087a1 Kent Overstreet 2025-03-17  408  	bool fua_cached	= read_cache && ns_fua < (ns_nofua + ns_rand) / 2;
e52b1d339e087a1 Kent Overstreet 2025-03-17  409  
e52b1d339e087a1 Kent Overstreet 2025-03-17  410  	if (!read_cache)
e52b1d339e087a1 Kent Overstreet 2025-03-17  411  		prt_str(out, "reads don't appear to be cached - safe\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  412  	else if (!fua_cached)
e52b1d339e087a1 Kent Overstreet 2025-03-17  413  		prt_str(out, "fua reads don't appear to be cached - safe\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  414  	else
e52b1d339e087a1 Kent Overstreet 2025-03-17  415  		prt_str(out, "fua reads appear to be cached - unsafe\n");
e52b1d339e087a1 Kent Overstreet 2025-03-17  416  err:
e52b1d339e087a1 Kent Overstreet 2025-03-17  417  	kfree(buf);
e52b1d339e087a1 Kent Overstreet 2025-03-17  418  	kfree(bio);
e52b1d339e087a1 Kent Overstreet 2025-03-17  419  	percpu_ref_put(&ca->io_ref);
e52b1d339e087a1 Kent Overstreet 2025-03-17  420  	bch_err_fn(c, ret);
e52b1d339e087a1 Kent Overstreet 2025-03-17  421  	return ret;
e52b1d339e087a1 Kent Overstreet 2025-03-17  422  }
e52b1d339e087a1 Kent Overstreet 2025-03-17  423  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

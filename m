Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AB2AEE1
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745896082; cv=none; b=PmWC9/C/N5uS1qagywlTPq1gCyi2icjzO8Zd7u2bD/jgfgN+u1dLhlFBxxvDLJv43pD2CY+pyShxW2vL3BOA5T0dCVf4OtNsJ0a4ZKHUxT3IxhPm88ZYNb3KAvMO2AIaJnpcxNYz8PjJUNZOtDZW2gnv9jh/JyagKZGgIhxYx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745896082; c=relaxed/simple;
	bh=5du8+b7WtmZFjoCbf0VfRFAbSkXKGR49Rz5cnc7jyrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SpPkgzV2izICCZoJJQG6NRtM5OeaEqdJQbOL3uTUF0Wn5G0SacVSLp3c8viH6Rhvf8PT6+wjDAONbysdqKrqmWkQyXxIV59qgJ/7Mgy1dZw2A8NeIZefjNO+Cotn7bStjCcwcn8nr6rh/BnRHpDZYn2ptIFWirmdh/XMW29tRQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk+feEIh; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk+feEIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745896080; x=1777432080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5du8+b7WtmZFjoCbf0VfRFAbSkXKGR49Rz5cnc7jyrg=;
  b=Pk+feEIhBRIC2EfizUUtvIQ/2ax46tvEPHTvoB0wGZgvxQ7HJCzLFbD3
   yqj6FrIlSRrH62VcJMMmCPKGmjAVSsPC8h0WOgHEdGTJ+gq/690gmyfwb
   Mla0X/48aP00cZ5pxQTXo30AorPy5V7zD9EWReK7DZRorCCdDZ1qD9Co1
   XoNz9KMFA1cuRlpcos4HE+lSRLTbpjw9ysSiZdDmg5Og0YybDTW/o2x4A
   fgun2+DVEgjjZdKBGXelEuSbOvXNWsqfaVbH/xvm2Ijihxu6VyfSB29wZ
   Gv+f+UKCYTc44e4LnlRtsOMswySgj3zhi72mjlVOcPsnwaFQB3Et1kiRc
   g==;
X-CSE-ConnectionGUID: GX61q2/xTfWMQB9iULp6Dw==
X-CSE-MsgGUID: GZH4Pg1TQ8aCxYTIDeMdrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47212483"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47212483"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:08:00 -0700
X-CSE-ConnectionGUID: en2D4tQdQxSvwcfpmdRR2w==
X-CSE-MsgGUID: OMSUVPdOSTCjMWAnNFX93Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134214994"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2025 20:07:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9bK8-0000Qx-05;
	Tue, 29 Apr 2025 03:07:56 +0000
Date: Tue, 29 Apr 2025 11:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.4 1/1] block/blk-core.c:1664
 blk_rq_prep_clone() error: uninitialized symbol 'bio'.
Message-ID: <202504291009.fidDXFaU-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   cd8e74fa0fa3de9f66c12c5c2c2868442d2f6728
commit: e08dcf9e2d01fdb05d812f6795c436dfe65fc788 [1/1] UPSTREAM: block: make blk_crypto_rq_bio_prep() able to fail
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 6 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291009.fidDXFaU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504291009.fidDXFaU-lkp@intel.com/

New smatch warnings:
block/blk-core.c:1664 blk_rq_prep_clone() error: uninitialized symbol 'bio'.

Old smatch warnings:
block/blk-core.c:540 blk_alloc_queue_node() warn: use 'gfp_mask' here instead of GFP_KERNEL?

vim +/bio +1664 block/blk-core.c

78d8e58a086b214 Mike Snitzer    2015-06-26  1609  
78d8e58a086b214 Mike Snitzer    2015-06-26  1610  /**
78d8e58a086b214 Mike Snitzer    2015-06-26  1611   * blk_rq_prep_clone - Helper function to setup clone request
78d8e58a086b214 Mike Snitzer    2015-06-26  1612   * @rq: the request to be setup
78d8e58a086b214 Mike Snitzer    2015-06-26  1613   * @rq_src: original request to be cloned
78d8e58a086b214 Mike Snitzer    2015-06-26  1614   * @bs: bio_set that bios for clone are allocated from
78d8e58a086b214 Mike Snitzer    2015-06-26  1615   * @gfp_mask: memory allocation mask for bio
78d8e58a086b214 Mike Snitzer    2015-06-26  1616   * @bio_ctr: setup function to be called for each clone bio.
78d8e58a086b214 Mike Snitzer    2015-06-26  1617   *           Returns %0 for success, non %0 for failure.
78d8e58a086b214 Mike Snitzer    2015-06-26  1618   * @data: private data to be passed to @bio_ctr
78d8e58a086b214 Mike Snitzer    2015-06-26  1619   *
78d8e58a086b214 Mike Snitzer    2015-06-26  1620   * Description:
78d8e58a086b214 Mike Snitzer    2015-06-26  1621   *     Clones bios in @rq_src to @rq, and copies attributes of @rq_src to @rq.
78d8e58a086b214 Mike Snitzer    2015-06-26  1622   *     The actual data parts of @rq_src (e.g. ->cmd, ->sense)
78d8e58a086b214 Mike Snitzer    2015-06-26  1623   *     are not copied, and copying such parts is the caller's responsibility.
78d8e58a086b214 Mike Snitzer    2015-06-26  1624   *     Also, pages which the original bios are pointing to are not copied
78d8e58a086b214 Mike Snitzer    2015-06-26  1625   *     and the cloned bios just point same pages.
78d8e58a086b214 Mike Snitzer    2015-06-26  1626   *     So cloned bios must be completed before original bios, which means
78d8e58a086b214 Mike Snitzer    2015-06-26  1627   *     the caller must complete @rq before @rq_src.
78d8e58a086b214 Mike Snitzer    2015-06-26  1628   */
78d8e58a086b214 Mike Snitzer    2015-06-26  1629  int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
78d8e58a086b214 Mike Snitzer    2015-06-26  1630  		      struct bio_set *bs, gfp_t gfp_mask,
78d8e58a086b214 Mike Snitzer    2015-06-26  1631  		      int (*bio_ctr)(struct bio *, struct bio *, void *),
78d8e58a086b214 Mike Snitzer    2015-06-26  1632  		      void *data)
78d8e58a086b214 Mike Snitzer    2015-06-26  1633  {
78d8e58a086b214 Mike Snitzer    2015-06-26  1634  	struct bio *bio, *bio_src;
78d8e58a086b214 Mike Snitzer    2015-06-26  1635  
78d8e58a086b214 Mike Snitzer    2015-06-26  1636  	if (!bs)
f4f8154a08bc580 Kent Overstreet 2018-05-08  1637  		bs = &fs_bio_set;
78d8e58a086b214 Mike Snitzer    2015-06-26  1638  
78d8e58a086b214 Mike Snitzer    2015-06-26  1639  	__rq_for_each_bio(bio_src, rq_src) {
78d8e58a086b214 Mike Snitzer    2015-06-26  1640  		bio = bio_clone_fast(bio_src, gfp_mask, bs);
78d8e58a086b214 Mike Snitzer    2015-06-26  1641  		if (!bio)
78d8e58a086b214 Mike Snitzer    2015-06-26  1642  			goto free_and_out;
78d8e58a086b214 Mike Snitzer    2015-06-26  1643  
78d8e58a086b214 Mike Snitzer    2015-06-26  1644  		if (bio_ctr && bio_ctr(bio, bio_src, data))
78d8e58a086b214 Mike Snitzer    2015-06-26  1645  			goto free_and_out;
78d8e58a086b214 Mike Snitzer    2015-06-26  1646  
78d8e58a086b214 Mike Snitzer    2015-06-26  1647  		if (rq->bio) {
78d8e58a086b214 Mike Snitzer    2015-06-26  1648  			rq->biotail->bi_next = bio;
78d8e58a086b214 Mike Snitzer    2015-06-26  1649  			rq->biotail = bio;
e08dcf9e2d01fdb Eric Biggers    2020-09-15  1650  		} else {
78d8e58a086b214 Mike Snitzer    2015-06-26  1651  			rq->bio = rq->biotail = bio;
78d8e58a086b214 Mike Snitzer    2015-06-26  1652  		}
e08dcf9e2d01fdb Eric Biggers    2020-09-15  1653  		bio = NULL;
e08dcf9e2d01fdb Eric Biggers    2020-09-15  1654  	}
78d8e58a086b214 Mike Snitzer    2015-06-26  1655  
78d8e58a086b214 Mike Snitzer    2015-06-26  1656  	__blk_rq_prep_clone(rq, rq_src);
78d8e58a086b214 Mike Snitzer    2015-06-26  1657  
e08dcf9e2d01fdb Eric Biggers    2020-09-15  1658  	if (rq->bio && blk_crypto_rq_bio_prep(rq, rq->bio, gfp_mask) < 0)
e08dcf9e2d01fdb Eric Biggers    2020-09-15  1659  		goto free_and_out;
02fea3fe34f4be5 Satya Tangirala 2020-05-14  1660  
78d8e58a086b214 Mike Snitzer    2015-06-26  1661  	return 0;
78d8e58a086b214 Mike Snitzer    2015-06-26  1662  
78d8e58a086b214 Mike Snitzer    2015-06-26  1663  free_and_out:
78d8e58a086b214 Mike Snitzer    2015-06-26 @1664  	if (bio)
78d8e58a086b214 Mike Snitzer    2015-06-26  1665  		bio_put(bio);
78d8e58a086b214 Mike Snitzer    2015-06-26  1666  	blk_rq_unprep_clone(rq);
78d8e58a086b214 Mike Snitzer    2015-06-26  1667  
78d8e58a086b214 Mike Snitzer    2015-06-26  1668  	return -ENOMEM;
b0fd271d5fba0b2 Kiyoshi Ueda    2009-06-11  1669  }
b0fd271d5fba0b2 Kiyoshi Ueda    2009-06-11  1670  EXPORT_SYMBOL_GPL(blk_rq_prep_clone);
b0fd271d5fba0b2 Kiyoshi Ueda    2009-06-11  1671  

:::::: The code at line 1664 was first introduced by commit
:::::: 78d8e58a086b214dddf1fd463e20a7e1d82d7866 Revert "block, dm: don't copy bios for request clones"

:::::: TO: Mike Snitzer <snitzer@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

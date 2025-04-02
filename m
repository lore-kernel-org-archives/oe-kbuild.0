Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCECF2F4A
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 05:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743570990; cv=none; b=XKEfsjj9eXNpJ3TQuklKISkKOIWXXJirL5YkfOXVFmdJiaIN+eysIyQBCQywcTtwbD6xxTzpWkAnWw27CTGrxjlNzXoylzmZKeW8RBL+xu/s+cpmD09bbWxbJ2aDA1/FBOYagW776sMlx2BxfVa5tzcXV+g+8VZvUmjMOYYVlVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743570990; c=relaxed/simple;
	bh=6d76QHkGoZcf5blOdWsCeaIl0DZ1QPe0miEo74S0uzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YC99KsqjQOHniumadn/BRr5UnsUe2CtjHVqSk2LTTCAZ2G3kBlcRACR9wxqiU57ETaB6jC8luhfZ/hF/dSD3VbajUPw6GuFiI74OYpwpm0gzEwGnI9G0ZZjWyQITkbevOtDQ1ZBUShK1GzpB+8nO2ftLNMsoANEa1B6LtqdYyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAhI1xJh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CAhI1xJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743570989; x=1775106989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6d76QHkGoZcf5blOdWsCeaIl0DZ1QPe0miEo74S0uzA=;
  b=CAhI1xJhjaflO1ibII6rIvqe+p0SO7UHER+L7/hDYdw8b+xsltxz8Hcc
   HXupV9epl27+y1UK3Ah9460W2EGYQ/59KjNz0/w6zXBFJdWVyy/tth6fX
   4GB57NN7xNBKz7VcUxrZVAWaWG05H3KbPi+07Nd30CeB0vS12zBmvGoOZ
   ntLCq8bNJNiSFpMWW4TTk7tad3wMu82q3PmSUaKybJzpCC8ZG3e40BNa1
   X5QcpFIU0HyTH8euZ/aqGi+CLYXIHAFBLxMgGJW1HLtIAXjdf0toxr8aM
   TFUDxgq3DfWB6q0JqHXo3ZfvVWxQKsFwIOYjZpT0XjZl3y7GiTSbTQMug
   A==;
X-CSE-ConnectionGUID: GbKEjXRhRsyb/5EzytdDSA==
X-CSE-MsgGUID: n8WDLph0QEyafwk1xQB9PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55112121"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="55112121"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 22:16:28 -0700
X-CSE-ConnectionGUID: TYEzRHYKRVellWR39tmv2g==
X-CSE-MsgGUID: aGpluhJ6Rf+hS76LVyPs9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131309647"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Apr 2025 22:16:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzqSe-000AUQ-25;
	Wed, 02 Apr 2025 05:16:24 +0000
Date: Wed, 2 Apr 2025 13:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 226/258]
 fs/bcachefs/io_write.c:719 bch2_write_endio() error: we previously assumed
 'ca' could be null (see line 701)
Message-ID: <202504021545.Q5zXI4Dx-lkp@intel.com>
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

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   0b5552c6e08f6aeb25e7b29451caf486017adcb3
commit: de399658588931506e1b3f4cc63cb3c9134a692e [226/258] bcachefs: Fix null ptr deref in bch2_write_endio()
:::::: branch date: 12 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250402/202504021545.Q5zXI4Dx-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504021545.Q5zXI4Dx-lkp@intel.com/

New smatch warnings:
fs/bcachefs/io_write.c:719 bch2_write_endio() error: we previously assumed 'ca' could be null (see line 701)

Old smatch warnings:
fs/bcachefs/io_write.c:902 bch2_write_prep_encoded_data() warn: missing unwind goto?

vim +/ca +719 fs/bcachefs/io_write.c

1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  685  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  686  static void bch2_write_endio(struct bio *bio)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  687  {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  688  	struct closure *cl		= bio->bi_private;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  689  	struct bch_write_op *op		= container_of(cl, struct bch_write_op, cl);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  690  	struct bch_write_bio *wbio	= to_wbio(bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  691  	struct bch_write_bio *parent	= wbio->split ? wbio->parent : NULL;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  692  	struct bch_fs *c		= wbio->c;
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  693  	struct bch_dev *ca		= wbio->have_ioref
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  694  		? bch2_dev_have_ref(c, wbio->dev)
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  695  		: NULL;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  696  
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  697  	bch2_account_io_completion(ca, BCH_MEMBER_ERROR_write,
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  698  				   wbio->submit_time, !bio->bi_status);
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  699  
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  700  	if (unlikely(bio->bi_status)) {
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31 @701  		if (ca)
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  702  			bch_err_inum_offset_ratelimited(ca,
0fefe8d8ef7402 fs/bcachefs/io.c       Kent Overstreet 2020-12-03  703  					    op->pos.inode,
7fec8266af12b6 fs/bcachefs/io.c       Kent Overstreet 2022-11-15  704  					    wbio->inode_offset << 9,
0fefe8d8ef7402 fs/bcachefs/io.c       Kent Overstreet 2020-12-03  705  					    "data write error: %s",
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  706  					    bch2_blk_status_to_str(bio->bi_status));
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  707  		else
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  708  			bch_err_inum_offset_ratelimited(c,
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  709  					    op->pos.inode,
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  710  					    wbio->inode_offset << 9,
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  711  					    "data write error: %s",
de399658588931 fs/bcachefs/io_write.c Kent Overstreet 2025-03-31  712  					    bch2_blk_status_to_str(bio->bi_status));
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  713  		set_bit(wbio->dev, op->failed.d);
14e2523fc59d16 fs/bcachefs/io_write.c Kent Overstreet 2025-01-19  714  		op->flags |= BCH_WRITE_io_error;
e0eaf8625974d9 fs/bcachefs/io.c       Kent Overstreet 2022-09-27  715  	}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  716  
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  717  	if (wbio->nocow) {
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  718  		bch2_bucket_nocow_unlock(&c->nocow_locks,
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01 @719  					 POS(ca->dev_idx, wbio->nocow_bucket),
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  720  					 BUCKET_NOCOW_LOCK_UPDATE);
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  721  		set_bit(wbio->dev, op->devs_need_flush->d);
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  722  	}
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  723  
b31c070407edda fs/bcachefs/io_write.c Kent Overstreet 2025-02-28  724  	if (wbio->have_ioref)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  725  		percpu_ref_put(&ca->io_ref);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  726  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  727  	if (wbio->bounce)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  728  		bch2_bio_free_pages_pool(c, bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  729  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  730  	if (wbio->put_bio)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  731  		bio_put(bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  732  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  733  	if (parent)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  734  		bio_endio(&parent->bio);
f8f30863382c0d fs/bcachefs/io.c       Kent Overstreet 2019-11-01  735  	else
b17d3cec14b487 fs/bcachefs/io.c       Kent Overstreet 2022-10-31  736  		closure_put(cl);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  737  }
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  738  

:::::: The code at line 719 was first introduced by commit
:::::: 62025697778cb5ca6173b3e52d7e7270edc65a2c bcachefs: Move nocow unlock to bch2_write_endio()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

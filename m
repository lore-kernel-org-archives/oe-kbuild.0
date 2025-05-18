Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF31DFE1
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747583024; cv=none; b=sCjuaLXlSlCDfVlDZRSCZ/Dp1bXiZ4WAyq9whkRmSRozg+F8NUiuSPul2yzV4yGzdpOjCdUuGHVB9Z/QmfcX71lM4KlvCmCUniBSsSnt+ZcMNxwVOxNsC9lBL8gDb3qDvAdcrm4+ZSuptr0Vo3+FstW53pZAJywvwoIHNlcNj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747583024; c=relaxed/simple;
	bh=WYdRozD2dGGzwFICYiHsnRggw3lOJG4V1m8k2Y8yQzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FnblnG2WhZWpkA4r7OjH1D/iYOBPOswapUFWkoGNL5auZzEUNpe/ilvQudSG0aiuoDFt/Ig/hrD3JsU6+y0gf7Ll5VaZNgJq/PE3e5XF+ZQNFDqhw3ZmoRhVd4yDSGoJ5+uh/PvqF3FxSQ7dsZKUOKeeZt8yPnFFMoyOhnDFSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5qNzZDg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5qNzZDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747583023; x=1779119023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WYdRozD2dGGzwFICYiHsnRggw3lOJG4V1m8k2Y8yQzc=;
  b=F5qNzZDgfui0U5P/+w1CG0eRvKIoMTMIdMnWWAkvARbkH4oCgfx2a/pB
   qlJGXtgA8ExBFhxU+Q+jIYaTwApt0wePXBb8DYLZrUK7ya0zBmtY8sqfG
   sHhpnHpws6qy+/8EiN5WfXMcw4hZ8Ab9yQO03mD2DmyGCzEX0hjcdvXla
   9tXJwzpQPZg1CeULww62751atXrBA3DK69WF5f3KvYx8sc2w2NSkhKSW+
   u8sSGRVgvycJB7CidoIPm5eFv/IOCZ5alrPfAXySn6OApLI+uD2i/Af3y
   w8/j89knGZpx5h6HbStA9B1WTnciDHV4gcqzy4Ukjqzm9V8g0B+AJNshm
   w==;
X-CSE-ConnectionGUID: mGDUPhq7Qq60cNonEtH11Q==
X-CSE-MsgGUID: qcjyU4g2SjOL1fTXhKifTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="48599025"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="48599025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 08:43:42 -0700
X-CSE-ConnectionGUID: /W0zDVGnQpqtK2TrT0g5fw==
X-CSE-MsgGUID: 9fJF0yt5QEq9JEBKkV7mxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="143933218"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 May 2025 08:43:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGgAs-000Kr7-1K;
	Sun, 18 May 2025 15:43:38 +0000
Date: Sun, 18 May 2025 23:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 238/238]
 fs/bcachefs/io_write.c:491 bch2_submit_wbio_replicas() error: uninitialized
 symbol 'last'.
Message-ID: <202505190117.W25T1uSJ-lkp@intel.com>
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
head:   6fe8c46a2bff7241e228175011b16750cb66db46
commit: 6fe8c46a2bff7241e228175011b16750cb66db46 [238/238] bcachefs: Call bch2_bkey_set_needs_rebalance() earlier in write path
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250519/202505190117.W25T1uSJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505190117.W25T1uSJ-lkp@intel.com/

New smatch warnings:
fs/bcachefs/io_write.c:491 bch2_submit_wbio_replicas() error: uninitialized symbol 'last'.

Old smatch warnings:
fs/bcachefs/io_write.c:759 bch2_write_endio() error: we previously assumed 'ca' could be null (see line 741)
fs/bcachefs/io_write.c:946 bch2_write_prep_encoded_data() warn: missing unwind goto?

vim +/last +491 fs/bcachefs/io_write.c

406e445b3c6be6 fs/bcachefs/io_write.c Alan Huang      2025-02-12  462  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  463  void bch2_submit_wbio_replicas(struct bch_write_bio *wbio, struct bch_fs *c,
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  464  			       enum bch_data_type type,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  465  			       const struct bkey_i *k,
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  466  			       bool nocow)
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  467  {
26609b619fa230 fs/bcachefs/io.c       Kent Overstreet 2018-11-01  468  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(bkey_i_to_s_c(k));
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  469  	struct bch_write_bio *n;
9a6b24b70fb342 fs/bcachefs/io_write.c Kent Overstreet 2025-04-18  470  	unsigned ref_rw  = type == BCH_DATA_btree ? READ : WRITE;
9a6b24b70fb342 fs/bcachefs/io_write.c Kent Overstreet 2025-04-18  471  	unsigned ref_idx = type == BCH_DATA_btree
9a6b24b70fb342 fs/bcachefs/io_write.c Kent Overstreet 2025-04-18  472  		? BCH_DEV_READ_REF_btree_node_write
9a6b24b70fb342 fs/bcachefs/io_write.c Kent Overstreet 2025-04-18  473  		: BCH_DEV_WRITE_REF_io_write;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  474  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  475  	BUG_ON(c->opts.nochanges);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  476  
6fe8c46a2bff72 fs/bcachefs/io_write.c Kent Overstreet 2025-05-16  477  	const struct bch_extent_ptr *last;
6fe8c46a2bff72 fs/bcachefs/io_write.c Kent Overstreet 2025-05-16  478  	bkey_for_each_ptr(ptrs, ptr)
6fe8c46a2bff72 fs/bcachefs/io_write.c Kent Overstreet 2025-05-16  479  		last = ptr;
6fe8c46a2bff72 fs/bcachefs/io_write.c Kent Overstreet 2025-05-16  480  
26609b619fa230 fs/bcachefs/io.c       Kent Overstreet 2018-11-01  481  	bkey_for_each_ptr(ptrs, ptr) {
dcffc3b1ae3251 fs/bcachefs/io_write.c Kent Overstreet 2025-03-29  482  		/*
dcffc3b1ae3251 fs/bcachefs/io_write.c Kent Overstreet 2025-03-29  483  		 * XXX: btree writes should be using io_ref[WRITE], but we
dcffc3b1ae3251 fs/bcachefs/io_write.c Kent Overstreet 2025-03-29  484  		 * aren't retrying failed btree writes yet (due to device
dcffc3b1ae3251 fs/bcachefs/io_write.c Kent Overstreet 2025-03-29  485  		 * removal/ro):
dcffc3b1ae3251 fs/bcachefs/io_write.c Kent Overstreet 2025-03-29  486  		 */
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  487  		struct bch_dev *ca = nocow
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  488  			? bch2_dev_have_ref(c, ptr->dev)
9a6b24b70fb342 fs/bcachefs/io_write.c Kent Overstreet 2025-04-18  489  			: bch2_dev_get_ioref(c, ptr->dev, ref_rw, ref_idx);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  490  
6fe8c46a2bff72 fs/bcachefs/io_write.c Kent Overstreet 2025-05-16 @491  		if (ptr != last) {
dbd0408087853c fs/bcachefs/io_write.c Kent Overstreet 2024-04-30  492  			n = to_wbio(bio_alloc_clone(NULL, &wbio->bio, GFP_NOFS, &c->replica_set));
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  493  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  494  			n->bio.bi_end_io	= wbio->bio.bi_end_io;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  495  			n->bio.bi_private	= wbio->bio.bi_private;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  496  			n->parent		= wbio;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  497  			n->split		= true;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  498  			n->bounce		= false;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  499  			n->put_bio		= true;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  500  			n->bio.bi_opf		= wbio->bio.bi_opf;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  501  			bio_inc_remaining(&wbio->bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  502  		} else {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  503  			n = wbio;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  504  			n->split		= false;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  505  		}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  506  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  507  		n->c			= c;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  508  		n->dev			= ptr->dev;
48af853925998c fs/bcachefs/io_write.c Kent Overstreet 2024-05-03  509  		n->have_ioref		= ca != NULL;
a8b3a677e786fa fs/bcachefs/io.c       Kent Overstreet 2022-11-02  510  		n->nocow		= nocow;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  511  		n->submit_time		= local_clock();
7fec8266af12b6 fs/bcachefs/io.c       Kent Overstreet 2022-11-15  512  		n->inode_offset		= bkey_start_offset(&k->k);
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  513  		if (nocow)
62025697778cb5 fs/bcachefs/io_write.c Kent Overstreet 2024-05-01  514  			n->nocow_bucket	= PTR_BUCKET_NR(ca, ptr);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  515  		n->bio.bi_iter.bi_sector = ptr->offset;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  516  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  517  		if (likely(n->have_ioref)) {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  518  			this_cpu_add(ca->io_done->sectors[WRITE][type],
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  519  				     bio_sectors(&n->bio));
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  520  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  521  			bio_set_dev(&n->bio, ca->disk_sb.bdev);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  522  
89fd25be70b4e3 fs/bcachefs/io.c       Kent Overstreet 2020-07-09  523  			if (type != BCH_DATA_btree && unlikely(c->opts.no_data_io)) {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  524  				bio_endio(&n->bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  525  				continue;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  526  			}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  527  
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  528  			submit_bio(&n->bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  529  		} else {
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  530  			n->bio.bi_status	= BLK_STS_REMOVED;
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  531  			bio_endio(&n->bio);
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  532  		}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  533  	}
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  534  }
1c6fdbd8f2465d fs/bcachefs/io.c       Kent Overstreet 2017-03-16  535  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

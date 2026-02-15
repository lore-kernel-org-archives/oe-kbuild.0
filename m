Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310EA1F03DE
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771147186; cv=none; b=GuiV5jPYjTggmjaRi+IWh7g8+nbcxVBHLT4y4DFc/0ClqpvAPY1mSa/YC/XrUvhkpa4xTbRooE7JE0h6xb0Uf7FfqOeCb3bG2rdfqpvoUZr5BaXrd6EEN/4HYIrQmvW91fBvtkesCfnSfzNI47CfquOw9ymyPE+I1s5g1O0Ev/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771147186; c=relaxed/simple;
	bh=/WRo7V8r7qVasXGWuRu9RrKcsX3CU0FuVJrP4hzNCZU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FfxrBWqlKbPxd+Rs3aOU6DgplDv+wXxtUwPM1MjmBG/zcuwaJ0r+XNBW9KqWrj2oOwvCAsoCvN4i1pOg2RqIJUC7RZBtAY5fh0M7VD0f6yeWqu61EpDyS4aMApbdzfzQ3nhYciLNyp122UCEVmkP+4OnN29DmIsRCc7ul2WVFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nfn40SLZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nfn40SLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771147185; x=1802683185;
  h=date:from:to:cc:subject:message-id;
  bh=/WRo7V8r7qVasXGWuRu9RrKcsX3CU0FuVJrP4hzNCZU=;
  b=Nfn40SLZS6tD1AfDzTLIqXZ5Qu1/dym4LEsXomWZ2ajmAgA8dZprWQy7
   G8uKEoVDbkrIE6lOzFLFRBTLy+5j9+NO98o50ZXX+m7PcjG4Gfx/xB6cZ
   mIkGRZ8AWrPGn7TUy+tYFP64TUGZUnz4B6KmhW+LZK/DzQ6GOvovRjO2R
   CGnPedH5nYX/s6HQLAI5/tq1AeVxnEKS65/q54LEKJpCGqsS+dJF7dp/K
   9YtT+RTNkno6YxNTejBTRFvs87nJ9+JGxcbKTEd1ZQZI8Q+uQ2RPvwxBd
   RVpe9P19eMunmA2nBK8FO6u2qXHcwfeke2XMg2hnfXJcrwvZpqC4+7WJ/
   Q==;
X-CSE-ConnectionGUID: AB/jo3A1RRe4CYxYBj4PKg==
X-CSE-MsgGUID: LKql40xBRA261K//tDG1ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72439047"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="72439047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 01:19:45 -0800
X-CSE-ConnectionGUID: V5lrdFTfQFaGuVCJvpWaLg==
X-CSE-MsgGUID: qH5ceCSQRqGFkqbhbtiKtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="243920259"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Feb 2026 01:19:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrYI0-00000000y80-2rqI;
	Sun, 15 Feb 2026 09:19:40 +0000
Date: Sun, 15 Feb 2026 17:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 466/799]
 fs/bcachefs/journal/init.c:147:1-7: preceding lock on line 77
Message-ID: <202602151705.SRbLA57N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: d74cd450a4cba91b047b460b997ac14b2862a709 [466/799] bcachefs: split out journal/init.c
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151705.SRbLA57N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602151705.SRbLA57N-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/journal/init.c:147:1-7: preceding lock on line 77

vim +147 fs/bcachefs/journal/init.c

d74cd450a4cba9 Kent Overstreet 2025-10-04   15  
d74cd450a4cba9 Kent Overstreet 2025-10-04   16  static int bch2_set_nr_journal_buckets_iter(struct bch_dev *ca, unsigned nr,
d74cd450a4cba9 Kent Overstreet 2025-10-04   17  					    bool new_fs, struct closure *cl)
d74cd450a4cba9 Kent Overstreet 2025-10-04   18  {
d74cd450a4cba9 Kent Overstreet 2025-10-04   19  	struct bch_fs *c = ca->fs;
d74cd450a4cba9 Kent Overstreet 2025-10-04   20  	struct journal_device *ja = &ca->journal;
d74cd450a4cba9 Kent Overstreet 2025-10-04   21  	u64 *new_bucket_seq = NULL, *new_buckets = NULL;
d74cd450a4cba9 Kent Overstreet 2025-10-04   22  	struct open_bucket **ob = NULL;
d74cd450a4cba9 Kent Overstreet 2025-10-04   23  	long *bu = NULL;
d74cd450a4cba9 Kent Overstreet 2025-10-04   24  	unsigned i, pos, nr_got = 0, nr_want = nr - ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04   25  	int ret = 0;
d74cd450a4cba9 Kent Overstreet 2025-10-04   26  
d74cd450a4cba9 Kent Overstreet 2025-10-04   27  	BUG_ON(nr <= ja->nr);
d74cd450a4cba9 Kent Overstreet 2025-10-04   28  
d74cd450a4cba9 Kent Overstreet 2025-10-04   29  	bu		= kcalloc(nr_want, sizeof(*bu), GFP_KERNEL);
d74cd450a4cba9 Kent Overstreet 2025-10-04   30  	ob		= kcalloc(nr_want, sizeof(*ob), GFP_KERNEL);
d74cd450a4cba9 Kent Overstreet 2025-10-04   31  	new_buckets	= kcalloc(nr, sizeof(u64), GFP_KERNEL);
d74cd450a4cba9 Kent Overstreet 2025-10-04   32  	new_bucket_seq	= kcalloc(nr, sizeof(u64), GFP_KERNEL);
d74cd450a4cba9 Kent Overstreet 2025-10-04   33  	if (!bu || !ob || !new_buckets || !new_bucket_seq) {
d74cd450a4cba9 Kent Overstreet 2025-10-04   34  		ret = bch_err_throw(c, ENOMEM_set_nr_journal_buckets);
d74cd450a4cba9 Kent Overstreet 2025-10-04   35  		goto err_free;
d74cd450a4cba9 Kent Overstreet 2025-10-04   36  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04   37  
d74cd450a4cba9 Kent Overstreet 2025-10-04   38  	for (nr_got = 0; nr_got < nr_want; nr_got++) {
d74cd450a4cba9 Kent Overstreet 2025-10-04   39  		enum bch_watermark watermark = new_fs
d74cd450a4cba9 Kent Overstreet 2025-10-04   40  			? BCH_WATERMARK_btree
d74cd450a4cba9 Kent Overstreet 2025-10-04   41  			: BCH_WATERMARK_normal;
d74cd450a4cba9 Kent Overstreet 2025-10-04   42  
d74cd450a4cba9 Kent Overstreet 2025-10-04   43  		ob[nr_got] = bch2_bucket_alloc(c, ca, watermark,
d74cd450a4cba9 Kent Overstreet 2025-10-04   44  					       BCH_DATA_journal, cl);
d74cd450a4cba9 Kent Overstreet 2025-10-04   45  		ret = PTR_ERR_OR_ZERO(ob[nr_got]);
d74cd450a4cba9 Kent Overstreet 2025-10-04   46  
d74cd450a4cba9 Kent Overstreet 2025-10-04   47  		if (ret == -BCH_ERR_bucket_alloc_blocked)
d74cd450a4cba9 Kent Overstreet 2025-10-04   48  			ret = bch_err_throw(c, freelist_empty);
d74cd450a4cba9 Kent Overstreet 2025-10-04   49  		if (ret == -BCH_ERR_freelist_empty) /* don't if we're actually out of buckets */
d74cd450a4cba9 Kent Overstreet 2025-10-04   50  			closure_wake_up(&c->freelist_wait);
d74cd450a4cba9 Kent Overstreet 2025-10-04   51  
d74cd450a4cba9 Kent Overstreet 2025-10-04   52  		if (ret)
d74cd450a4cba9 Kent Overstreet 2025-10-04   53  			break;
d74cd450a4cba9 Kent Overstreet 2025-10-04   54  
d74cd450a4cba9 Kent Overstreet 2025-10-04   55  		CLASS(btree_trans, trans)(c);
d74cd450a4cba9 Kent Overstreet 2025-10-04   56  		ret = bch2_trans_mark_metadata_bucket(trans, ca,
d74cd450a4cba9 Kent Overstreet 2025-10-04   57  					ob[nr_got]->bucket, BCH_DATA_journal,
d74cd450a4cba9 Kent Overstreet 2025-10-04   58  					ca->mi.bucket_size, BTREE_TRIGGER_transactional);
d74cd450a4cba9 Kent Overstreet 2025-10-04   59  		if (ret) {
d74cd450a4cba9 Kent Overstreet 2025-10-04   60  			bch2_open_bucket_put(c, ob[nr_got]);
d74cd450a4cba9 Kent Overstreet 2025-10-04   61  			bch_err_msg(c, ret, "marking new journal buckets");
d74cd450a4cba9 Kent Overstreet 2025-10-04   62  			break;
d74cd450a4cba9 Kent Overstreet 2025-10-04   63  		}
d74cd450a4cba9 Kent Overstreet 2025-10-04   64  
d74cd450a4cba9 Kent Overstreet 2025-10-04   65  		bu[nr_got] = ob[nr_got]->bucket;
d74cd450a4cba9 Kent Overstreet 2025-10-04   66  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04   67  
d74cd450a4cba9 Kent Overstreet 2025-10-04   68  	if (!nr_got)
d74cd450a4cba9 Kent Overstreet 2025-10-04   69  		goto err_free;
d74cd450a4cba9 Kent Overstreet 2025-10-04   70  
d74cd450a4cba9 Kent Overstreet 2025-10-04   71  	/* Don't return an error if we successfully allocated some buckets: */
d74cd450a4cba9 Kent Overstreet 2025-10-04   72  	ret = 0;
d74cd450a4cba9 Kent Overstreet 2025-10-04   73  
d74cd450a4cba9 Kent Overstreet 2025-10-04   74  	if (c) {
d74cd450a4cba9 Kent Overstreet 2025-10-04   75  		bch2_journal_flush_all_pins(&c->journal);
d74cd450a4cba9 Kent Overstreet 2025-10-04   76  		bch2_journal_block(&c->journal);
d74cd450a4cba9 Kent Overstreet 2025-10-04  @77  		mutex_lock(&c->sb_lock);
d74cd450a4cba9 Kent Overstreet 2025-10-04   78  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04   79  
d74cd450a4cba9 Kent Overstreet 2025-10-04   80  	memcpy(new_buckets,	ja->buckets,	ja->nr * sizeof(u64));
d74cd450a4cba9 Kent Overstreet 2025-10-04   81  	memcpy(new_bucket_seq,	ja->bucket_seq,	ja->nr * sizeof(u64));
d74cd450a4cba9 Kent Overstreet 2025-10-04   82  
d74cd450a4cba9 Kent Overstreet 2025-10-04   83  	BUG_ON(ja->discard_idx > ja->nr);
d74cd450a4cba9 Kent Overstreet 2025-10-04   84  
d74cd450a4cba9 Kent Overstreet 2025-10-04   85  	pos = ja->discard_idx ?: ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04   86  
d74cd450a4cba9 Kent Overstreet 2025-10-04   87  	memmove(new_buckets + pos + nr_got,
d74cd450a4cba9 Kent Overstreet 2025-10-04   88  		new_buckets + pos,
d74cd450a4cba9 Kent Overstreet 2025-10-04   89  		sizeof(new_buckets[0]) * (ja->nr - pos));
d74cd450a4cba9 Kent Overstreet 2025-10-04   90  	memmove(new_bucket_seq + pos + nr_got,
d74cd450a4cba9 Kent Overstreet 2025-10-04   91  		new_bucket_seq + pos,
d74cd450a4cba9 Kent Overstreet 2025-10-04   92  		sizeof(new_bucket_seq[0]) * (ja->nr - pos));
d74cd450a4cba9 Kent Overstreet 2025-10-04   93  
d74cd450a4cba9 Kent Overstreet 2025-10-04   94  	for (i = 0; i < nr_got; i++) {
d74cd450a4cba9 Kent Overstreet 2025-10-04   95  		new_buckets[pos + i] = bu[i];
d74cd450a4cba9 Kent Overstreet 2025-10-04   96  		new_bucket_seq[pos + i] = 0;
d74cd450a4cba9 Kent Overstreet 2025-10-04   97  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04   98  
d74cd450a4cba9 Kent Overstreet 2025-10-04   99  	nr = ja->nr + nr_got;
d74cd450a4cba9 Kent Overstreet 2025-10-04  100  
d74cd450a4cba9 Kent Overstreet 2025-10-04  101  	ret = bch2_journal_buckets_to_sb(c, ca, new_buckets, nr);
d74cd450a4cba9 Kent Overstreet 2025-10-04  102  	if (ret)
d74cd450a4cba9 Kent Overstreet 2025-10-04  103  		goto err_unblock;
d74cd450a4cba9 Kent Overstreet 2025-10-04  104  
d74cd450a4cba9 Kent Overstreet 2025-10-04  105  	bch2_write_super(c);
d74cd450a4cba9 Kent Overstreet 2025-10-04  106  
d74cd450a4cba9 Kent Overstreet 2025-10-04  107  	/* Commit: */
d74cd450a4cba9 Kent Overstreet 2025-10-04  108  	if (c)
d74cd450a4cba9 Kent Overstreet 2025-10-04  109  		spin_lock(&c->journal.lock);
d74cd450a4cba9 Kent Overstreet 2025-10-04  110  
d74cd450a4cba9 Kent Overstreet 2025-10-04  111  	swap(new_buckets,	ja->buckets);
d74cd450a4cba9 Kent Overstreet 2025-10-04  112  	swap(new_bucket_seq,	ja->bucket_seq);
d74cd450a4cba9 Kent Overstreet 2025-10-04  113  	ja->nr = nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04  114  
d74cd450a4cba9 Kent Overstreet 2025-10-04  115  	if (pos <= ja->discard_idx)
d74cd450a4cba9 Kent Overstreet 2025-10-04  116  		ja->discard_idx = (ja->discard_idx + nr_got) % ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04  117  	if (pos <= ja->dirty_idx_ondisk)
d74cd450a4cba9 Kent Overstreet 2025-10-04  118  		ja->dirty_idx_ondisk = (ja->dirty_idx_ondisk + nr_got) % ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04  119  	if (pos <= ja->dirty_idx)
d74cd450a4cba9 Kent Overstreet 2025-10-04  120  		ja->dirty_idx = (ja->dirty_idx + nr_got) % ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04  121  	if (pos <= ja->cur_idx)
d74cd450a4cba9 Kent Overstreet 2025-10-04  122  		ja->cur_idx = (ja->cur_idx + nr_got) % ja->nr;
d74cd450a4cba9 Kent Overstreet 2025-10-04  123  
d74cd450a4cba9 Kent Overstreet 2025-10-04  124  	if (c)
d74cd450a4cba9 Kent Overstreet 2025-10-04  125  		spin_unlock(&c->journal.lock);
d74cd450a4cba9 Kent Overstreet 2025-10-04  126  err_unblock:
d74cd450a4cba9 Kent Overstreet 2025-10-04  127  	if (c) {
d74cd450a4cba9 Kent Overstreet 2025-10-04  128  		bch2_journal_unblock(&c->journal);
d74cd450a4cba9 Kent Overstreet 2025-10-04  129  		mutex_unlock(&c->sb_lock);
d74cd450a4cba9 Kent Overstreet 2025-10-04  130  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04  131  
d74cd450a4cba9 Kent Overstreet 2025-10-04  132  	if (ret) {
d74cd450a4cba9 Kent Overstreet 2025-10-04  133  		CLASS(btree_trans, trans)(c);
d74cd450a4cba9 Kent Overstreet 2025-10-04  134  		for (i = 0; i < nr_got; i++)
d74cd450a4cba9 Kent Overstreet 2025-10-04  135  			bch2_trans_mark_metadata_bucket(trans, ca,
d74cd450a4cba9 Kent Overstreet 2025-10-04  136  						bu[i], BCH_DATA_free, 0,
d74cd450a4cba9 Kent Overstreet 2025-10-04  137  						BTREE_TRIGGER_transactional);
d74cd450a4cba9 Kent Overstreet 2025-10-04  138  	}
d74cd450a4cba9 Kent Overstreet 2025-10-04  139  err_free:
d74cd450a4cba9 Kent Overstreet 2025-10-04  140  	for (i = 0; i < nr_got; i++)
d74cd450a4cba9 Kent Overstreet 2025-10-04  141  		bch2_open_bucket_put(c, ob[i]);
d74cd450a4cba9 Kent Overstreet 2025-10-04  142  
d74cd450a4cba9 Kent Overstreet 2025-10-04  143  	kfree(new_bucket_seq);
d74cd450a4cba9 Kent Overstreet 2025-10-04  144  	kfree(new_buckets);
d74cd450a4cba9 Kent Overstreet 2025-10-04  145  	kfree(ob);
d74cd450a4cba9 Kent Overstreet 2025-10-04  146  	kfree(bu);
d74cd450a4cba9 Kent Overstreet 2025-10-04 @147  	return ret;
d74cd450a4cba9 Kent Overstreet 2025-10-04  148  }
d74cd450a4cba9 Kent Overstreet 2025-10-04  149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

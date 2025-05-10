Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0314A1F03D2
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746913229; cv=none; b=Ax/cUB+zJaJ+EO+4iP4qH/NOOJ2XhbAy9yphTotTer6nfNvy5tXo73IdYwEVSbINjg05Q8bjL7r3Z01390AhiwoZqZz9x4+zppG722vmCpzFKEa6mn7AZIKKM8NCmpNMDmEEGhcpKrHM/nO5LrrquL/V5N+WIYeTvbMFXtpQwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746913229; c=relaxed/simple;
	bh=7IYR4BMn67xhVpeHzEFZMOmTVeMdOvoqQI/+wrKGKGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8APEGcDsdphAu54n5t6T8qqvR6Ks/sixpsx6N3MOWwwxUkuuIU1zPt5t4KuMvlj3wtamsfqjbM61oaWXF3VQ0ZbvZ9A2rJD7ZD2IxNIrRHri1JiH93vUGZXy271qMhxCg4rdFHI+X0JpqB40/AvJFiL27vxQ/ZuQ8iJ+CW5Nr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE71acX2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE71acX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746913227; x=1778449227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7IYR4BMn67xhVpeHzEFZMOmTVeMdOvoqQI/+wrKGKGY=;
  b=LE71acX2/kL5WxqUOifi+bB5NVxuiOfBkg8jdxvMFMMzRR1/fVsYjhOE
   pXFU4ztSEj7xCitpSO6+gTzePv1K/340vBTV6VUYM4Q98PgqTuKveoWBe
   uS6jmzzC0mhSGzQSyfBXWmBxe0K/wxT2VWIHmJSplzin41jO7Jdu4GzNM
   qTIBjcaNAU1RPQUvB3g+b9LC29yRhvtAkCAJa8sM5BHrhFe0puGyIXCFB
   sjSpqlX6SJlGzKyZhz4d3gSd12/KRJRaghgHYIKBqF6xbaEszhSZM782h
   0UWeAvlrs566toZs9eNukgbhAn3rOjh9ioGqqdQafiul4iDy9ljPW5rOj
   A==;
X-CSE-ConnectionGUID: bGC2Dxv+ScOQbt1kRwW0IQ==
X-CSE-MsgGUID: SVR1wKYqTKapa81Jf6MFWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="74115053"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="74115053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 14:40:26 -0700
X-CSE-ConnectionGUID: Gjo14cMbS+uaJSI9ZPzwXg==
X-CSE-MsgGUID: rWej0ydARE2IrW9PTHhOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="168039599"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 May 2025 14:40:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDrvj-000DPH-0V;
	Sat, 10 May 2025 21:40:23 +0000
Date: Sun, 11 May 2025 05:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 171/199]
 fs/bcachefs/backpointers.c:334 __bch2_backpointer_get_key() warn: passing
 zero to 'ERR_CAST'
Message-ID: <202505110519.F1cJbDqf-lkp@intel.com>
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
head:   d815fb1b379fb43f7a33d1bede6efea16b6405e6
commit: c85f7244967c89ccd189af685cd7d5401501eee6 [171/199] bcachefs: Fix missing commit in backpointer to missing target
:::::: branch date: 2 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110519.F1cJbDqf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505110519.F1cJbDqf-lkp@intel.com/

smatch warnings:
fs/bcachefs/backpointers.c:334 __bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +334 fs/bcachefs/backpointers.c

c85f7244967c89c Kent Overstreet 2025-05-09  283  
c85f7244967c89c Kent Overstreet 2025-05-09  284  static struct bkey_s_c __bch2_backpointer_get_key(struct btree_trans *trans,
9e92d6e9efb02c6 Kent Overstreet 2024-11-14  285  						  struct bkey_s_c_backpointer bp,
a8c752bb1d93a24 Kent Overstreet 2022-03-17  286  						  struct btree_iter *iter,
056cae1c00b9773 Kent Overstreet 2024-11-14  287  						  unsigned iter_flags,
c85f7244967c89c Kent Overstreet 2025-05-09  288  						  struct bkey_buf *last_flushed,
c85f7244967c89c Kent Overstreet 2025-05-09  289  						  bool commit)
a8c752bb1d93a24 Kent Overstreet 2022-03-17  290  {
a8c752bb1d93a24 Kent Overstreet 2022-03-17  291  	struct bch_fs *c = trans->c;
633cf069445d953 Kent Overstreet 2024-04-30  292  
f11ca2ab18e369a Kent Overstreet 2024-11-27  293  	if (unlikely(bp.v->btree_id >= btree_id_nr_alive(c)))
f11ca2ab18e369a Kent Overstreet 2024-11-27  294  		return bkey_s_c_null;
f11ca2ab18e369a Kent Overstreet 2024-11-27  295  
a8c752bb1d93a24 Kent Overstreet 2022-03-17  296  	bch2_trans_node_iter_init(trans, iter,
9e92d6e9efb02c6 Kent Overstreet 2024-11-14  297  				  bp.v->btree_id,
9e92d6e9efb02c6 Kent Overstreet 2024-11-14  298  				  bp.v->pos,
ca16fa6b860fe35 Kent Overstreet 2024-12-28  299  				  0,
ca16fa6b860fe35 Kent Overstreet 2024-12-28  300  				  bp.v->level,
6bdefe9c3900b3b Kent Overstreet 2023-03-29  301  				  iter_flags);
9180ad2e161b703 Kent Overstreet 2025-03-21  302  	struct bkey_s_c k = bch2_btree_iter_peek_slot(trans, iter);
a8c752bb1d93a24 Kent Overstreet 2022-03-17  303  	if (bkey_err(k)) {
a8c752bb1d93a24 Kent Overstreet 2022-03-17  304  		bch2_trans_iter_exit(trans, iter);
a8c752bb1d93a24 Kent Overstreet 2022-03-17  305  		return k;
a8c752bb1d93a24 Kent Overstreet 2022-03-17  306  	}
a8c752bb1d93a24 Kent Overstreet 2022-03-17  307  
2581f89ac8d7174 Kent Overstreet 2025-04-02  308  	/*
2581f89ac8d7174 Kent Overstreet 2025-04-02  309  	 * peek_slot() doesn't normally return NULL - except when we ask for a
2581f89ac8d7174 Kent Overstreet 2025-04-02  310  	 * key at a btree level that doesn't exist.
2581f89ac8d7174 Kent Overstreet 2025-04-02  311  	 *
2581f89ac8d7174 Kent Overstreet 2025-04-02  312  	 * We may want to revisit this and change peek_slot():
2581f89ac8d7174 Kent Overstreet 2025-04-02  313  	 */
2581f89ac8d7174 Kent Overstreet 2025-04-02  314  	if (!k.k) {
2581f89ac8d7174 Kent Overstreet 2025-04-02  315  		bkey_init(&iter->k);
2581f89ac8d7174 Kent Overstreet 2025-04-02  316  		iter->k.p = bp.v->pos;
2581f89ac8d7174 Kent Overstreet 2025-04-02  317  		k.k = &iter->k;
2581f89ac8d7174 Kent Overstreet 2025-04-02  318  	}
2581f89ac8d7174 Kent Overstreet 2025-04-02  319  
9e92d6e9efb02c6 Kent Overstreet 2024-11-14  320  	if (k.k &&
eb25733aba20544 Kent Overstreet 2024-11-15  321  	    extent_matches_bp(c, bp.v->btree_id, bp.v->level, k, bp))
a8c752bb1d93a24 Kent Overstreet 2022-03-17  322  		return k;
a8c752bb1d93a24 Kent Overstreet 2022-03-17  323  
a8c752bb1d93a24 Kent Overstreet 2022-03-17  324  	bch2_trans_iter_exit(trans, iter);
ca16fa6b860fe35 Kent Overstreet 2024-12-28  325  
ca16fa6b860fe35 Kent Overstreet 2024-12-28  326  	if (!bp.v->level) {
c85f7244967c89c Kent Overstreet 2025-05-09  327  		int ret = backpointer_target_not_found(trans, bp, k, last_flushed, commit);
c2c2a4d6420bbfd Kent Overstreet 2024-11-12  328  		return ret ? bkey_s_c_err(ret) : bkey_s_c_null;
853960d00b4b3df Kent Overstreet 2023-11-04  329  	} else {
c85f7244967c89c Kent Overstreet 2025-05-09  330  		struct btree *b = __bch2_backpointer_get_node(trans, bp, iter, last_flushed, commit);
ca16fa6b860fe35 Kent Overstreet 2024-12-28  331  		if (b == ERR_PTR(-BCH_ERR_backpointer_to_overwritten_btree_node))
ca16fa6b860fe35 Kent Overstreet 2024-12-28  332  			return bkey_s_c_null;
c2c2a4d6420bbfd Kent Overstreet 2024-11-12  333  		if (IS_ERR_OR_NULL(b))
c2c2a4d6420bbfd Kent Overstreet 2024-11-12 @334  			return ((struct bkey_s_c) { .k = ERR_CAST(b) });
a8c752bb1d93a24 Kent Overstreet 2022-03-17  335  
853960d00b4b3df Kent Overstreet 2023-11-04  336  		return bkey_i_to_s_c(&b->key);
a8c752bb1d93a24 Kent Overstreet 2022-03-17  337  	}
a8c752bb1d93a24 Kent Overstreet 2022-03-17  338  }
a8c752bb1d93a24 Kent Overstreet 2022-03-17  339  

:::::: The code at line 334 was first introduced by commit
:::::: c2c2a4d6420bbfd584aa5e159a6f78b7b5124fd7 bcachefs: bch2_backpointer_get_key() now repairs dangling backpointers

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

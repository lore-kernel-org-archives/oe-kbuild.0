Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065EC36C
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732444033; cv=none; b=SC5qV0j8olprmndyAjnQ5MeL0cbFWJPc3LTZ6gF/KHa8gSf1NaCGiEUBv+9GBdRM7aQ56Mg1IwS8LsQbJfsJfWgsqC+ZxRpkEUXBwcbu+P4ofvLfDYymEkvu3Oh95j2B0Aby6BuFG7as94dww+igdZ8FdgUfFsWUFtGfwbVZ9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732444033; c=relaxed/simple;
	bh=xDojRUamTBkAypU8cgPPT8dck69r8Vd0LgNtjAGUzCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVfjTKV0IpBuzs140sB8oPODBwmWDxmQy5Hy8KLc18OmjTMLswXlK/xQBQRGMfNGj3nlLU1DqvFDzoj9Y3DguQOZVP24s8XzuVqfu6wjP7kNefi8Ys7sJDUZMwL/9fUSTEIvDthI5jEhuHTdZglwI1QzYQrRX0kAmLZVJKH6etY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/Avjtz8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/Avjtz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732444032; x=1763980032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDojRUamTBkAypU8cgPPT8dck69r8Vd0LgNtjAGUzCQ=;
  b=D/Avjtz8+K4BUPm9rPrM4PffkU62QfOsSzY9/XNCnkbWWkPupf216LMz
   JiHj+w24hUIqFXQg/jatJxgypZBUsMqqJQdbaBfic7s8UmrP092YYU3hY
   8MFvblRY8ysG/I+0FjxjvQbcU0v2ufADYZX0t4Raycjdx/hFUSQOiY7BY
   rChFg9k7yLvxgPXuaorAVC/OxHn1E47eswFvQkMA3qBnZKzo73YP92bwM
   cglRuWZo+3vdtF5xR7bT29DOGn0VVGbUVDu8yQFTiWO1Mc+8fLjnSP+Et
   0SnwQMx7TS16VH8dQ21ZzqUVA9BUq2zNbP950hcqvmAROSe3Pnb6ehlip
   Q==;
X-CSE-ConnectionGUID: KAZ633BGTHyTlO34f26eaw==
X-CSE-MsgGUID: /9KG7OPxQtqt4qMbGfMyHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="20142206"
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="20142206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 02:27:11 -0800
X-CSE-ConnectionGUID: cxwgnY9TQFOJc1rM8UwS7w==
X-CSE-MsgGUID: QmNQfmCHRpKi3myIkvAHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="95408419"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Nov 2024 02:27:10 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tF9pb-0004xt-2y;
	Sun, 24 Nov 2024 10:27:07 +0000
Date: Sun, 24 Nov 2024 18:26:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 121/122]
 fs/bcachefs/backpointers.c:252 bch2_backpointer_get_key() warn: passing zero
 to 'ERR_CAST'
Message-ID: <202411241837.x4f2R2fz-lkp@intel.com>
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
head:   7523f438871c5a777f0826187648427d7698b475
commit: b98f75357e030104047942b7bb4cb5251b9b4275 [121/122] bcachefs: bch2_backpointer_get_key() now repairs dangling backpointers
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-161-20241124 (https://download.01.org/0day-ci/archive/20241124/202411241837.x4f2R2fz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411241837.x4f2R2fz-lkp@intel.com/

smatch warnings:
fs/bcachefs/backpointers.c:252 bch2_backpointer_get_key() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +252 fs/bcachefs/backpointers.c

a8c752bb1d93a2 Kent Overstreet 2022-03-17  221  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  222  struct bkey_s_c bch2_backpointer_get_key(struct btree_trans *trans,
de95cc201a972c Kent Overstreet 2024-11-14  223  					 struct bkey_s_c_backpointer bp,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  224  					 struct btree_iter *iter,
0e196f73280b60 Kent Overstreet 2024-11-14  225  					 unsigned iter_flags,
0e196f73280b60 Kent Overstreet 2024-11-14  226  					 struct bkey_buf *last_flushed)
a8c752bb1d93a2 Kent Overstreet 2022-03-17  227  {
de95cc201a972c Kent Overstreet 2024-11-14  228  	if (likely(!bp.v->level)) {
a8c752bb1d93a2 Kent Overstreet 2022-03-17  229  		struct bch_fs *c = trans->c;
633cf069445d95 Kent Overstreet 2024-04-30  230  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  231  		bch2_trans_node_iter_init(trans, iter,
de95cc201a972c Kent Overstreet 2024-11-14  232  					  bp.v->btree_id,
de95cc201a972c Kent Overstreet 2024-11-14  233  					  bp.v->pos,
853960d00b4b3d Kent Overstreet 2023-11-04  234  					  0, 0,
6bdefe9c3900b3 Kent Overstreet 2023-03-29  235  					  iter_flags);
633cf069445d95 Kent Overstreet 2024-04-30  236  		struct bkey_s_c k = bch2_btree_iter_peek_slot(iter);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  237  		if (bkey_err(k)) {
a8c752bb1d93a2 Kent Overstreet 2022-03-17  238  			bch2_trans_iter_exit(trans, iter);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  239  			return k;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  240  		}
a8c752bb1d93a2 Kent Overstreet 2022-03-17  241  
de95cc201a972c Kent Overstreet 2024-11-14  242  		if (k.k &&
f106dcc3f2ef1e Kent Overstreet 2024-11-15  243  		    extent_matches_bp(c, bp.v->btree_id, bp.v->level, k, bp))
a8c752bb1d93a2 Kent Overstreet 2022-03-17  244  			return k;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  245  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  246  		bch2_trans_iter_exit(trans, iter);
b98f75357e0301 Kent Overstreet 2024-11-12  247  		int ret = backpointer_target_not_found(trans, bp, k, last_flushed);
b98f75357e0301 Kent Overstreet 2024-11-12  248  		return ret ? bkey_s_c_err(ret) : bkey_s_c_null;
853960d00b4b3d Kent Overstreet 2023-11-04  249  	} else {
0e196f73280b60 Kent Overstreet 2024-11-14  250  		struct btree *b = bch2_backpointer_get_node(trans, bp, iter, last_flushed);
b98f75357e0301 Kent Overstreet 2024-11-12  251  		if (IS_ERR_OR_NULL(b))
b98f75357e0301 Kent Overstreet 2024-11-12 @252  			return ((struct bkey_s_c) { .k = ERR_CAST(b) });
a8c752bb1d93a2 Kent Overstreet 2022-03-17  253  
853960d00b4b3d Kent Overstreet 2023-11-04  254  		return bkey_i_to_s_c(&b->key);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  255  	}
a8c752bb1d93a2 Kent Overstreet 2022-03-17  256  }
a8c752bb1d93a2 Kent Overstreet 2022-03-17  257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

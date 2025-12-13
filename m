Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ECF3054DE
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765625497; cv=none; b=ZTu4D6073PArQp3k+iXF5Idy4k3tyYlU3+g8q4fbieN+rthHG8Eg6K1Ec7oFduAMJALLBE5A+QCCiGoSA7uyTnHbs8UtqDSyVq9QP24qPsTjazABd489gkNMc7iS2tMip3CRKXHH10uhMJqPOXNLPE9LnnER6eCWGReUkPOiMkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765625497; c=relaxed/simple;
	bh=EJaV8ibyvxriEYPzaH8+6PfbJGDSwVqQ0JUz100fDfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HTmtvbuKcT0SK0zJ7Yy5tXNOdkmtyqICpawpFfoJ2BuVtuoTEjORap2AVKbw3j+1m+HiCj3LnkPE7WDqFe7mXMT6wMT9d58e5C6AoqHo2WYhqIQ9z6FH+ThlKCRgjTw55Ewrhsow4ELwJn6rZG5wmd/w/49gu/oM0TN6GYY+fPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcKCJqGN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcKCJqGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765625496; x=1797161496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJaV8ibyvxriEYPzaH8+6PfbJGDSwVqQ0JUz100fDfA=;
  b=gcKCJqGNephz9/PHrirL7B9XSdLjeMz7AjMQFuW7uW4Hyr7nWZt5/j4v
   0OYy9Jd4q+SV0kn40dZ8PTL9DEM9wu/JS6AgBux78cHDXZb8rszG7gaNu
   b7sAIyjYchSMW0sE5DtKpSAmX8NK6KBBge0jrbH9iAEgRVCJjGT9aJjgJ
   p/HFulmNCePjf65/MkWajHro5SLpCNEGlQtf+yTBWH+O2E7UNbkKtSASH
   TfMCjzK5+Cc7xOzncnCSArBvVJ5T7lwJYCkzIGNR2sWH6y3vKFkd0iZcZ
   KzE9JQS4MiO6SZ9djsRRZuxhok4d9UzgIkm6afg9e0XA+gzLJdezVcbSB
   g==;
X-CSE-ConnectionGUID: uccRs73VT9+RHtVM8ANn+w==
X-CSE-MsgGUID: lXjgawLUSsum4p98bSBxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67647223"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67647223"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:31:35 -0800
X-CSE-ConnectionGUID: NYTMYK39SqWXs5B26k5wrQ==
X-CSE-MsgGUID: ZfOZ+KsbTk286vGJXNFFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="220682867"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 03:31:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNqV-000000007YF-3I4d;
	Sat, 13 Dec 2025 11:31:31 +0000
Date: Sat, 13 Dec 2025 19:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:master 1132/1133] fs/bcachefs/btree/bset.c:297
 __bch2_verify_insert_pos() error: we previously assumed 'prev' could be null
 (see line 261)
Message-ID: <202512131957.UC9Ah0R2-lkp@intel.com>
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
head:   80758af7483ae60d55095a425cd2cdc3cfa47b86
commit: 2869354f0ae41176f4b4c178978020ad4cdf075e [1132/1133] bcachefs: bch2_btree_node_keys_to_text()
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: microblaze-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131957.UC9Ah0R2-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131957.UC9Ah0R2-lkp@intel.com/

New smatch warnings:
fs/bcachefs/btree/bset.c:297 __bch2_verify_insert_pos() error: we previously assumed 'prev' could be null (see line 261)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/prev +297 fs/bcachefs/btree/bset.c

1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  250  
34aeb820f900529 fs/bcachefs/bset.c       Kent Overstreet 2025-05-10  251  static void __bch2_verify_insert_pos(struct btree *b, struct bkey_packed *where,
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  252  				     struct bkey_packed *insert, unsigned clobber_u64s)
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  253  {
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  254  	struct bset_tree *t = bch2_bkey_to_bset(b, where);
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  255  	struct bkey_packed *prev = bch2_bkey_prev_all(b, t, where);
5cfd69775eb5460 fs/bcachefs/bset.c       Kent Overstreet 2023-09-09  256  	struct bkey_packed *next = (void *) ((u64 *) where->_data + clobber_u64s);
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  257  #if 0
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  258  	BUG_ON(prev &&
a00fd8c535d91c5 fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  259  	       bkey_iter_cmp(b, prev, insert) > 0);
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  260  #else
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21 @261  	if (prev &&
a00fd8c535d91c5 fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  262  	    bkey_iter_cmp(b, prev, insert) > 0) {
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  263  		CLASS(printbuf, buf)();
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  264  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  265  		bch2_btree_node_bsets_to_text(&buf, NULL, b);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  266  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  267  		prt_str(&buf, "prev > insert:\n");
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  268  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  269  		prt_str(&buf, "prev    key ");
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  270  		struct bkey k1 = bkey_unpack_key(b, prev);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  271  		bch2_bkey_to_text(&buf, &k1);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  272  		prt_newline(&buf);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  273  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  274  		prt_str(&buf, "insert  key ");
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  275  		struct bkey k2 = bkey_unpack_key(b, insert);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  276  		bch2_bkey_to_text(&buf, &k2);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  277  		prt_newline(&buf);
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  278  
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  279  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  280  		bch2_print_string_as_lines(KERN_ERR, buf.buf);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  281  		panic("%s\n", __func__);
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  282  	}
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  283  #endif
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  284  #if 0
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  285  	BUG_ON(next != btree_bkey_last(b, t) &&
a00fd8c535d91c5 fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  286  	       bkey_iter_cmp(b, insert, next) > 0);
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  287  #else
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  288  	if (next != btree_bkey_last(b, t) &&
a00fd8c535d91c5 fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  289  	    bkey_iter_cmp(b, insert, next) > 0) {
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  290  		CLASS(printbuf, buf)();
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  291  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  292  		bch2_btree_node_bsets_to_text(&buf, NULL, b);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  293  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  294  		prt_str(&buf, "insert > next:\n");
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  295  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  296  		prt_str(&buf, "prev    key ");
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12 @297  		struct bkey k1 = bkey_unpack_key(b, prev);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  298  		bch2_bkey_to_text(&buf, &k1);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  299  		prt_newline(&buf);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  300  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  301  		prt_str(&buf, "insert  key ");
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  302  		struct bkey k2 = bkey_unpack_key(b, insert);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  303  		bch2_bkey_to_text(&buf, &k2);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  304  		prt_newline(&buf);
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  305  
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  306  
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  307  		bch2_print_string_as_lines(KERN_ERR, buf.buf);
2869354f0ae4117 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  308  		panic("%s\n", __func__);
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  309  	}
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  310  #endif
1c6fdbd8f2465dd fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  311  }
271a3d3a4b30dcd fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  312  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

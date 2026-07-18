Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394472618
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784414681; cv=none; b=aHdT6lts9MQ7YZkxkUw3/c+3snDy4NtTByzKq2fAhAMQ4yNrC4Gpl4S1HUkMCHDCEvF4DizJfInPdCCebHjVzcssnFgaPgfL0qoQPqxnoYoP1vXY1girOcDvgl9wMODiCPS1YCO/2gVJgPqV5CgGmWCy17l4SgNcn8RczeK65Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784414681; c=relaxed/simple;
	bh=5o3fsjgmmLeLDfETrwtMGOrKAZTS1Fi18K11+cwy00w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q81JGo5QWQEtazBrc00xC1swv49RO+kNczPjzEIfARwR+I3TPhwuGN8YPVK323gjdKTIrJgQQK2ey4kKnKqOysmtFyxKEyKZOJUmxRbmB9I7I1fLmwGLm4P/7xSsqtADm/ctldH/6Q1uN2nVW8agOWKEyHZ1Ue5+XdNNsSvVYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfuSCsxU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfuSCsxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784414679; x=1815950679;
  h=date:from:to:cc:subject:message-id;
  bh=5o3fsjgmmLeLDfETrwtMGOrKAZTS1Fi18K11+cwy00w=;
  b=EfuSCsxUA+1Ux3Q6TxoL3X3xtPYBy9QbrcYYEjCvSdoQFQU/q0meUb4i
   bPjXRNF+odMmQC75BTjLR6qKicqQd92h9eZBgttHhzv0X5RigN7jl5aws
   Rr9DuxBSXiBAoT5ynrNaef2qj3mK3I0Mk2ktrUu4t6ruNGCg2T0V8TZfy
   1AAZKFCxSAxJmVNsIHE8Kq869jwRkSpqOY2fbVkYEPCnnIBY+v1IPxe6H
   0gLJJOuqK8cMvGgCFd/JI7l8ecYlJ6ZFTTmRE9fQD+VRNZkhRSb42y9Zh
   uvt4crr0MZcjTAzk8bSNgM5JhGB+gB7naMmqsTQfYgKmoqK/7fJjuyxFK
   A==;
X-CSE-ConnectionGUID: 2hJkXElMQhCqTZF2xsUV2w==
X-CSE-MsgGUID: 1JXXN5+sTUu2vJH8E74mLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95401325"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95401325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 15:44:39 -0700
X-CSE-ConnectionGUID: prE4fmwjQzKAJDmN3Z3UMw==
X-CSE-MsgGUID: 74s4YhgIT8ChruUaloC1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="261375744"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2026 15:44:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlDlh-00000000VAH-3rMi;
	Sat, 18 Jul 2026 22:44:28 +0000
Date: Sun, 19 Jul 2026 06:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 1132/1155] fs/bcachefs/btree/bset.c:297
 __bch2_verify_insert_pos() error: we previously assumed 'prev' could be null
 (see line 261)
Message-ID: <202607190628.kRzDrnrE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 2869354f0ae41176f4b4c178978020ad4cdf075e [1132/1155] bcachefs: bch2_btree_node_keys_to_text()
:::::: branch date: 9 weeks ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260719/202607190628.kRzDrnrE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607190628.kRzDrnrE-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/bset.c:297 __bch2_verify_insert_pos() error: we previously assumed 'prev' could be null (see line 261)

vim +/prev +297 fs/bcachefs/btree/bset.c

1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  250  
34aeb820f90052 fs/bcachefs/bset.c       Kent Overstreet 2025-05-10  251  static void __bch2_verify_insert_pos(struct btree *b, struct bkey_packed *where,
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  252  				     struct bkey_packed *insert, unsigned clobber_u64s)
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  253  {
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  254  	struct bset_tree *t = bch2_bkey_to_bset(b, where);
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  255  	struct bkey_packed *prev = bch2_bkey_prev_all(b, t, where);
5cfd69775eb546 fs/bcachefs/bset.c       Kent Overstreet 2023-09-09  256  	struct bkey_packed *next = (void *) ((u64 *) where->_data + clobber_u64s);
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  257  #if 0
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  258  	BUG_ON(prev &&
a00fd8c535d91c fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  259  	       bkey_iter_cmp(b, prev, insert) > 0);
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  260  #else
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21 @261  	if (prev &&
a00fd8c535d91c fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  262  	    bkey_iter_cmp(b, prev, insert) > 0) {
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  263  		CLASS(printbuf, buf)();
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  264  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  265  		bch2_btree_node_bsets_to_text(&buf, NULL, b);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  266  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  267  		prt_str(&buf, "prev > insert:\n");
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  268  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  269  		prt_str(&buf, "prev    key ");
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  270  		struct bkey k1 = bkey_unpack_key(b, prev);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  271  		bch2_bkey_to_text(&buf, &k1);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  272  		prt_newline(&buf);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  273  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  274  		prt_str(&buf, "insert  key ");
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  275  		struct bkey k2 = bkey_unpack_key(b, insert);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  276  		bch2_bkey_to_text(&buf, &k2);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  277  		prt_newline(&buf);
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  278  
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  279  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  280  		bch2_print_string_as_lines(KERN_ERR, buf.buf);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  281  		panic("%s\n", __func__);
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  282  	}
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  283  #endif
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  284  #if 0
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  285  	BUG_ON(next != btree_bkey_last(b, t) &&
a00fd8c535d91c fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  286  	       bkey_iter_cmp(b, insert, next) > 0);
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  287  #else
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  288  	if (next != btree_bkey_last(b, t) &&
a00fd8c535d91c fs/bcachefs/bset.c       Kent Overstreet 2018-08-21  289  	    bkey_iter_cmp(b, insert, next) > 0) {
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  290  		CLASS(printbuf, buf)();
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  291  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  292  		bch2_btree_node_bsets_to_text(&buf, NULL, b);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  293  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  294  		prt_str(&buf, "insert > next:\n");
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  295  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  296  		prt_str(&buf, "prev    key ");
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12 @297  		struct bkey k1 = bkey_unpack_key(b, prev);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  298  		bch2_bkey_to_text(&buf, &k1);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  299  		prt_newline(&buf);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  300  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  301  		prt_str(&buf, "insert  key ");
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  302  		struct bkey k2 = bkey_unpack_key(b, insert);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  303  		bch2_bkey_to_text(&buf, &k2);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  304  		prt_newline(&buf);
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  305  
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  306  
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  307  		bch2_print_string_as_lines(KERN_ERR, buf.buf);
2869354f0ae411 fs/bcachefs/btree/bset.c Kent Overstreet 2025-12-12  308  		panic("%s\n", __func__);
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  309  	}
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  310  #endif
1c6fdbd8f2465d fs/bcachefs/bset.c       Kent Overstreet 2017-03-16  311  }
271a3d3a4b30dc fs/bcachefs/bset.c       Kent Overstreet 2016-07-21  312  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

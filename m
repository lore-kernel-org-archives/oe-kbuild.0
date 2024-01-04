Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC63F200A6
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 08:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cWM10upT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704356036; x=1735892036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJVVNZz25dCfN+B6BM9lnP5M8erIIS7q+jvFZzExhkU=;
  b=cWM10upTXVZRC5GcSdyLx6/b37V2i5pQ87jvVXQi9078j4i4xWbSG8hV
   9wcT6VCf2bTnkiK2o1yzXu5wqh9o+p6jE3uXdhMug7Yov0ymfHXa0otiL
   obM0FmXNH7/kr9r1Q0nmENAVMhPQ/9t5kJKlpeMUyUhsmPJirwVdH8Y5k
   W+aMDbHBikgdc0NIsV/mURmCgURhzityaqrJUPpV+fyZt1oclUb9STA5n
   tIy9HLp7+ErMlsAnYH71U/C0hvu97W4feAxoWw10m92/4L0mXaOr0utTi
   GXjOMUL5X8Lz3NaxdsWN7LLT0MkV3jZNZ9MtpfhcjplXbBgCbxwukLswn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4255607"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4255607"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 00:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="903728395"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="903728395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Jan 2024 00:13:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLIrO-000N3I-1p;
	Thu, 04 Jan 2024 08:13:50 +0000
Date: Thu, 4 Jan 2024 16:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/extent_update.c:139:12-13: WARNING opportunity for min()
Message-ID: <202401041653.kKSAOsur-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac865f00af293d081356bec56eea90815094a60e
commit: 08c07fea7b437f0a841f85cc9b670b60dacd85cf bcachefs: Split out extent_update.c
date:   2 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-r064-20231231 (https://download.01.org/0day-ci/archive/20240104/202401041653.kKSAOsur-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401041653.kKSAOsur-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/extent_update.c:139:12-13: WARNING opportunity for min()

vim +139 fs/bcachefs/extent_update.c

08c07fea7b437f Kent Overstreet 2019-11-15   89  
08c07fea7b437f Kent Overstreet 2019-11-15   90  int bch2_extent_atomic_end(struct btree_iter *iter,
08c07fea7b437f Kent Overstreet 2019-11-15   91  			   struct bkey_i *insert,
08c07fea7b437f Kent Overstreet 2019-11-15   92  			   struct bpos *end)
08c07fea7b437f Kent Overstreet 2019-11-15   93  {
08c07fea7b437f Kent Overstreet 2019-11-15   94  	struct btree_trans *trans = iter->trans;
08c07fea7b437f Kent Overstreet 2019-11-15   95  	struct btree *b;
08c07fea7b437f Kent Overstreet 2019-11-15   96  	struct btree_node_iter	node_iter;
08c07fea7b437f Kent Overstreet 2019-11-15   97  	struct bkey_packed	*_k;
08c07fea7b437f Kent Overstreet 2019-11-15   98  	unsigned		nr_iters = 0;
08c07fea7b437f Kent Overstreet 2019-11-15   99  	int ret;
08c07fea7b437f Kent Overstreet 2019-11-15  100  
08c07fea7b437f Kent Overstreet 2019-11-15  101  	ret = bch2_btree_iter_traverse(iter);
08c07fea7b437f Kent Overstreet 2019-11-15  102  	if (ret)
08c07fea7b437f Kent Overstreet 2019-11-15  103  		return ret;
08c07fea7b437f Kent Overstreet 2019-11-15  104  
08c07fea7b437f Kent Overstreet 2019-11-15  105  	b = iter->l[0].b;
08c07fea7b437f Kent Overstreet 2019-11-15  106  	node_iter = iter->l[0].iter;
08c07fea7b437f Kent Overstreet 2019-11-15  107  
08c07fea7b437f Kent Overstreet 2019-11-15  108  	BUG_ON(bkey_cmp(bkey_start_pos(&insert->k), b->data->min_key) < 0);
08c07fea7b437f Kent Overstreet 2019-11-15  109  
08c07fea7b437f Kent Overstreet 2019-11-15  110  	*end = bpos_min(insert->k.p, b->key.k.p);
08c07fea7b437f Kent Overstreet 2019-11-15  111  
08c07fea7b437f Kent Overstreet 2019-11-15  112  	ret = count_iters_for_insert(trans, bkey_i_to_s_c(insert), 0, end,
08c07fea7b437f Kent Overstreet 2019-11-15  113  				     &nr_iters, EXTENT_ITERS_MAX / 2, false);
08c07fea7b437f Kent Overstreet 2019-11-15  114  	if (ret < 0)
08c07fea7b437f Kent Overstreet 2019-11-15  115  		return ret;
08c07fea7b437f Kent Overstreet 2019-11-15  116  
08c07fea7b437f Kent Overstreet 2019-11-15  117  	while ((_k = bch2_btree_node_iter_peek_filter(&node_iter, b,
08c07fea7b437f Kent Overstreet 2019-11-15  118  						      KEY_TYPE_discard))) {
08c07fea7b437f Kent Overstreet 2019-11-15  119  		struct bkey	unpacked;
08c07fea7b437f Kent Overstreet 2019-11-15  120  		struct bkey_s_c	k = bkey_disassemble(b, _k, &unpacked);
08c07fea7b437f Kent Overstreet 2019-11-15  121  		unsigned offset = 0;
08c07fea7b437f Kent Overstreet 2019-11-15  122  
08c07fea7b437f Kent Overstreet 2019-11-15  123  		if (bkey_cmp(bkey_start_pos(k.k), *end) >= 0)
08c07fea7b437f Kent Overstreet 2019-11-15  124  			break;
08c07fea7b437f Kent Overstreet 2019-11-15  125  
08c07fea7b437f Kent Overstreet 2019-11-15  126  		if (bkey_cmp(bkey_start_pos(&insert->k),
08c07fea7b437f Kent Overstreet 2019-11-15  127  			     bkey_start_pos(k.k)) > 0)
08c07fea7b437f Kent Overstreet 2019-11-15  128  			offset = bkey_start_offset(&insert->k) -
08c07fea7b437f Kent Overstreet 2019-11-15  129  				bkey_start_offset(k.k);
08c07fea7b437f Kent Overstreet 2019-11-15  130  
08c07fea7b437f Kent Overstreet 2019-11-15  131  		ret = count_iters_for_insert(trans, k, offset, end,
08c07fea7b437f Kent Overstreet 2019-11-15  132  					&nr_iters, EXTENT_ITERS_MAX, true);
08c07fea7b437f Kent Overstreet 2019-11-15  133  		if (ret)
08c07fea7b437f Kent Overstreet 2019-11-15  134  			break;
08c07fea7b437f Kent Overstreet 2019-11-15  135  
08c07fea7b437f Kent Overstreet 2019-11-15  136  		bch2_btree_node_iter_advance(&node_iter, b);
08c07fea7b437f Kent Overstreet 2019-11-15  137  	}
08c07fea7b437f Kent Overstreet 2019-11-15  138  
08c07fea7b437f Kent Overstreet 2019-11-15 @139  	return ret < 0 ? ret : 0;
08c07fea7b437f Kent Overstreet 2019-11-15  140  }
08c07fea7b437f Kent Overstreet 2019-11-15  141  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

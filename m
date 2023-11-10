Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6756F3D381
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Nov 2023 22:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdudSvTE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699655019; x=1731191019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCRtULFYT8SP7cw/+Gq4TcvVQFhOyxgibK8rT77q7OA=;
  b=gdudSvTEbGWH2gS1bsb8JRVJBUFLZYnPZU4DwwInmeDyp36qNSilVt/1
   kYHpJZ9UpxWEmo0X0PzRdhttGcn7YoV4Q/C323V3gYoVgb/DA63CfR6oo
   oUnT5vYiCg2cXAHrhb8z7fdQx3vSar1m5GR1CUq8eGFK3IQ1tzUfO280N
   AKxi/afdc6S8L9wA/aVR050t9An6cZeTJW/Ll4cHzb3VBLAlOfYobInnF
   SltnARGxZDMjgACVeywphzn4ZJeDcGzSNmYtb+caa5p8+u2JdDSSM3Rhi
   NEsaPj8aeNd7FkD886L8elskHELzJCWf5q5/iTOR+0Z50LJc5+0haR0Bc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="11789715"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11789715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 14:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792941328"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="792941328"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 14:23:34 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZuV-0009yS-3A;
	Fri, 10 Nov 2023 22:23:31 +0000
Date: Sat, 11 Nov 2023 06:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/backpointers.c:321 bch2_backpointer_get_node() warn:
 variable dereferenced before check 'b' (see line 319)
Message-ID: <202311110647.H3uABojn-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ac347a0655dbc7d885e217c89dddd16e2800bd58
commit: 853960d00b4b3df96acbf8e18980896f9115c45c bcachefs: Simplify, fix bch2_backpointer_get_key()
date:   5 days ago
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231111/202311110647.H3uABojn-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110647.H3uABojn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110647.H3uABojn-lkp@intel.com/

smatch warnings:
fs/bcachefs/backpointers.c:321 bch2_backpointer_get_node() warn: variable dereferenced before check 'b' (see line 319)

vim +/b +321 fs/bcachefs/backpointers.c

a8c752bb1d93a2 Kent Overstreet 2022-03-17  297  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  298  struct btree *bch2_backpointer_get_node(struct btree_trans *trans,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  299  					struct btree_iter *iter,
62a03559d667c1 Kent Overstreet 2023-03-31  300  					struct bpos bp_pos,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  301  					struct bch_backpointer bp)
a8c752bb1d93a2 Kent Overstreet 2022-03-17  302  {
a8c752bb1d93a2 Kent Overstreet 2022-03-17  303  	struct bch_fs *c = trans->c;
62a03559d667c1 Kent Overstreet 2023-03-31  304  	struct bpos bucket = bp_pos_to_bucket(c, bp_pos);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  305  	struct btree *b;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  306  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  307  	BUG_ON(!bp.level);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  308  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  309  	bch2_trans_node_iter_init(trans, iter,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  310  				  bp.btree_id,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  311  				  bp.pos,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  312  				  0,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  313  				  bp.level - 1,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  314  				  0);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  315  	b = bch2_btree_iter_peek_node(iter);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  316  	if (IS_ERR(b))
a8c752bb1d93a2 Kent Overstreet 2022-03-17  317  		goto err;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  318  
853960d00b4b3d Kent Overstreet 2023-11-04 @319  	BUG_ON(b->c.level != bp.level - 1);
853960d00b4b3d Kent Overstreet 2023-11-04  320  
a8c752bb1d93a2 Kent Overstreet 2022-03-17 @321  	if (b && extent_matches_bp(c, bp.btree_id, bp.level,
a8c752bb1d93a2 Kent Overstreet 2022-03-17  322  				   bkey_i_to_s_c(&b->key),
a8c752bb1d93a2 Kent Overstreet 2022-03-17  323  				   bucket, bp))
a8c752bb1d93a2 Kent Overstreet 2022-03-17  324  		return b;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  325  
a8c752bb1d93a2 Kent Overstreet 2022-03-17  326  	if (b && btree_node_will_make_reachable(b)) {
a8c752bb1d93a2 Kent Overstreet 2022-03-17  327  		b = ERR_PTR(-BCH_ERR_backpointer_to_overwritten_btree_node);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  328  	} else {
daba90f2da9d1a Kent Overstreet 2023-11-04  329  		backpointer_not_found(trans, bp_pos, bp, bkey_i_to_s_c(&b->key));
a8c752bb1d93a2 Kent Overstreet 2022-03-17  330  		b = NULL;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  331  	}
a8c752bb1d93a2 Kent Overstreet 2022-03-17  332  err:
a8c752bb1d93a2 Kent Overstreet 2022-03-17  333  	bch2_trans_iter_exit(trans, iter);
a8c752bb1d93a2 Kent Overstreet 2022-03-17  334  	return b;
a8c752bb1d93a2 Kent Overstreet 2022-03-17  335  }
a8c752bb1d93a2 Kent Overstreet 2022-03-17  336  

:::::: The code at line 321 was first introduced by commit
:::::: a8c752bb1d93a24a0de753e209d4f4d58d65c878 bcachefs: New on disk format: Backpointers

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

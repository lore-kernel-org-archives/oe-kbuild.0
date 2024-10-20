Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6111376
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729391835; cv=none; b=Txy+bORbUzXlsEu0PJEucWnp8bdvOA8i+qwAAFtWAoSbOrHAkZd4zKcIx93VGyRtfEJEHgbQ+CYNbUuzKIrBIvhEbA9DnpQ3Zgp+BQFZdPupyAg6adSF5udqfTAmWgbJQUQyGKn5BE1WBlminV8gBuSHMi9wKsbiw6Gmv+Yf6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729391835; c=relaxed/simple;
	bh=OUBnpoRFVtUSu1xPJ4FvrQlyFhWzIP+tL9e0xaFVeas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TleHOz9cNXo9l/qQR1dhKQgll8ukpDjK22afn2UyyFgy0niYLg4rScULN8Px4WtlqzbilB/Ue/FAfik1unfoyiQiPklNf80VWIQK/E/eiNpuTchFFFqONnyK+/+vhobJziXBWtZX1Sq5irI1n05aCHXXclaWF+CiB9QHIR7ldpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNkmaQoV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNkmaQoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729391833; x=1760927833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OUBnpoRFVtUSu1xPJ4FvrQlyFhWzIP+tL9e0xaFVeas=;
  b=bNkmaQoVQR9GH2FtcYexxyhd7sSOl/i19zXHnUQbjsW7r8DzJdCp3qfq
   qLDgdsh2BUtx1hc4i/GJxNg4L3VwX9LmPktoDYmTLTWasc1D+cm53hDqh
   Ng7pAEE1npbK7RlTPIuzrDOEdTbxiTVLcRhA7WhpNzbK8KBjhgq5EFRZt
   yFbxqQxM77LzNvGIw4Tc0QqwUKtIqiIxTv9TX70zzzGYi11oXevz+Rn4R
   rdWnfW6R9BecpPpoqN9KJMLwXOv1tFBhriht3VuI4ACpMN9iWXaVNJj87
   oDv6eHYNuxU/OOpC/soL4jTpHLeWZeeZixKIVf17lNDAk8e49IzQiqv0z
   w==;
X-CSE-ConnectionGUID: O4tGWaJ6RI+teTq2DtNbpw==
X-CSE-MsgGUID: qUEwJ6DZS3Wx510hW8E9Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="29110897"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="29110897"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 19:37:13 -0700
X-CSE-ConnectionGUID: fvMvJZhFShyW9b8bZa92lA==
X-CSE-MsgGUID: aC+zdIDJQyKoclgFu1eKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83994365"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 19:37:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Lob-000PnP-0r;
	Sun, 20 Oct 2024 02:37:09 +0000
Date: Sun, 20 Oct 2024 10:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/btree_trans_commit.c:407
 btree_key_can_insert_cached_slowpath() warn: inconsistent returns 'trans'.
Message-ID: <202410201015.Iq1p71Bx-lkp@intel.com>
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
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: 09b0283ee23a02094a43a9b93146d1060c58fc3a bcachefs: Make sure to drop/retake btree locks before reclaim
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20241015 (https://download.01.org/0day-ci/archive/20241020/202410201015.Iq1p71Bx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410201015.Iq1p71Bx-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree_trans_commit.c:407 btree_key_can_insert_cached_slowpath() warn: inconsistent returns 'trans'.

vim +/trans +407 fs/bcachefs/btree_trans_commit.c

b0004d8dfac514 fs/bcachefs/btree_update_leaf.c  Kent Overstreet 2018-08-03  370  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  371  noinline static int
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  372  btree_key_can_insert_cached_slowpath(struct btree_trans *trans, unsigned flags,
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  373  				     struct btree_path *path, unsigned new_u64s)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  374  {
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  375  	struct bch_fs *c = trans->c;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  376  	struct btree_insert_entry *i;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  377  	struct bkey_cached *ck = (void *) path->l[0].b;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  378  	struct bkey_i *new_k;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  379  	int ret;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  380  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  381  	bch2_trans_unlock_write(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  382  	bch2_trans_unlock(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  383  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  384  	new_k = kmalloc(new_u64s * sizeof(u64), GFP_KERNEL);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  385  	if (!new_k) {
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  386  		bch_err(c, "error allocating memory for key cache key, btree %s u64s %u",
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  387  			bch2_btree_id_str(path->btree_id), new_u64s);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  388  		return -BCH_ERR_ENOMEM_btree_key_cache_insert;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  389  	}
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  390  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  391  	ret =   bch2_trans_relock(trans) ?:
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  392  		bch2_trans_lock_write(trans);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  393  	if (unlikely(ret)) {
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  394  		kfree(new_k);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  395  		return ret;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  396  	}
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  397  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  398  	memcpy(new_k, ck->k, ck->u64s * sizeof(u64));
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  399  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  400  	trans_for_each_update(trans, i)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  401  		if (i->old_v == &ck->k->v)
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  402  			i->old_v = &new_k->v;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  403  
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  404  	kfree(ck->k);
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  405  	ck->u64s	= new_u64s;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  406  	ck->k		= new_k;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05 @407  	return 0;
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  408  }
09b0283ee23a02 fs/bcachefs/btree_trans_commit.c Kent Overstreet 2023-11-05  409  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

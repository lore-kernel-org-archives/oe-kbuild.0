Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DC1F5F6
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733767428; cv=none; b=dmp7WPVxoFXaFhRCiLUI1dQNkqbGBwEdnbEpd5VCq4GLJJy3InTsnYOdRHv3UxeLOKiNqofctdh38oYC8KJCxIROj/+T4keJQCGFWSsRC06GW2/wEX76Nx56rUGisHIfi/x8T98kGkvTWqLbBPo9FpzUg50sF/e2SyAdAG8lRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733767428; c=relaxed/simple;
	bh=L3fs+ZcxP6KkUmjDumx/x6RLm2W3ORNrWsqwsJhETHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iyv451P543dX6KZissaaBqjT38qXFP9l+hTZZ9a7nheQSIw0DveXRUVsHxdhg8qWTjF2wWY2H+GG8A3CLRVsNDuaL9ZOGmdTtFREHo0SpgVDHC09DeZsY2kGTYQSZBVPmKgI7VTr4/uD+BhqaXoPTaUrXNJwWamiSD39wf/KCKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/7nkCfF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/7nkCfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733767426; x=1765303426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3fs+ZcxP6KkUmjDumx/x6RLm2W3ORNrWsqwsJhETHc=;
  b=M/7nkCfF/5gmIlaXKbiQ+FcGZMm8vbFiCm04azvgtxwrwmtukLXh1maG
   ARroSttwRqvwsIPVAbDR0KHQCtFUqiiBsGzN4+2EwXKoxNo+Zp2jn0bjo
   RxCLZ9ivu+C0uoCdqrMytNvsPBIXqofeVWMiSRUpPw78MRYxcKDV9GK5/
   QNOOkwTKIoUQ9sttQ96y7LwpGVackrKKf1YBjybwSfw4ji3ntGVMAE2nN
   lk/qz9U0brqsueg0qVtX8lTucnfnuFFjzB1+OmiYBWZts6mt8V62AbQ3w
   o+kkn0eT8RLSHVYVi6FMdtvunDtGFZgyvzHSyhWF5ZnDWICBhPw59oBlA
   w==;
X-CSE-ConnectionGUID: WhLdyosQSLeZwxcEpNMsow==
X-CSE-MsgGUID: 2G110GunRe2LPOHnVQ4dmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34207555"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34207555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 10:03:31 -0800
X-CSE-ConnectionGUID: utBjUkJPTWmNT5tN7IINbg==
X-CSE-MsgGUID: ZYFG7DGvRqiL3iVAhjnYGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="94959764"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2024 10:03:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKi6Q-0004gn-35;
	Mon, 09 Dec 2024 18:03:26 +0000
Date: Tue, 10 Dec 2024 02:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-testing 204/207]
 fs/bcachefs/str_hash.c:164 check_inode_hash_info_matches_root() warn:
 statement has no effect 3
Message-ID: <202412100128.ZOCTYHAo-lkp@intel.com>
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
head:   ac71259d2b2eabd2e1745eb19b0724be4d75fd64
commit: 41df8115fe32fe3911ea5c1d7cb6d182abd689a7 [204/207] bcachefs: bch2_str_hash_check_key() now checks inode hash info
:::::: branch date: 4 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100128.ZOCTYHAo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412100128.ZOCTYHAo-lkp@intel.com/

smatch warnings:
fs/bcachefs/str_hash.c:164 check_inode_hash_info_matches_root() warn: statement has no effect 3

vim +164 fs/bcachefs/str_hash.c

41df8115fe32fe3 Kent Overstreet 2024-12-08  140  
41df8115fe32fe3 Kent Overstreet 2024-12-08  141  /*
41df8115fe32fe3 Kent Overstreet 2024-12-08  142   * All versions of the same inode in different snapshots must have the same hash
41df8115fe32fe3 Kent Overstreet 2024-12-08  143   * seed/type: verify that the hash info we're using matches the root
41df8115fe32fe3 Kent Overstreet 2024-12-08  144   */
41df8115fe32fe3 Kent Overstreet 2024-12-08  145  static int check_inode_hash_info_matches_root(struct btree_trans *trans, u64 inum,
41df8115fe32fe3 Kent Overstreet 2024-12-08  146  					      struct bch_hash_info *hash_info)
41df8115fe32fe3 Kent Overstreet 2024-12-08  147  {
41df8115fe32fe3 Kent Overstreet 2024-12-08  148  	struct bch_fs *c = trans->c;
41df8115fe32fe3 Kent Overstreet 2024-12-08  149  	struct btree_iter iter;
41df8115fe32fe3 Kent Overstreet 2024-12-08  150  	struct bkey_s_c k;
41df8115fe32fe3 Kent Overstreet 2024-12-08  151  	int ret = 0;
41df8115fe32fe3 Kent Overstreet 2024-12-08  152  
41df8115fe32fe3 Kent Overstreet 2024-12-08  153  	for_each_btree_key_reverse_norestart(trans, iter, BTREE_ID_inodes, SPOS(0, inum, U32_MAX),
41df8115fe32fe3 Kent Overstreet 2024-12-08  154  					     BTREE_ITER_all_snapshots, k, ret) {
41df8115fe32fe3 Kent Overstreet 2024-12-08  155  		if (k.k->p.offset != inum)
41df8115fe32fe3 Kent Overstreet 2024-12-08  156  			break;
41df8115fe32fe3 Kent Overstreet 2024-12-08  157  		if (bkey_is_inode(k.k))
41df8115fe32fe3 Kent Overstreet 2024-12-08  158  			goto found;
41df8115fe32fe3 Kent Overstreet 2024-12-08  159  	}
41df8115fe32fe3 Kent Overstreet 2024-12-08  160  	bch_err(c, "%s(): inum %llu not found", __func__, inum);
41df8115fe32fe3 Kent Overstreet 2024-12-08  161  	ret = -BCH_ERR_fsck_repair_unimplemented;
41df8115fe32fe3 Kent Overstreet 2024-12-08  162  	goto err;
41df8115fe32fe3 Kent Overstreet 2024-12-08  163  found:
41df8115fe32fe3 Kent Overstreet 2024-12-08 @164  	struct bch_inode_unpacked inode;
41df8115fe32fe3 Kent Overstreet 2024-12-08  165  	ret = bch2_inode_unpack(k, &inode);
41df8115fe32fe3 Kent Overstreet 2024-12-08  166  	if (ret)
41df8115fe32fe3 Kent Overstreet 2024-12-08  167  		goto err;
41df8115fe32fe3 Kent Overstreet 2024-12-08  168  
41df8115fe32fe3 Kent Overstreet 2024-12-08  169  	struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
41df8115fe32fe3 Kent Overstreet 2024-12-08  170  	if (memcmp(hash_info, &hash2, sizeof(hash2))) {
41df8115fe32fe3 Kent Overstreet 2024-12-08  171  		ret = repair_inode_hash_info(trans, &inode);
41df8115fe32fe3 Kent Overstreet 2024-12-08  172  		if (!ret) {
41df8115fe32fe3 Kent Overstreet 2024-12-08  173  			bch_err(c, "inode hash info mismatch with root, but mismatch not found");
41df8115fe32fe3 Kent Overstreet 2024-12-08  174  			ret = -BCH_ERR_fsck_repair_unimplemented;
41df8115fe32fe3 Kent Overstreet 2024-12-08  175  		}
41df8115fe32fe3 Kent Overstreet 2024-12-08  176  	}
41df8115fe32fe3 Kent Overstreet 2024-12-08  177  err:
41df8115fe32fe3 Kent Overstreet 2024-12-08  178  	bch2_trans_iter_exit(trans, &iter);
41df8115fe32fe3 Kent Overstreet 2024-12-08  179  	return ret;
41df8115fe32fe3 Kent Overstreet 2024-12-08  180  }
41df8115fe32fe3 Kent Overstreet 2024-12-08  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

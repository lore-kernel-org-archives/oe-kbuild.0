Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED219340D
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733831294; cv=none; b=WwGpWdiGlMg0/inGs2AbgyKy7NWFiFKUCoKUEPL2KEcTJOWaW7KW/orRyd/ZGMN8f06cAKScS+/kwuHH1HzENFw8R1CaPca+DFeicmAofryUSOWSScPlId1rCDc/mJLOrHfrrLLmZxQ3ft2KDLUY9VK6EoeMZpAu2N5kS8s9Ou4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733831294; c=relaxed/simple;
	bh=r7rE+khcinPbbsVbZpM4XZ57u8Ik174Pn3c0Xexi+2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXFLQj+tjQV536llysFTmdvZ7lJZsx+kuOVOMAvX8y+ffS/jaVLIA7gBo9GBax3oxUa0JDVHdt12HsCwiamFUZIPxbKCVngeFvVZHKkdRAAyU3ZdwoFhX9aDmii9v5OwOnb4kfIuXVb2oZ8Kygy8QFayo5tG7hp/RB26rk2ym5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+YbtHRG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+YbtHRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733831293; x=1765367293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7rE+khcinPbbsVbZpM4XZ57u8Ik174Pn3c0Xexi+2g=;
  b=I+YbtHRG02prARl0r2dP5kUuD69mLhF4tIdew2Y6bKoGsC0dnMvkjyvZ
   jt3pGB4wk8uXjAYxe+S64Z2Ns6tIzJ4cvuj6JV1HFMNsnmL/5LgsA+u2z
   WgKIQoOyIjsZhhpi3DM1PjcMcPk6OAO6uu4X94rMAlX0fkcd/4vts/qPU
   SV3TkUf2pt5/qQ+7HE+y/LTCEBLwp7Ngc+IpNwSUgBlEriwWtVDVlDx+G
   9aA70mSeHNwrT2f+0KzVr36Vw59gM1Zz/shy8n3r1fUCCJ4ztvgjQVvy6
   2CBhcv5KkDpcOJsx42Zb178G3thFcNyWgho7fkB+zwe25Lw2eQ+4Y0Mhi
   w==;
X-CSE-ConnectionGUID: GxQHc/qbS/6y0rV19ed5qQ==
X-CSE-MsgGUID: CMQsOvpYShaolVkJJugoHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44773646"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="44773646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:48:12 -0800
X-CSE-ConnectionGUID: fSZMsUX9Q9Cpaq2NjC2gjw==
X-CSE-MsgGUID: uDQbfF+WQ0+yDY8E1o+CoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="96195788"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2024 03:48:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKyim-0005UH-1g;
	Tue, 10 Dec 2024 11:48:08 +0000
Date: Tue, 10 Dec 2024 19:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2346/2656] fs/bcachefs/str_hash.c:169:57: sparse:
 sparse: invalid initializer
Message-ID: <202412101940.vAyYOD98-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/str_hash.c:169:57: sparse: sparse: invalid initializer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1b2ab8149928c1cea2d7eca30cd35bb7fe014053
commit: 2519d3b0d656d1a3106bc2c1f23c178f83570607 [2346/2656] bcachefs: bch2_str_hash_check_key() now checks inode hash info
:::::: branch date: 6 hours ago
:::::: commit date: 22 hours ago
config: csky-randconfig-r113-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101940.vAyYOD98-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241210/202412101940.vAyYOD98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412101940.vAyYOD98-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/str_hash.c:164:9: sparse: sparse: typename in expression
   fs/bcachefs/str_hash.c:164:16: sparse: sparse: Expected ; at end of statement
   fs/bcachefs/str_hash.c:164:16: sparse: sparse: got bch_inode_unpacked
   fs/bcachefs/str_hash.c:164:9: sparse: sparse: undefined identifier 'struct'
   fs/bcachefs/str_hash.c:165:37: sparse: sparse: undefined identifier 'inode'
   fs/bcachefs/str_hash.c:169:62: sparse: sparse: undefined identifier 'inode'
>> fs/bcachefs/str_hash.c:169:57: sparse: sparse: invalid initializer
   fs/bcachefs/str_hash.c:171:54: sparse: sparse: undefined identifier 'inode'

vim +169 fs/bcachefs/str_hash.c

2519d3b0d656d1 Kent Overstreet 2024-12-08  140  
2519d3b0d656d1 Kent Overstreet 2024-12-08  141  /*
2519d3b0d656d1 Kent Overstreet 2024-12-08  142   * All versions of the same inode in different snapshots must have the same hash
2519d3b0d656d1 Kent Overstreet 2024-12-08  143   * seed/type: verify that the hash info we're using matches the root
2519d3b0d656d1 Kent Overstreet 2024-12-08  144   */
2519d3b0d656d1 Kent Overstreet 2024-12-08  145  static int check_inode_hash_info_matches_root(struct btree_trans *trans, u64 inum,
2519d3b0d656d1 Kent Overstreet 2024-12-08  146  					      struct bch_hash_info *hash_info)
2519d3b0d656d1 Kent Overstreet 2024-12-08  147  {
2519d3b0d656d1 Kent Overstreet 2024-12-08  148  	struct bch_fs *c = trans->c;
2519d3b0d656d1 Kent Overstreet 2024-12-08  149  	struct btree_iter iter;
2519d3b0d656d1 Kent Overstreet 2024-12-08  150  	struct bkey_s_c k;
2519d3b0d656d1 Kent Overstreet 2024-12-08  151  	int ret = 0;
2519d3b0d656d1 Kent Overstreet 2024-12-08  152  
2519d3b0d656d1 Kent Overstreet 2024-12-08  153  	for_each_btree_key_reverse_norestart(trans, iter, BTREE_ID_inodes, SPOS(0, inum, U32_MAX),
2519d3b0d656d1 Kent Overstreet 2024-12-08  154  					     BTREE_ITER_all_snapshots, k, ret) {
2519d3b0d656d1 Kent Overstreet 2024-12-08  155  		if (k.k->p.offset != inum)
2519d3b0d656d1 Kent Overstreet 2024-12-08  156  			break;
2519d3b0d656d1 Kent Overstreet 2024-12-08  157  		if (bkey_is_inode(k.k))
2519d3b0d656d1 Kent Overstreet 2024-12-08  158  			goto found;
2519d3b0d656d1 Kent Overstreet 2024-12-08  159  	}
2519d3b0d656d1 Kent Overstreet 2024-12-08  160  	bch_err(c, "%s(): inum %llu not found", __func__, inum);
2519d3b0d656d1 Kent Overstreet 2024-12-08  161  	ret = -BCH_ERR_fsck_repair_unimplemented;
2519d3b0d656d1 Kent Overstreet 2024-12-08  162  	goto err;
2519d3b0d656d1 Kent Overstreet 2024-12-08  163  found:
2519d3b0d656d1 Kent Overstreet 2024-12-08  164  	struct bch_inode_unpacked inode;
2519d3b0d656d1 Kent Overstreet 2024-12-08  165  	ret = bch2_inode_unpack(k, &inode);
2519d3b0d656d1 Kent Overstreet 2024-12-08  166  	if (ret)
2519d3b0d656d1 Kent Overstreet 2024-12-08  167  		goto err;
2519d3b0d656d1 Kent Overstreet 2024-12-08  168  
2519d3b0d656d1 Kent Overstreet 2024-12-08 @169  	struct bch_hash_info hash2 = bch2_hash_info_init(c, &inode);
2519d3b0d656d1 Kent Overstreet 2024-12-08  170  	if (memcmp(hash_info, &hash2, sizeof(hash2))) {
2519d3b0d656d1 Kent Overstreet 2024-12-08  171  		ret = repair_inode_hash_info(trans, &inode);
2519d3b0d656d1 Kent Overstreet 2024-12-08  172  		if (!ret) {
2519d3b0d656d1 Kent Overstreet 2024-12-08  173  			bch_err(c, "inode hash info mismatch with root, but mismatch not found");
2519d3b0d656d1 Kent Overstreet 2024-12-08  174  			ret = -BCH_ERR_fsck_repair_unimplemented;
2519d3b0d656d1 Kent Overstreet 2024-12-08  175  		}
2519d3b0d656d1 Kent Overstreet 2024-12-08  176  	}
2519d3b0d656d1 Kent Overstreet 2024-12-08  177  err:
2519d3b0d656d1 Kent Overstreet 2024-12-08  178  	bch2_trans_iter_exit(trans, &iter);
2519d3b0d656d1 Kent Overstreet 2024-12-08  179  	return ret;
2519d3b0d656d1 Kent Overstreet 2024-12-08  180  }
2519d3b0d656d1 Kent Overstreet 2024-12-08  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

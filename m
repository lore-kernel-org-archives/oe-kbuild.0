Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554B28FD
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Dec 2024 06:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733466778; cv=none; b=pJJQGj+6G+OZoh+E2Y0gKp79tH3YMMps+nz2T8JBZ7ZGF2Xhq9jZ4Jvm2awqkr4tqs/KTPcj0JVH8ZBd8QHar+ofe4dSTsy5lFNxsrJWAvQtaAdm6LYDSr7/f3HwiXBUPfMsKl/4lMObw+JxuFnLVLyDuXaleXyd4jt+kXdJ8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733466778; c=relaxed/simple;
	bh=pqsJXCVxjW+qrN0it8qAeXRO+UE2dYLbgyLBwCaMofw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvGzxE9slhWAHv9EBMAWBLcukwt79/s9Z94vcrJKtyfd1pl8rz9XUvyfw1IvqOf8RwECqm04KuGjFkeLHehHCyVjldmdg3Ert5u2TuFA3fMX5WVYLudxleAC1VxIDv907Y/+eGeaxgwr8CIBc8bJtJ7Jw6VQnsUwVyH54zdq/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mp/t/uRL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp/t/uRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733466776; x=1765002776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pqsJXCVxjW+qrN0it8qAeXRO+UE2dYLbgyLBwCaMofw=;
  b=mp/t/uRLf6DBrydSEwxbxjXxD9JM9nlGgFoxyaJwgtvU+6YkW7YfPS7j
   i6hRaDR/z6eRyKgt7J4vvJ1yh+gjE8yv+XhNr1Ui/+7zuf9Y3NcLNbrn+
   q9s96q+2RfTwQZMlyfS5zMorGKL8KNvAXI/q72XlT3JxOcBNuP8y+Js7Q
   rOlwkoP15biZiE95XHlCdm60rWBFsvmo/MpFaRf1g4cKwH84vUHh3p7+d
   9P5dujSyVrHno+Len5aZN7LIIcBoH58F/xymN/bI13+2Ak7VKFroce0R4
   kOWMo8sjo7nP3wZbCIvSfgqwY6i3e5Pd1NsyAbWMr8zr/MTt+zKxddoAB
   Q==;
X-CSE-ConnectionGUID: 6D4gm+5sT/CIQr5++GxRpg==
X-CSE-MsgGUID: 7Gr55RWyT6mSr4s9mx8/UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="21400836"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="21400836"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 22:32:55 -0800
X-CSE-ConnectionGUID: 0gbB4NDYSSKO7Ukzq+pw8g==
X-CSE-MsgGUID: /5fEkvivQzeiBunYxws8Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="117571447"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Dec 2024 22:32:54 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJRtU-0000lf-1R;
	Fri, 06 Dec 2024 06:32:52 +0000
Date: Fri, 6 Dec 2024 14:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/inode.c:694:13-14: WARNING opportunity for min()
Message-ID: <202412061453.U4rt0B7J-lkp@intel.com>
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
head:   b8f52214c61a5b99a54168145378e91b40d10c90
commit: 9b23fdbd5d29beb5bd272c304e0d978edd32f513 bcachefs: bcachefs_metadata_version_inode_has_child_snapshots
date:   8 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r062-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061453.U4rt0B7J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412061453.U4rt0B7J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/inode.c:694:13-14: WARNING opportunity for min()

vim +694 fs/bcachefs/inode.c

9b23fdbd5d29beb Kent Overstreet 2024-09-29  678  
9b23fdbd5d29beb Kent Overstreet 2024-09-29  679  static int update_parent_inode_has_children(struct btree_trans *trans, struct bpos pos,
9b23fdbd5d29beb Kent Overstreet 2024-09-29  680  					    bool have_child)
9b23fdbd5d29beb Kent Overstreet 2024-09-29  681  {
9b23fdbd5d29beb Kent Overstreet 2024-09-29  682  	struct btree_iter iter;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  683  	struct bkey_s_c k = bch2_inode_get_iter_snapshot_parent(trans,
9b23fdbd5d29beb Kent Overstreet 2024-09-29  684  						&iter, pos, BTREE_ITER_with_updates);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  685  	int ret = bkey_err(k);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  686  	if (ret)
9b23fdbd5d29beb Kent Overstreet 2024-09-29  687  		return ret;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  688  	if (!k.k)
9b23fdbd5d29beb Kent Overstreet 2024-09-29  689  		return 0;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  690  
9b23fdbd5d29beb Kent Overstreet 2024-09-29  691  	if (!have_child) {
9b23fdbd5d29beb Kent Overstreet 2024-09-29  692  		ret = bch2_inode_has_child_snapshots(trans, k.k->p);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  693  		if (ret) {
9b23fdbd5d29beb Kent Overstreet 2024-09-29 @694  			ret = ret < 0 ? ret : 0;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  695  			goto err;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  696  		}
9b23fdbd5d29beb Kent Overstreet 2024-09-29  697  	}
9b23fdbd5d29beb Kent Overstreet 2024-09-29  698  
9b23fdbd5d29beb Kent Overstreet 2024-09-29  699  	u64 f = bkey_inode_flags(k);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  700  	if (have_child != !!(f & BCH_INODE_has_child_snapshot)) {
9b23fdbd5d29beb Kent Overstreet 2024-09-29  701  		struct bkey_i *update = bch2_bkey_make_mut(trans, &iter, &k,
9b23fdbd5d29beb Kent Overstreet 2024-09-29  702  					     BTREE_UPDATE_internal_snapshot_node);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  703  		ret = PTR_ERR_OR_ZERO(update);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  704  		if (ret)
9b23fdbd5d29beb Kent Overstreet 2024-09-29  705  			goto err;
9b23fdbd5d29beb Kent Overstreet 2024-09-29  706  
9b23fdbd5d29beb Kent Overstreet 2024-09-29  707  		bkey_inode_flags_set(bkey_i_to_s(update), f ^ BCH_INODE_has_child_snapshot);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  708  	}
9b23fdbd5d29beb Kent Overstreet 2024-09-29  709  err:
9b23fdbd5d29beb Kent Overstreet 2024-09-29  710  	bch2_trans_iter_exit(trans, &iter);
9b23fdbd5d29beb Kent Overstreet 2024-09-29  711  	return ret;
dde8cb11645b7d9 Kent Overstreet 2023-07-17  712  }
dde8cb11645b7d9 Kent Overstreet 2023-07-17  713  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

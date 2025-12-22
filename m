Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FE242D72
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433324; cv=none; b=mVXbgxr2BsyMG9jR6dNXTybYsC2NCIq8u78hlE3W4trU97RNgLjkKgchyONS4JubIGJKpISJ+4QNlevwDx/rOcn+pG9Fcr0K8EWM3NBiUQKTG5MOps9687zcDNrJ3ek4jyaeotyUOBy++9A8YpWOA84qyBOh9pe90H/o0R/AMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433324; c=relaxed/simple;
	bh=S87z9AjxtCpVg4RhXmd8vxGaw2F2WBZdYtTzu0hHhBQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rtFroi0LtGznJOFWCMc308etIWT91zTHLEOIvVSwKh9SKutwBYpM+DqDAJsRojUVZ48BeEB+lICibICwwiT7XAJI+Vz6kE4a7J602HLQbWROwijJIYOyG0NGtjEqicGtG4+QikKcOGCSBnKJe5Zwq7/EDHniomIzTpB1plnUCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQMOvT/5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQMOvT/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766433323; x=1797969323;
  h=date:from:to:cc:subject:message-id;
  bh=S87z9AjxtCpVg4RhXmd8vxGaw2F2WBZdYtTzu0hHhBQ=;
  b=nQMOvT/5v0UZrsQiKSiW5ORIX798xN5ukJY6ngl9iC2BJnuCxKT1mAmB
   eSVFShMgoESJUpWXjy4xyowUMYDlSRRHRhyr6tlYrqp56uJQZEE+EnN+W
   LM/QYeuu+SypQjosCjv53rm1tG+6RCo0jqDoDQIRSzsBFPN9GL4MQUgFV
   oDxJzK5gtNP5FBj4sErn51wMqAShMAm+1I4KvTx3Ieb+SamUoA8oZyLit
   1hhhpLF6Fq6G0+ODVoBoTmnWzvzco6xUzvPjwmW4A0tYUpC+wkpK9vRYT
   b1faHvZUHRcNXqUbHgk+wOq4e8rsJ0zL34M9NTCUuf9kx8Eihhnyfj7V6
   w==;
X-CSE-ConnectionGUID: OrGU34dLTreU23VloNlq+Q==
X-CSE-MsgGUID: v6dNwfPUQlGS9PHAyXVl1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68274156"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68274156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:55:23 -0800
X-CSE-ConnectionGUID: 8TLv85soTBCuDuOEgHZZZw==
X-CSE-MsgGUID: lM6hMeSZRlCR/F6qAcscxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237011339"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 11:55:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlzy-0000000013o-3f4D;
	Mon, 22 Dec 2025 19:55:18 +0000
Date: Tue, 23 Dec 2025 03:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error:
 __builtin_memcpy() 'bp->v.start' too small (40 vs 1960)
Message-ID: <202512230338.1yErYVc8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
:::::: branch date: 6 weeks ago
:::::: commit date: 8 weeks ago
config: sparc-randconfig-r071-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230338.1yErYVc8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512230338.1yErYVc8-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __builtin_memcpy() 'bp->v.start' too small (40 vs 1960)
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __builtin_memcpy() 'f->ptrs' too small (32 vs 1960)

vim +63 fs/bcachefs/btree/node_scan.c

4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  50  
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  51  static void found_btree_node_to_key(struct bkey_i *k, const struct found_btree_node *f)
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  52  {
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  53  	struct bkey_i_btree_ptr_v2 *bp = bkey_btree_ptr_v2_init(k);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  54  
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  55  	set_bkey_val_u64s(&bp->k, sizeof(struct bch_btree_ptr_v2) / sizeof(u64) + f->nr_ptrs);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  56  	bp->k.p			= f->max_key;
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  57  	bp->v.seq		= cpu_to_le64(f->cookie);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  58  	bp->v.sectors_written	= 0;
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  59  	bp->v.flags		= 0;
f7c3dc2646584c fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-04-25  60  	bp->v.sectors_written	= cpu_to_le16(f->sectors_written);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  61  	bp->v.min_key		= f->min_key;
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  62  	SET_BTREE_PTR_RANGE_UPDATED(&bp->v, f->range_updated);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11 @63  	memcpy(bp->v.start, f->ptrs, sizeof(struct bch_extent_ptr) * f->nr_ptrs);
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  64  }
4409b8081d1624 fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  65  

:::::: The code at line 63 was first introduced by commit
:::::: 4409b8081d1624af814a9cda781ad9cdda3973cb bcachefs: Repair pass for scanning for btree nodes

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10963AE197
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758541; cv=none; b=VARWyWysWv9Pitr7Hy7kU0LcSynDWix2h71yBUUMwAS+j61ChW6+HN9OpQj03G0SeRXCjheeNP842tCzpzZZ1B91MMspIU5PDzV0ij83/0pMkiFU8OPsqPpwUQ3hG+xGvutx3JSfRnMsUxjDRmkLHHuSy3Z/qvf11hU5GatIL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758541; c=relaxed/simple;
	bh=L7Xa4BHUK276yPSLEzkLU2DmrVggdW9Nef6CcV+uags=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N8uwaUT8942cpoGls1646Xo/PrYeRSq1sItOoJun/eDfiqL2QDizCaVS9/UXCnNMm/jro3e8Pj4o6h1YOFU7K2DJ30LdvlHGQIE+Zc2Vv55Zgi808XyQBeTlbn1qMjGhqCsXVZ4XiUIHfc7eD/Y1YEcqlTE3YXeH9utn00yX814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOWZSAV1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOWZSAV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778758539; x=1810294539;
  h=date:from:to:cc:subject:message-id;
  bh=L7Xa4BHUK276yPSLEzkLU2DmrVggdW9Nef6CcV+uags=;
  b=aOWZSAV1RxLU6b+98ltqKLcPiUTp086q2bzdu3qWVpG3ZnUCV9oluZhn
   SXSddtoqsUOzA5Z7fXPo0dzL24uRvzGRG7Dk/7xiHzkDczl8gg3ME/8cK
   GPvLxlF7fCyXRAvxHuYBS28KzldlMsBlU5BPRpesXzWR/fsG6wQbbp08Y
   U9Od+4hzlIkNCkXCmCAB2agCMVWXm2oQ8E1a0znKzxjjN3Ee0/TRUeCAe
   xceD8xkmEPxBvUhCQFRabThWYP3AYtEtmQXGDKbN/pxHIqHx4BvMouD2X
   GZadUflPmzn9z2NPrauQ9P5kOU+d+mGxKu4QKqSLJPSY2hTO3Lb5t++56
   A==;
X-CSE-ConnectionGUID: pUskqEY5TTOKb63E7uT6oQ==
X-CSE-MsgGUID: TqgOGPOSTWO4hEiejQBdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105157373"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="105157373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 04:35:38 -0700
X-CSE-ConnectionGUID: 0jSK41KpSRSEmie3KiGpsg==
X-CSE-MsgGUID: CGBaJNCqSdOT/kkcgDETtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="235720661"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 May 2026 04:35:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNULn-000000006RH-0Fs6;
	Thu, 14 May 2026 11:35:35 +0000
Date: Thu, 14 May 2026 19:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy()
 'bp->v.start' too small (40 vs 1960)
Message-ID: <202605141940.K4hYtYBj-lkp@intel.com>
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
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r072-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141940.K4hYtYBj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141940.K4hYtYBj-lkp@intel.com/

New smatch warnings:
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy() 'bp->v.start' too small (40 vs 1960)
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy() 'f->ptrs' too small (32 vs 1960)

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:294 arch_atomic64_fetch_add_unless() warn: inconsistent indenting

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

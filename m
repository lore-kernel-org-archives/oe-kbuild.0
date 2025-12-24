Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CD3451C8
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589018; cv=none; b=N8ux2nkFdSYba5RlPMZnSze+zDznRuBA6jiqSMbEceFGQXJI1xcj/79ZzBcUSq6DYapJy5O7fsqs3u5bahSQ5G+inZH8EW79hFjLsV4D+mE8j46vEBCvzFOU7JsalOeMp0vWpD/wGbzHvWNXX6f1dINzT11eT0tcOtYD3+JdvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589018; c=relaxed/simple;
	bh=EqCUr5Ru9its8RnprypbHJNHK0Vv94clyD0ATQeGqTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QxPzJAWaEDITxchuX2tu9cI3CU8T0CT+j88wiSezRuWNtgqXoGm5ykSXZ0wtaCC1Y0G5oLM+yHyugdYMz8pNQW/QKOrgwYz4/jJ9S8g6u8bu3qqh6h0NqImQS84lYvUhSy/GHdON0KD7k7qWzGoidBvcMuf5oumcwBht8+0Hp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axpKY/Ed; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axpKY/Ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766589017; x=1798125017;
  h=date:from:to:cc:subject:message-id;
  bh=EqCUr5Ru9its8RnprypbHJNHK0Vv94clyD0ATQeGqTE=;
  b=axpKY/EdAal7zHZ+dLqhqwwHTCzoIEM76nsvRgMJGyrqFt5fp8eRfWXI
   f0tqyAmrGxoqAnmrx/zyPMRcxS90WvleX5gjssVrg//bAxmApXHCFkm+v
   OOuxCd1DjHsHaiRC1KI/E93Qfb0rn49RLdbLU++4Zk4cdZ21GVcLhJFpj
   uxeWrzBmTOaFtVnKKIzoZScVjrryjEa/5iLhhCmbbzTvy4D4NHKd0j7Db
   NYKWSHaf4+rAa7N0cRnPLy+aByeamY6YN2zVZ4poq8F44a0ezNJSWQ0Ey
   GpuyCFyJ0lpDyIpsZ1OEEH6lHdSfynGjs4erm7eezHw/kSGX0/Qf1sQKz
   w==;
X-CSE-ConnectionGUID: 0j8ynGTCTRKANeE/yOI3Ig==
X-CSE-MsgGUID: 1oOp+xfNS0K57UMJovdelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71005019"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="71005019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 07:10:17 -0800
X-CSE-ConnectionGUID: TGgZUGfVSVqQK/TfBltk4w==
X-CSE-MsgGUID: LM6dGWGkQGmuHpliALS1eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="223525402"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2025 07:10:15 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYQVB-000000003B5-2D04;
	Wed, 24 Dec 2025 15:10:13 +0000
Date: Wed, 24 Dec 2025 23:09:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to
 be signed checked against zero?
Message-ID: <202512242348.gvV7rBbQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
:::::: branch date: 7 weeks ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251224/202512242348.gvV7rBbQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242348.gvV7rBbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512242348.gvV7rBbQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/alloc/buckets.h):
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source
>> fs/bcachefs/data/extents.h:551:9: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/bcachefs/fs-io.c:748:16: sparse: signed value source
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/data/copygc.c:440:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.c:440:21: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.c:440:21: sparse:    struct task_struct *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   fs/bcachefs/opts.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   fs/bcachefs/recovery_passes.c:341:5: sparse: sparse: context imbalance in '__bch2_run_explicit_recovery_pass' - wrong count at exit
   fs/bcachefs/recovery_passes.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   fs/bcachefs/recovery.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:633:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1326:38: sparse: sparse: array of flexible structures
   fs/bcachefs/recovery.c: note: in included file:
>> fs/bcachefs/data/copygc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/data/copygc.h:11:33: sparse:    struct task_struct *

vim +551 fs/bcachefs/data/extents.h

1c6fdbd8f2465d fs/bcachefs/extents.h Kent Overstreet 2017-03-16  546  
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  547  static inline bool bkey_extent_is_unwritten(struct bkey_s_c k)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  548  {
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  549  	struct bkey_ptrs_c ptrs = bch2_bkey_ptrs_c(k);
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  550  
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13 @551  	bkey_for_each_ptr(ptrs, ptr)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  552  		if (ptr->unwritten)
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  553  			return true;
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  554  	return false;
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  555  }
792031116bee35 fs/bcachefs/extents.h Kent Overstreet 2022-11-13  556  

:::::: The code at line 551 was first introduced by commit
:::::: 792031116bee35e13be7c8ae8cf1b8eec141b136 bcachefs: Unwritten extents support

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

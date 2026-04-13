Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9072475F7
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 19:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776109535; cv=none; b=JSFMmd8GF2qcsJx8THH3HwjoM0l5397lEl4D5GqyQUq2iM+3+t4zSHasKEt3X+3NwcqMelVTmdSRewMJWNP9DURDtgZAd6cC5WphBEgKZ7QgnAaOmrSVlSnJhOYEBDGF8zcouzzOqakGiYrSB9RISbM5C6gs/Pfy6rrwWlLnpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776109535; c=relaxed/simple;
	bh=FdCdrHg7owXfvsG/CN51S5EMddv4tqwFT65dcNmrrbw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WP1EhkQpnoaUfC2X/BjnctQXQL151ROsGejl5rz5XZEDbkJcIbpZHKoIkByo8sl+daKA5wYDpFPAVftEoOzeuvXU9rkbcVedR3zUdzQe2MHvxV8V2OpoULs/WqNY149D3mBji7P63QiHVy4BFAU7ZeEWsr3PVWLrgOkpN8KYuE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwxLcYm9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwxLcYm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776109534; x=1807645534;
  h=date:from:to:cc:subject:message-id;
  bh=FdCdrHg7owXfvsG/CN51S5EMddv4tqwFT65dcNmrrbw=;
  b=CwxLcYm9k5dIz/OPDdsA/kjquqArgjzQlFB8VhbP6RFrHs1EqOzkVy0N
   ikuxheZZQhEN510LN6WREpAgsNa2XfS5y4DzAvAJWfnT/upvRZWAFMWFP
   8spw0JX/JPJiQmuDgDstRjNmVncOrFQzw5Cr6OCH6g2It9OgeQh+nAyQO
   gYslWRhpUs4Qi7EYjJK9Dme/Te/6NVf6l9MBEWoeuEaczr/WMCX/2RPkL
   8/JX9nOj1txVMGB39C2lydE6dRH2VkRIeJPEsFWcFodfpViXV02wpz8aq
   z9/xr/PASGMGl7EEfspsr3QIWGMuXImqruWotEycBEtAPylfVMWl6aDHv
   w==;
X-CSE-ConnectionGUID: WXYKZvjvSyi4eybJMLztaQ==
X-CSE-MsgGUID: O2+mwbZaTx+iDoi0YO62sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="99700290"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="99700290"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:45:33 -0700
X-CSE-ConnectionGUID: K0+GhyYjQqatR3nOs1b6aw==
X-CSE-MsgGUID: VXb2nUklSwCwzf9AYSbOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="231607926"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2026 12:45:32 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCNDt-000000000n3-1fXN;
	Mon, 13 Apr 2026 19:45:29 +0000
Date: Tue, 14 Apr 2026 03:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error:
 __builtin_memcpy() 'bp->v.start' too small (40 vs 1960)
Message-ID: <202604140311.WVHRO6v2-lkp@intel.com>
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

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
:::::: branch date: 5 months ago
:::::: commit date: 6 months ago
config: sparc-randconfig-r072-20260414 (https://download.01.org/0day-ci/archive/20260414/202604140311.WVHRO6v2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604140311.WVHRO6v2-lkp@intel.com/

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

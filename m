Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421521D3E6
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689647; cv=none; b=NTyrKYFsYeolHEHhvEwBKiJr1uQ53jfZ5TTVes+dr0gxJhuYXa6OCIukImsp1wKyAhqoZ8Q+8+T92eglXW+RqJiJNyZg7o+m7mLlOKhM2DGUIPrZsMgt4I9fxd3fLFEIgZZen76jisL62/vDbyxxx3CNgwTU47ZMnSLkBgu2BLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689647; c=relaxed/simple;
	bh=vRPCAqNcKNL8RamQOKQgZKTxSjX0Ora8YD4TxlDbkKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NJKCKXfV4FdTpCLJe7OXoXNo+kV7jYW9s/7JrWB4Yd7YN35pg3tvemF5l0Xtbq2Tej9m7xmn3e5TqPmO/fDMTiipRcXdad7KvzuSSi0yZTeTmeJL/DIiqF70Hpibwdne86HRMP4MUoc5LL4iqzKMP4Mi0Z8c0vcKcW/RKVD9vzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SV0wW5Eq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SV0wW5Eq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757689645; x=1789225645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRPCAqNcKNL8RamQOKQgZKTxSjX0Ora8YD4TxlDbkKo=;
  b=SV0wW5Eqq01vEYAoUgHvEu+cfVNOZYxWGStqW+1tmJjsyyhLLqdYBojS
   fuN2ZQxccs0LnlvDLrFgNu0SOlsb/UA9R6bw1+0Zn81bCqp+IYqKBWeyv
   9a6kQkVUnLsXZtI/RNgXVgWAigPaPXhdRzJzHtoZwQiGhqQ3ZS87PGaFO
   eXb9MJKlMfOSQP/hgemKm91U3RXsLZ+b6DelOP5i2HqFMnoBJHReN97Hk
   nktoJpalbDNhdSCjS8UN6lTF1eBuW2azZlaoV3geIi1OJrbOx2dwwq58J
   T2Or5A40eboMBClApkt1GpTH9iLV+F18fP63MmHW5et95SwqbHWGnk2QP
   g==;
X-CSE-ConnectionGUID: uYFAqQOkQBuUl3T7iHehdg==
X-CSE-MsgGUID: Hkv5x19eTXOg4TPXJ4h2dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="63667895"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="63667895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 08:07:24 -0700
X-CSE-ConnectionGUID: VNTOPtz/RtS8rBgAdxqr2A==
X-CSE-MsgGUID: Voi0HMlzQoSlRj+6/HkILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="178330319"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2025 08:07:23 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux5Mu-000144-2o;
	Fri, 12 Sep 2025 15:07:20 +0000
Date: Fri, 12 Sep 2025 23:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 408/413] fs/bcachefs/rebalance.c:269
 bch2_bkey_needs_rebalance() warn: potential ! vs ~ typo
Message-ID: <202509122223.5KcPTtzo-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   bb2535dc2fde90827c6c5f396f650218c1708fa2
commit: 15b69edd603293d247aa78c34a249e414789ce90 [408/413] bcachefs: rebalance now supports checking/changing checksum type
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: hexagon-randconfig-r071-20250912 (https://download.01.org/0day-ci/archive/20250912/202509122223.5KcPTtzo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509122223.5KcPTtzo-lkp@intel.com/

New smatch warnings:
fs/bcachefs/rebalance.c:269 bch2_bkey_needs_rebalance() warn: potential ! vs ~ typo

Old smatch warnings:
fs/bcachefs/rebalance.c:1255 check_rebalance_work_one() error: we previously assumed 'extent_k.k' could be null (see line 1248)
fs/bcachefs/rebalance.c:1258 check_rebalance_work_one() error: we previously assumed 'rebalance_k.k' could be null (see line 1249)

vim +269 fs/bcachefs/rebalance.c

6366b1a9a814ba Kent Overstreet 2025-08-19  219  
6366b1a9a814ba Kent Overstreet 2025-08-19  220  	unsigned compression_type = bch2_compression_opt_to_type(r.background_compression);
15b69edd603293 Kent Overstreet 2025-09-01  221  	unsigned csum_type	= bch2_data_checksum_type_rb(c, r);
6366b1a9a814ba Kent Overstreet 2025-08-19  222  
6366b1a9a814ba Kent Overstreet 2025-08-19  223  	bool incompressible = false, unwritten = false, ec = false;
6366b1a9a814ba Kent Overstreet 2025-08-19  224  	unsigned durability = 0, min_durability = INT_MAX;
161d13835e38e4 Kent Overstreet 2024-10-28  225  
161d13835e38e4 Kent Overstreet 2024-10-28  226  	const union bch_extent_entry *entry;
161d13835e38e4 Kent Overstreet 2024-10-28  227  	struct extent_ptr_decoded p;
15ba41fcbf6130 Kent Overstreet 2025-08-20  228  	unsigned ptr_idx = 1;
161d13835e38e4 Kent Overstreet 2024-10-28  229  
15ba41fcbf6130 Kent Overstreet 2025-08-20  230  	guard(rcu)();
161d13835e38e4 Kent Overstreet 2024-10-28  231  	bkey_for_each_ptr_decode(k.k, ptrs, p, entry) {
15ba41fcbf6130 Kent Overstreet 2025-08-20  232  		incompressible	|= p.crc.compression_type == BCH_COMPRESSION_TYPE_incompressible;
15ba41fcbf6130 Kent Overstreet 2025-08-20  233  		unwritten	|= p.ptr.unwritten;
161d13835e38e4 Kent Overstreet 2024-10-28  234  
15ba41fcbf6130 Kent Overstreet 2025-08-20  235  		if (!p.ptr.cached) {
6366b1a9a814ba Kent Overstreet 2025-08-19  236  			if (p.crc.compression_type != compression_type) {
15ba41fcbf6130 Kent Overstreet 2025-08-20  237  				*compress_ptrs |= ptr_idx;
6366b1a9a814ba Kent Overstreet 2025-08-19  238  				r.need_rb |= BIT(BCH_REBALANCE_background_compression);
161d13835e38e4 Kent Overstreet 2024-10-28  239  			}
161d13835e38e4 Kent Overstreet 2024-10-28  240  
15b69edd603293 Kent Overstreet 2025-09-01  241  			if (p.crc.csum_type != csum_type) {
15b69edd603293 Kent Overstreet 2025-09-01  242  				*csum_ptrs |= ptr_idx;
15b69edd603293 Kent Overstreet 2025-09-01  243  				r.need_rb |= BIT(BCH_REBALANCE_data_checksum);
15b69edd603293 Kent Overstreet 2025-09-01  244  			}
15b69edd603293 Kent Overstreet 2025-09-01  245  
6366b1a9a814ba Kent Overstreet 2025-08-19  246  			if (r.background_target &&
6366b1a9a814ba Kent Overstreet 2025-08-19  247  			    !bch2_dev_in_target(c, p.ptr.dev, r.background_target)) {
6366b1a9a814ba Kent Overstreet 2025-08-19  248  				*move_ptrs |= ptr_idx;
6366b1a9a814ba Kent Overstreet 2025-08-19  249  				r.need_rb |= BIT(BCH_REBALANCE_background_target);
161d13835e38e4 Kent Overstreet 2024-10-28  250  			}
161d13835e38e4 Kent Overstreet 2024-10-28  251  
6366b1a9a814ba Kent Overstreet 2025-08-19  252  			unsigned d = bch2_extent_ptr_durability(c, &p);
6366b1a9a814ba Kent Overstreet 2025-08-19  253  			durability += d;
6366b1a9a814ba Kent Overstreet 2025-08-19  254  			min_durability = min(min_durability, d);
161d13835e38e4 Kent Overstreet 2024-10-28  255  
6366b1a9a814ba Kent Overstreet 2025-08-19  256  			ec |= p.has_ec;
6366b1a9a814ba Kent Overstreet 2025-08-19  257  		}
8c087d2ddf5d4d Kent Overstreet 2025-03-11  258  
15ba41fcbf6130 Kent Overstreet 2025-08-20  259  		ptr_idx <<= 1;
15ba41fcbf6130 Kent Overstreet 2025-08-20  260  	}
161d13835e38e4 Kent Overstreet 2024-10-28  261  
6366b1a9a814ba Kent Overstreet 2025-08-19  262  	if (unwritten || incompressible) {
6366b1a9a814ba Kent Overstreet 2025-08-19  263  		*compress_ptrs = 0;
6366b1a9a814ba Kent Overstreet 2025-08-19  264  		r.need_rb &= ~BIT(BCH_REBALANCE_background_compression);
161d13835e38e4 Kent Overstreet 2024-10-28  265  	}
15b69edd603293 Kent Overstreet 2025-09-01  266  
15b69edd603293 Kent Overstreet 2025-09-01  267  	if (unwritten) {
15b69edd603293 Kent Overstreet 2025-09-01  268  		*csum_ptrs = 0;
15b69edd603293 Kent Overstreet 2025-09-01 @269  		r.need_rb &= !BIT(BCH_REBALANCE_data_checksum);
15b69edd603293 Kent Overstreet 2025-09-01  270  	}
15b69edd603293 Kent Overstreet 2025-09-01  271  
6366b1a9a814ba Kent Overstreet 2025-08-19  272  	return r;
161d13835e38e4 Kent Overstreet 2024-10-28  273  }
161d13835e38e4 Kent Overstreet 2024-10-28  274  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8B01DD529
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 01:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779006; cv=none; b=QG6gpuMssk3nDOjKUbRIDqzcazLLakzU2FUko7gTFfOsrOeRJcmGuZDm5FENB72/XlLa0pkg6qIFUbUxs5tbujiLmXBZbFgkK0brJXV8RLFC1y/1e3Dxhd3/14+lgZ6ty/rQI/vxGhQMZDpSCh0u/OOuaJUmM/s5QGgiYkm7Rug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779006; c=relaxed/simple;
	bh=D+dkuGr4+s1nsukSjIIHvRztzf7GYbjjFkvWeiAanjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCqXDCzKCZIv/OE2Hz/8WAQoejzF9iCUXowCGZWuUC+LB5MjrzOndJGTbgqv3waKrsWrmKdB3GDghkTO9EzChZHgdMQ9K9i4Z4Be9IZy00TMwiTo3jYfGmU5V6mMq+mqkxdZkaIYM20RVoKSP7v/h3eDrEBcVVcuwDAcvpt47Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHd2fitv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHd2fitv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749779005; x=1781315005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+dkuGr4+s1nsukSjIIHvRztzf7GYbjjFkvWeiAanjc=;
  b=HHd2fitvmkQS4/L+IFDmN6mKF+I6zYcmYAJ7YZIoeVfzVusAbNrHnPZA
   76LowU3sSqjQPF3bzcpXTMIYzQR4IE0OyOVV4QEWWLYCwjMv/gz45BUXR
   3wDCeNRIPA1n4P8+bz+Rj0Iy51YdUk/7k/dPsOxBpACM864xa162uSI57
   AWXihWxmbE9hPtxdh26wTIBQ0LKZ5bp3VXn0V8JaF+ZNKJ3Ss8LwdPJzz
   zB+FEtj91TQEqkRSYCu/llzcah7ae3efT/2/ntYc3NqH9/c0/snbt5x5l
   IOWCHB3+1BcxTmAYXm8lIm1KLgEB3z3LIPb3Aql357RNGAbbc8x1vb9Db
   Q==;
X-CSE-ConnectionGUID: 9bg0zXZqSuuk6nAfBawX0Q==
X-CSE-MsgGUID: 3ZvICEI1SbWKBHhbWpYwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63338423"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="63338423"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:43:24 -0700
X-CSE-ConnectionGUID: wGDwUCVBQ36ebZjgHoXwEw==
X-CSE-MsgGUID: eU6DB5a2RRe3ULeIKisEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="151514269"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2025 18:43:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPtRx-000C82-0l;
	Fri, 13 Jun 2025 01:43:21 +0000
Date: Fri, 13 Jun 2025 09:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1012/2199] fs/bcachefs/btree_update_interior.o:
 warning: objtool: bch2_btree_update_start+0x574: unreachable instruction
Message-ID: <202506130909.7OJMCjaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0bb71d301869446810a0b13d3da290bd455d7c78
commit: ae05c9514d32c41f05fe842ff26fb15f6121b03c [1012/2199] bcachefs: Add range being updated to btree_update_to_text()
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: loongarch-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130909.7OJMCjaX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130909.7OJMCjaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130909.7OJMCjaX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_insert_fits+0x98: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_free_never_used+0x4c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_update_add_new_node+0x78: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_node_lock_write.constprop.0+0x8c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_insert_fixup_btree_ptr+0x168: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_node_free+0x168: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_alloc+0x48: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: get_iter_to_node+0x11c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_btree_node_update_key+0x10c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_btree_node_alloc+0x32c: unreachable instruction
>> fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_update_start+0x574: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_set_root+0x1f0: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: btree_update_nodes_written+0x3b0: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_node_check_topology+0x27c: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_insert_keys_interior+0x1d0: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_increase_depth+0xb8: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __btree_split_node.isra.0+0x528: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: btree_split+0xb0: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: bch2_btree_insert_node+0xa8: unreachable instruction
   fs/bcachefs/btree_update_interior.o: warning: objtool: __bch2_foreground_maybe_merge+0x10c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

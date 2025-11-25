Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E1F314A89
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071799; cv=none; b=gz0IPm6EGzc53qTSAKiGQTR35PSuKgZlypKK69rtFBrlqF9172L3AAU9SrmFUbQu2ZReOsS1SQHsTQjn0vqxrZk8KIIZTis7iHqhf85Mztx25gq5bJilkEIc0J/5sCiJPBMpjQSpIuicKhzS3vYSuczVGJ864s/SAgWR5zAIPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071799; c=relaxed/simple;
	bh=DRU5a7rvfuJxw7k/6XUF9qUCHxniqpzjUKhw8Pjt1xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kU0evkplDsNeXfwjJr+XuWl0y6WSz2SNMeXEPlyhpeBfxqx+zQirZ/i8E8/siJOLS0FTKqSeP+NnS0nJ1xdDHDC5LRd+8E+umzyJrXMANf8SfQuYkzU6HWgDKgFBGkVgnyxsBt2531MLUASt/yavetuDSfOE9rRLYxGxTV4w1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ33k6pv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ33k6pv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764071798; x=1795607798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRU5a7rvfuJxw7k/6XUF9qUCHxniqpzjUKhw8Pjt1xk=;
  b=bQ33k6pvDEeh/xvyxLVXIJk5AhQs8Omic1MHrly90yCze8Usx8UZuwHk
   Q38Wa8t40Xxwz4UWwLqY20UqYVVqPHf0UU9dmxaooDWVqbU3oGzD7C/YE
   1XYtAerGr3teez3XGCULGb9G5ZanujLfBhd4Tj6DWZPU8eITJwv3QxZC3
   FVrwprmmfaVYCfZWTppAXbUcQ9yJMOnyfJd/WI+S+5QEUrH72jwFIwzGO
   rSJ4BK735Ihpfp0BBcffMaI5csIJ9o63mrN8nA+Hhyw2MJbA+RPudM7h2
   PqRp1ZeFuMsroc4OUQueyeuA7xivC5GzsJEshLiCAtwGAI0GNT/WcXMjR
   w==;
X-CSE-ConnectionGUID: nG5uZMimTMGTM++b9GYhGQ==
X-CSE-MsgGUID: yCqWCG/WQfmE4r8jM7ipUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="88737065"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="88737065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:56:37 -0800
X-CSE-ConnectionGUID: JH/SYgkgTBeeBcXb2g/9YQ==
X-CSE-MsgGUID: Vx+TgPalRUWOqTqDV+6Jwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192700510"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2025 03:56:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrer-000000001js-3QrK;
	Tue, 25 Nov 2025 11:56:33 +0000
Date: Tue, 25 Nov 2025 19:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:master 458/990]
 fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy()
 'bp->v.start' too small (40 vs 1960)
Message-ID: <202511251912.fxHfE5d3-lkp@intel.com>
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

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/koverstreet/bcachefs master
head:   09be9a5a514734ebdd6fd840964815b2b0823c66
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/990] bcachefs: move btree files to subdir
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-r072-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251912.fxHfE5d3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511251912.fxHfE5d3-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy() 'bp->v.start' too small (40 vs 1960)
fs/bcachefs/btree/node_scan.c:63 found_btree_node_to_key() error: __memcpy() 'f->ptrs' too small (32 vs 1960)

vim +63 fs/bcachefs/btree/node_scan.c

4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  50  
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  51  static void found_btree_node_to_key(struct bkey_i *k, const struct found_btree_node *f)
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  52  {
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  53  	struct bkey_i_btree_ptr_v2 *bp = bkey_btree_ptr_v2_init(k);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  54  
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  55  	set_bkey_val_u64s(&bp->k, sizeof(struct bch_btree_ptr_v2) / sizeof(u64) + f->nr_ptrs);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  56  	bp->k.p			= f->max_key;
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  57  	bp->v.seq		= cpu_to_le64(f->cookie);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  58  	bp->v.sectors_written	= 0;
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  59  	bp->v.flags		= 0;
f7c3dc2646584cd fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-04-25  60  	bp->v.sectors_written	= cpu_to_le16(f->sectors_written);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  61  	bp->v.min_key		= f->min_key;
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  62  	SET_BTREE_PTR_RANGE_UPDATED(&bp->v, f->range_updated);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11 @63  	memcpy(bp->v.start, f->ptrs, sizeof(struct bch_extent_ptr) * f->nr_ptrs);
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  64  }
4409b8081d1624a fs/bcachefs/btree_node_scan.c Kent Overstreet 2024-03-11  65  

:::::: The code at line 63 was first introduced by commit
:::::: 4409b8081d1624af814a9cda781ad9cdda3973cb bcachefs: Repair pass for scanning for btree nodes

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

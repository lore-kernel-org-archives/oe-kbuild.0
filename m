Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7ED2DCBF7
	for <oe-kbuild@lists.linux.dev>; Sun, 25 May 2025 07:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159847; cv=none; b=beCclxihve4XGGRtDJcB+Eu76NxccwtcqVIPP/pk7sC3H9yT0CL9FpPRcZKzlGfz1BrfsHr7ed6oqo/1AYb7rDRy/cQMxTjiuFkdPsLVMGbpaxGR1ZWEkshwMD1HJTlHzAm2K3lbHdhaGyMX0Dq/ov09LlE1nN8wCBeR6YJDq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159847; c=relaxed/simple;
	bh=Rc+SvVKdEGuKPJh9T+avIG6T5PRj/fs4QLfpKXZAkZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oe/7+/iwl+0dAX81UBNpc4CfXW6Nv37zK93f80uUBoUPUnXfK0wjPZipDKZvwwvdAkT2msdu82uUM/WkPQSbCFvhXcUkQ0kJ6K1GTpw66eU6JYaV+xHjh6WYKeDSmYKriQ3yXloc2rKwvixfkbrjmAFMJhNTtFbXAeZZbfrwjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FT0H54Le; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FT0H54Le"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748159846; x=1779695846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rc+SvVKdEGuKPJh9T+avIG6T5PRj/fs4QLfpKXZAkZc=;
  b=FT0H54LeVcPTJuXF7JOusEM3pGSBXv0u7yBVVi1jZebPYUIcPiMcE70Y
   3jpQotv0NmwHf2I9hjB0+XK6PNVh3t5QtmvXFR+sP30acY3RuKyyq2Qdz
   wmbK1mHAFnT5JSqhKHqhY1cct0S9KwbR5fSWSPWHEuph/A9JDJlz9ML4V
   oZ21H0XXSTRmfkcjFeuwO7HtGllpcKNV2Yv394KZRRVOLIZYr97ZXI4tL
   IiKL4C6lUmiIwj0p3MCvyyNtP2t7Qu19j0YgkJzUEEU0aEdtLYhfn4wSv
   93zjzsW4E9U/nztXOwsANAu9H0HJ159JfnwYfscUQxHbhGB+26WKaIpJH
   w==;
X-CSE-ConnectionGUID: idIfXnM4S0yEhcYNdEOLrA==
X-CSE-MsgGUID: ZadWjJFZRZa7mZpl9/ZQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="53962508"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="53962508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 00:57:25 -0700
X-CSE-ConnectionGUID: FUWz/yVlTH65ISdIDlc0kA==
X-CSE-MsgGUID: Rc+NOCTdQyebkDk908SfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="145790792"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 May 2025 00:57:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ6ET-000Rgi-2H;
	Sun, 25 May 2025 07:57:21 +0000
Date: Sun, 25 May 2025 15:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10439/13331] fs/btrfs/volumes.o: warning:
 objtool: decide_stripe_size_zoned+0xcc: unreachable instruction
Message-ID: <202505251547.s4DVJWhg-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 94cb8d7144340e760644b2f104586da4717d1f32 [10439/13331] btrfs: use verbose ASSERT() in volumes.c
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250525/202505251547.s4DVJWhg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251547.s4DVJWhg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505251547.s4DVJWhg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/volumes.o: warning: objtool: handle_ops_on_dev_replace+0x1cc: unreachable instruction
>> fs/btrfs/volumes.o: warning: objtool: decide_stripe_size_zoned+0xcc: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: dev_extent_hole_check+0x13c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: find_free_dev_extent+0xa4: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: init_alloc_chunk_ctl+0x1f8: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_create_chunk+0xc4: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_balance+0x420: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_map_block+0x98: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: read_one_dev+0x28c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_read_sys_array+0x90: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_rm_device+0x108: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_map_repair_block+0x74: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0923F41A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756537188; cv=none; b=LM5cdVesg5aJ7x4qF0+x7FfIjlx7TqdIfjsNsofT6KTgIyro0BtyiDRVaSXpJReXDh3PLOSzBAGnXqlV8PuSvC+BzIs6wpgqjY4rigFX9dv4z9b8r7c5PbDJROqHv2eU7o9qhqrpCUbPeU6fvfn305T4rf4+uZCmn5JZz6QzajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756537188; c=relaxed/simple;
	bh=W4gQ+toN6QKDXqw9nPlmPNUPq6TOhYM8+OcgbRbZ6pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwdFHMe0DGmekkQmA6iynN6rdlvIUi77OmAbJoztg9UVRVrGm2AKydwiZ+GZtH3beky0PfXw8+UZI14LHVSmX7Ejh0sGOuk6l7yO6JnhcuG3afTlXbC4l8vZgHHLSha5BPaRvvRf68P+J/edX5mBiT9reFN9ePjs2eqE78L/f0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1Gcjial; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1Gcjial"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756537187; x=1788073187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W4gQ+toN6QKDXqw9nPlmPNUPq6TOhYM8+OcgbRbZ6pg=;
  b=J1GcjialBZ8UztyjXkwi7JUTLIBn4mmo9T75p+UCC71Dh4toLi/MikeL
   So76P4CruK3mNTqIqS234p4Q+cZcnDycNFzhw71dCfxIcqs1p5qp5gp7g
   XOl/ZP7eGl1MKEJ8pENfHKK8JhZqF5F4rCWHM88IyA8fT5dqxkr+INxt8
   xqY7Rle+RnNleXxeye9xghf/sCSQkH5kcnBSC8MxHNpOX/R8sUXhv5fGB
   OlzlwPrUWlE9MSx72oLtTyh9t0Iss9RUNYfJwVqu8OpQjNaSttMFZXo7w
   01BUGsFFcOUI0pFfOG6uiT4mlESI389eiLKi7d4iyQpsECU31HCJ6FQ0S
   g==;
X-CSE-ConnectionGUID: aqlmWyI3SNGs7E0G9kIovA==
X-CSE-MsgGUID: tvO3+rWWRuC7Ex6gnQeb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81406346"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="81406346"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 23:59:47 -0700
X-CSE-ConnectionGUID: 8S7onzv9SvCa2bUk/uoqWg==
X-CSE-MsgGUID: 94TSlZhpRxCyk5Fh5B2uFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201490627"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Aug 2025 23:59:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usFYr-000VDz-39;
	Sat, 30 Aug 2025 06:59:41 +0000
Date: Sat, 30 Aug 2025 14:59:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/numa_memblks.c:108 numa_set_distance() error: we previously
 assumed 'numa_distance' could be null (see line 91)
Message-ID: <202508301457.6gRT9Sdw-lkp@intel.com>
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
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Mike,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11e7861d680c3757eab18ec0a474ff680e007dc4
commit: 75f9d4cc4eb5e15dd5ce843e33de7f6346a0d4fa mm: move numa_distance and related code from x86 to numa_memblks
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301457.6gRT9Sdw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508301457.6gRT9Sdw-lkp@intel.com/

smatch warnings:
mm/numa_memblks.c:108 numa_set_distance() error: we previously assumed 'numa_distance' could be null (see line 91)

vim +/numa_distance +108 mm/numa_memblks.c

75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   69) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   70) /**
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   71)  * numa_set_distance - Set NUMA distance from one NUMA to another
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   72)  * @from: the 'from' node to set distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   73)  * @to: the 'to'  node to set distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   74)  * @distance: NUMA distance
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   75)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   76)  * Set the distance from node @from to @to to @distance.  If distance table
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   77)  * doesn't exist, one which is large enough to accommodate all the currently
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   78)  * known nodes will be created.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   79)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   80)  * If such table cannot be allocated, a warning is printed and further
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   81)  * calls are ignored until the distance table is reset with
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   82)  * numa_reset_distance().
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   83)  *
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   84)  * If @from or @to is higher than the highest known node or lower than zero
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   85)  * at the time of table creation or @distance doesn't make sense, the call
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   86)  * is ignored.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   87)  * This is to allow simplification of specific NUMA config implementations.
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   88)  */
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   89) void __init numa_set_distance(int from, int to, int distance)
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   90) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  @91) 	if (!numa_distance && numa_alloc_distance() < 0)
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   92) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   93) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   94) 	if (from >= numa_distance_cnt || to >= numa_distance_cnt ||
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   95) 			from < 0 || to < 0) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   96) 		pr_warn_once("Warning: node ids are out of bound, from=%d to=%d distance=%d\n",
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   97) 			     from, to, distance);
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   98) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07   99) 	}
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  100) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  101) 	if ((u8)distance != distance ||
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  102) 	    (from == to && distance != LOCAL_DISTANCE)) {
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  103) 		pr_warn_once("Warning: invalid distance parameter, from=%d to=%d distance=%d\n",
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  104) 			     from, to, distance);
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  105) 		return;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  106) 	}
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  107) 
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07 @108) 	numa_distance[from * numa_distance_cnt + to] = distance;
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  109) }
75f9d4cc4eb5e1 Mike Rapoport (Microsoft  2024-08-07  110) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

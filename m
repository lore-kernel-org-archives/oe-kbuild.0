Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D31EA6F
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jun 2025 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750491146; cv=none; b=EcdD4by4sOI2pwePojQNVWlMSkl018dSD537LenqtKOVEzQ3oq9qkQbhYAWoWNfA3ht1QvClWQUKQ0Hi2NSbWM/rBKm9TUic+4mWQ2N0OJlXaUMjosnzbtf0Q5dP4y9rr0wCZM9VZpb29O3mb8BBq8ojDdGnRv4XpkjjEsC+mJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750491146; c=relaxed/simple;
	bh=N1GUtvUlztBjL+HuwKFgb59dmzR4kkszXaeR7W7+ABQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onm3Nfs6Lo/DrxUEzmkaLUyTa1tvFbiv0PhY3kWR5EdSXMA3YEopXMqCDMQ++KL4Lb7iA0GDhLq+SfxGBdgaQoKSJaKgCwjso9MkBh25bxpked+sQkK7aIuNGvG2MV/spAUGEjpu4yQUzlOmdeXTxfHSPodynamkWl3FPiasM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMJ2xfTM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMJ2xfTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750491144; x=1782027144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1GUtvUlztBjL+HuwKFgb59dmzR4kkszXaeR7W7+ABQ=;
  b=XMJ2xfTMH5mEWE4HTJzp5XtDS2LglUJH/L9CwIOtzJ5f4igqEgtqmRmc
   4kO7oG5gQhTjcz9WzNRERglqoqXWX1iQPV+Ee6fC8zDSPn4g1xO2nNJFW
   j4FhNczxn7F1XOJlGFWD/WbMyqiz1/LJt46PBEgDZniGBKbNYplkwnPgQ
   oxKoAGqvPgVqKL+0tfNAP6uouTrHfQgOuwyYBjHHrFwXTqjE4+kbOoELa
   Ggvz8AJs/sGQ5CcYqUplVzwackkGX7/NKtwf/PeCZNTYKe3tyGrU/AgfR
   +b4SanCfUMAkzZoH3+Vz83T/d90akOUU8KgUh8bp+zPwaB2fR2haEmVfF
   g==;
X-CSE-ConnectionGUID: 6kRrdLBNT/6Sbz4mIJg7JA==
X-CSE-MsgGUID: K9XWO61xTDu1KPotlbZ2kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64188921"
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="64188921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 00:32:24 -0700
X-CSE-ConnectionGUID: IG8DiY4VTCKOFkz4YpFSQQ==
X-CSE-MsgGUID: 8LAt7I3KRCepiSrG2FqflA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,253,1744095600"; 
   d="scan'208";a="155662405"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2025 00:32:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSsi4-000MS8-25;
	Sat, 21 Jun 2025 07:32:20 +0000
Date: Sat, 21 Jun 2025 15:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:to_build 57/57] lib/maple_tree.c:4073:22: warning:
 stack frame size (1024) exceeds limit (960) in 'mas_wr_bnode'
Message-ID: <202506211558.2nx1iAxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   45965d80ee21635e7f04e6d7fd6caa929820b219
commit: 45965d80ee21635e7f04e6d7fd6caa929820b219 [57/57] Kbuild: rework stack frame warn logic
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250621/202506211558.2nx1iAxu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506211558.2nx1iAxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506211558.2nx1iAxu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/maple_tree.c:3815:22: warning: stack frame size (1056) exceeds limit (960) in 'mas_wr_spanning_store' [-Wframe-larger-than]
    3815 | static noinline void mas_wr_spanning_store(struct ma_wr_state *wr_mas)
         |                      ^
>> lib/maple_tree.c:4073:22: warning: stack frame size (1024) exceeds limit (960) in 'mas_wr_bnode' [-Wframe-larger-than]
    4073 | static noinline void mas_wr_bnode(struct ma_wr_state *wr_mas)
         |                      ^
   2 warnings generated.


vim +/mas_wr_bnode +4073 lib/maple_tree.c

54a611b605901c Liam R. Howlett 2022-09-06  4066  
54a611b605901c Liam R. Howlett 2022-09-06  4067  /*
54a611b605901c Liam R. Howlett 2022-09-06  4068   * mas_wr_bnode() - Slow path for a modification.
54a611b605901c Liam R. Howlett 2022-09-06  4069   * @wr_mas: The write maple state
54a611b605901c Liam R. Howlett 2022-09-06  4070   *
54a611b605901c Liam R. Howlett 2022-09-06  4071   * This is where split, rebalance end up.
54a611b605901c Liam R. Howlett 2022-09-06  4072   */
361e97e055ccf0 Arnd Bergmann   2025-06-16 @4073  static noinline void mas_wr_bnode(struct ma_wr_state *wr_mas)
54a611b605901c Liam R. Howlett 2022-09-06  4074  {
54a611b605901c Liam R. Howlett 2022-09-06  4075  	struct maple_big_node b_node;
54a611b605901c Liam R. Howlett 2022-09-06  4076  
54a611b605901c Liam R. Howlett 2022-09-06  4077  	trace_ma_write(__func__, wr_mas->mas, 0, wr_mas->entry);
54a611b605901c Liam R. Howlett 2022-09-06  4078  	memset(&b_node, 0, sizeof(struct maple_big_node));
54a611b605901c Liam R. Howlett 2022-09-06  4079  	mas_store_b_node(wr_mas, &b_node, wr_mas->offset_end);
62c7b2b9842c54 Sidhartha Kumar 2024-08-14  4080  	mas_commit_b_node(wr_mas, &b_node);
54a611b605901c Liam R. Howlett 2022-09-06  4081  }
54a611b605901c Liam R. Howlett 2022-09-06  4082  

:::::: The code at line 4073 was first introduced by commit
:::::: 361e97e055ccf02e7d0b7b8cd68e06793b04c797 maple_tree: try to reduce stack usage

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

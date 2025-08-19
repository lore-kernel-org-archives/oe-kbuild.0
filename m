Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF281CAA79
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Aug 2025 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587514; cv=none; b=cUfh2Jl9TEa/KnCdMyUJkKRx6qz0I45EXO2pjy9AE0QWssfYVO8zlSIwRBYfDjrsIsS6QuM02iTRTjE/e3rEs0WO74grNDv8E4wqDEv4PfB9DfeSceNCJkrTOZBIEmGSJp7BZE7+JI3XZyz0jVU3g/rGRIIifUSX8VDD5C/wbws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587514; c=relaxed/simple;
	bh=75SF6vJXQEIjlyrjF1EN5FRWYBG/RDmUYD/wHlCAmDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dvlRd5mfH632XxsC3d1X01R/sw4hYzT4JsmqmZLolhJ3y0BkPfQkUbhc+7t6OwSWD0cIcXcBNLZmBTKunCE+nV8yFhjvjyvBUCZph670RneLaDbe4jKqHe+JElJDYnftgtb+Rcrix1Av4sa954/DVj1IctLZzp8ZqiNjos2lSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqdsZYvB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqdsZYvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755587512; x=1787123512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75SF6vJXQEIjlyrjF1EN5FRWYBG/RDmUYD/wHlCAmDo=;
  b=BqdsZYvBGdIfQbeuWu+YLr6ILPE7uDi2klryhjbu5Ko22yDZ43XVcW2y
   65g8xPtZX71qh5Tf57wwGzdPrTqfj9T9gshq1u/1MWTtxQGKk28FyKplv
   oS8ILci7uh59w45ix2Yls5YL+xtmqQGM7X5m/GqHc4cwXw3o0PYeKAAMW
   ZHL2xAPjpidUyOmUn6aIFRMkC4mWxr3SvCACyBlAOO/4BBB2qBSdGGTNP
   HdwU29CmpjwyzJGuMDeTBEwixAoPgF+ModQME8zXa/Pc/4J3ZHXlVRGy3
   a3qZa2ThupdkA0f8qvBgLhcJjzaisUqxwKbROsPZJOb8eR2iGRWzqfrDI
   Q==;
X-CSE-ConnectionGUID: vol1ANdGSeu0+xc7t90MNw==
X-CSE-MsgGUID: foFmlgbWRtu0rTOzoQsK/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69196801"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="69196801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 00:11:52 -0700
X-CSE-ConnectionGUID: 5piO3WerQ6qiEUObT4nUsA==
X-CSE-MsgGUID: K33EdOV4TpGZ4vxpqnZ3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167681314"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2025 00:11:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoGVZ-000GbO-1H;
	Tue, 19 Aug 2025 07:11:49 +0000
Date: Tue, 19 Aug 2025 15:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning:
 objtool: mlx5e_mpwrq_mtts_per_wqe: unexpected end of section
 .text.mlx5e_mpwrq_mtts_per_wqe
Message-ID: <202508191508.rMUnuUJn-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be48bcf004f9d0c9207ff21d0edb3b42f253829e
commit: c5995abe15476798b2e2f0163a33404c41aafc8f objtool: Improve error handling
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-004-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191508.rMUnuUJn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191508.rMUnuUJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508191508.rMUnuUJn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_open_rq: unexpected end of section .text.mlx5e_open_rq
>> drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_mtts_per_wqe: unexpected end of section .text.mlx5e_mpwrq_mtts_per_wqe
   drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.o: warning: objtool: mlx5e_mpwrq_max_log_rq_size: unexpected end of section .text.mlx5e_mpwrq_max_log_rq_size

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

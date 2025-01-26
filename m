Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C819C552
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jan 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737874976; cv=none; b=A/yuh3ajvgnzLcRYNwxiEg130MYXl/3aObKdYRQ/O4/TWzocTXEy3j3i8vugOYUI35nefeBktpu2QA2QH07vdpacPuJv5/xBe7Pe7qWX382rYAtKJo1Im6eluekqTi5Xv5vv6CcmaETQJoItxcauagtGJnh8b4mfo/Xp5h4Ptb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737874976; c=relaxed/simple;
	bh=GkWmvK7ostN+e/FHKE42scvGoHIvBRAA5hZ722GOPCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wt3VNeytq6876H7wzh8q4TlBDPayixEIlceIcDcA+9tpeyrc6BnNn2HwSOK78ceAkSH6giiY2ybJkec8IpNH5LtnLOu5Er8ehl7H+TtMRh2VI5/hWdy0sr3PmTBe1LIv+HdceLVZqQQC3awk8UCTwdJOqQ9+MPNyprU5wW3xa2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMrHQ9mY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMrHQ9mY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737874975; x=1769410975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkWmvK7ostN+e/FHKE42scvGoHIvBRAA5hZ722GOPCw=;
  b=TMrHQ9mYWtic0tC4tkUldNY/luBpxDjl9Plfve1iSKzd3m50kdYhgABH
   5SSCmq46yy26L9gCNyKedXosB+oXY+5tGSocTTdi9VWM8NEb8tYLRfW+3
   YbTPYEekoUT8dGSX3nyqhn/gTCXT3itbg3g+qWZBaDdRGBrc5uV8f7GB2
   zPbdBV1tUzjfEKYHYAQFD1GCIj8x/KvtS6LGRa1Ci6YeEnIdVTyU3Q3Oo
   XxcDSCz4Kq3UXuuIaL3hk7QlG7S6fw52MPwPv8w7vI7RjHV4c6y4GGpI9
   s8phs7bdAPUBKCvzC+onlpjaRcJfvJzYZB8kz7jsob13X1Cs4YzB2dAW1
   Q==;
X-CSE-ConnectionGUID: /ggZTM2ATp+UJT6NBgseBw==
X-CSE-MsgGUID: Ccb3gAujTJ6H4l9pDOMvEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38242285"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="38242285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 23:02:54 -0800
X-CSE-ConnectionGUID: BB62iivdQH+t7OkoYILWug==
X-CSE-MsgGUID: wfFrq5BGTF+NVYguULBWQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113292600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2025 23:02:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbwfT-000f1D-0M;
	Sun, 26 Jan 2025 07:02:51 +0000
Date: Sun, 26 Jan 2025 15:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nathan:b4/llvm-trap-unreachable 2/2] vmlinux.o: warning: objtool:
 edac_raw_mc_handle_error+0xbb8: panic() is missing a __noreturn annotation
Message-ID: <202501261557.8NxULEFI-lkp@intel.com>
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
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git b4/llvm-trap-unreachable
head:   5aa3e312a14a904fe3a91d3e0366007253c52de4
commit: 5aa3e312a14a904fe3a91d3e0366007253c52de4 [2/2] kbuild: Turn unreachable into a trap for LLVM
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-buildonly-randconfig-003-20250126 (https://download.01.org/0day-ci/archive/20250126/202501261557.8NxULEFI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501261557.8NxULEFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501261557.8NxULEFI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_user_addr_fault+0x6fa: unreachable instruction
>> vmlinux.o: warning: objtool: edac_raw_mc_handle_error+0xbb8: panic() is missing a __noreturn annotation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

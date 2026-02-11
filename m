Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3A833EC
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769223; cv=none; b=ltB+ILcNLIH61RuB278u7YlK8A6xRMn1b3a4xOHToxtACcAOAeIgR8b7OrQZyUmdKWFblAx3Iv3FXGrLZL7FKnuCyJBeJGvtD4+c0ItZ8uYMmVTtSURuEQi08UZ9KfBDLhKMC/B6ZsLY/BaCTJa6eDvuoDhT4cvKvoA4kjp2VFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769223; c=relaxed/simple;
	bh=yVAmWVI36DiMsD5c3U7B/25UXLLcZd+13wvk+g4/YZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PfKpn+mlD/EoE33yRR+XK8dFoT2AOImnGJ8+WWJkwttieDp+0+YfmklDeXyxB55DxygPReTM7Kh3UUFgY4lBfMV/kaRUUX6CE6lY/ynmi5N3frK29ZL2NZ7pKfrp4HC3u1GhVbcjeJCgQd7zA93AqGXYmWPlsV4ymWsnsh9htdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8HSmSCq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8HSmSCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770769222; x=1802305222;
  h=date:from:to:cc:subject:message-id;
  bh=yVAmWVI36DiMsD5c3U7B/25UXLLcZd+13wvk+g4/YZ4=;
  b=M8HSmSCqTV/MXClBH5aE2+4xBdp6i+GF27FDtWWYl8xr8MoPU1n15y/T
   RXy9vwgRGY+wD3UpVMJX0amGT7Nvq/UaL9sgdpwOQ1eQ9BqO9+NUf+6md
   GxxkHQmqJGVDb4LYqsMdbVZOEg76amqOnY+1OrDSL4pXmYOHJpCyrupRl
   u5tRsLWDuw8HYVKmLB0QFRyzGAsFik0ylCRSOVoMmCj4FV/+qKb9mXf+D
   8LJnwbSttnnf7IjPLy9TDeLp6mpdnLQPSWR6/bYSSaC8puJ2lgahUeqX5
   0zjyUH7nD9suCLG6gC4+lcRPIRnEG50ORB0LZMaIzpW1YX1mwwSmM0wtk
   g==;
X-CSE-ConnectionGUID: EoASL5jMTtS68h7NWnGHLg==
X-CSE-MsgGUID: H34RdWZzTTCQT5FsQxHcZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82639848"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82639848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:20:21 -0800
X-CSE-ConnectionGUID: MjeCjqU/R3GqzFj6jF6fiw==
X-CSE-MsgGUID: CZd1CxLZTFubXRaVQjic+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211909222"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2026 16:20:21 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpxxq-000000000xh-1yWf;
	Wed, 11 Feb 2026 00:20:18 +0000
Date: Wed, 11 Feb 2026 01:20:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 17/17] diff:
 tools/arch/x86/include/asm/amd/ibs.h: No such file or directory
Message-ID: <202602110135.SuQZCSht-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   2ab60d4d838bf6681a144dc06814fe74c65624d2
commit: 0028489c58bea4559be1ef503b566d40157b5d02 [17/17] x86/platform/amd: Move the <asm/amd-ibs.h> header to <asm/amd/ibs.h>
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260211/202602110135.SuQZCSht-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110135.SuQZCSht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602110135.SuQZCSht-lkp@intel.com/

All errors (new ones prefixed by >>):

>> diff: tools/arch/x86/include/asm/amd/ibs.h: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

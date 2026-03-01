Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F741175A8F
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409042; cv=none; b=kKmHpthADpqutHkjB12BkdRuPu5q9TOnCBXbaUxaHjQD4kPs71/+FvJAowl4FuPx6UUhQVspiR0mRNDBuV5xU7Z0sLIIu6b7n3WIUy+noN67rcXN9eORWgdK2ZjbMG6IfyCcXIk3OcYh2hjvnPW7HxldYqZVuhqCZkuBAcH8dFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409042; c=relaxed/simple;
	bh=mlH2eAmrj329xyeTYRJveQzTO+TaqzdOYzkeummeWdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=trklyKvo7w1aSwKPWsJ/yKgQzlLSPXsQDoOgPq+NzUJLMAjuW0QvZQ9y+RzAO+EYUtMqND2NCa6Db60tOMJ7MBZQxmwxKQdcNyqlpVJrZaa3rnx88lPP6QgbvZCaZeJo9ujOx4i7OddUpkXO+G6lKKkJ4Vsmmck55FRwi6YLRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYZ8TwjF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYZ8TwjF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772409041; x=1803945041;
  h=date:from:to:cc:subject:message-id;
  bh=mlH2eAmrj329xyeTYRJveQzTO+TaqzdOYzkeummeWdY=;
  b=lYZ8TwjFSN89/aTceACzz1tDU99IqGP0rNYQDFNbN0hO+XUF/+k6FWzB
   lr3wAL/skxxlkUgwrg9kcPvEOFC8uxk9ItngxxSSkoXE2ItGgAQpUl4FK
   dAMsXuJZXky/y09MCqE8SXceJgLZOcAvG2VqFVmvzm5KdeWBW/TdDbUr9
   10MobClK1hcEa5M3dkpM4DT6IruQRBoPvrB+yYHuwi1PcnxxNWy4HKn3f
   CkNZ5hzoEKBk7vcxfQcxJLJO0FxIgR8Vl6XvqLq7mShkWZk0EAfRmFrhp
   JEKPCfYFoNHyM3hf0zYrtfQ+LLHiOypsYxPwmiZOP0av7/BKBJzfl2OSM
   Q==;
X-CSE-ConnectionGUID: eHVQQTPjRNK8zPIpFiUjGw==
X-CSE-MsgGUID: lr7FjzELRp20P/ld+im2IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77023805"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="77023805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 15:50:40 -0800
X-CSE-ConnectionGUID: FsQoQf7GRnGOxJGLiGNwTA==
X-CSE-MsgGUID: g1yD+T3CQamk0JpVg860Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="240476860"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2026 15:50:39 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwqYW-00000000065-2aD7;
	Sun, 01 Mar 2026 23:50:36 +0000
Date: Mon, 02 Mar 2026 07:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 23/41] FATAL ERROR: Unrecognized check name "graph_child_address"
Message-ID: <202603020754.bMyZogtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   b5dad0282f45e7bb008aa7c57248905cbdddf9c6
commit: e12e34f3ae8fb084b480616c257f44300c6cb866 [23/41] arm/arm64: samsung: Enable W=1 on dtbs by default
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-002-20260301 (https://download.01.org/0day-ci/archive/20260302/202603020754.bMyZogtn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603020754.bMyZogtn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603020754.bMyZogtn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> FATAL ERROR: Unrecognized check name "graph_child_address"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150A14BF92
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 20:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509971; cv=none; b=GtSp25pEPMw7SDih9PJk+3lYsDjeZWmHpesaAeViuI1sThVcS3m8wOdhwARNkoc4TfTD38s2hmHZxi26JP+tVuy78BepIakX/AwAbvTdvzhl7zZwrAu6D0XISAAOxGZ0IBhbe3sZOG3pDTQoWxKG3W6wMLQ2uM1KOUSrztXtsDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509971; c=relaxed/simple;
	bh=eiotgdJVDed1J0SZ0eEeWqRF8OI+7hGuYVCwKBsyXbU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mNyqTuKpuKa0fnRYj9LgiWv5WjD7pnSIOkK/yOpsFMoW0olCFlqVxuKFfCawzBm2psTxm58cdrnpdbfOQyLI71rPz7+DkJ5bikTQDdH2/rCHHV73hSuOCIgZgQ731qPhFHf4558OzPIRjynFoOdoMlwPjypDs5qhtb53ykXhBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSr9KMNl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSr9KMNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768509970; x=1800045970;
  h=date:from:to:cc:subject:message-id;
  bh=eiotgdJVDed1J0SZ0eEeWqRF8OI+7hGuYVCwKBsyXbU=;
  b=nSr9KMNlYroyYmbWMm356EvmeloHw9Xz3LoXIEgM0G9zgwmzUpyB1ydh
   Py0imY3BeogT0W4zCJlzqlKx0WKFOK0IBTWX7nKH8DQVfrFz4ZkJrzy15
   mB3j+yJCGRHeb/xgna5k5VfN+HCKONeEGksn65gj/BQsghrtccfHk4ZAp
   VzqHQ5eIEpN/qZK+iKuDQNstEs8Bfmx6IC10dTVkrx15vlZsqbqoVpNyL
   kAh7okyop7hcTLV4XEJHb0RPuTyZvO+oqMcKVvZ9D3GXjdvouqZyPpT6a
   oPC+PXak9nFjzKUE/qjk0ExoK7qZpgi7KwN+ti+QRMlh/8hq7Th1CF3XO
   A==;
X-CSE-ConnectionGUID: uQNqrh8YRmqEVsPcnGqP0A==
X-CSE-MsgGUID: /33XA+/bT6K9jQRtDLhG1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73455995"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="73455995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 12:46:10 -0800
X-CSE-ConnectionGUID: gTxoYES9TLurExY1uP3Dqg==
X-CSE-MsgGUID: b29Ece0eT/yEizW6bL7+VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="204841600"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Jan 2026 12:46:08 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgUEI-000000001e5-0XGo;
	Thu, 15 Jan 2026 20:46:06 +0000
Date: Thu, 15 Jan 2026 21:45:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [netfilter-nf:for-netdev-nf-25-07-17 3/8] udpclash.c:17:10:
 fatal error: stdio.h: No such file or directory
Message-ID: <202601152105.AMzeFE6b-lkp@intel.com>
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
CC: netfilter-devel@vger.kernel.org
CC: coreteam@netfilter.org
TO: Florian Westphal <fw@strlen.de>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git for-netdev-nf-25-07-17
head:   2d72afb340657f03f7261e9243b44457a9228ac7
commit: 78a58836358783995884784cb20021db6f6a29df [3/8] selftests: netfilter: add conntrack clash resolution test case
:::::: branch date: 6 months ago
:::::: commit date: 6 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260115/202601152105.AMzeFE6b-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152105.AMzeFE6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601152105.AMzeFE6b-lkp@intel.com/

Note: the netfilter-nf/for-netdev-nf-25-07-17 HEAD 2d72afb340657f03f7261e9243b44457a9228ac7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> udpclash.c:17:10: fatal error: stdio.h: No such file or directory
      17 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

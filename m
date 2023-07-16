Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF5128F5
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 11:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689507505; x=1721043505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=giycHXSK0H1P5a+/JMcW3hrxJaNMXyoBY0JqQw2J4+Y=;
  b=YCe8CniBcg3++3fWe7zzFCiCmBQ048u+wvmKwUICeNnh8R6OkWmEkc2X
   4yX5ARzUhiOTSB6I7YBLhYp9Wm+avj01CwdiUExxZ8bZTVNDZqY1H29l/
   uRcSghq0/E7tADlGvl8tAlY10T1Ppv6l3BPmUhjkgFQjwgHLqJL5LAem/
   Y23jaeoZK6MHnOsCJL2RVCsyC7OSUwuScbcxaszjHlGkVNNhKfYoC204J
   CVt5yMQcG4HU49lRQsD75PZ8ySPPaXeNg3kQEQhRFjKp0OQW2MVC8HOIl
   +aHjK+mAQ1beGoGW4vwCLVrrYbK7uSL6QfW5YKkfB9w4OIEUbzNOSrS3A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="431924393"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="431924393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 04:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836582122"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="836582122"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2023 04:38:23 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL050-0008oU-1r;
	Sun, 16 Jul 2023 11:38:22 +0000
Date: Sun, 16 Jul 2023 19:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:kvm-upstream-workaround 121/365] arch/x86/kvm/vmx/tdx.c:
 mmu.h is included more than once.
Message-ID: <202307161950.r5m8XR0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 5f81f9f172b39f1502e95ae8e9120d71b7673e7e [121/365] KVM: TDX: TDP MMU TDX support
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161950.r5m8XR0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307161950.r5m8XR0H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.

vim +8 arch/x86/kvm/vmx/tdx.c

     5	
     6	#include "capabilities.h"
     7	#include "x86_ops.h"
   > 8	#include "mmu.h"
     9	#include "tdx.h"
    10	#include "vmx.h"
    11	#include "x86.h"
  > 12	#include "mmu.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

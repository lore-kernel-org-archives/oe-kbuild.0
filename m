Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114B101FA
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687262833; x=1718798833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcMjfbg+PHNoNLf6bCjB2xByc7GNO8G0ZDCgUatKUdU=;
  b=i84jM6h5IAJGeegtx40N97SrJwq72Wi34pDGF2cB9bMGV4v4L10YtENt
   daf91+17drdASHePKz45q9bTsqjLY9XgX5zqwHTlD9PzaKKx05eBe30IY
   lviIi6nDV19oa+5GzIy0XgLl8KRVl9mTxeuy8lhbmWKfjPmfBk71/fKlZ
   9K25sgrdDnJ/liq3bKDUd4/NDut+RyT4qDw7pHtPTepNQmGvg2OOp26FI
   5Sl7FcJG38r+XTiBieKvFN5JHgCKSs0gALeAGyF6JRvl8Y2VL8HLZoHR4
   3ZamTLvwxqUuEaiFja/WpqC4AUH23kMC7r9sXwYIKmq+Yd4Krsxnq7GXW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="362382341"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="362382341"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 05:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="803932476"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="803932476"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 05:07:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBa8c-0005rc-1z;
	Tue, 20 Jun 2023 12:07:10 +0000
Date: Tue, 20 Jun 2023 20:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/sja1105/sja1105.o: warning: objtool:
 sja1105_fast_age() falls through to next function
 sja1105_mgmt_xmit.constprop.0.isra.0.cold()
Message-ID: <202306201928.0Pjw7lF0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/dsa/sja1105/sja1105.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_mgmt_xmit.constprop.0.isra.0.cold()"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   692b7dc87ca6d55ab254f8259e6f970171dc9d01
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-s023-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201928.0Pjw7lF0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201928.0Pjw7lF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306201928.0Pjw7lF0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/sja1105/sja1105.o: warning: objtool: sja1105_fast_age() falls through to next function sja1105_mgmt_xmit.constprop.0.isra.0.cold()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

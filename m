Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F1D7C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690669447; x=1722205447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spz8yXNFhSkzWEoUdX6yy0vTrScds3mlvSd1oqzLBls=;
  b=K2nOsmB6O0o/f5Yf/rNW/IX7O05zIEcb+sf9fCmyUX6HhAILNKV15Kw0
   agoUiEKHpRFsYY0ZWgnSWOsPpuaB8oVN6OpbN4LYKJLzZhFxKUHcnUYzO
   Og1OGxMatJHSABrm70PWgzA8yfCG56lQEzJZ4CB9vDvBFaDpfWisRAV+f
   bFRly3WR1WulSCVQ/NF7XUoZ+ymgWdoxkNOYfSF1V9U955pXLfaqB8vlx
   8l8lYe0eDPvS4rwjDjoJP7RHO/IUphxN3jMrJDyivvKHHr8il5THQ9QaS
   fVhiM6Np1+ayxhnVGm9j2kTJyznwv54ZcxS8bNILcjH2h8XjvlELrCQ/A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348398727"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="348398727"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 15:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="762934052"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="762934052"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 15:24:05 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPsLn-0004Jr-2m;
	Sat, 29 Jul 2023 22:23:56 +0000
Date: Sun, 30 Jul 2023 06:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2135/5284]
 drivers/net/ethernet/broadcom/asp2/bcmasp.c:562:1-33: WARNING: Function
 "for_each_available_child_of_node" should have of_node_put() before goto
 around lines 567.
Message-ID: <202307300630.q6Vxwxty-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Justin Chen <justin.chen@broadcom.com>
CC: Simon Horman <simon.horman@corigine.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 490cb412007de593e07c1d3e2b1ec4233886707c [2135/5284] net: bcmasp: Add support for ASP2.0 Ethernet controller
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: s390-randconfig-r051-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300630.q6Vxwxty-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300630.q6Vxwxty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307300630.q6Vxwxty-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/asp2/bcmasp.c:562:1-33: WARNING: Function "for_each_available_child_of_node" should have of_node_put() before goto around lines 567.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

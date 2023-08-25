Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21047CA60
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692974636; x=1724510636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CA/cUXXpFwBPheOKCiR9Yx3mARhmkAepMPY6nBT9/N4=;
  b=MNF3uRwS6ChkGdMt7mRDyKc9MfgC5ETF+/ZfDHhUn4/E/9r+FT9DiVg8
   WgWy627olZrjKF+TfiGF2RarfRQvQ4KamtlePjFvx6JDAusc1QDX9qLXg
   SLo4YUrJaAShCZgHDWy3rIica58d+FCZyQr0FgIO0ILRzLB2lQWgNN/N2
   Qjv6k045n2jtM7Af9BHqlAci8a8pbWE4wfK/hDYCKlGupj/9Lsc4bW/CA
   33K8w0OBKvkVlXesvHOH2u4dJ7iil4cgpdAANtzRLdCsJ5S2eYvV0tfTt
   inWED9jXFSL3ON7akD5H6T/509W6su6iw/UMQNpynDbXcnyQa9Rfa97F1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373596171"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373596171"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 07:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="731084162"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="731084162"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Aug 2023 07:43:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZY2P-0003hg-2y;
	Fri, 25 Aug 2023 14:43:50 +0000
Date: Fri, 25 Aug 2023 22:43:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 11766/12910]
 drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because
 platform_get_irq() already prints an error
Message-ID: <202308252226.Z4qCa0F9-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: 72f5801a4e2b7122ed8ff5672ea965a0b3458e6b [11766/12910] dmaengine: fsl-edma: integrate v3 support
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-101-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252226.Z4qCa0F9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252226.Z4qCa0F9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308252226.Z4qCa0F9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E471388
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 04:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696048732; x=1727584732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JSP98CNqGX6N+1k96aucHythRfGBSdxluC77zuJ1kGI=;
  b=h92/LdCuwL3izaztWr2ibBDFDIH6aaCb7iBJYY5ed605is3TDmwcgVlu
   BZXv1JDvTN8Zgcm4Uq9Qh2j1sGdU1iiCb726CzxARFoLVY4cB87We2WEM
   AGAqt+/ImWlGq2KI5cRcxvQ3h+6CKu2UE3w3VX9O0eGWsksP1M3J6xY+E
   rULlp4CBjEq1R3m2/9C3pTlDP1e4ts4DH8gI6KJx1lyhr2TQXBv+BJOiX
   rQ+eFvpCCoTeboRZn3ZB9klNZftM0mKZ4vSV+MtEIsAUJimUWBe0V+jKb
   pPylrmYj0bMAH2F+OrZpwl/g5wshzKuGFFlc03aqiwI1cF5KxSdZD/371
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385247433"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="385247433"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 21:38:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865930250"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="865930250"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2023 21:38:38 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmRkR-0003hh-2n;
	Sat, 30 Sep 2023 04:38:35 +0000
Date: Sat, 30 Sep 2023 12:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because
 platform_get_irq() already prints an error
Message-ID: <202309301203.5nXfgagk-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f3ebbef746f89f860a90ced99a359202ea86fde
commit: 72f5801a4e2b7122ed8ff5672ea965a0b3458e6b dmaengine: fsl-edma: integrate v3 support
date:   6 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-053-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301203.5nXfgagk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301203.5nXfgagk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309301203.5nXfgagk-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/fsl-edma-main.c:234:3-10: line 234 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

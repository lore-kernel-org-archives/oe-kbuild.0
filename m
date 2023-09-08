Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEC17466
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Sep 2023 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694215599; x=1725751599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBQIN4gvaRQzcmaaR03wQZMkBxY0UGrEC6bLDiDBlAc=;
  b=fWApPsqx9s03gENt3i84oBp9EsWKlMGShOYUeehh67rxT7VzHvT1sf/m
   T8JLLzitATcCKLrq2A7KcXrvbQI/9eLXtwPFeZS4Sh7/W6IgdtmhTeCgY
   dD8GKU4OWbhFeXrhpy4wvEiRNYG041DTD0tkt3RwIWvbCgUK35+jiSdXC
   kprK2v9DUhfqJPQMDySC7/nZw6cyOSb3qKfZSC57Ez+1B+JxWmb8ZbRk2
   b1ySZ1JnHyL7iOSybgTp8ztjrtO42WyYXcegdiKGlgZjXn95VxnxyJgMq
   556cBnGHKhqKZTQRyudYSqUg5QH1baGL76zz9E4u6oEfmnkNeyu6jwNXP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="362821313"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="362821313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 16:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="808175394"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="808175394"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2023 16:26:36 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qekrx-0002jZ-2q;
	Fri, 08 Sep 2023 23:26:33 +0000
Date: Sat, 9 Sep 2023 07:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:for-linus 2/3] checkpatch: WARNING: Reported-by: should be
 immediately followed by Closes: with a URL to the report
Message-ID: <202309090700.hmpFwHhY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   5260bd6d36c83c5b269c33baaaf8c78e520908b0
commit: 8ec9c1d5d0a5a4744516adb483b97a238892f9d5 [2/3] PCI: Free released resource after coalescing
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090700.hmpFwHhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309090700.hmpFwHhY-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
#12: 
Reported-by: Kalle Valo <kvalo@kernel.org>
Tested-by: Kalle Valo <kvalo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

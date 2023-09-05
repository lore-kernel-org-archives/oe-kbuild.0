Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5CA5D
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693899732; x=1725435732;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fmGzNld1ytVzEj5DZZcEInZwSMz0EFNae+d73Tnjqcg=;
  b=IUtCsjlxCX4yJH+nllCvDbWw7bX9ARlcI9M6Ufy+2X2bFyTGYC/NLe0w
   JgLKgzzMI3joXIDahAmROENXNutgYTwrMjNwHLw6oX8EeCdeVZENtEC+P
   SN4acP27XtIZiz/rS2J4aIQLxYDTX8NUlfvfScZ8Pf1C0eZUk6is94tTT
   J2wBCshocxwWIr7E96VgBjD3rTa/AVyZFd9lDseR3qk5o0BoDmORK2bxj
   QP91oYl8bjbvl9p7TnYCTQDsOSAEBUfK4LzzbzP6Kqoof3WLfGgscsR6S
   L0KBoBC4KEICR6hUkCGk69XAd6Wb5jw+7IOkHphW/B34BX/qf8bFSx6f8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356223206"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356223206"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 00:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914740419"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="914740419"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Sep 2023 00:41:52 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdQh4-0001ON-1B;
	Tue, 05 Sep 2023 07:41:50 +0000
Date: Tue, 5 Sep 2023 15:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 7/19] checkpatch: WARNING: Prefer a maximum 75
 chars per line (possible unwrapped commit description?)
Message-ID: <202309051556.mYjw3EX6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   7af65c1120567de8624e021d798438252cbde876
commit: a0473c77b4c19a108c9b19ba58aa2509fdefc534 [7/19] PCI: dwc: Add missing PCI_EXP_LNKCAP_MLW handling
:::::: branch date: 4 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051556.mYjw3EX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051556.mYjw3EX6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#28: 
[X+1] DesignWare Cores PCI Express Controller Databook - DWC PCIe Root Port,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

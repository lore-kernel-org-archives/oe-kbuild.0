Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502751C13
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693900383; x=1725436383;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yOZoWvMqmjEOmaRm6a+RoY6605Y+sqw68h2G30rOUKQ=;
  b=agaIZssivdtF1K3jZuvlixxnnBJvQbQM4Nyu1qghxEDy0N4Ostv81J0o
   G97HssChBGkaG6uqLdvOTJEBiDeZ8lTTI+n1UkNP9lXn3T+dnmV3oxeR/
   X+U9sXHofEWyvzo1yJCBgUzJsg5mQ74Wc9ppnmpce8FjcR00GUvBkYOpz
   miWwLxv+yhEXojJ+mcofa/t2DFq1J/X4tqz0UqK0SHL0Q5Dm4f8582sj4
   GGOddXpscsklvkAg/W9kzX/OSEI/GmizmKlkNW0LqX0BNYuyXoRcI2f5Y
   gc7xOtYTLvobAlctizSxl0Szo920yXizUKINHxJrM3ecVrIqr1iPcUayi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356224960"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356224960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 00:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690841288"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="690841288"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 00:52:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdQrj-0001P4-05;
	Tue, 05 Sep 2023 07:52:51 +0000
Date: Tue, 5 Sep 2023 15:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 11/19] checkpatch:   ERROR:
 "dw_pcie_write_dbi2" [drivers/pci/controller/dwc/pcie-rcar-gen4-host-drv.ko]
 undefined!
Message-ID: <202309051511.QVDeFBBg-lkp@intel.com>
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
commit: a986f6fd339e322db1d427e547b69189f58bc692 [11/19] PCI: dwc: Expose dw_pcie_write_dbi2() to module
:::::: branch date: 4 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051511.QVDeFBBg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051511.QVDeFBBg-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
  ERROR: "dw_pcie_write_dbi2" [drivers/pci/controller/dwc/pcie-rcar-gen4-host-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

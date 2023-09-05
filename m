Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DE1ECE
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693900382; x=1725436382;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=99jVYLYshniCstwbG/LWvT6iKQUGBH5MO3mzBLPOtVI=;
  b=CusV8p7/0gZsfjAQ/H/s/02rc7fnr0ppw0CTW2hshhJl0m9AjcS6kRi2
   cqAuK00w/TG8ynd1BomWb1Vuhgbl7oeGvGmqXgfqdazh8n0g2JgpuI1cz
   PHxBMzoVszKHsylCWo/uY4mvSaiLb4OPsKYk+qZp71hRjbNdQzqW+IhFq
   O9wgX2ZK9nK/IVGpNNJgKW64YM9hZ1vCYM7mRRXEiTF9XCsC8Uh6GgS1U
   F0/fa7F2SrMz9voHO+ReFsD7ctRbL5imEv5a92IJbR+RRLowcgoo8ubtF
   7/KjLmnpzFbgdVKl+z30JCIQyRru4GGly5u9wRn1+PrKclHGpKqYcZoac
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356224959"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356224959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 00:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="690841286"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="690841286"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Sep 2023 00:52:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdQri-0001P2-39;
	Tue, 05 Sep 2023 07:52:50 +0000
Date: Tue, 5 Sep 2023 15:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 10/19] checkpatch:   ERROR: "dw_pcie_ep_exit"
 [drivers/pci/controller/dwc/pcie-rcar-gen4-ep-drv.ko] undefined!
Message-ID: <202309051554.8LmBeXY4-lkp@intel.com>
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
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
INFO skip CC for checkpatch warnings

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rcar
head:   7af65c1120567de8624e021d798438252cbde876
commit: 3f937c80eb8e888716d686b1a62b2810feeccb56 [10/19] PCI: dwc: Expose dw_pcie_ep_exit() to module
:::::: branch date: 4 hours ago
:::::: commit date: 9 days ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051554.8LmBeXY4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051554.8LmBeXY4-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
  ERROR: "dw_pcie_ep_exit" [drivers/pci/controller/dwc/pcie-rcar-gen4-ep-drv.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

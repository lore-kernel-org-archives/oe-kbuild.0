Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57EA38
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901835; x=1725437835;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Vj8CrbS886wtlzzS/iEtbCRB542HSGvbsWKakDVuICQ=;
  b=SEDbo9R25mzCKiMBKHf5FKq/5OSZUTXfY8ZqYObnjakcZr3Bm27FaOhU
   gZiB3u2OvOgFEarLicsF2PsbHwtZWlMT+ojRLcV09TS+LFYarbcNGnE7z
   dMb6VIB0UudBFEMEHhVRQe/S6avtfdtTFUT2U5c5wvC5gASiBDQmyuWh4
   TVtm7RNbFUKuu8BJ2X6hGVE8kOl6o2hTxayLhfuNjlPWMbHk0KZw9sYzG
   IFRVlwabQw5w9ogoM467XHXdBkwD/8JGcDeeB7ICumkPEDsRK8oaYjRQ0
   OrxlLKLiNpLTbYQ2fqxvXAXgAv+O+P3Kgmb3NXAoIYf14HwxukTp1ig1A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356232413"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356232413"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770255647"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="770255647"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 01:16:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdRF2-0001Ql-03;
	Tue, 05 Sep 2023 08:16:56 +0000
Date: Tue, 5 Sep 2023 16:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 17/19] checkpatch: WARNING: please write a help
 paragraph that fully describes the config symbol
Message-ID: <202309051649.01kXyDSP-lkp@intel.com>
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
commit: 48b21f1ff7ce0fc5008044e6036f763abdd41507 [17/19] PCI: rcar-gen4-ep: Add R-Car Gen4 PCIe Endpoint support
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051649.01kXyDSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051649.01kXyDSP-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: please write a help paragraph that fully describes the config symbol
#31: drivers/pci/controller/dwc/Kconfig:428:
+config PCIE_RCAR_GEN4_EP
+	tristate "Renesas R-Car Gen4 PCIe Endpoint controller"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on PCI_ENDPOINT
+	select PCIE_DW_EP
+	help
+	  Say Y here if you want PCIe endpoint controller support on R-Car Gen4
+	  SoCs. To compile this driver as a module, choose M here: the module
+	  will be called pcie-rcar-gen4-ep.ko. This uses the DesignWare core.
+

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

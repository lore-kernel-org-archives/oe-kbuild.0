Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FAA38
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901838; x=1725437838;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Q8bB5rnRwXpJWySlSyRCJrdB9OjACheTOPzh5Zv7Cm0=;
  b=Q4nKN/2B+Kd7kgqTSa6SXKbgOFZhipRSRBpYC6FRdQ2DhTe7MGdr9+mH
   s/OHToDQ7F91A/4yv1e+1pcaI71cxPoyV/npiXGy/upjKT6gvrqeiyd9R
   o7RFrBtVAFgD7yERytk3v/IcCHDiRDwNSIZsKJoQOd/oKD2LyNsRVjrp2
   GS/dIND+0aAw0/jH+FQV62k5R0jVkAg204moZTIO6NDo8S7SPf5vUhfUv
   svrslv669Pac9PzrgsiYBTahmClUBi5Ukc+BgMvY0h6mDLkRpir0mWkA5
   +Dv/8CBL0/lyL73e1IG6e9iyaHtJxR0sM+DrQifBuBwzUBIG9wRwn6OIN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356232412"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="356232412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="770255644"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="770255644"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 01:16:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdRF2-0001Qp-0C;
	Tue, 05 Sep 2023 08:16:56 +0000
Date: Tue, 5 Sep 2023 16:16:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 16/19] checkpatch: WARNING: please write a help
 paragraph that fully describes the config symbol
Message-ID: <202309051642.MYLQUMVn-lkp@intel.com>
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
commit: 4dda2b239680213f3f5bc29212a10eca0e67428c [16/19] PCI: rcar-gen4: Add R-Car Gen4 PCIe Host support
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230905/202309051642.MYLQUMVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309051642.MYLQUMVn-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: please write a help paragraph that fully describes the config symbol
#44: drivers/pci/controller/dwc/Kconfig:418:
+config PCIE_RCAR_GEN4
+	tristate "Renesas R-Car Gen4 PCIe Host controller"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on PCI_MSI
+	select PCIE_DW_HOST
+	help
+	  Say Y here if you want PCIe host controller support on R-Car Gen4 SoCs.
+	  To compile this driver as a module, choose M here: the module will be
+	  called pcie-rcar-gen4-host.ko. This uses the DesignWare core.
+

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

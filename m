Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF4410963
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693157340; x=1724693340;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5zVtB4ye5V+buQxv8nLHbrjAT3/FTnJuNz6Euc2zkq4=;
  b=NChH4SjlBGT8OwMX8Fc11S5ezGumcadZwejEvBjw7fHXW2Y5Fbtp9ooA
   ZCwaUdESIEQy38+OK21G0+GE2m5/wkffgSnEk1/oH6Ra1FSypbVIqJrsH
   VOqePwMn69Fs+ah7VNkHeU86vySRwR1TkBiNcEmr4mzXZMYgCJ+7/8itX
   2EaBY6T4AIVSOLJK7agQgZ+Iaybt0YKJPc8G8BYVEOKZ/fyKashnyooEe
   ox5pI/OUTWiEeC6qlZaJ7oBSxUKFRYz4Wn3Kk+i/7VI8Nfkks32MljIfC
   +U0x4FByaiqmNpSX0qSVdRkVXlpd3v30sREr99lpslGFjkbmubIYeNTlP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="377696611"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="377696611"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="773023416"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="773023416"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 27 Aug 2023 10:28:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJZK-000633-1X;
	Sun, 27 Aug 2023 17:28:58 +0000
Date: Mon, 28 Aug 2023 01:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 16/19] checkpatch: WARNING: please write a help
 paragraph that fully describes the config symbol
Message-ID: <202308280157.GQVVB7Nu-lkp@intel.com>
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
head:   3ef0626cae45defbdb3aee4b034839caceecaaf3
commit: dec47c985619463940f2aced6110c921fb663f16 [16/19] PCI: rcar-gen4: Add R-Car Gen4 PCIe Host support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280157.GQVVB7Nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280157.GQVVB7Nu-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: please write a help paragraph that fully describes the config symbol
#43: drivers/pci/controller/dwc/Kconfig:418:
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
#68: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

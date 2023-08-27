Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83711189
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693157340; x=1724693340;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zAOvgFQS9xg2O9jIKMRyGTm1G79gt2Ju0xK0Ig/z9xk=;
  b=IRUI3G3d3sQlvTizLaaThy34JRpKgRc0YasPUzPF0zMhqp5mV/KlxuS5
   VOghcGOXoy3z6vsGui0hRRkbWVt3aFbzO+1Zs2Bg7LdAeyXsFSa8cJgd4
   70A6JJrrqSzbv5dSJ6U25wAxgDPJ++64/CatbVra2ohode1r381GLZGMm
   wyk/+wUY+XQ2QU8HntbmLLyfG/aq/Dmir947E0eYN9a5OF3oE5AO1PRus
   1WFi3mWZWW/+QBOWpAD9TRfIFjqyRsGz58Na/PccesAfFmyxyTPbnnApg
   rfBOYcbcgACxRs17kuKQnz/zUjxc8/83tjtu/iA+bHsRNxqWdyu9k738e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="355292900"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="355292900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 10:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="852559806"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="852559806"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2023 10:28:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaJZK-000631-1T;
	Sun, 27 Aug 2023 17:28:58 +0000
Date: Mon, 28 Aug 2023 01:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:controller/rcar 17/19] checkpatch: WARNING: please write a help
 paragraph that fully describes the config symbol
Message-ID: <202308280114.y1GJEN5O-lkp@intel.com>
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
commit: df170a8855884de7a06240e8c4167e6883b14049 [17/19] PCI: rcar-gen4-ep: Add R-Car Gen4 PCIe Endpoint support
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308280114.y1GJEN5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308280114.y1GJEN5O-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: please write a help paragraph that fully describes the config symbol
#30: drivers/pci/controller/dwc/Kconfig:428:
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
#55: 
new file mode 100644

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465754687
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722647428; cv=none; b=qFFgGLDiet6jdOCFWJkaD7tD09Hfcq5Gjc1V7YtMFbzWyEeYtoTOwfLe3uBhR6WV7mdpLV3S4DCcFn5X5FDTZKQr0RxqmdIr6iHTXFLUnik19+aGigs1OaC9HcDja+/Hv7jJEJsidKVajDinukxgyXV4Aw35GdcI2dDa7EOKeh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722647428; c=relaxed/simple;
	bh=jEAyImrtoK2vGn1Qo91mRXRcdUrQwThwTLy6IQW5cUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TDu2HFM63JStif5itytUsa4F3kVkaEwHUtCgb29h0HtB1jycbQEkr2M7QHiwCkWR04MedWOLsueNFG/yW4z3jco5cijnG/C4PrqCzTWzOfqdCz4zjDOq219wdVPpEje4A1qg9dXeWIEg/XPEL73gGekelw4d6dhtIG7GgVotDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwPZGNlI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwPZGNlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722647426; x=1754183426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jEAyImrtoK2vGn1Qo91mRXRcdUrQwThwTLy6IQW5cUQ=;
  b=cwPZGNlIMFSOTTgNrlnrKq5G9zlMCfZhoGfTp2pPs2jP440p1CK8AfL0
   E0u0Tj6WnbOTQ9+TO4eCcyFd7nUzJbPjGCnQUMAKLgOoAbyMcPevCNNVJ
   4AxEOJ+qdZEc+NiPAooJVNDh+0TZBZ7Yw/e0CocZnmnZeMfscyeloeuhJ
   PoyBpSxF8pGWvVq8A4L+l69fpdI9UvXTXVXRd7CRv1v1xYkKYehHP3uq+
   PpskCTqOrBrBLqzJkvsNt0BHc80jKqYe3QhTwUh9EAqYmb9eTQNbtCpHM
   CtpOHF9w+AgG9opLSe+EoCGvnuoUFoiSx7BOq8JNJNcIo/Re3UBe22WBQ
   Q==;
X-CSE-ConnectionGUID: WfipPJ+IRjqNi10j6Gx10A==
X-CSE-MsgGUID: kFaY/NSOSMa4jkRE1r9qnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31836003"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31836003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:10:26 -0700
X-CSE-ConnectionGUID: GdLf0/JLTZqNESlj5cmAFQ==
X-CSE-MsgGUID: VdlZPpsqQM2sQAA2S4m0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55458823"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2024 18:10:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa3Hq-000xeo-1h;
	Sat, 03 Aug 2024 01:10:22 +0000
Date: Sat, 3 Aug 2024 09:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/7] arm64: dts: agilex: add dts enabling PCIe Root Port
Message-ID: <202408030809.wxDeRMpK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240731143946.3478057-7-matthew.gerlach@linux.intel.com>
References: <20240731143946.3478057-7-matthew.gerlach@linux.intel.com>
TO: matthew.gerlach@linux.intel.com
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: robh@kernel.org
TO: bhelgaas@google.com
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
TO: joyce.ooi@intel.com
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/matthew-gerlach-linux-intel-com/dt-bindings-PCI-altera-Convert-to-YAML/20240802-064520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240731143946.3478057-7-matthew.gerlach%40linux.intel.com
patch subject: [PATCH 6/7] arm64: dts: agilex: add dts enabling PCIe Root Port
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240803/202408030809.wxDeRMpK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030809.wxDeRMpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408030809.wxDeRMpK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:601.10-658.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
   arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:20.36-41.5: Warning (simple_bus_reg): /soc@0/bridge@80000000/pcie@200000000: simple-bus unit address format error, expected "10000000"
   arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:43.32-53.5: Warning (simple_bus_reg): /soc@0/bridge@80000000/msi@10008080: simple-bus unit address format error, expected "100018080"
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /firmware/svc: failed to match any schema with compatible: ['intel,agilex-svc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /firmware/svc/fpga-mgr: failed to match any schema with compatible: ['intel,agilex-soc-fpga-mgr']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: cb-intosc-hs-div2-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: cb-intosc-ls-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: f2s-free-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: clock-controller@ffd10000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/intel,agilex.yaml#
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.74a', 'snps,dwmac']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/sysmgr@ffd12000: failed to match any schema with compatible: ['altr,sys-mgr-s10', 'altr,sys-mgr']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/sysmgr@ffd12000: failed to match any schema with compatible: ['altr,sys-mgr-s10', 'altr,sys-mgr']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr: failed to match any schema with compatible: ['altr,socfpga-s10-ecc-manager', 'altr,socfpga-a10-ecc-manager']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-s10']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/ocram-ecc@ff8cc000: failed to match any schema with compatible: ['altr,socfpga-s10-ocram-ecc', 'altr,socfpga-a10-ocram-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/usb0-ecc@ff8c4000: failed to match any schema with compatible: ['altr,socfpga-s10-usb-ecc', 'altr,socfpga-usb-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/emac0-rx-ecc@ff8c0000: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/emac0-tx-ecc@ff8c0400: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/emac0-tx-ecc@ff8c0400: failed to match any schema with compatible: ['altr,socfpga-s10-eth-mac-ecc', 'altr,socfpga-eth-mac-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/sdmmca-ecc@ff8c8c00: failed to match any schema with compatible: ['altr,socfpga-s10-sdmmc-ecc', 'altr,socfpga-sdmmc-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: /soc@0/eccmgr/sdmmca-ecc@ff8c8c00: failed to match any schema with compatible: ['altr,socfpga-s10-sdmmc-ecc', 'altr,socfpga-sdmmc-ecc']
>> arch/arm64/boot/dts/intel/socfpga_agilex7f_socdk_pcie_root_port.dtb: bridge@80000000: $nodename:0: 'bridge@80000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

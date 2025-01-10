Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CA820D4F8
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512816; cv=none; b=EFQgTYonQMB7Aoeh0RaQlP7vW1HVoDcIssDfkmXVNqX0jPJZ7AOqwTeNGyB33ukdzhFQgsSeZmwZIxzbA8NgXUvPx30LMLALZMzU6sw+qUsACwKScxjYnLbNAtGVJt/5MHlhAQNdrT4IhQ+RFY+vb89v1gvoQGobLFLGpeQpH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512816; c=relaxed/simple;
	bh=tGMVNXu8gukPXPP7nk65apfuSBihLLzCm+bUKcLjzMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5fn/qGdaCwVJEbBMrdL39urMcYgFvAIRe7W9pVGan6TOBixI81zKoJQupz8kDA1Tc4U6FD6qQ7o+1pbSBSwhr05X8U8P/zClA66sTFpxEcwQEfq+yoTi67OkpCAk56sLcGZtOizofiKza/rB084StAI1LIypD6UztvLwvrEK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H88LfGRH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H88LfGRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736512815; x=1768048815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGMVNXu8gukPXPP7nk65apfuSBihLLzCm+bUKcLjzMo=;
  b=H88LfGRH1Z9pyApBSIA+fzewUA0VrTCosxx8BAhpJINWty1QTqJiWXz/
   c3llmyvx7xMErKJ/s1gzqSKwKZ+fqK7XmKou0GlO66EMBr8bEf+Lzm96G
   6JJtj/uBZOX5/hgkdm6g6WtW3rhH5DV/gh8LE5WF0snqCWaxyJWgGf29v
   Jk2XG1SRmUGS8Ggrqt+o1shzdWoptmej7nekhTvOzvYlhPGlqNcu+8VRu
   ZGfJlHt0MCwrq72+I/qs7CU6hskZ8bnZCZWJHJxdRQONOSfxP8VgzEMc2
   D130gaCVneBbm1B9OCeZi2n0yB3zEbqAitPln4YjIZ6uoD4sqOfateD3v
   A==;
X-CSE-ConnectionGUID: NZPuIN8EQtOEOH/julGTSw==
X-CSE-MsgGUID: YrQjRPBhQRKJFXY4hWoYfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36965415"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36965415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:40:14 -0800
X-CSE-ConnectionGUID: Vbh9Fn7OQ9yZP9kxi63/YA==
X-CSE-MsgGUID: EZ35lhppQpyckfMeUzCF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108644082"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jan 2025 04:40:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWEJ9-000JET-1L;
	Fri, 10 Jan 2025 12:40:11 +0000
Date: Fri, 10 Jan 2025 20:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/5] arm64: dts: agilex: add dts enabling PCIe Root
 Port
Message-ID: <202501102029.DLRgEcil-lkp@intel.com>
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
In-Reply-To: <20250108165909.3344354-5-matthew.gerlach@linux.intel.com>
References: <20250108165909.3344354-5-matthew.gerlach@linux.intel.com>
TO: Matthew Gerlach <matthew.gerlach@linux.intel.com>
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: bhelgaas@google.com
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
TO: joyce.ooi@intel.com
TO: linux-pci@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: matthew.gerlach@altera.com
CC: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on pci/next pci/for-linus mani-mhi/mhi-next linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Gerlach/dt-bindings-PCI-altera-Add-binding-for-Agilex/20250109-010528
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250108165909.3344354-5-matthew.gerlach%40linux.intel.com
patch subject: [PATCH v3 4/5] arm64: dts: agilex: add dts enabling PCIe Root Port
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250110/202501102029.DLRgEcil-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102029.DLRgEcil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501102029.DLRgEcil-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:601.10-658.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:20.36-41.5: Warning (simple_bus_reg): /soc@0/fpga-bus@80000000/pcie@200000000: simple-bus unit address format error, expected "10000000"
>> arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:43.32-53.5: Warning (simple_bus_reg): /soc@0/fpga-bus@80000000/msi@10008080: simple-bus unit address format error, expected "100018080"

vim +/10000000 +20 arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi

755f37e6d7f7c1 Matthew Gerlach 2025-01-08 @20  		pcie_0_pcie_aglx: pcie@200000000 {
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  21  			reg = <0x00000000 0x10000000 0x10000000>,
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  22  			      <0x00000001 0x00010000 0x00008000>,
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  23  			      <0x00000000 0x20000000 0x00200000>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  24  			reg-names = "Txs", "Cra", "Hip";
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  25  			interrupt-parent = <&intc>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  26  			interrupts = <GIC_SPI 0x14 IRQ_TYPE_LEVEL_HIGH>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  27  			interrupt-controller;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  28  			#interrupt-cells = <0x1>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  29  			device_type = "pci";
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  30  			bus-range = <0x0000000 0x000000ff>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  31  			ranges = <0x82000000 0x00000000 0x00100000 0x00000000 0x10000000 0x00000000 0x0ff00000>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  32  			msi-parent = <&pcie_0_msi_irq>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  33  			#address-cells = <0x3>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  34  			#size-cells = <0x2>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  35  			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  36  			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_0_pcie_aglx 0 0 0 0x1>,
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  37  					<0x0 0x0 0x0 0x2 &pcie_0_pcie_aglx 0 0 0 0x2>,
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  38  					<0x0 0x0 0x0 0x3 &pcie_0_pcie_aglx 0 0 0 0x3>,
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  39  					<0x0 0x0 0x0 0x4 &pcie_0_pcie_aglx 0 0 0 0x4>;
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  40  			status = "disabled";
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  41  		};
755f37e6d7f7c1 Matthew Gerlach 2025-01-08  42  
755f37e6d7f7c1 Matthew Gerlach 2025-01-08 @43  		pcie_0_msi_irq: msi@10008080 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

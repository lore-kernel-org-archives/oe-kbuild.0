Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA33FE57D
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 04:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723349975; cv=none; b=kt4LPNLTrwQ5C3S7h55o1BHUnbV5Tftp7w8Tk044Xp1s6u84oW5P9ldE0HBQ7TqLrWD0K9FzEr8/nraZQFUB04hEplzHvPNfqF8143lbEsqcexA9GwShmfnokH/zxWjjyFTwQZS93URGzo6q6ry68C3XZzWzE1zqvit1XuLlT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723349975; c=relaxed/simple;
	bh=/co3p/4Z60lriSI6qmVUNfjz3m6jKWcHiu8S7F3uuvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qei0BDUypWe8WJ43+sFOF0BEED512GW31NVKmNwJ1mDuVOx8cXZyPtXqRQyfqhNBxvGEhmxrvvd4vxmF4KtVBqf5+FnHDZEe53mfksTun0LLDALxrAqoAPEdncfephESkT7xpwkn84ZcM7+OmTTZbuPSA9yFYXmsTta1cd8Yrz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6uU9MFM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6uU9MFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723349972; x=1754885972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/co3p/4Z60lriSI6qmVUNfjz3m6jKWcHiu8S7F3uuvI=;
  b=b6uU9MFMq3fXYECrePehFS77m/cy3o1Uf6bMMQMlikxoUMxYxJMq5nee
   q8ipqEwMFifoZENbXle4zPr9oW82K2fIx658Tn6DupkO9fbTTXb3Yymph
   dau9CNtdUETBtbq43k8o67kSmo6yyHeXmPi/9mI+By+wLW685SQrXS9Ih
   vwPMHfT+MNmoPyLJzLdqb1rBKZSedcoq75LK1c5GNvwI01GCNCS9dXaqi
   c8rkwEX88BoHXTsG2BTUifdcIRw8x1HXkHFnedaZz3Ty90GA+SUDCaioB
   IJMnKjgG4GUbdc6eXrZPlgGOhI24HxyvUbX16TDrPlfzG4E4eGoKO2Vs4
   Q==;
X-CSE-ConnectionGUID: LNSC7+vFSSCCIjN3AxwHzQ==
X-CSE-MsgGUID: zE87lBYrRKGtZS0KExhcRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21645251"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="21645251"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 21:19:32 -0700
X-CSE-ConnectionGUID: /C213PPYSaC+6V8ryKrLKg==
X-CSE-MsgGUID: kWd4ARZjTa2MT5EaYR9i4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="57838776"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2024 21:19:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd03E-000AZX-16;
	Sun, 11 Aug 2024 04:19:28 +0000
Date: Sun, 11 Aug 2024 12:18:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/7] arm64: dts: agilex: add dts enabling PCIe Root
 Port
Message-ID: <202408111225.s6i0bZwF-lkp@intel.com>
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
In-Reply-To: <20240809151213.94533-7-matthew.gerlach@linux.intel.com>
References: <20240809151213.94533-7-matthew.gerlach@linux.intel.com>
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
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/matthew-gerlach-linux-intel-com/dt-bindings-PCI-altera-Convert-to-YAML/20240810-022339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240809151213.94533-7-matthew.gerlach%40linux.intel.com
patch subject: [PATCH v2 6/7] arm64: dts: agilex: add dts enabling PCIe Root Port
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240811/202408111225.s6i0bZwF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111225.s6i0bZwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408111225.s6i0bZwF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:601.10-658.5: Warning (simple_bus_reg): /soc@0/eccmgr: missing or empty reg/ranges property
>> arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:20.36-41.5: Warning (simple_bus_reg): /soc@0/fpga-bus@80000000/pcie@200000000: simple-bus unit address format error, expected "10000000"
>> arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi:43.32-53.5: Warning (simple_bus_reg): /soc@0/fpga-bus@80000000/msi@10008080: simple-bus unit address format error, expected "100018080"

vim +/10000000 +20 arch/arm64/boot/dts/intel/socfpga_agilex_pcie_root_port.dtsi

cbbbcb29052ff9b Matthew Gerlach 2024-08-09 @20  		pcie_0_pcie_aglx: pcie@200000000 {
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  21  			reg = <0x00000000 0x10000000 0x10000000>,
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  22  			      <0x00000001 0x00010000 0x00008000>,
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  23  			      <0x00000000 0x20000000 0x00200000>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  24  			reg-names = "Txs", "Cra", "Hip";
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  25  			interrupt-parent = <&intc>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  26  			interrupts = <GIC_SPI 0x14 IRQ_TYPE_LEVEL_HIGH>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  27  			interrupt-controller;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  28  			#interrupt-cells = <0x1>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  29  			device_type = "pci";
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  30  			bus-range = <0x0000000 0x000000ff>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  31  			ranges = <0x82000000 0x00000000 0x00100000 0x00000000 0x10000000 0x00000000 0x0ff00000>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  32  			msi-parent = <&pcie_0_msi_irq>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  33  			#address-cells = <0x3>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  34  			#size-cells = <0x2>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  35  			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  36  			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_0_pcie_aglx 0 0 0 0x1>,
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  37  					<0x0 0x0 0x0 0x2 &pcie_0_pcie_aglx 0 0 0 0x2>,
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  38  					<0x0 0x0 0x0 0x3 &pcie_0_pcie_aglx 0 0 0 0x3>,
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  39  					<0x0 0x0 0x0 0x4 &pcie_0_pcie_aglx 0 0 0 0x4>;
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  40  			status = "disabled";
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  41  		};
cbbbcb29052ff9b Matthew Gerlach 2024-08-09  42  
cbbbcb29052ff9b Matthew Gerlach 2024-08-09 @43  		pcie_0_msi_irq: msi@10008080 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E7B2561AE
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760821604; cv=none; b=MSWw91SlHF5axmNs6drd2iiY53/mzVjuxHyU+7I1cKuTPSsba5W6rOJsmAwE4nBaQniH4qTi+r75tHWJenFlaxnb0YJ3XD+X7MBlShILoPszILuCklQX86DhPAMnG4iKLy/HunvC7soKEpS0cZCLVQ/Ki9UyBIUtalNxUeFb1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760821604; c=relaxed/simple;
	bh=q5AJ6wL/vLF5/gJJlFTFMoY30kvUW8tcmCfDzkaXOIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MD71eZQisnJzCylQtdE06CnIYHz91AhPlO3XEkF1AoMDmA4VP+kmsEIprgufIGhhH5Z6Myh5wHGhsE+RVk41bNFVXBD6W+UMD/IU+QGuvkRMR0Wdh82vCdsqGkoAGfwTM+udq6tRtohz6qB10ZR7WkzdndyyWS8b+oC01VUQMc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfQKSRSm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfQKSRSm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760821602; x=1792357602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q5AJ6wL/vLF5/gJJlFTFMoY30kvUW8tcmCfDzkaXOIM=;
  b=hfQKSRSmT7G0a9vbDJD3Ay0ehv/HJA4ZR1gapLx6DRHqtzPGvZiaSXL1
   ZpelGvFxIMMYfpM+mGh6/dNSvKM9dm//z3Pqe2kPxVX8fcJW6EmZC2qlQ
   7YAEkdYrUCJcrenfrzdOzUJKGTPZIAmOZofNPZZ0vEeogNECCoSCQP5lJ
   XpJPW2LKt17Fuu6Qy/3E1CvdxlJq2esPSF2lF4WRmksHGtpOZiAxDM1DF
   5safkjQVysKi3xtOo3cob+7HfOszLXxvJFCis/DaVHQ8kGoM5lxvCtkw7
   +ks+r7ZTrdaexxXGJgrEfiY/TVHIhWKjDwzI1//99tPCjoBHdXSt205cx
   g==;
X-CSE-ConnectionGUID: 9xFSxQFFSzW9m/uta4LQQA==
X-CSE-MsgGUID: ZFm3IKHBQRuxU1HgrIS4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62906683"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62906683"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 14:06:41 -0700
X-CSE-ConnectionGUID: vnhZdh4xQ4OhUT5M8feu+Q==
X-CSE-MsgGUID: VCz/2eZmQIud+du8RPsDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183773010"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2025 14:06:40 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAE8I-0008bx-23;
	Sat, 18 Oct 2025 21:06:35 +0000
Date: Sun, 19 Oct 2025 05:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/4 RESEND] dt-bindings: display: tegra: document EPP,
 ISP, MPE and TSEC for Tegra114+
Message-ID: <202510190409.hViO9EEc-lkp@intel.com>
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
In-Reply-To: <20251016074152.8759-2-clamor95@gmail.com>
References: <20251016074152.8759-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <treding@nvidia.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-display-tegra-document-EPP-ISP-MPE-and-TSEC-for-Tegra114/20251016-154458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251016074152.8759-2-clamor95%40gmail.com
patch subject: [PATCH v5 1/4 RESEND] dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20251016 (https://download.01.org/0day-ci/archive/20251019/202510190409.hViO9EEc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190409.hViO9EEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510190409.hViO9EEc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: tsec@54100000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
--
   arch/arm64/boot/dts/nvidia/tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map: Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: tsec@54100000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2571.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
--
   	'nvidia,tegra186' was expected
   	'nvidia,tegra194' was expected
   	'nvidia,tegra234' was expected
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /: failed to match any schema with compatible: ['nvidia,p3450-0000', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: vi@54080000 (nvidia,tegra210-vi): 'avdd-dsi-csi-supply' does not match any of the regexes: '^csi@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vi.yaml#
>> arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: tsec@54100000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupt-parent', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /: failed to match any schema with compatible: ['google,smaug-rev8', 'google,smaug-rev7', 'google,smaug-rev6', 'google,smaug-rev5', 'google,smaug-rev4', 'google,smaug-rev3', 'google,smaug-rev2', 'google,smaug-rev1', 'google,smaug', 'nvidia,tegra210']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: tsec@54100000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
--
   	'nvidia,p3701-0008' was expected
   	'nvidia,p3834-0008' was expected
   	'toradex,apalis_t30-v1.1' was expected
   	'toradex,apalis-tk1-v1.2' was expected
   	'google,nyan-blaze-rev8' was expected
   	'google,nyan-big-rev8' was expected
   	'google,nyan-big-rev5' was expected
   	'nvidia,tegra264' was expected
   	from schema $id: http://devicetree.org/schemas/arm/tegra.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra210-pcie']
>> arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: tsec@54100000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: dma@60020000 (nvidia,tegra210-apbdma): $nodename:0: 'dma@60020000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dtb: pmic@3c (maxim,max77620): reg: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

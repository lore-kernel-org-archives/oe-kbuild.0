Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC718732B
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722915700; cv=none; b=bszWpqteTs51aOTzMTPhh9/VD0RzpOAtKyIMvQgoiJFDKpHxhse/XUc5llqDQtM87n+co/u5ngMKJ8G7JlbdTSCALh75UBbTXUJQV8AdOid6YT5OR16Y4sc7QyqM4DBy8NlKCmjmO+NZvhaubKoSBMaOaG9bqPZK/P8zEXdVfec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722915700; c=relaxed/simple;
	bh=1FbLgL31b3pxbJ7ccgmDevDp6GKURVxrNz64Nw4/Kxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQvccRXI7BAmi/9/1gfYcpMwax6fq9jc/j4NYkZKytqrGJG0Lb36iF59th92Wn5AZDlmzCwgF0/JAduPf4Brq0Qxj8RvLg8pwfBD5km7h9NVB+3g+HPNh4o17br3NBpzR7MLbsRK3KJUnf2GMnhiATKPY6+Cr+R470S3hwjaukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foGyrAfD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foGyrAfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722915698; x=1754451698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1FbLgL31b3pxbJ7ccgmDevDp6GKURVxrNz64Nw4/Kxc=;
  b=foGyrAfDypuuqsjFEbNOC+TmTECb0TPRau2POHE9V4ss2q3Ikqyk766n
   HSnWwCrO5vru5cyw4DtqOLHryZp86DRJUQ0QhlMDbV2ybKgE5w1rkeyk3
   36U5jOgxz2vO9wWfsCWWgFoOkexUon181BAJiphiw/Uxv0hJmUCTO22a8
   zwNISNR4E9vPpOMwg0A4Okouk533VoTXjAie9nDJyHB6MqK8HjlEQ8dMa
   rO60GnUrNjLSBqo9GAp/TwbX1ceqmHhhU52tq5V8yJu/tlWBDz6hRaN5W
   jGITLlh2QIwCMsrA+p7gFMIv03PAc3rE2SfYGqWlmp6rfxFAUuNgR/RNa
   w==;
X-CSE-ConnectionGUID: 2TgZRxeCSdycUD/j9Zm0Mg==
X-CSE-MsgGUID: pX3SQcrxTje/3dpTeMPt5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20876204"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="20876204"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 20:41:24 -0700
X-CSE-ConnectionGUID: vYTSiP/tR3qNtPUAnelyTg==
X-CSE-MsgGUID: J7xwriG9RrOQVqxv0GS+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="60735606"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 05 Aug 2024 20:41:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbB4a-000472-2L;
	Tue, 06 Aug 2024 03:41:20 +0000
Date: Tue, 6 Aug 2024 11:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [vkoul-dmaengine:next 5/5]
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408061117.6drQqhsB-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   0204485c5a1e2de00acfd83c3931bd9dc6493c64
commit: 0204485c5a1e2de00acfd83c3931bd9dc6493c64 [5/5] dt-bindings: fsl-qdma: allow compatible string fallback to fsl,ls1021a-qdma
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061117.6drQqhsB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061117.6drQqhsB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408061117.6drQqhsB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3400000: fsl,pcie-scfg:0: [23, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3500000: fsl,pcie-scfg:0: [23, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: pcie@3600000: fsl,pcie-scfg:0: [23, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: dma-controller@8380000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	'fsl,ls1021a-qdma' is not one of ['fsl,ls1028a-qdma', 'fsl,ls1043a-qdma', 'fsl,ls1046a-qdma']
   	'fsl,ls1021a-qdma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie-scfg:0: [22, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3500000: fsl,pcie-scfg:0: [22, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3600000: fsl,pcie-scfg:0: [22, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: dma-controller@8380000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	'fsl,ls1021a-qdma' is not one of ['fsl,ls1028a-qdma', 'fsl,ls1043a-qdma', 'fsl,ls1046a-qdma']
   	'fsl,ls1021a-qdma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#
--
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: '#address-cells', '#size-cells', 'compatible', 'dma-ranges', 'ranges', 'sata@3200000', 'usb@2f00000', 'usb@3000000', 'usb@3100000' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: aux-bus: 'panel' is a required property
   	from schema $id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3400000: fsl,pcie-scfg:0: [25, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3500000: fsl,pcie-scfg:0: [25, 1] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: pcie@3600000: fsl,pcie-scfg:0: [25, 2] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape-pcie.yaml#
>> arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: dma-controller@8380000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ls1021a-qdma', 'fsl,ls1043a-qdma'] is too long
   	'fsl,ls1021a-qdma' is not one of ['fsl,ls1028a-qdma', 'fsl,ls1043a-qdma', 'fsl,ls1046a-qdma']
   	'fsl,ls1021a-qdma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl-qdma.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: power-controller@1ee2140: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: /soc/power-controller@1ee2140: failed to match any schema with compatible: ['fsl,ls1043a-rcpm', 'fsl,qoriq-rcpm-2.1+']
   arch/arm64/boot/dts/freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dtb: fman@1a00000: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

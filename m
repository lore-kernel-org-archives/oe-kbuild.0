Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B0946C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773731878; cv=none; b=pb95qGaDnXH06MI34FGMLt0YAq0MGbJ1MXu1KoavsGodWnHN4fIa6WbBT17xqEH7tX6HjlvCFS7cKHkBF8C5qRjCK9Behr2AvbuSCcz4q/mQLGG3iqUFKcVlYXGLwWSNSPGaCNkqc9ybMayC0Ub92XH+OXiIbRYp71yTcVPxJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773731878; c=relaxed/simple;
	bh=OgrtajI7G5oZUuvfjZp6P2IG3s6aTxdjGik1s/Um9Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iH2agtebKzHDp1PAcHOn5B8EzYkb4jq1R73/eL67RVI0BH6xxZowGZ6VfaQlHlz0qjVY1AU8iDmsJYar6pUo3OTrgrjIdgyS9n9oHTBBz57FeUOxG/rhKjLbMD+2xUVDa5+TgR1r2Ik2HWIGfG0KE1ifsAe/XQ6wTUes0KkxhoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsdOHrFU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsdOHrFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773731877; x=1805267877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgrtajI7G5oZUuvfjZp6P2IG3s6aTxdjGik1s/Um9Jo=;
  b=VsdOHrFUQ8mOBd/jUuv+Ppy5T+hKH1rUApqbTYfDqmCvScB3MDeGN1qt
   lxr/hCQ+edKgggDCeTzfnnchHUGhho9i3DoCfBmHYRDFve6XhoM+S4TIQ
   5wlEIuPBaAdZegu85g8i6WwBtNPDDzDSdzobeEOF10nfj73FgjVww08sg
   PzE/6li9gFQSmtlle5oaW8XrwmWjxgA4EY5Azv5Y3PBOUvzhJkQkm7Oz2
   AHupX5rv1Xsliwq7WUEI2w3ZDzYGq++epl/XLaM97K15Bx4CoT28jWdu2
   6p25rilYUat1SO5jxrPUTNmGpZ/3Sn/foRiHL391LHLqUyfBrcmvXb91l
   g==;
X-CSE-ConnectionGUID: llzEEJNaQaKbtgi6Wg54Vw==
X-CSE-MsgGUID: aG33ZRKWTZmfnazBBskd9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74729315"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74729315"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:17:56 -0700
X-CSE-ConnectionGUID: buzPBoUDRxic0i0hu/Q+oA==
X-CSE-MsgGUID: O/UJ2XurQSKQgtN4iH0isA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252675155"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2026 00:17:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2OgZ-000000004OD-45L8;
	Tue, 17 Mar 2026 07:17:51 +0000
Date: Tue, 17 Mar 2026 08:17:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm64: dts: ti: k3-*: Add am64x and newer reset
 registers
Message-ID: <202603170838.SzEqn33w-lkp@intel.com>
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
In-Reply-To: <20260316070429.1545707-3-alexander.sverdlin@siemens.com>
References: <20260316070429.1545707-3-alexander.sverdlin@siemens.com>
TO: "A. Sverdlin" <alexander.sverdlin@siemens.com>
TO: linux-arm-kernel@lists.infradead.org
CC: Alexander Sverdlin <alexander.sverdlin@siemens.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>
CC: Andrew Davis <afd@ti.com>
CC: Jayesh Choudhary <j-choudhary@ti.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Abraham I <kishon@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Sverdlin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v7.0-rc4 next-20260316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/A-Sverdlin/dt-bindings-mfd-syscon-add-binding-for-TI-K3-platforms-reset-registers/20260316-150948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260316070429.1545707-3-alexander.sverdlin%40siemens.com
patch subject: [PATCH v2 2/3] arm64: dts: ti: k3-*: Add am64x and newer reset registers
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2051-20260316 (https://download.01.org/0day-ci/archive/20260317/202603170838.SzEqn33w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170838.SzEqn33w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603170838.SzEqn33w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-pcie.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-hummingboard-t-usb3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-eth-phy.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-rtc.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-disable-spi-nor.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-gpio-fan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-pcie-usb2.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
>> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: syscon@43000000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-rst'] is too short
   	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
   	'microchip,pic64gx-control-scb' was expected
   	'microchip,pic64gx-sysreg-scb' was expected
   	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

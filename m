Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225DD22DF9E
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757843662; cv=none; b=BNoMR81l/Bn4LVQGcKEYVwb1hc0Z9rroJROTpxz8PHT64jvP6UpoFZm++ecndB2GHE1SEPHvtIplg7s1xGI0t8X/KHJODEs8dLaJODg5KhT2QHoaNUzbiSx4CMf3TwJD9ItpYWJeBVqy2ZqmdqP7EPhyxcHe2AGotHypXpmam0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757843662; c=relaxed/simple;
	bh=do2vmJ94G92PlXxB4cAsHSyIFKV/twKGjMXJ+rSJBbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQpQWLguO0C7ngMN6fuqDJo0npmt3UOKTJMN1bm+lczS3QXUaFWuVw1lX5YhCejoTHTh8hUOSDYKqa9MGouviyDjsy7cYkLL80FPhWu00T1flYWSUiechpebz3fyt+JiaRBNQXidHz+DudjScFRd7aW/wUAw/8kPJvcR3Ac8Y8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAMZBMSD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAMZBMSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757843658; x=1789379658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=do2vmJ94G92PlXxB4cAsHSyIFKV/twKGjMXJ+rSJBbc=;
  b=WAMZBMSDxYzSODPDXyKyOTb7hiOoUSS0UhTxhb2otgsFqL54gnA+NWiP
   hklFZdlbViduqx+RzwQeskdZy2WuIqZHjkz82I/sK/Ach3vUtl12sm18s
   StxgaqrZUSuEuEVeI6klM5RAIt1v0fY5OPYPXss1OUgOip7d/m/nFoyLm
   T3XqZoWrxFdTgCWcNL8MWE1TWUTRgtepPZXOry3597o34DCk9ozLhx2GL
   JPVOm2icP8FKrUaX+1RXZLbGU9LhTBwG6kTeX+HNGGvYdiQoxlyjS+MtI
   AOP01OS1fr01mQQW/2jp54sD5oS39hDJXbO9mnLRYoBP7FraUf34nk5mp
   w==;
X-CSE-ConnectionGUID: Kpkh26t0S/ygG4jWo3OITg==
X-CSE-MsgGUID: sI7G/j54RXa4irOa9meDbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="77734611"
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="77734611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 02:54:15 -0700
X-CSE-ConnectionGUID: 9Yweiwg9RFmKpF1YP5DXrQ==
X-CSE-MsgGUID: U8MbtREsTlmcfUbq9hOFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,263,1751266800"; 
   d="scan'208";a="211524596"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2025 02:54:14 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxjQx-0002Ik-19;
	Sun, 14 Sep 2025 09:54:11 +0000
Date: Sun, 14 Sep 2025 17:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
Message-ID: <202509141754.3APMPdpB-lkp@intel.com>
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
In-Reply-To: <20250910233402.567245-1-festevam@gmail.com>
References: <20250910233402.567245-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: shawnguo@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: frank.li@nxp.com
CC: Fabio Estevam <festevam@gmail.com>

Hi Fabio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc5 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Estevam/dt-bindings-soc-imx-iomuxc-gpr-Document-the-CSI-mux/20250911-073439
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250910233402.567245-1-festevam%40gmail.com
patch subject: [PATCH v2] dt-bindings: soc: imx-iomuxc-gpr: Document the CSI mux
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250911 (https://download.01.org/0day-ci/archive/20250914/202509141754.3APMPdpB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141754.3APMPdpB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509141754.3APMPdpB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6dl-sabreauto.dtb: gpio-keys (gpio-keys): 'back', 'home', 'program', 'volume-down', 'volume-up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: /soc/bus@2100000/i2c@21a8000/hdmi-receiver@48: failed to match any schema with compatible: ['nxp,tda19971']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: gsc@20 (gw,gsc): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/gateworks-gsc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: gsc@20 (gw,gsc): '#address-cells' is a dependency of '#size-cells'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: ds1672@68 (dallas,ds1672): $nodename:0: 'ds1672@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/trivial-rtc.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: gpio-keys (gpio-keys): 'eeprom-wp', 'tamper', 'user-pb', 'user-pb1x' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6q-sabreauto.dtb: gpio-keys (gpio-keys): 'back', 'home', 'program', 'volume-down', 'volume-up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: nand-controller@112000 (fsl,imx6q-gpmi-nand): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml#
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: gpio-keys (gpio-keys): 'back', 'home', 'program', 'volume-down', 'volume-up' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: /soc/bus@2100000/i2c@21a4000/touchscreen@4: failed to match any schema with compatible: ['eeti,egalax_ts']
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: / (fsl,imx6sx-sdb-reva): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[79]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[43, 1, 0]], 'enable-active-high': True, 'phandle': 68} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[44, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[44, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: / (fsl,imx6sx-sdb): regulator-pcie-gpio: {'compatible': ['regulator-fixed'], 'pinctrl-names': ['default'], 'pinctrl-0': [[80]], 'regulator-name': ['MPCIE_3V3'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'gpio': [[45, 1, 0]], 'enable-active-high': True, 'phandle': 69} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: sai@21d4000 (fsl,imx6sx-sai): pinctrl-0: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-basic.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-extended.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
--
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx.dtsi:1461.4-1464.29: Warning (interrupt_map): /soc/pcie@8ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: nand-controller@1806000 (fsl,imx6sx-gpmi-nand): #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: syscon@20e4000 (fsl,imx6sx-iomuxc-gpr): '#address-cells', '#size-cells', 'bridge@18' do not match any of the regexes: '^ipu[12]_csi[01]_mux$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: bridge@18 (fsl,imx6sx-ldb): reg: [[24, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo-full.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

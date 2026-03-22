Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0208E37F8B9
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 03:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774151029; cv=none; b=sXwMoR7GlWPNKjgOguSqAyQ149i6TuKWkXfG/uV16NH7bw7B0zNjFPbghV9YRPSnegBYTUd4QlR4BNSXZXy6J1iiu+gsJcTcqOsOQAR1zyk1Ww2r/F5ZJYArXsUpRHe2eEhPSZRRZejN0tEzAvPICpPLiDfQRkj5ngIfB8bw1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774151029; c=relaxed/simple;
	bh=cKrvRgrftE1m3O1qZ5u8uzN1oVukN/9jtn0WvsZr7Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZRLq6u4akT7pseHHXEyWuij8cBXNOPWVLzz/GtwaiAFSMMihK4aLnQewqEfQOMm5cIzjETeOSapgs8NO0eGMg3fe19eOREShUZ6dnh1cyF+rZTT651+6TnINkGhs3wqO2NOiXlcp4b4DS0ZqaczofPsaQorks0bYY2jbIqA+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I49ryZfE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I49ryZfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774151025; x=1805687025;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cKrvRgrftE1m3O1qZ5u8uzN1oVukN/9jtn0WvsZr7Qg=;
  b=I49ryZfEsWSiE50Eb6LyNY8WAWpOjNwaNf++dhbwNhz9iYoh7LnHQOqX
   dlI/4cdf6HNwj72DzMBdHxEpbOy6FL+abpZZQxCrZC7468SsLQPN3oJb1
   86M4oLyodDbln9+XFy695Xro6qr5dHhEWsg0pV5NJ1rbhkNAqLkU3wakG
   kv03eElUhpJ7ZH1UlJiFEcKrW9917dv2zsT/234jPDUrKFHjlKrD3tr18
   NgtcGlovcO9g4VZN1NUIbPLGD31f0kRFU2GpRuYN8DdglLbVVelrzsxg9
   9e25v6RwlWTin/SsgA0aXSyBNbtLNf9s4QfV5Vxpw64bEf418fp3PQ2vi
   A==;
X-CSE-ConnectionGUID: NyFP3WQMTs6DwRKIXuLvYg==
X-CSE-MsgGUID: I9T0RgOTRoqwSpfEJCub4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75259711"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75259711"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 20:43:44 -0700
X-CSE-ConnectionGUID: 68LyPQdzRVutXV7yavFdcw==
X-CSE-MsgGUID: G/xlpbxqSuGxOgcIitxxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="247607982"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Mar 2026 20:43:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w49j2-000000006Gz-40Sg;
	Sun, 22 Mar 2026 03:43:40 +0000
Date: Sun, 22 Mar 2026 04:43:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated
 reset-gpio
Message-ID: <202603220411.bYn2zeX6-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260311154955.145120-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260311154955.145120-4-krzysztof.kozlowski@oss.qualcomm.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Richard Zhu <hongxing.zhu@nxp.com>
TO: Lucas Stach <l.stach@pengutronix.de>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
TO: linux-pci@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: imx@lists.linux.dev
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v7.0-rc3 next-20260312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/dt-bindings-PCI-snps-dw-pcie-Drop-deprecated-reset-gpio/20260312-000905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260311154955.145120-4-krzysztof.kozlowski%40oss.qualcomm.com
patch subject: [PATCH 2/2] dt-bindings: PCI: snps,dw-pcie: Drop deprecated reset-gpio
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-2051-20260312 (https://download.01.org/0day-ci/archive/20260322/202603220411.bYn2zeX6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220411.bYn2zeX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603220411.bYn2zeX6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-apf6dev.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_7.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[26]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('disable-gpio', 'reset-gpio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: pmic@58 (dlg,da9063): onkey: 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/dlg,da9062-onkey.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi:152.14-239.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi:226.14-319.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi:219.14-318.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw53xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi1_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw54xx.dtb: ipu1_csi1_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi:175.14-256.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi:142.14-229.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw552x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi:138.14-225.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dtb: ipu1_csi0_mux (video-mux): port@4:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi:250.14-349.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi:256.14-343.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi:152.14-239.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5907.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi:161.14-268.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5910.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5912.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi:137.14-237.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-gw5913.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-emmc-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-emmc-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-hummingboard2-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-icore-rqs.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i-ads2.dtsi:13.8-43.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-mba6a.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-mba6b.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-sabresd.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6dl-solidsense.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi:282.15-308.5: Warning (unit_address_vs_reg): /soc/bus@2100000/i2c@21a4000/led-controller@30/multi-led@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi:274.26-309.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a4000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-hydra.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: stmpe811@41 (st,stmpe811): 'blocks', 'id', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'ampire,amp19201200b5tzqw-t03', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z8dha', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel', 'winstar,wf70a8syjhlnga']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-apf6dev.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: switch@0 (marvell,mv88e6085): ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: switch@0 (marvell,mv88e6085): ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: switch@0 (marvell,mv88e6085): ports:port@4: 'phy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dtb: sata@2200000 (fsl,imx6q-ahci): 'fsl,receive-dpll-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/imx-sata.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('disable-gpio', 'reset-gpio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dtb: pmic@58 (dlg,da9063): onkey: 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/dlg,da9062-onkey.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi:152.14-239.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw51xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi:226.14-319.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw52xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi:219.14-318.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw53xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dtb: flash@0 (sst,w25q256): compatible: 'oneOf' conditional failed, one must be fixed:
   	['sst,w25q256', 'jedec,spi-nor'] is too long
   	'sst,w25q256' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'sst,w25q256' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2008000/flash@0: failed to match any schema with compatible: ['sst,w25q256', 'jedec,spi-nor']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu2_csi1_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw54xx.dtb: ipu2_csi1_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi:175.14-256.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi:142.14-229.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw552x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi:138.14-225.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi:250.14-349.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi:256.14-343.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi:152.14-239.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5907.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi:161.14-268.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5910.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5912.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi:137.14-237.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/i2c@21a0000/gsc@20: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-gw5913.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-emmc-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-hummingboard-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-emmc-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-hummingboard2-som-v15.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-icore-rqs.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i-ads2.dtsi:13.8-43.4: Warning (avoid_unnecessary_addr_size): /sound: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-mba6b.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi:333.7-352.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/ethernet@2188000/mdio: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_max.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_som2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-nitrogen6_som2.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
--
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dts:229.7-248.4: Warning (avoid_unnecessary_addr_size): /soc/bus@2100000/ethernet@2188000/mdio: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'blocks', 'id', 'irq-gpio', 'irq-trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-phytec-pbab01.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-sabresd.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-solidsense.dtb: ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/gpio-gate-clock.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dtb: encoder (ti,tfp410): 'ti,deskew' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,tfp410.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6q-zii-rdu2.dtb: pcie@1ffc000 (fsl,imx6q-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-mba6b.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_som2.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-nitrogen6_som2.dtb: /soc/bus@2100000/i2c@21a8000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-phytec-mira-rdk-nand.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): ipu1_csi0_mux:port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dtb: ipu1_csi0_mux (video-mux): port@1:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/video-mux.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:910.28-918.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
>> arch/arm/boot/dts/nxp/imx/imx6qp-zii-rdu2.dtb: pcie@1ffc000 (fsl,imx6qp-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-reva.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-sai.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-sdb-mqs.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2220000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: lcdif@2224000 (fsl,imx6sx-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sx-lcdif' is not one of ['fsl,imx6sl-lcdif', 'fsl,imx6sll-lcdif', 'fsl,imx6ul-lcdif', 'fsl,imx7d-lcdif', 'fsl,imx8mm-lcdif', 'fsl,imx8mn-lcdif', 'fsl,imx8mq-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sx-softing-vining-2000.dtb: pcie@8ffc000 (fsl,imx6sx-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx7d-sdb.dtb: pcie@33800000 (fsl,imx7d-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dtb: pcie@33800000 (fsl,imx7d-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
--
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx7d.dtsi:137.4-140.30: Warning (interrupt_map): /soc/pcie@33800000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@31001000, using 0 as fallback
>> arch/arm/boot/dts/nxp/imx/imx7d-sdb-sht11.dtb: pcie@33800000 (fsl,imx7d-pcie): Unevaluated properties are not allowed ('reset-gpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

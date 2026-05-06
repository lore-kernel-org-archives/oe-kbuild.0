Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F044E052
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077343; cv=none; b=sBKrxEgrSvb8FRpAZ4WvrzuPdW71S5+oel6W6QDJ0pYIPEDTVKCBpxYYeMY0S0abAMxZuxzwn3aOjl3sig2MiMulL5KdL9TYkTB+3vUqvx5yE/vthsMj1Jlrv9Chtfm3y7IX44Vs/lCwRw5uurZ4Jc52e/8h1wDqYyzVHEW+xjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077343; c=relaxed/simple;
	bh=3+LXUKLYsJrfLniVCmLr33SlYUyXzeYZuCxfskHUYiI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRqmt9MhQ5QEUrHdFvJPmR5bLO1qdXoLNakmVCzroBAXZjebuaHQOSAwRDRw0mTe5d3l7cRHDCNtf27aS7b9n/xu82ClqrzjWO23nIw6OU7Qo93A1Hfw6n/jt4C/mpjWuLhSjk48N28SbkUDJBLklS2IdWpnwzrTr4mYOHatQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVVZXT9x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVVZXT9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778077341; x=1809613341;
  h=date:from:to:cc:subject:message-id;
  bh=3+LXUKLYsJrfLniVCmLr33SlYUyXzeYZuCxfskHUYiI=;
  b=nVVZXT9xlXb+mHQnARLRbEvjoTRLZHgqvpi5nhCEv6fMvRQStEbEJJx6
   vV+JQaShDxDzqV3UsKzJPuwlHugtdCxbpLOnlLSUMGbELaSip7LKxsA9H
   sx4EENZw+27qdyrnHLUslVO5YOkoceZjH9/KnSDt6t5iBx2E7U+SfPspM
   He4Tl4YPymA6bpFeD0OvxsSCsXjyIgYstRW4e0FoHXVPVf4NNhzNP2Ok+
   XA+BRy0QscymsF6WT+9eJZv1S31b5P3cWuFymipX+8Sm6P2KXMZ5w1oFS
   dCrjWVM2NmER6YW38sC4oQ1lTpOxo5cElnnzUPHWDmn1pitNJtPBzO8QU
   Q==;
X-CSE-ConnectionGUID: 3EMkgiHvQu+hoZqFiFekcw==
X-CSE-MsgGUID: m8zOpSvQT3uZr7/wry5siQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82854755"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="82854755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 07:22:20 -0700
X-CSE-ConnectionGUID: LO/UfmdfQYiVERlqkzVlYA==
X-CSE-MsgGUID: WKd6u1g2TPiLuMc/V9KFeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="236270559"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 May 2026 07:22:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKd8j-000000006ZN-00uM;
	Wed, 06 May 2026 14:22:17 +0000
Date: Wed, 06 May 2026 16:22:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000
 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
Message-ID: <202605061616.DOQompO4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
commit: 70a299ed2e03e7ef26e5be7889bab1a47960ed25 dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260506/202605061616.DOQompO4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061616.DOQompO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 70a299ed2e03 ("dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605061616.DOQompO4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2180.20-2182.6: Warning (graph_child_address): /dp@ff970000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0:0: 8 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: pcie@0,0: wifi@0,0:reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: wifi@0,0 (qcom,ath10k): reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe3a0000 (generic-ohci): bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe3a0000 (generic-ohci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe3a0000 (generic-ohci): bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe3a0000 (generic-ohci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe3a0000 (generic-ohci): bluetooth@1:compatible: ['usbcf3,e300', 'usb4ca,301a'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe3a0000 (generic-ohci): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bluetooth@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: panel@0 (kingdisplay,kd097d04): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

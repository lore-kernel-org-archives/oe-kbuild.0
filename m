Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185913D1CA4
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591851; cv=none; b=fEzWCi8pOjEADyNq+b9FkUeLRx+w7IMscQiG7X97ghOT64aPdEUNZ7bcbIsEy0qSL5ujmjyiGoCIH4j1oJDOnNQ19huj2U5ZAh5NkHah9gc2n6cQ/3acqAWmsPDN2vTrK7tly5qmVYDDKiINOAn9JbZlp5ekCvZidtnZsoGnAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591851; c=relaxed/simple;
	bh=2lheLlULQHGtzTAVVhZqoNPgqDlKt+SCjCb3AUIorlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZavL6sNP/pnNtpeo1BIFcJG4zokyvDpux+fv4MyQ+tihf0DH+O2+SrsFpRkIdnHuS56gXTyqdE42QbgV5+awz0AktWr5W951e8c/fD5NkcWBDLxv6t/meyLChvngOSQBQgeJ6BdBM5Xb/JmUiPYyClt9VyDpguUw58zpOMgQXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzqlqtrT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzqlqtrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777591846; x=1809127846;
  h=date:from:to:cc:subject:message-id;
  bh=2lheLlULQHGtzTAVVhZqoNPgqDlKt+SCjCb3AUIorlg=;
  b=ZzqlqtrTyM5WOdppIsjekTR/+0rVigvwQt4qMZnG950hOQe1GHyDmTsC
   h0jW5j8VL6HBjykUzlycZoB9QFXM49XcDzON5Ty3j+uds5goL6Hr1b/1n
   f3PAGD6xSPmqPYp9VywqkdHZ4FPKXt0k3Wpkd/B8IKfq5D4OWnSB4+QSz
   MtkaAb+Tu0RpJrHgxTqOH5ufMAWtNuJpD/ZXAJ0r5mVSQlLfuHlSeZu4j
   dMMIPVE8RXb9ywkaUbyuLzrICVQ28QkXmYf0nvSWlGYxwsEbLE0ShgHyK
   cXotI/51AvVVcFhH307NDgBsRI57fgcJ1coViAbpfohm5Pfc5w3uA4Vhr
   g==;
X-CSE-ConnectionGUID: EvHf+16mRm2e+nOAZqwcnA==
X-CSE-MsgGUID: E7oIB1kiTru5nlTGJ9nEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="77727010"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="77727010"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 16:30:43 -0700
X-CSE-ConnectionGUID: doNAGXFUQUqOuVYIMf3a2w==
X-CSE-MsgGUID: xeCYKD3QS56/p33PrN4zaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="234782501"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 30 Apr 2026 16:30:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIaq7-000000004vD-3HdI;
	Thu, 30 Apr 2026 23:30:39 +0000
Date: Fri, 01 May 2026 01:30:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000
 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
Message-ID: <202605010155.nlxHQJbV-lkp@intel.com>
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
head:   08d0d3466664000ba0670e0ef0d447f23459e0d4
commit: 70a299ed2e03e7ef26e5be7889bab1a47960ed25 dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260501/202605010155.nlxHQJbV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010155.nlxHQJbV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 70a299ed2e03 ("dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010155.nlxHQJbV-lkp@intel.com/

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
